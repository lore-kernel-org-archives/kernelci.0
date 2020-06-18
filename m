Subject: Re: next/master bisection: baseline.login on ox820-cloudengines-pogoplug-series-3N
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
 <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
 <20200618163602.1727fffd@xps13>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <bdc6d561-acfe-311e-2e57-968d15033a15@collabora.com>
Date: Thu, 18 Jun 2020 15:59:54 +0100
MIME-Version: 1.0
In-Reply-To: <20200618163602.1727fffd@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci-results@groups.io, miquel.raynal@bootlin.com
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, kernelci@groups.io

+ kernelci@groups.io

On 18/06/2020 15:36, Miquel Raynal wrote:
> Hi Guillaume,
> 
> -reducing the Cc: list
> 
> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
> 2020 15:23:45 +0100:
> 
>> On 18/06/2020 15:09, Miquel Raynal wrote:
>>> Hi Guillaume,
>>>
>>> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
>>> 15:23:24 +0200:
>>>   
>>>> Hi Guillaume,
>>>>
>>>> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
>>>> 2020 13:28:05 +0100:
>>>>  
>>>>> Please see the bisection report below about a kernel panic.
>>>>>
>>>>> Reports aren't automatically sent to the public while we're
>>>>> trialing new bisection features on kernelci.org but this one
>>>>> looks valid.
>>>>>
>>>>> See the kernel Oops due to a NULL pointer followed by a panic:
>>>>>
>>>>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504  
>>>>
>>>> Thanks for the report, I will not be able to manage it before Monday,
>>>> but I'll try to take care of it early next week.  
>>>
>>> Actually Boris saw the issue, I just updated nand/next, it should be
>>> part of tomorrow's linux-next. Could you please report if it fixes your
>>> boot?  
>>
>> Sure, will check tomorrow.  Thanks for the update.
>>
>> We may also consider adding the nand/next branch to kernelci.org
>> and catch issues earlier.  We can discuss that separately.
> 
> That would be great! So far, we -MTD- have been lazy and relied on
> linux-next testing only. We do code analysis with Intel's 0-day robots
> but they tend to be very slow when approaching -rc6/-rc7 which is also
> an issue for us because of the wide variety of architectures we still
> support.
> 
> Currently we maintain the following branches, which are all pulled
> in linux-next:
>  * nand/next -> Raw NAND and SPI-NAND stuff
>  * spi-nor/next -> SPI-NOR stuff
>  * cfi/next -> CFI stuff
>  * mtd/next -> everything else
>  * mtd/fixes occasionally for all MTD fixes (no subsystem specific
> branch)
> 
> Are there any kernel-ci prerequisites we should be aware of?

Each branch being added means more kernels to be built and an
increased load in test labs.  But, we can fine-tune the KernelCI
configuration to handle that.

Related to Boris' email, linux-next is built with all possible
combinations of arch/defconfig/compilers, which amounts to about
150 kernels for each revision:

  https://kernelci.org/job/next/branch/master/

For your subsystem branches, we could reduce it to only build the
main defconfigs for each architecture, or maybe even a subset of
them.  Building just the defconfigs for x86, arm and arm64 would
allow to maximise the tests/build ratio.  You would also get
results quicker than the linux-next ones, typically a couple of
hours after pushing each branch.  This is what other subsystems
do, for example GPIO (linusw):

  https://kernelci.org/job/linusw/

Then we can filter which tests to run for your subsystem, at
least the "baseline" one which are very quick checks for boot
failures and other obvious issues.  Some relevant tests could
probably be added to cover flash memory devices, it has been on
the wish list for a while.  Do you have any tests to recommend?

Thanks,
Guillaume
