Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kernelci-backend: /callback/lava/test: only "lava" results?
In-Reply-To: <1ae947fb-2e1d-e1b3-0637-cb35e05d833d@collabora.com>
References: <7hr25oy9il.fsf@baylibre.com> <1ae947fb-2e1d-e1b3-0637-cb35e05d833d@collabora.com>
Date: Tue, 27 Aug 2019 14:48:09 -0700
Message-ID: <7h7e6ywa92.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Khouloud Touil <ktouil@baylibre.com>

Guillaume Tucker <guillaume.tucker@collabora.com> writes:

> On 13/08/2019 23:40, Kevin Hilman wrote:
>> Hi Guillaume,
>> 
>> In testing the recent PR to add fastboot support and a new
>> "boot-fastboot" testplan[1], we noticed that while the jobs are booting
>> fine, there were not results in the backend.
>> 
>> After a bit of digging, I think this is because this new test-plan job
>> has a deploy and boot section, but no test section, but the
>> lava-v2-jobs-from-api will set the "notify" callback to use
>> /callback/lava/test for any testplan that's not called "boot".
>
> Correct.
>
>> Looking at the backend code[2] that's handling the suite_names, it seems
>> that we intentionally ignore the "lava" test-suite in any plan-name
>> that's not "boot".
>
> Correct, the "lava" part doesn't have anything to do with
> KernelCI test plans, it's a LAVA implementation detail.
>
>> This means that oure current "boot-nfs" test-plan and the new
>> "boot-fastboot" testplan, neither of which have a test section, and use
>> the /callback/lava/test API will never produce any data in the database.
>
> Yes, and that's also the case for the new UEFI test plans.
>
>> So I came up with two potential solutions for this.
>> 
>> 1) lava-v2-jobs-from-api solution: treat the "boot-*" test plans like
>>    the existing "boot" testplan and make them use the
>>    /callback/lava/boot API.  This is a simple patch[3]
>
> That's easy because all we need to do is add a "name: boot"
> attribute to these boot-* test plans in YAML.  The patch in [3]
> is a bit fragile and implicit so probably best...
>
> But then the real problem with this is you can't distinguish the
> difference between different boot-* plans as they'll all appear
> as boot results.  So if you do a plain boot with one board, and
> then a boot-nfs with that same board, the boot-nfs results will
> overwrite the boot ones.  More about this further down...
>
>
>> 2) backend solution: handle the boot-* test-plans like the "boot"
>>    test-plan and save the lava test-suite[4] as well
>
> The "lava" part should never ever have been saved in the backend
> because it's not part of the KernelCI tests.  Also, hard-coding
> things there is bad.  The boot test plan is on its way out - see
> option 3 :)
>
>> I kind of prefer (2) since I think the /test API and data are more
>> useful in the long term.
>> 
>> I guess another solution would be
>> 
>> 3) ensure that all non-"boot" test-plans have a basic "test" section
>> (something like simple.jinja2)
>
> Yes, this is the best approach IMO.  This is what the "baseline"
> test plan is all about.

OK, I'm fully on board with that.  I know that's the direction we're
headed, but it's a bit slow with the current amount of active
developers.

> It has been put on hold because of other
> issues in KernelCI, but that's essentially what it is there for:
>
> * stop relying solely on LAVA's login success to treat a boot
>   test as "good"
>
> * look for any kernel warnings or errors in the log after logging
>   in as a first set of test cases
>
> * check that drivers and devices have been probed as expected
>   wherever possible (typically using bootrr)
>
> With alternative ways to boot a same platforms such as nfs, uefi,
> fastboot, we can then have baseline test plan variants which will
> all be saving results in the backend accordingly.  I think it's
> becoming important enough to resolve this now given all these new
> things, so we should resume progress on this front and replace
> the boot test plan once baseline is running on all the platforms.
>
> The "simple" test plan should also then become obsolete, unless
> we repurpose it for other types of functional tests run on a
> subset of platforms.
>
> Of course, one of the issues that have been blocking progress is
> that the front-end Tests page is currently broken.  So that would
> need to be fixed too.

FWIW, we (BayLibre) have some experiments going on with front-end
replacements going on with an ELK stack building on the kcing work from
Charles Olivera.

In addition to visualization for test results, we're also working on
ways to collect/correlate/show the test results (and measurements) from
multiple jobs (e.g. LAVA multi-node.)  The first use-case being
power-measurement using equipment external to the DUT.

IMO, the current kernelci-frontend is not at all suited for the
visualization tasks we have in mind, and we need something more
flexible.  I'm not fully convinced that ELK is either, but it's proving
to be pretty powerful.

Maybe the Linaro Squad folks have some good stuff here too, but I'm not
sure.

But overall, you're right.  We need work on test visualization in order
to better explore the growing kinds of tests we have coming.

Kevin
