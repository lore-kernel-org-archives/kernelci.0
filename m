Subject: Re: [kernelci] Testing with distros
References: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com>
 <7hd0wbkeyj.fsf@baylibre.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <502ea174-4e44-8e2f-33a2-3c6db85949a1@collabora.com>
Date: Mon, 2 Jul 2018 10:07:20 +0200
MIME-Version: 1.0
In-Reply-To: <7hd0wbkeyj.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>

On 06/28/2018 01:05 AM, Kevin Hilman wrote:
> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
> 
>> One subject that comes up regularly is about testing distributions
>> against upstream kernels in KernelCI.  We've been historically using a
>> bare buildroot user-space to do boot testing and run very low-level test
>> cases.  We're now starting to produce Debian root file systems for more
>> advanced test plans and extend the coverage of kernel-user interfaces
>> (DRM, V4L2...).
>>
>> It seems like there would also be some value in having tests that
>> capture distro user-space breakages due to kernel changes.  This may
>> mean building upstream kernels with a distro config, booting with a
>> fixed stable user-space from that distro and detecting new failures.
>>
>> The next part to be defined would be what tests to run with these
>> distros, as even booting means choosing which services to start etc...
>> The point being to increase kernel test coverage without ending up
>> testing the user-space itself as this would seem outside of the scope of
>> KernelCI.
>>
>> Does this sound like a path worth exploring?
> 
> It definitely sounds like a path worth exploring, but personally, I'd
> rather get our kernel-focused testing (and reporting!) figured out using
> our debian baseline before tackling distros.

I would prefer if distros ran mainline kernels in their own CI, then 
reported the bugs upstream after triage. And ideally, added tests against 
the kernel ABI to kernelci.

Regards,

Tomeu

> In particular, I think a kselftest and/or LTP testplan should probably
> be next on the list.
> 
> Kevin
> 
> 
> 
