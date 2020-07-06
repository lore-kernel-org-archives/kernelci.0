Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Microchip KernelCi contributions
In-Reply-To: <3c193c7e-c13d-5740-8d11-4dca5be528ef@microchip.com>
References: <3c193c7e-c13d-5740-8d11-4dca5be528ef@microchip.com>
Date: Mon, 06 Jul 2020 11:20:26 -0700
Message-ID: <7hr1to4iad.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Santiago.Esteban@microchip.com, info@kernelci.org

Hi Santiago,

<Santiago.Esteban@microchip.com> writes:

> I'm Santiago Esteban, SW Engineer at Microchip. I'm=C2=A0 leading the ef=
fort=20
> for continuous integration of our Linux developments. We are setting up=
=20
> the=C2=A0 infrastructure for CI in a=C2=A0 board farm containing several=
 boards.=20
> We would like to contribute to the KernelCI effort with build and test=
=20
> data. Hopefully, as our knowledge increases we will be able to help=C2=
=A0 in=20
> some other ways.
>
>
> How should I prodeed?

How is your lab currently setup?  Are you using LAVA? If not, can you
tell us a bit more about how your lab is setup?  What kind of hardware
you're testing?

If using LAVA, getting integrated into KernelCI is pretty straight
forward.

Some pre-requisites:

- boards can boot an upstream Linux kernel using an upstream defconfig,
  (minimum: boot to a serial-console shell using a ramdisk)
- LAVA device-types for your boards are submitted upstream to the LAVA
  project

>From there, with a basic LAVA setup/working, we just add your lab to our
list of labs[1] and then add your device-types in your lab to our list
of devices[2].

For kernelci.org to be able to submit jobs to your LAVA lab, you'll need
to create a `kernel-ci` user, setup an auth token and share that token
with us.  Any boards that the kernel-ci LAVA user has access to,
kernelci.org will have access to.

Hope that helps get you started,

Kevin

[1] https://github.com/kernelci/kernelci-core/blob/master/lab-configs.yaml
[2] https://github.com/kernelci/kernelci-core/blob/master/test-configs.yam=
l

