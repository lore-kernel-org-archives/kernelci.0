Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] getting started?
References: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com>
	<27efc07a-244a-653a-2143-b2b7960ed4a2@hpe.com>
	<CAH+k93Hn6wDEPU6qMsRfSFS0_ApdzxR6kGumnho9iDNWqvxfFg@mail.gmail.com>
	<4f4fcc85-f40e-08d7-07da-bc0ed619efcb@hpe.com>
Date: Thu, 26 Jul 2018 17:22:07 -0500
In-Reply-To: <4f4fcc85-f40e-08d7-07da-bc0ed619efcb@hpe.com> (Micah Parrish's
	message of "Thu, 28 Jun 2018 11:53:35 -0600")
Message-ID: <7ha7qd1vu8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Micah Parrish <micah.parrish@hpe.com>
Cc: kernelci@groups.io

"Micah Parrish" <micah.parrish@hpe.com> writes:

> I'm trying to redeploy a mix of prototypes and production systems as a
> very low touch "top of tree kernel test" farm.=C2=A0 This give us early
> warning when an kernel change has affected our HW or FW.=C2=A0 Kernelci.=
org
> does almost exactly what I'd like to do, but I need to keep an
> instance in-house because of prototype confidentiality requirements.=C2=
=A0
> If that works out I'm open to putting some production servers in the
> main pool somehow.
>
> Is there a diagram of how all the parts fit together?

The long delay in responding meant that no, there was no diagram.  Our
docs are pretty minimal, but we've begun an attempt to improve that
on the wiki for the kernelci-doc project: https://github.com/kernelci/kern=
elci-doc/wiki

The sub-page for setting up a local instance[1] would be a good start,
and to compliment that, I just whipped up this draw.io diagram[1] that
tries to show graphically how all the kernelCI pieces fit together in a
full CI loop. Most items have links to the various github projects where
the code lives.

I admit that it's very primitive, but it should at least help you get
started seeing how all the parts fit together.

Hope that helps,

Kevin

[1] https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-devel=
opment-instance
[2] https://drive.google.com/file/d/1x2SXt24ZNzuk3SfBzsQpw_RnLOcF3vWd/view=
?usp=3Dsharing


> -Micah
>
>
> On 06/28/2018 07:11 AM, Matt Hart wrote:
>> Hi Micah
>>
>> There are indeed a lot of moving parts. You could run your own web
>> UI and API fairly easily but there's no guides to setup the build
>> system and the boot testing (LAVA) lab.
>> What are you trying to achieve? Could it be with KernelCI rather
>> than your own setup?
>>
>> Matt
>>
>> On 22 June 2018 at 19:35, Micah Parrish <micah.parrish@hpe.com
>> <mailto:micah.parrish@hpe.com>> wrote:
>>
>>     I really like what you've done with kernelci.org
>>     <http://kernelci.org>, and I'm interested in running it in a
>>     semi-isolated x86 test lab.=C2=A0 Do you have a recipe I can follow=
 for
>>     doing this?=C2=A0 It seems like there are a lot of moving parts, bu=
t I
>>     don't quite see how they all fit together yet.
>>
>>     Regards,
>>
>>     Micah Parrish
>>     Linux OS Engineer
>>     Hewlett-Packard Enterprise
>>
>>
>>
>>
>>
>
>
>
>=20
