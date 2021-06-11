Subject: Re: #KCIDB engagement report
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <202106011315.432A65D6@keescook>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <774899c5-c20a-3d7e-3289-ee257b86e06e@collabora.com>
Date: Fri, 11 Jun 2021 17:11:59 +0100
MIME-Version: 1.0
In-Reply-To: <202106011315.432A65D6@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, keescook@chromium.org, Nick Desaulniers <ndesaulniers@google.com>
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

Hi Kees,

On 01/06/2021 21:26, Kees Cook wrote:
> On Mon, May 24, 2021 at 10:38:22AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
>> On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
>> <Nikolai.Kondrashov@redhat.com> wrote:
>>> [...]
>>>      KernelCI native
>>>          Sending (a lot of) production build and test results.
>>>          https://staging.kernelci.org:3000/?var-origin=kernelci
>>> [...]
> 
> Apologies for the thread hijack, but does anyone know what's happening
> with kselftest? It seems missing from the listed[1] build artifacts, but
> it is actually present[2] (and I see the logs for generating the tarball
> there too), but I can't find any builds that actually run the tests?
> 
> (Or how do I see a top-level list of all tests and search it?)

The kselftest results are all there on the KernelCI native
dashboard, for example the futex tests:

  https://linux.kernelci.org/test/job/mainline/branch/master/kernel/v5.13-rc5-74-g06af8679449d/plan/kselftest-futex/


Here's a set of passing results on a "coral" x86 Chromebook, with
a bunch of unknowns but that's because other kselftests are being
run when they shouldn't (net, mqueue, ptrace) so it's noise which
should get resolved with a fix soon:

  https://linux.kernelci.org/test/plan/id/60c2bf67ed48b86ffe0c0df8/


And here are the full kernel build details:

  https://linux.kernelci.org/build/id/60c2bdeea60229633d0c0f0c/

and artifacts (logs, binaries, meta-data in JSON):

  https://storage.kernelci.org/mainline/master/v5.13-rc5-74-g06af8679449d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-8/


So this is the original data, now let's look at what we have in
KCIDB.  Here's the matching build:

  https://kcidb.kernelci.org/d/build/build?orgId=1&var-dataset=kernelci04&var-id=kernelci:kernelci.org:60c2bdeea60229633d0c0f0c

However there's no results, probably because submitting the data
failed for some reason.  It could be due to some invalid
characters in the test names.  The Log link works though, it
takes you to the directory with all the log files - to be
improved as it's advertised as a single build log...

So we'll take a closer look, see if there were any errors in the
logs to find out why the results aren't in KCIDB.  But the
kselftests were definitely run.


Thanks,
Guillaume

> [1] https://kcidb.kernelci.org/d/build/build?orgId=1&var-dataset=kernelci04&var-id=kernelci:kernelci.org:60b654321456eb7654b3afa6&fullscreen&panelId=17
> [2] https://storage.kernelci.org//mainline/master/v5.13-rc4-11-gc2131f7e73c9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-8/
