Subject: Re: kernelci-backend: /callback/lava/test: only "lava" results?
References: <7hr25oy9il.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <1ae947fb-2e1d-e1b3-0637-cb35e05d833d@collabora.com>
Date: Tue, 27 Aug 2019 16:50:22 +0100
MIME-Version: 1.0
In-Reply-To: <7hr25oy9il.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Khouloud Touil <ktouil@baylibre.com>

On 13/08/2019 23:40, Kevin Hilman wrote:
> Hi Guillaume,
> 
> In testing the recent PR to add fastboot support and a new
> "boot-fastboot" testplan[1], we noticed that while the jobs are booting
> fine, there were not results in the backend.
> 
> After a bit of digging, I think this is because this new test-plan job
> has a deploy and boot section, but no test section, but the
> lava-v2-jobs-from-api will set the "notify" callback to use
> /callback/lava/test for any testplan that's not called "boot".

Correct.

> Looking at the backend code[2] that's handling the suite_names, it seems
> that we intentionally ignore the "lava" test-suite in any plan-name
> that's not "boot".

Correct, the "lava" part doesn't have anything to do with
KernelCI test plans, it's a LAVA implementation detail.

> This means that oure current "boot-nfs" test-plan and the new
> "boot-fastboot" testplan, neither of which have a test section, and use
> the /callback/lava/test API will never produce any data in the database.

Yes, and that's also the case for the new UEFI test plans.

> So I came up with two potential solutions for this.
> 
> 1) lava-v2-jobs-from-api solution: treat the "boot-*" test plans like
>    the existing "boot" testplan and make them use the
>    /callback/lava/boot API.  This is a simple patch[3]

That's easy because all we need to do is add a "name: boot"
attribute to these boot-* test plans in YAML.  The patch in [3]
is a bit fragile and implicit so probably best...

But then the real problem with this is you can't distinguish the
difference between different boot-* plans as they'll all appear
as boot results.  So if you do a plain boot with one board, and
then a boot-nfs with that same board, the boot-nfs results will
overwrite the boot ones.  More about this further down...


> 2) backend solution: handle the boot-* test-plans like the "boot"
>    test-plan and save the lava test-suite[4] as well

The "lava" part should never ever have been saved in the backend
because it's not part of the KernelCI tests.  Also, hard-coding
things there is bad.  The boot test plan is on its way out - see
option 3 :)

> I kind of prefer (2) since I think the /test API and data are more
> useful in the long term.
> 
> I guess another solution would be
> 
> 3) ensure that all non-"boot" test-plans have a basic "test" section
> (something like simple.jinja2)

Yes, this is the best approach IMO.  This is what the "baseline"
test plan is all about.  It has been put on hold because of other
issues in KernelCI, but that's essentially what it is there for:

* stop relying solely on LAVA's login success to treat a boot
  test as "good"

* look for any kernel warnings or errors in the log after logging
  in as a first set of test cases

* check that drivers and devices have been probed as expected
  wherever possible (typically using bootrr)

With alternative ways to boot a same platforms such as nfs, uefi,
fastboot, we can then have baseline test plan variants which will
all be saving results in the backend accordingly.  I think it's
becoming important enough to resolve this now given all these new
things, so we should resume progress on this front and replace
the boot test plan once baseline is running on all the platforms.

The "simple" test plan should also then become obsolete, unless
we repurpose it for other types of functional tests run on a
subset of platforms.

Of course, one of the issues that have been blocking progress is
that the front-end Tests page is currently broken.  So that would
need to be fixed too.

Guillaume

> Kevin
> 
> [1] https://github.com/kernelci/kernelci-core/pull/94
> [2] https://github.com/kernelci/kernelci-backend/blob/master/app/utils/callback/lava.py#L577
> 
> [3]
> diff --git a/lava-v2-jobs-from-api.py b/lava-v2-jobs-from-api.py
> index 9daf5e035184..9612bad312af 100755
> --- a/lava-v2-jobs-from-api.py
> +++ b/lava-v2-jobs-from-api.py
> @@ -80,7 +80,7 @@ def add_callback_params(params, config, plan):
>      callback_type = config.get('callback_type')
>  
>      if callback_type == 'kernelci':
> -        lava_cb = 'boot' if plan == 'boot' else 'test'
> +        lava_cb = 'boot' if plan.startswith('boot') else 'test'
>          params['callback_name'] = '/'.join(['lava', lava_cb])
>  
>      params.update({
> 
> [4]
> diff --git a/app/utils/callback/lava.py b/app/utils/callback/lava.py
> index dbf902509ef8..b92a63a3c12a 100644
> --- a/app/utils/callback/lava.py
> +++ b/app/utils/callback/lava.py
> @@ -579,7 +579,7 @@ def add_tests(job_data, job_meta, lab_name, db_options,
>                  # LAVA adds a prefix index to the test suite names "X_" except
>                  # for the lava key.  Remove it to get the original name.
>                  suite_name = suite_name.partition("_")[2]
> -            elif plan_name != "boot":
> +            elif not plan_name.startswith("boot"):
>                  continue
>              group = dict(meta)
>              group[models.NAME_KEY] = suite_name
> 

