Subject: Re: [PATCH] kunit: Add kunit_tool support in kernelci-core
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <d8ae2e8a-67a7-3f2a-6bc1-55491626de0b@collabora.com>
Date: Mon, 17 Feb 2020 22:38:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Heidi Fahim <heidifahim@google.com>
Cc: Mark Brown <broonie@kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, David Gow <davidgow@google.com>, kernelci@groups.io

Hi Heidi,

Thanks for sharing your branch on GitHub:

  https://github.com/Heidifahim/kernelci-core/commits/kci_kunit

There are essentially 2 patches there, the first one is to
get "git describe" to work with no tags and it's already merged.
The second one is the one below about running KUnit tests, I
thought I would do an inline review here initially.

On 31/01/2020 00:52, Heidi Fahim wrote:
> --kunit and --kunit_json flags have been added that can be specified
> with the "./kci_build build_kernel" command.  If --kunit is specified by
> the user, the script will first check if kunit is present at
> <kdir>/tools/testing/kunit/kunit.py.  Further, --kunit needs to be set
> to a particular value from [alltests, defconfig, kunitconfig] (i.e.
> --kunit=kunitconfig), where this value specifies whether to run
> alltests, defconfig kunit tests or tests that can be configured with a
> user-created .kunitconfig file. If kunit_tool is present, the kunit.py
> run command is executed and the parsed test results are printed to
> console as well as stored as a JSON in a file specified by --kunit_json.
> 
> Signed-off-by: Heidi Fahim <heidifahim@google.com>
> Change-Id: I321a8c95438cfede3cceffe18e43c6e039981e15
> ---
>  kci_build         |  6 +++---
>  kernelci/build.py | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
>  kernelci/cli.py   | 15 ++++++++++++++
>  3 files changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/kci_build b/kci_build
> index 5dbdab17..8949facc 100755
> --- a/kci_build
> +++ b/kci_build
> @@ -252,15 +252,15 @@ class cmd_list_kernel_configs(Command):
>  
>  class cmd_build_kernel(Command):
>      help = "Build a kernel"
> -    args = [Args.build_env, Args.arch, Args.kdir]
> +    args = [Args.build_env, Args.arch, Args.kdir, Args.kunit, Args.kunit_json]

If we did go down the route of using kci_build for KUnit, these
arguments should be optional and added to opt_args instead.

