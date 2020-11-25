Subject: Re: Contribute to Kernel-CI with a new Lab
References: <f3a51005-7e51-e9b0-7a07-c5a268ab00ce@microchip.com>
 <ccf0ae0dbd5cce956631a7e4572ca84e0abd45e1.camel@pengutronix.de>
 <b722c06a-057d-c1bb-1013-682d4282bbd7@microchip.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <90ad5257-0690-913a-1a04-d299f6830305@collabora.com>
Date: Wed, 25 Nov 2020 14:09:10 +0000
MIME-Version: 1.0
In-Reply-To: <b722c06a-057d-c1bb-1013-682d4282bbd7@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: santiago.esteban@microchip.com, jlu@pengutronix.de
Cc: kernelci@groups.io, ticotimo@gmail.com

On 12/11/2020 11:46, Santiago.Esteban via info via groups.io wrote:
> On 12/11/20 9:49, Jan L=C3=BCbbe wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
>>
>> Hi Santi,
>>
>> On Wed, 2020-11-11 at 18:05 +0000, Santiago.Esteban via info via groups=
.io wrote:
>>> Hi KernelCI,
>>>
>>> A few months back I contacted you about adding a new lab to KernelCI
>>> infrastructure. It took us longer than I wished, but now we finally
>>> have been able to connect our farm to an internal KernelCI deployment
>>> (using docker).
>>>
>>> As I explained before, our farm holds 4 boards with different SoCs
>>> from Microchip (and Atmel): Sam9x60ek, Sama5d2_xplained,
>>> Sama5d3_xplained and Sama5d4_xplained. All of then with mainline
>>> support.
>>>
>>> Our setup, does not uses Lava and it relies on Labgrid to perform the
>>> tests. We use "kci_data" tool to publish test results on KernelCI.
>> That's very interesting. :) Do you have published the interface code
>> somewhere? I've been trying to find some time to do that myself, but it
>> seems you've beaten me to it. ;)
>>
>> Regards
>> Jan
>=20
> Hi Jan,
>=20
> No, I haven't publish it, till now. I've never though it would be useful=
=
=20
> to anybody but me=C2=A0 ;)
>=20
> I have a python script that is tailored (too much) to our systems. It=20
> performs some actions that depend on our infrastructure and how I've=20
> implemented the labgrid tests (for example, I grab the results from a=20
> pytest=C2=A0 json report). At the end, it creates a "tmeta_<board>.json"=
 file=20
> (equivalent to the "bmeta.json") that is later published with "kci_data"=
=
=20
> tool.
>=20
> It could be used as an inspiration to make a more generic=20
> "kci_labgrid_test" tool if there are interest, but, all kernelci=20
> important stuff, still needs to be validated ;)

There is already a plugin mechanism behind kci_test to have
specific implementations for generating the test job description
data and submitting it to a remote lab.  At the moment, only LAVA
has an implementation but it sounds like Labgrid would be a neat
addition.  The main challenge I guess, is that there isn't any
built-in API for Labgrid to receive job descriptions and run
them.

One way to address this issue is to provide notifications with
jobs to run, and a lab using Labgrid would subscribe to it.  As
we're planning to refactor kernelci-backend and also come up with
a more generic pipeline mechanis than Jenkins, we should be able
to have this kind of notification system in place anyway in order
to corrdinate the different components of the pipeline in a
modular way.  It would be great to use some Labgrid labs as part
of this exercise.  If you're interested, we can discuss that when
we have some clear ideas about the main part of work.

> I have attached it to this email the script and (more important) an=20
> example of the output it produces.

Thanks!  It's great to see that it doesn't really take much code
to get some KernelCI jobs to run in Labgrid.

> BR,
>=20
> Santi
>=20
>>
>>> We would like to work with you to be able to publish these results.
>>> Will it be possible to get a token for the staging database? I'm sure
>>> that there are things that need to be polished on our json files.

Absolutely, I'll send you a staging API token privately.  Also,
are you on IRC?  That would help with discussing things and
addressing any issues.

Thanks,
Guillaume
