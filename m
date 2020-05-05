MIME-Version: 1.0
References: <CAPDyKFoP_zTja189oGvUm0NuOe1ihi8u-XfPUwxbz3DVHrjP_w@mail.gmail.com>
 <CAH1_8nDa6f3gJJtdpS8UDDj6ZhTCCW-VPK5Ps_jqxPhH2SETpw@mail.gmail.com>
In-Reply-To: <CAH1_8nDa6f3gJJtdpS8UDDj6ZhTCCW-VPK5Ps_jqxPhH2SETpw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2020 16:05:30 +0200
Message-ID: <CAPDyKFqv1_CCT5K6xsixyys9nthz=qGFj9Qspw+gjkpPBdHqKA@mail.gmail.com>
Subject: Re: MMC tree not building anymore
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, info <info@kernelci.org>

On Thu, 30 Apr 2020 at 15:28, Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
>
> Hi Ulf,
>
> On Thu, Apr 30, 2020 at 2:14 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>
>> Hi KernelCI folkz,
>>
>> My MMC tree seems not to be included in the kernelCI infrastructure
>> anymore, as I receive no more reports.
>> Would it possible to re-enable my tree?
>
>
> Sorry, some of our kernel builders had to be turned off
> temporarily and as a result we've had to scale down the number of
> branches being monitored.  We have now started re-enabling some
> gradually to see how much the system can cope with, until we add
> a new set of builders and go back to normal.
>
> I've just enabled your ulfh/next branch again, it should be fine
> if you don't push new revisions more than once a day to limit the
> total number of builds.

Thanks a lot!

Occasionally I may push more than once per day - but normally I push
~3 times per week.

>
> Actually, maybe this would also be the opportunity to review the
> number of kernels built from your branch.  Do you need all the
> CPU architectures and all the defconfigs to be built?  For
> example, some maintainers are happy with just the main defconfigs
> such as linusw:
>
>     https://kernelci.org/build/linusw/branch/for-next/kernel/v5.7-rc2-34-g9e581cd14663/
>
> Some even just need 3 builds, for arm, arm64 and x86_64.  This is
> typically the best tests/build ratio.  Having fewer builds also
> means you'll get email reports quicker.  It's easy enough to
> adjust the KernelCI configuration to make it optimal, please let
> us know.

Okay, I think these are a good enough subset for me.

allmodconfig (arm, arm64, x86_64)
defconfig (arm64, riscv, x86_64, i386)
multi_v7_defconfig (arm)
cavium_octeon_defconfig (mips)

Kind regards
Uffe
