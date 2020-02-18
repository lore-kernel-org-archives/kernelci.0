MIME-Version: 1.0
References: <d8ae2e8a-67a7-3f2a-6bc1-55491626de0b@collabora.com>
In-Reply-To: <d8ae2e8a-67a7-3f2a-6bc1-55491626de0b@collabora.com>
From: heidifahim@google.com
Date: Tue, 18 Feb 2020 15:03:43 -0800
Message-ID: <CAMVcs3sw1xEM_1XQWxXug8jWrQKxKZW4Bj+Z-1sdqrfiv=KMHw@mail.gmail.com>
Subject: Re: [PATCH] kunit: Add kunit_tool support in kernelci-core
Content-Type: multipart/alternative; boundary="00000000000097d29a059ee1afcd"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, David Gow <davidgow@google.com>, kernelci@groups.io

--00000000000097d29a059ee1afcd
Content-Type: text/plain; charset="UTF-8"

Thanks for your comments! I'll be addressing them soon.

Just FYI, make sure to cherry pick patchset 11
<https://kunit-review.googlesource.com/c/linux/+/3289/11> on my Gerrit
change. This one has all my merged changes working with kernelci properly,
other patchsets only have the all config change.


On Mon, Feb 17, 2020 at 2:38 PM Guillaume Tucker <
guillaume.tucker@collabora.com> wrote:

> Hi Heidi,
>
> Thanks for sharing your branch on GitHub:
>
>   https://github.com/Heidifahim/kernelci-core/commits/kci_kunit
>
> There are essentially 2 patches there, the first one is to
> get "git describe" to work with no tags and it's already merged.
> The second one is the one below about running KUnit tests, I
> thought I would do an inline review here initially.
>
> On 31/01/2020 00:52, Heidi Fahim wrote:
> > --kunit and --kunit_json flags have been added that can be specified
> > with the "./kci_build build_kernel" command.  If --kunit is specified by
> > the user, the script will first check if kunit is present at
> > <kdir>/tools/testing/kunit/kunit.py.  Further, --kunit needs to be set
> > to a particular value from [alltests, defconfig, kunitconfig] (i.e.
> > --kunit=kunitconfig), where this value specifies whether to run
> > alltests, defconfig kunit tests or tests that can be configured with a
> > user-created .kunitconfig file. If kunit_tool is present, the kunit.py
> > run command is executed and the parsed test results are printed to
> > console as well as stored as a JSON in a file specified by --kunit_json.
> >
> > Signed-off-by: Heidi Fahim <heidifahim@google.com>
> > Change-Id: I321a8c95438cfede3cceffe18e43c6e039981e15
> > ---
> >  kci_build         |  6 +++---
> >  kernelci/build.py | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  kernelci/cli.py   | 15 ++++++++++++++
> >  3 files changed, 68 insertions(+), 4 deletions(-)
> >
> > diff --git a/kci_build b/kci_build
> > index 5dbdab17..8949facc 100755
> > --- a/kci_build
> > +++ b/kci_build
> > @@ -252,15 +252,15 @@ class cmd_list_kernel_configs(Command):
> >
> >  class cmd_build_kernel(Command):
> >      help = "Build a kernel"
> > -    args = [Args.build_env, Args.arch, Args.kdir]
> > +    args = [Args.build_env, Args.arch, Args.kdir, Args.kunit,
> Args.kunit_json]
>
> If we did go down the route of using kci_build for KUnit, these
> arguments should be optional and added to opt_args instead.
>
> >      opt_args = [Args.defconfig, Args.j, Args.verbose, Args.output,
> >                  Args.mod_path]
> >
> >      def __call__(self, configs, args):
> >          build_env = configs['build_environments'][args.build_env]
> >          return kernelci.build.build_kernel(
> > -            build_env, args.kdir, args.arch, args.defconfig, args.j,
> > -            args.verbose, args.output, args.mod_path)
> > +            build_env, args.kdir, args.arch, args.kunit,
> args.kunit_json,
> > +            args.defconfig, args.j,args.verbose, args.output,
> args.mod_path)
> >
> >
> >  class cmd_install_kernel(Command):
> > diff --git a/kernelci/build.py b/kernelci/build.py
> > index 0a1501de..25e50425 100644
> > --- a/kernelci/build.py
> > +++ b/kernelci/build.py
> > @@ -18,6 +18,7 @@
> >  import fnmatch
> >  import itertools
> >  import json
> > +import logging
> >  import os
> >  import platform
> >  import requests
> > @@ -561,12 +562,16 @@ def _kernel_config_enabled(dot_config, name):
> >      return shell_cmd('grep -cq CONFIG_{}=y {}'.format(name,
> dot_config), True)
> >
> >
> > -def build_kernel(build_env, kdir, arch, defconfig=None, jopt=None,
> > +def build_kernel(build_env, kdir, arch, kunit, kunit_json,
> defconfig=None, jopt=None,
> >                   verbose=False, output_path=None, mod_path=None):
> >      """Build a linux kernel
> >
> >      *build_env* is a BuildEnvironment object
> >      *kdir* is the path to the kernel source directory
> > +    *kunit* runs KUnit tests under a specific config option (alltests,
> > +    defconfig, kunitconfig)
> > +    *kunit_json* specifies KUnit test result JSON filename, should not
> be
> > +    specified without --kunit
> >      *defconfig* is the name of the kernel defconfig
> >      *jopt* is the -j option to pass to make for parallel builds
> >      *verbose* is whether to print all the output of the make commands
> > @@ -685,6 +690,9 @@ def build_kernel(build_env, kdir, arch,
> defconfig=None, jopt=None,
> >      with open(os.path.join(output_path, 'bmeta.json'), 'w') as
> json_file:
> >          json.dump(bmeta, json_file, indent=4, sort_keys=True)
>
> Well, it looks like nothing special actually needs to be changed
> in the build function, only that KUnit needs a particular kernel
> config and arch (uml).  So I think it's better to leave
> the "kci_build build_kernel" step unchanged and have something
> else to run KUnit tests afterwards - see below.
>
> > +    if kunit:
> > +        kunit_json = run_kunit_tests(kdir, kunit, kunit_json)
> > +        # TODO: add functionality using the generated KUnit JSON
>
> I guess the missing part is about submitting test results to the
> KernelCI backend API?
>
> >      return result
> >
> >
> > @@ -933,3 +941,44 @@ def load_json(bmeta_json, dtbs_json):
> >      with open(dtbs_json) as json_file:
> >          dtbs = json.load(json_file)['dtbs']
> >      return bmeta, dtbs
> > +
> > +
> > +def run_kunit_tests(kdir, kunit, kunit_json):
> > +    """Run KUnit tests on a UML instance and return the results in a
> JSON file
> > +
> > +    The kunit_params dict keeps the information for the KUnit run
> command in
> > +    one place: the path to run KUnit, the test configurations,and the
> path to
> > +    theoutput JSON. This way if any of these values change, only this
> variable
> > +    needs to be modified.
> > +
> > +    *kdir* is the path to the kernel source directory
> > +    *kunit* specifies which tests to run: all kunit tests, or tests
> specified in
> > +    the default kunit config, or tests specified in the custom
> kunitconfig
> > +    *kunit_json* specifies the filename to store the KUnit test results
> JSON
> > +
> > +    The returned value is the filepath to the JSON holding the tests
> results
> > +    """
> > +    kunit_params = {
> > +        'run_path': os.path.realpath(
> > +                            os.path.join(kdir,
> 'tools/testing/kunit/kunit.py')),
> > +        'defconfig': '--defconfig',
> > +        'alltests': '--alltests',
> > +        'kunit_json': kunit_json,
> > +    }
> > +    kunit_config = '' if kunit == 'kunitconfig' else kunit_params[kunit]
>
> Unless I'm missing something, this function is essentially
> calling kunit.py with some arguments.  This could be done with a
> shell script outside of this Python module altogether.
>
> So I believe one way to integrate this completely into
> kernelci-core would be to add a template shell script around
> kunit.py and an entry in test-configs.yaml for a "kunit" test
> plan with parameters to run one of the available options such
> 'alltests', 'defconfig' or 'kunitconfig'.
>
> Then this could be run with a new type of lab which could be
> called "shell", to run commands directly on the current host.  At
> the moment, all the labs declared in lab-configs.yaml are of
> the "lava" type.  For KUnit, there could be a "kunit" lab of the
> type "shell" and a new class in kernelci-core/kernelci/lab to run
> arbitrary commands and produce test results in a format suitable
> to then be sent to the KernelCI backend.
>
> Maybe I can help you with an example for this if you're not yet
> familiar with how kci_test works.
>
> > +    run_cmd = "%s run --json=%s %s" % (kunit_params['run_path'],
> > +                                       kunit_params['kunit_json'],
> > +                                       kunit_config)
> > +    try:
> > +        if kunit == 'alltests':
> > +            shell_cmd(run_cmd, ret_code=True)
> > +        else:
> > +            print(shell_cmd(run_cmd, ret_code=False))
> > +        src = os.path.join(kdir, kunit_params['kunit_json'])
> > +        dest = os.path.join(os.path.dirname(__file__),
> > +                            kunit_params['kunit_json'])
> > +        shutil.copyfile(src, dest)
> > +        return dest
> > +    except Exception:
> > +        logging.error("KUnit error: ensure that KUnit tool is in the "
> > +                      "correct directory at %s/tools/testing/kunit/.")
> > \ No newline at end of file
> > diff --git a/kernelci/cli.py b/kernelci/cli.py
> > index 6e890232..50f0c25c 100644
> > --- a/kernelci/cli.py
> > +++ b/kernelci/cli.py
> > @@ -246,6 +246,21 @@ class Args(object):
> >          'help': "Path to the debos files",
> >      }
> >
> > +    kunit = {
> > +        'name': '--kunit',
> > +        'nargs': '?',
> > +        'help':
> > +        "Run KUnit tests for UML, specifying if the def kunit config,"
> > +        "custom kunitconfig, or all tests should be ran",
> > +        'choices': ['alltests', 'defconfig', 'kunitconfig'],
> > +        'const': 'kunitconfig'
> > +    }
> > +
> > +    kunit_json = {
> > +        'name': '--kunit_json',
> > +        'help': "Filename to store KUnit test results JSON",
> > +    }
> > +
> >
> >  class Command(object):
> >      """A command helper class.
> >
>
> Thanks for this first step, it looks quite promising even though
> there may still quite a bit of work needed to complete it.  I
> haven't actually tried to run it yet, only shared my first
> thoughts here.  I should give it a try later this week though.
>
> Best wishes,
> Guillaume
>

--00000000000097d29a059ee1afcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your comments! I&#39;ll be addressing them soon=
.<div><br></div><div>Just FYI, make sure to cherry pick <a href=3D"https://=
kunit-review.googlesource.com/c/linux/+/3289/11">patchset 11</a> on my Gerr=
it change. This one has all my merged changes working with kernelci properl=
y, other patchsets only have the all config change.</div></div><br><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 17=
, 2020 at 2:38 PM Guillaume Tucker &lt;<a href=3D"mailto:guillaume.tucker@c=
ollabora.com">guillaume.tucker@collabora.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Heidi,<br>
<br>
Thanks for sharing your branch on GitHub:<br>
<br>
=C2=A0 <a href=3D"https://github.com/Heidifahim/kernelci-core/commits/kci_k=
unit" rel=3D"noreferrer" target=3D"_blank">https://github.com/Heidifahim/ke=
rnelci-core/commits/kci_kunit</a><br>
<br>
There are essentially 2 patches there, the first one is to<br>
get &quot;git describe&quot; to work with no tags and it&#39;s already merg=
ed.<br>
The second one is the one below about running KUnit tests, I<br>
thought I would do an inline review here initially.<br>
<br>
On 31/01/2020 00:52, Heidi Fahim wrote:<br>
&gt; --kunit and --kunit_json flags have been added that can be specified<b=
r>
&gt; with the &quot;./kci_build build_kernel&quot; command.=C2=A0 If --kuni=
t is specified by<br>
&gt; the user, the script will first check if kunit is present at<br>
&gt; &lt;kdir&gt;/tools/testing/kunit/kunit.py.=C2=A0 Further, --kunit need=
s to be set<br>
&gt; to a particular value from [alltests, defconfig, kunitconfig] (i.e.<br=
>
&gt; --kunit=3Dkunitconfig), where this value specifies whether to run<br>
&gt; alltests, defconfig kunit tests or tests that can be configured with a=
<br>
&gt; user-created .kunitconfig file. If kunit_tool is present, the kunit.py=
<br>
&gt; run command is executed and the parsed test results are printed to<br>
&gt; console as well as stored as a JSON in a file specified by --kunit_jso=
n.<br>
&gt; <br>
&gt; Signed-off-by: Heidi Fahim &lt;<a href=3D"mailto:heidifahim@google.com=
" target=3D"_blank">heidifahim@google.com</a>&gt;<br>
&gt; Change-Id: I321a8c95438cfede3cceffe18e43c6e039981e15<br>
&gt; ---<br>
&gt;=C2=A0 kci_build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt;=C2=A0 kernelci/build.py | 51 +++++++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 kernelci/cli.py=C2=A0 =C2=A0| 15 ++++++++++++++<br>
&gt;=C2=A0 3 files changed, 68 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/kci_build b/kci_build<br>
&gt; index 5dbdab17..8949facc 100755<br>
&gt; --- a/kci_build<br>
&gt; +++ b/kci_build<br>
&gt; @@ -252,15 +252,15 @@ class cmd_list_kernel_configs(Command):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class cmd_build_kernel(Command):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 help =3D &quot;Build a kernel&quot;<br>
&gt; -=C2=A0 =C2=A0 args =3D [Args.build_env, Args.arch, Args.kdir]<br>
&gt; +=C2=A0 =C2=A0 args =3D [Args.build_env, Args.arch, Args.kdir, Args.ku=
nit, Args.kunit_json]<br>
<br>
If we did go down the route of using kci_build for KUnit, these<br>
arguments should be optional and added to opt_args instead.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 opt_args =3D [Args.defconfig, Args.j, Args.verbose=
, Args.output,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.mod=
_path]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def __call__(self, configs, args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_env =3D configs[&#39;build_env=
ironments&#39;][args.build_env]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kernelci.build.build_kernel(<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_env, args.kdir, args.=
arch, args.defconfig, args.j,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.verbose, args.output, =
args.mod_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_env, args.kdir, args.=
arch, args.kunit, args.kunit_json,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.defconfig, args.j,args=
.verbose, args.output, args.mod_path)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class cmd_install_kernel(Command):<br>
&gt; diff --git a/kernelci/build.py b/kernelci/build.py<br>
&gt; index 0a1501de..25e50425 100644<br>
&gt; --- a/kernelci/build.py<br>
&gt; +++ b/kernelci/build.py<br>
&gt; @@ -18,6 +18,7 @@<br>
&gt;=C2=A0 import fnmatch<br>
&gt;=C2=A0 import itertools<br>
&gt;=C2=A0 import json<br>
&gt; +import logging<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import platform<br>
&gt;=C2=A0 import requests<br>
&gt; @@ -561,12 +562,16 @@ def _kernel_config_enabled(dot_config, name):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return shell_cmd(&#39;grep -cq CONFIG_{}=3Dy {}&#3=
9;.format(name, dot_config), True)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def build_kernel(build_env, kdir, arch, defconfig=3DNone, jopt=3DNone=
,<br>
&gt; +def build_kernel(build_env, kdir, arch, kunit, kunit_json, defconfig=
=3DNone, jopt=3DNone,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ve=
rbose=3DFalse, output_path=3DNone, mod_path=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Build a linux kernel<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 *build_env* is a BuildEnvironment object<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *kdir* is the path to the kernel source directory<=
br>
&gt; +=C2=A0 =C2=A0 *kunit* runs KUnit tests under a specific config option=
 (alltests,<br>
&gt; +=C2=A0 =C2=A0 defconfig, kunitconfig)<br>
&gt; +=C2=A0 =C2=A0 *kunit_json* specifies KUnit test result JSON filename,=
 should not be<br>
&gt; +=C2=A0 =C2=A0 specified without --kunit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *defconfig* is the name of the kernel defconfig<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 *jopt* is the -j option to pass to make for parall=
el builds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *verbose* is whether to print all the output of th=
e make commands<br>
&gt; @@ -685,6 +690,9 @@ def build_kernel(build_env, kdir, arch, defconfig=
=3DNone, jopt=3DNone,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with open(os.path.join(output_path, &#39;bmeta.jso=
n&#39;), &#39;w&#39;) as json_file:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(bmeta, json_file, indent=
=3D4, sort_keys=3DTrue)<br>
<br>
Well, it looks like nothing special actually needs to be changed<br>
in the build function, only that KUnit needs a particular kernel<br>
config and arch (uml).=C2=A0 So I think it&#39;s better to leave<br>
the &quot;kci_build build_kernel&quot; step unchanged and have something<br=
>
else to run KUnit tests afterwards - see below.<br>
<br>
&gt; +=C2=A0 =C2=A0 if kunit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kunit_json =3D run_kunit_tests(kdir, kuni=
t, kunit_json)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: add functionality using the gener=
ated KUnit JSON<br>
<br>
I guess the missing part is about submitting test results to the<br>
KernelCI backend API?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return result<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -933,3 +941,44 @@ def load_json(bmeta_json, dtbs_json):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with open(dtbs_json) as json_file:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtbs =3D json.load(json_file)[&#39;d=
tbs&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return bmeta, dtbs<br>
&gt; +<br>
&gt; +<br>
&gt; +def run_kunit_tests(kdir, kunit, kunit_json):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Run KUnit tests on a UML instance and=
 return the results in a JSON file<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 The kunit_params dict keeps the information for the KUn=
it run command in<br>
&gt; +=C2=A0 =C2=A0 one place: the path to run KUnit, the test configuratio=
ns,and the path to<br>
&gt; +=C2=A0 =C2=A0 theoutput JSON. This way if any of these values change,=
 only this variable<br>
&gt; +=C2=A0 =C2=A0 needs to be modified.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *kdir* is the path to the kernel source directory<br>
&gt; +=C2=A0 =C2=A0 *kunit* specifies which tests to run: all kunit tests, =
or tests specified in<br>
&gt; +=C2=A0 =C2=A0 the default kunit config, or tests specified in the cus=
tom kunitconfig<br>
&gt; +=C2=A0 =C2=A0 *kunit_json* specifies the filename to store the KUnit =
test results JSON<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 The returned value is the filepath to the JSON holding =
the tests results<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 kunit_params =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;run_path&#39;: os.path.realpath(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(kdir, &#39;tools/testing/kunit/ku=
nit.py&#39;)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;defconfig&#39;: &#39;--defconfig&#39=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;alltests&#39;: &#39;--alltests&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;kunit_json&#39;: kunit_json,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 kunit_config =3D &#39;&#39; if kunit =3D=3D &#39;kunitc=
onfig&#39; else kunit_params[kunit]<br>
<br>
Unless I&#39;m missing something, this function is essentially<br>
calling kunit.py with some arguments.=C2=A0 This could be done with a<br>
shell script outside of this Python module altogether.<br>
<br>
So I believe one way to integrate this completely into<br>
kernelci-core would be to add a template shell script around<br>
kunit.py and an entry in test-configs.yaml for a &quot;kunit&quot; test<br>
plan with parameters to run one of the available options such<br>
&#39;alltests&#39;, &#39;defconfig&#39; or &#39;kunitconfig&#39;.<br>
<br>
Then this could be run with a new type of lab which could be<br>
called &quot;shell&quot;, to run commands directly on the current host.=C2=
=A0 At<br>
the moment, all the labs declared in lab-configs.yaml are of<br>
the &quot;lava&quot; type.=C2=A0 For KUnit, there could be a &quot;kunit&qu=
ot; lab of the<br>
type &quot;shell&quot; and a new class in kernelci-core/kernelci/lab to run=
<br>
arbitrary commands and produce test results in a format suitable<br>
to then be sent to the KernelCI backend.<br>
<br>
Maybe I can help you with an example for this if you&#39;re not yet<br>
familiar with how kci_test works.<br>
<br>
&gt; +=C2=A0 =C2=A0 run_cmd =3D &quot;%s run --json=3D%s %s&quot; % (kunit_=
params[&#39;run_path&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kunit=
_params[&#39;kunit_json&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kunit=
_config)<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if kunit =3D=3D &#39;alltests&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shell_cmd(run_cmd, ret_code=
=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(shell_cmd(run_cmd, re=
t_code=3DFalse))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D os.path.join(kdir, kunit_params[&=
#39;kunit_json&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest =3D os.path.join(os.path.dirname(__f=
ile__),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kunit_params[&#39;kunit_json&#39;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfile(src, dest)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return dest<br>
&gt; +=C2=A0 =C2=A0 except Exception:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logging.error(&quot;KUnit error: ensure t=
hat KUnit tool is in the &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;correct directory at %s/tools/testing/kunit/.&quot;)<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/kernelci/cli.py b/kernelci/cli.py<br>
&gt; index 6e890232..50f0c25c 100644<br>
&gt; --- a/kernelci/cli.py<br>
&gt; +++ b/kernelci/cli.py<br>
&gt; @@ -246,6 +246,21 @@ class Args(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;help&#39;: &quot;Path to the de=
bos files&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 kunit =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;name&#39;: &#39;--kunit&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;nargs&#39;: &#39;?&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;help&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Run KUnit tests for UML, specifying=
 if the def kunit config,&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;custom kunitconfig, or all tests sh=
ould be ran&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;choices&#39;: [&#39;alltests&#39;, &=
#39;defconfig&#39;, &#39;kunitconfig&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;const&#39;: &#39;kunitconfig&#39;<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 kunit_json =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;name&#39;: &#39;--kunit_json&#39;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;help&#39;: &quot;Filename to store K=
Unit test results JSON&quot;,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class Command(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;A command helper class.<br>
&gt; <br>
<br>
Thanks for this first step, it looks quite promising even though<br>
there may still quite a bit of work needed to complete it.=C2=A0 I<br>
haven&#39;t actually tried to run it yet, only shared my first<br>
thoughts here.=C2=A0 I should give it a try later this week though.<br>
<br>
Best wishes,<br>
Guillaume<br>
</blockquote></div>

--00000000000097d29a059ee1afcd--
