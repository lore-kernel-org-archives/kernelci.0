Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Contribution as a build and boot tester.
In-Reply-To: <CAEX+82+jdktsFSGWyM_8_XnrOKoy_an4ZJrooWut4mAt2u3Qaw@mail.gmail.com>
References: <CAEX+82+jdktsFSGWyM_8_XnrOKoy_an4ZJrooWut4mAt2u3Qaw@mail.gmail.com>
Date: Mon, 23 Mar 2020 15:31:39 -0700
Message-ID: <7h8sjqhfec.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, xavinux@gmail.com, info@kernelci.org

Hi Javier,

Javier Romero <xavinux@gmail.com> writes:

> My name is Javier, have been working as a Linux sysadmin for the last 10
> years and now I'm working as a cloud engineer.

Thanks for your interest in KernelCI.

> Would like to start contributing as a build and boot tester. I've a
> Raspberry PI 3 with ARM Hardware, and a computer with an Intel Core 2 duo.

Currently, a single Core2 duo won't be very useful to us as an extra
builder, and we already have rpi3 boards in a few of our existing labs.

However, if you'd like to setup your rpi3 into a LAVA lab to better
understand how KernelCI lab works, and potentially add more hardware, I
suggest following our docs for setting up your own LAVA[1].  That doc
doesn't (yet) mention it, but you we now have a dockerized version of a
LAVA lab that hopefully simplifies the learning curve of setting up
LAVA: https://github.com/kernelci/lava-docker/

Kevin

[1] https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-development-instance
