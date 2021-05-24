MIME-Version: 1.0
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
In-Reply-To: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Mon, 24 May 2021 10:38:22 -0700
Message-ID: <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
Subject: Re: #KCIDB engagement report
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On Mon, May 24, 2021 at 12:50 AM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> Hi everyone,
>
> Below is the monthly report on KCIDB* engagement. It lists various CI systems
> and their status of engagement with KCIDB, and once we get to that, will list
> developer engagement.
>
> Lines with updates are marked with "!".
>
> Not much news this time, as I had to tend to CKI matters, and had a couple
> weeks of vacation. I still have to tie some loose CKI ends before I return to
> working on a new KCIDB release and reaching developers with e-mail
> notifications.
>
> However, I did try to contact Huawei's Compass CI with an invitation for
> cooperation, but got no response so far.
>
>      KernelCI native
>          Sending (a lot of) production build and test results.
>          https://staging.kernelci.org:3000/?var-origin=kernelci
>
>      Red Hat CKI
>          Sending production results.
>          https://staging.kernelci.org:3000/?var-origin=redhat
>
>      Google Syzbot
>          Sending a subset of production results (failures only).
>          https://staging.kernelci.org:3000/?var-origin=syzbot
>
>      ARM
>          Sending production results.
>          Full commit hashes are currently not available, are spoofed, and don't
>          match the ones reported by others. To be fixed soon.
>          https://staging.kernelci.org:3000/?var-origin=arm
>
>      Sony Fuego
>          Internal design in progress.
>
>      Gentoo GKernelCI
>          Sending production results.
>          Only builds (a few architectures), no configs, no logs, and no tests
>          for now, but working on growing contributions.
>          https://staging.kernelci.org:3000/?var-origin=gkernelci
>
>      Intel 0day
>          Initial conversation concluded, general interest expressed,
>          no contact since.
>
>      Linaro
>          Sending (a lot of) Tuxsuite build results to "production" KCIDB.
>          https://staging.kernelci.org:3000/?var-origin=tuxsuite

Hi Nikolai,
It's nice to see our results getting collected; it looks for a given
tree I can even see the build results of different compilers.

For example, here's a recent run of mainline:
https://kcidb.kernelci.org/d/revision/revision?orgId=1&var-dataset=kernelci04&var-id=c4681547bcce777daf576925a966ffa824edd09d

One thing we need to be able to quickly triage when we see a build
failure with one toolchain is "is this toolchain specific or not?"  I
figure KCIDB has the data; is there a way to surface the results of
such a query quickly?  If not, that would really help us.

>
>      TuxML
>          Initial contact in response to a report.
>          There's a plan to approach us and start work in the coming months.
>
>      Yocto Project
>          Initial contact in response to a report.
>          Would like to start sending build and test results, particularly for
>          older kernels. Would like to separate upstream commits from project
>          patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196
>
> !   Huawei Compass CI
> !       Sent a message to Fengguang Wu, who was presenting it at LVC 2021.
> !       No response so far.
>
> Please respond with corrections or suggestions of other CI systems to contact.
>
> Nick
>
> *KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
>   Foundation's KernelCI project:
>   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/
>
>
>
> 
>
>


-- 
Thanks,
~Nick Desaulniers
