Subject: Re: [kernelci] getting started?
References: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com>
 <27efc07a-244a-653a-2143-b2b7960ed4a2@hpe.com>
 <CAH+k93Hn6wDEPU6qMsRfSFS0_ApdzxR6kGumnho9iDNWqvxfFg@mail.gmail.com>
From: "Micah Parrish" <micah.parrish@hpe.com>
Message-ID: <4f4fcc85-f40e-08d7-07da-bc0ed619efcb@hpe.com>
Date: Thu, 28 Jun 2018 11:53:35 -0600
MIME-Version: 1.0
In-Reply-To: <CAH+k93Hn6wDEPU6qMsRfSFS0_ApdzxR6kGumnho9iDNWqvxfFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

I'm trying to redeploy a mix of prototypes and production systems as a=20
very low touch "top of tree kernel test" farm.=C2=A0 This give us early=20
warning when an kernel change has affected our HW or FW.=C2=A0 Kernelci.or=
g=20
does almost exactly what I'd like to do, but I need to keep an instance=20
in-house because of prototype confidentiality requirements.=C2=A0 If that=
=20
works out I'm open to putting some production servers in the main pool=20
somehow.

Is there a diagram of how all the parts fit together?

-Micah


On 06/28/2018 07:11 AM, Matt Hart wrote:
> Hi Micah
>
> There are indeed a lot of moving parts. You could run your own web UI=20
> and API fairly easily but there's no guides to setup the build system=20
> and the boot testing (LAVA) lab.
> What are you trying to achieve? Could it be with KernelCI rather than=20
> your own setup?
>
> Matt
>
> On 22 June 2018 at 19:35, Micah Parrish <micah.parrish@hpe.com=20
> <mailto:micah.parrish@hpe.com>> wrote:
>
>     I really like what you've done with kernelci.org
>     <http://kernelci.org>, and I'm interested in running it in a
>     semi-isolated x86 test lab.=C2=A0 Do you have a recipe I can follow =
for
>     doing this?=C2=A0 It seems like there are a lot of moving parts, but=
 I
>     don't quite see how they all fit together yet.
>
>     Regards,
>
>     Micah Parrish
>     Linux OS Engineer
>     Hewlett-Packard Enterprise
>
>
>
>
>=20