>      opt_args = [Args.defconfig, Args.j, Args.verbose, Args.output,
>                  Args.mod_path]
>  
>      def __call__(self, configs, args):
>          build_env = configs['build_environments'][args.build_env]
>          return kernelci.build.build_kernel(
> -            build_env, args.kdir, args.arch, args.defconfig, args.j,
> -            args.verbose, args.output, args.mod_path)
> +            build_env, args.kdir, args.arch, args.kunit, args.kunit_json,
> +            args.defconfig, args.j,args.verbose, args.output, args.mod_path)
>  
>  
>  class cmd_install_kernel(Command):
> diff --git a/kernelci/build.py b/kernelci/build.py
> index 0a1501de..25e50425 100644
> --- a/kernelci/build.py
> +++ b/kernelci/build.py
> @@ -18,6 +18,7 @@
>  import fnmatch
>  import itertools
>  import json
> +import logging
>  import os
>  import platform
>  import requests
> @@ -561,12 +562,16 @@ def _kernel_config_enabled(dot_config, name):
>      return shell_cmd('grep -cq CONFIG_{}=y {}'.format(name, dot_config), True)
>  
>  
> -def build_kernel(build_env, kdir, arch, defconfig=None, jopt=None,
> +def build_kernel(build_env, kdir, arch, kunit, kunit_json, defconfig=None, jopt=None,
>                   verbose=False, output_path=None, mod_path=None):
>      """Build a linux kernel
>  
>      *build_env* is a BuildEnvironment object
>      *kdir* is the path to the kernel source directory
> +    *kunit* runs KUnit tests under a specific config option (alltests,
> +    defconfig, kunitconfig)
> +    *kunit_json* specifies KUnit test result JSON filename, should not be
> +    specified without --kunit
>      *defconfig* is the name of the kernel defconfig
>      *jopt* is the -j option to pass to make for parallel builds
>      *verbose* is whether to print all the output of the make commands
> @@ -685,6 +690,9 @@ def build_kernel(build_env, kdir, arch, defconfig=None, jopt=None,
>      with open(os.path.join(output_path, 'bmeta.json'), 'w') as json_file:
>          json.dump(bmeta, json_file, indent=4, sort_keys=True)

Well, it looks like nothing special actually needs to be changed
in the build function, only that KUnit needs a particular kernel
config and arch (uml).  So I think it's better to leave
the "kci_build build_kernel" step unchanged and have something
else to run KUnit tests afterwards - see below.

> +    if kunit:
> +        kunit_json = run_kunit_tests(kdir, kunit, kunit_json)
> +        # TODO: add functionality using the generated KUnit JSON

I guess the missing part is about submitting test results to the
KernelCI backend API?

>      return result
>  
>  
> @@ -933,3 +941,44 @@ def load_json(bmeta_json, dtbs_json):
>      with open(dtbs_json) as json_file:
>          dtbs = json.load(json_file)['dtbs']
>      return bmeta, dtbs
> +
> +
> +def run_kunit_tests(kdir, kunit, kunit_json):
> +    """Run KUnit tests on a UML instance and return the results in a JSON file
> +
> +    The kunit_params dict keeps the information for the KUnit run command in
> +    one place: the path to run KUnit, the test configurations,and the path to
> +    theoutput JSON. This way if any of these values change, only this variable
> +    needs to be modified.
> +
> +    *kdir* is the path to the kernel source directory
> +    *kunit* specifies which tests to run: all kunit tests, or tests specified in
> +    the default kunit config, or tests specified in the custom kunitconfig
> +    *kunit_json* specifies the filename to store the KUnit test results JSON
> +
> +    The returned value is the filepath to the JSON holding the tests results
> +    """
> +    kunit_params = {
> +        'run_path': os.path.realpath(
> +                            os.path.join(kdir, 'tools/testing/kunit/kunit.py')),
> +        'defconfig': '--defconfig',
> +        'alltests': '--alltests',
> +        'kunit_json': kunit_json,
> +    }
> +    kunit_config = '' if kunit == 'kunitconfig' else kunit_params[kunit]

Unless I'm missing something, this function is essentially
calling kunit.py with some arguments.  This could be done with a
shell script outside of this Python module altogether.

So I believe one way to integrate this completely into
kernelci-core would be to add a template shell script around
kunit.py and an entry in test-configs.yaml for a "kunit" test
plan with parameters to run one of the available options such
'alltests', 'defconfig' or 'kunitconfig'.

Then this could be run with a new type of lab which could be
called "shell", to run commands directly on the current host.  At
the moment, all the labs declared in lab-configs.yaml are of
the "lava" type.  For KUnit, there could be a "kunit" lab of the
type "shell" and a new class in kernelci-core/kernelci/lab to run
arbitrary commands and produce test results in a format suitable
to then be sent to the KernelCI backend.

Maybe I can help you with an example for this if you're not yet
familiar with how kci_test works.

> +    run_cmd = "%s run --json=%s %s" % (kunit_params['run_path'],
> +                                       kunit_params['kunit_json'],
> +                                       kunit_config)
> +    try:
> +        if kunit == 'alltests':
> +            shell_cmd(run_cmd, ret_code=True)
> +        else:
> +            print(shell_cmd(run_cmd, ret_code=False))
> +        src = os.path.join(kdir, kunit_params['kunit_json'])
> +        dest = os.path.join(os.path.dirname(__file__),
> +                            kunit_params['kunit_json'])
> +        shutil.copyfile(src, dest)
> +        return dest
> +    except Exception:
> +        logging.error("KUnit error: ensure that KUnit tool is in the "
> +                      "correct directory at %s/tools/testing/kunit/.")
> \ No newline at end of file
> diff --git a/kernelci/cli.py b/kernelci/cli.py
> index 6e890232..50f0c25c 100644
> --- a/kernelci/cli.py
> +++ b/kernelci/cli.py
> @@ -246,6 +246,21 @@ class Args(object):
>          'help': "Path to the debos files",
>      }
>  
> +    kunit = {
> +        'name': '--kunit',
> +        'nargs': '?',
> +        'help':
> +        "Run KUnit tests for UML, specifying if the def kunit config,"
> +        "custom kunitconfig, or all tests should be ran",
> +        'choices': ['alltests', 'defconfig', 'kunitconfig'],
> +        'const': 'kunitconfig'
> +    }
> +
> +    kunit_json = {
> +        'name': '--kunit_json',
> +        'help': "Filename to store KUnit test results JSON",
> +    }
> +
>  
>  class Command(object):
>      """A command helper class.
> 

Thanks for this first step, it looks quite promising even though
there may still quite a bit of work needed to complete it.  I
haven't actually tried to run it yet, only shared my first
thoughts here.  I should give it a try later this week though.

Best wishes,
Guillaume
