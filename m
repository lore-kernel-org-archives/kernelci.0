Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Baseline test plan and bootrr
In-Reply-To: <CAH1_8nCtNfBQwO=o3GCLfcrCc2L9==zRafZaULRT-5kwo995Kw@mail.gmail.com>
References: <158129CBC2E3B0B8.7959@groups.io> <CAH1_8nCtNfBQwO=o3GCLfcrCc2L9==zRafZaULRT-5kwo995Kw@mail.gmail.com>
Date: Thu, 14 Feb 2019 11:51:20 -0800
Message-ID: <7hpnruno7b.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> On Thu, Feb 7, 2019 at 6:55 PM Guillaume Tucker via Groups.Io
> <guillaume.tucker=gmail.com@groups.io> wrote:
>
>> Hi,
>>
>> Currently, boot tests entirely rely on the LAVA logic to detect
>> when a login prompt has been reached.  While this mostly works,
>> it does not guarantee that the platform is actually usable or
>> that everything went smoothly during the boot.
>>
>> For this reason, it would seem useful to introduce a "baseline"
>> test plan which would essentially boot and then do some fast
>> checks to verify that nothing is obviously broken.  This can
>> include things like grepping the kernel log for any errors and
>> checking that drivers have been initialised correctly.  There's a
>> lot that can be done in a few seconds with a basic ramdisk.
>>
>>
>> So we could have a list of regular expressions to detect any
>> issues in the kernel log and report a LAVA test case result for
>> each of them.  The log fragment associated with each match should
>> also be available to include the actual errors in a report.
>> Doing this on the device means we keep the test definition in the
>> same location as the other test plans, and we can run it like any
>> test suite.
>>
>
> Any thoughts on this part?  Does anyone see any issue with having
> a series of patterns to grep the kernel log and have a test case
> result for each of them in LAVA? (i.e. pass if pattern was not
> matched...)

I think this is a good idea.

The difficulty comes in looking for device/board specific stuff, but
that shouldn't stop us from doing something generic that looks for the
obvious stuff.

It could also look for (and count) kernel errors, warnings, backtraces,
etc. etc.

Kevin
