Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS build failures in kernelCI
In-Reply-To: <20190128223906.b73t4tympcpom5fl@pburton-laptop>
References: <7hpnsgrgel.fsf@baylibre.com> <20190128223906.b73t4tympcpom5fl@pburton-laptop>
Date: Tue, 07 May 2019 08:58:13 -0700
Message-ID: <7hy33ijlyi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Hi Paul,

Paul Burton <paul.burton@mips.com> writes:

> On Mon, Jan 28, 2019 at 03:44:02PM +0100, Kevin Hilman wrote:
>> We're having various build failures for a handful of defconfigs with
>> linux-next and mainline:
>> 
>> Go to one of these views, and click on "Failed":
>> mainline: https://kernelci.org/build/mainline/branch/master/kernel/v5.0-rc4/
>> 
>> Some of those defconfig targets (decstation_defconfig,
>> jmr3927_defconfig) are failing with:
>> 
>>      cc1: error: '-march=r3900' requires '-mfp32'
>> 
>> We're trying to use standard debian compilers for all targets, and for
>> MIPS we're using: mips-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0
>
> Thanks for the report. I've just submitted a fix for that [1], and
> assuming nobody points out a problem in the next day or so I'll apply it
> to my mips-fixes branch.
>
>> The other build failures seem to be failing because there is no make
>> target for uImage.gz (which we set as the default target for MIPS.)
>> 
>> We don't currently have a good way to have different make targets for
>> different defconfigs.
>
> Would it be an option to build the 'all' target? That typically
> generates the appropriate image for the configured platform.

Revisiting this...

Turns out that 'make all' doesn't build the uImage.gz target, which is
what's used on the pistachio_marduk (with pistachio_defconfig) so we
switched the builds back to 'make uImage.gz'.

However, that fails for a few other defconfigs where that target doesn't
work.

What's your recommendation to have this working for all defconfigs?

I'm guessing we should keep 'make all' but fix any defconfigs that are
not building the uImage.gz target? 

Kevin
