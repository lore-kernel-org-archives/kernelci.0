Return-Path: <richard.purdie@linuxfoundation.org>
Message-ID: <cde7e97bceec089445cda3c31d6ff9ed9d3f2e08.camel@linuxfoundation.org>
Subject: Re: [Automated-testing] KCIDB engagement report #kcidb
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Jan 2021 11:01:21 +0000
In-Reply-To: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
References: <ef0cf85a-1bb3-c3eb-7193-da39d7d8152f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

On Thu, 2021-01-21 at 12:07 +0200, Nikolai Kondrashov wrote:
> Hi everyone,
> 
> Below is the monthly report on KCIDB* engagement. It lists various CI systems
> and their status of engagement with KCIDB, and once we get to that, will list
> developer engagement.
> 
> Lines with updates are marked with "!".
> 
> The main news is that Gentoo GKernelCI have started sending their preliminary
> data to our "playground" setup. Linaro have also started work on sending
> tuxmake build results, but no reports have arrived yet.
> 
>      KernelCI native
>          Sending staging results.
>          Transitioning to production results is at 50%
>          (KCIDB support done, backend work started).
>          https://staging.kernelci.org:3000/?var-origin=kernelci
> 
>      Red Hat CKI
>          Sending production results.
>          https://staging.kernelci.org:3000/?var-origin=redhat
> 
>      Google Syzbot
>          Sending a subset of production results (failures only).
>          https://staging.kernelci.org:3000/?var-origin=syzbot
> 
>      ARM
>          Sending production results to "production" KCIDB.
>          Full commit hashes are currently not available, are spoofed, and don't
>          match the ones reported by others. To be fixed soon.
>          https://staging.kernelci.org:3000/?var-origin=arm
> 
>      Sony Fuego
>          Internal design in progress.
> 
> !   Gentoo GKernelCI
> !       Preliminary data (revisions and builds) have started flowing into
> !       "playground" KCIDB. No timestamps yet.
> !       https://staging.kernelci.org:3000/d/home/home?var-origin=gkernelci&var-dataset=playground_kernelci04
> 
>      Intel 0day
>          Initial conversation concluded, general interest expressed,
>          no contact since.
> 
> !   Linaro
> !       Work has started on sending tuxmake build results
> !       (a part of https://tuxsuite.com/). No reports have arrived yet.
> 
> Please respond with corrections or suggestions of other CI systems to contact.

I noticed Yocto Project isn't mentioned here but we do a lot of builds
of complete systems for multiple architectures and we include kernels
in those. We probably have two kernel versions under testing in any
given project release series.

Would it be useful to get data from us? If so, what kind of data?

We're generally building linux-yocto from:
https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/
which is derived from upstream kernel releases as their baseline.

Testing wise, we build them, then usually boot them under qemu with a
variety of userspaces. We also run ltp, some lsb and the tests from a
variety of projects like lttng.

An example output report we use is:

https://autobuilder.yocto.io/pub/non-release/20210120-9/testresults/testresult-report.txt

So far I'd assumed you were interested in bleeding edge kernel CI but
if there is interest around general kernel testing of older kernels, we
do have a lot of data. There are some details we don't currently log
(e.g. which kernel version in in a given test target) but we can change
that if we need it.

Cheers,

Richard







