Subject: Re: Baseline test plan and bootrr
References: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
 <df8ef2bb-b351-2003-5a1c-030a056d1d63@collabora.com>
 <CAFqH_500cnVrgknz5e7=QmH99KfBihLMNA2hee92jmVvQ4_XKw@mail.gmail.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <142fbd32-4872-360e-89d2-3ca540df416e@collabora.com>
Date: Tue, 12 Feb 2019 07:52:03 +0100
MIME-Version: 1.0
In-Reply-To: <CAFqH_500cnVrgknz5e7=QmH99KfBihLMNA2hee92jmVvQ4_XKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Enric Balletbo Serra <eballetbo@gmail.com>, kernelci@groups.io
Cc: guillaume.tucker@gmail.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, anibal.limon@linaro.org, nicolas.dechesne@linaro.org, bjorn.andersson@linaro.org

On 2/11/19 6:18 PM, Enric Balletbo Serra wrote:
> cc'ing: anibal.limon@linaro.org, nicolas.dechesne@linaro.org,
> bjorn.andersson@linaro.org
> 
> Missatge de Tomeu Vizoso <tomeu.vizoso@collabora.com> del dia dl., 11
> de febr. 2019 a les 14:16:
>>
>> On 2/7/19 7:54 PM, Guillaume Tucker wrote:
>>> Hi,
>>>
>>> Currently, boot tests entirely rely on the LAVA logic to detect
>>> when a login prompt has been reached.  While this mostly works,
>>> it does not guarantee that the platform is actually usable or
>>> that everything went smoothly during the boot.
>>>
>>> For this reason, it would seem useful to introduce a "baseline"
>>> test plan which would essentially boot and then do some fast
>>> checks to verify that nothing is obviously broken.  This can
>>> include things like grepping the kernel log for any errors and
>>> checking that drivers have been initialised correctly.  There's a
>>> lot that can be done in a few seconds with a basic ramdisk.
>>>
>>>
>>> So we could have a list of regular expressions to detect any
>>> issues in the kernel log and report a LAVA test case result for
>>> each of them.  The log fragment associated with each match should
>>> also be available to include the actual errors in a report.
>>> Doing this on the device means we keep the test definition in the
>>> same location as the other test plans, and we can run it like any
>>> test suite.
>>>
>>>
>>> Another useful tool is bootrr, which my colleague Enric has
>>> started to use on some Chromebook devices.  It can check that
>>> drivers have been loaded and devices probed correctly.  It's
>>> entirely written in shell scripts so it can be run in our current
>>> buildroot rootfs and can easily be extended to run other checks.
>>> It looks up the device tree platform name and uses that to call a
>>> platform-specific script with relevant drivers and devices.
>>> Here's Enric's branch with such scripts for a few devices and a
>>> LAVA test definition:
>>>
>>>     https://github.com/eballetbo/bootrr/commits/master
>>>
>>> and some sample runs with buildroot:
>>>
>>>     https://lava.collabora.co.uk/scheduler/job/1478554
>>>     https://lava.collabora.co.uk/scheduler/job/1478553
>>>
>>>
>>> Does this look like something worth running in KernelCI?  Should
>>> we just have a bootrr test plan or go for the "baseline" test
>>> plan I'm suggesting, to be run on all devices and ultimately
>>> instead of the current boot-to-login jobs?
>>
>> I think we could get a substantially part of the benefits that bootrr
>> provides by trivially checking that /sys/kernel/debug/devices_deferred is
>> empty after all modules have been loaded.
>>
> 
> Agree, although this doesn't cover when a driver simply fails (not
> returning -EPROBE_DEFER)

In these cases, there should have been an error or warning printed that 
should have been parsed and considered as a test failure.

Of course, misbehaved drivers could fail silently, but that's not that 
different from a driver not returning an error in probe() but remaining 
in a non-functional state.

> or when a driver is not instantiated for some
> reason (so the probe is not called) but should be.

Yeah, that requires I guess some way to specify that we expect these 
drivers to be available in these boards.

But that's information that we'll need to give anyway when we enable more 
advanced test suites. For each device, we'll need to give information 
such as on which storage device to run a specific test case, etc. Right 
now we are only telling which device types should be able to run specific 
test suites.

> But is a simple
> trivial test that *we should definitely add.*

My exact point, I think there's a lot of value in there.

> I was also thinking about the idea of implementing a
> /sys/kernel/debug/devices_failed with a list of devices that failed to
> probe, but I'm not sure if makes sense or not. Again, this will not
> solve the problem when the driver is not instantiated for some reason
> but should be, and also, we can get some drivers that fail but are
> expected to fail for the device-specific platform. So in such case, we
> will need some kind of ignore list per device-specific to avoid false
> boot regressions.

Yeah, past devices_deferred the benefit / cost ratio starts declining 
sharply :)

>> We probably want to do that even if we had bootrr, as I find unlikely
>> that people will maintain device-specific scripts for all the devices we
>> test on.
>>
> 
> That's also one of my worries, how difficult will be maintain these
> device-specific scripts. I'm wondering if the bootrr developers have
> or thought at some point on some kind of automatic tool to generate
> the scripts (i.e parsing the DT, however, this doesn't cover all the
> cases) or if is done always manually.

The kernel already exposes the device list to userspace, doesn't it? But 
that doesn't help with knowing which of them aren't expected to probe.

I think I would personally just keep adding test suites, which of course 
would fail if the target device isn't present. This should also catch 
bugs that caused a dependency to fail probing (clocks, regulators, 
pinmux, etc).

Cheers,

Tomeu



> Cheers,
>    Enric
> 
>> Cheers,
>>
>> Tomeu
>>
>>
>>
>>> Best wishes,
>>> Guillaume
>>>
>>>
>>>
>>
>> 
>>
