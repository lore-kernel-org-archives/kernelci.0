Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS test results
In-Reply-To: <997-5c133500-1-763d5380@188620748>
References: <997-5c133500-1-763d5380@188620748>
Date: Fri, 14 Dec 2018 09:03:43 -0800
Message-ID: <7hr2ekniq8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Ezequiel Garcia <ezequiel.garcia@collabora.com>
Cc: Paul Burton <paul.burton@mips.com>, "kernelci@groups.io" <kernelci@groups.io>

"Ezequiel Garcia" <ezequiel.garcia@collabora.com> writes:

> On Thursday, December 13, 2018 21:51 -03, Kevin Hilman <khilman@baylibre.com> wrote: 
>  
>> Paul Burton <paul.burton@mips.com> writes:
>> 
>> [...]
>> 
>> > For the Ci20 there are 2 main options:
>> >
>> >   1) Use a U-Boot uImage.
>> >
>> >      The Ci20 ships with the U-Boot bootloader by default, and expects
>> >      to load kernels packages in the legacy U-Boot uImage format. When
>> >      you build the kernel, if you have the U-Boot mkimage tool in your
>> >      $PATH, you should get a arch/mips/boot/uImage.gz file. You then
>> >      load this into DDR using U-Boot, for example using the tftp
>> >      command, and run the bootm command to boot the kernel.
>> >
>> >      Of note is that Ezequiel Garcia, CC'd, is currently working on
>> >      upstreaming Ci20 support in U-Boot.
>> 
>> u-boot is the preferred option, and I just tried it on my Ci20, but it
>> seems the u-boot on this board doesn't find the network, so I can't
>> DHCP/TFTP (log below[1]).
>> 
>> If I just let the kernel boot that is flashed on the board, it boots up
>> an OpenWRT image and is able to DHCP and get an IP address, so I know
>> the network interface is working.
>> 
>> Maybe Ezequiel has a newer version of u-boot with working network
>> support I could try?  If so, please also send instructions for how to
>> (re)flash u-boot, (or maybe boot a new u-boot from the SD card?)
>> 
>
> Yes, I have. I will push a branch for you and let you know,
> so you can test with some recent U-Boot.

Cool, thanks.

> However... this log you have here is not from the CI20 board,
> which is JZ4780 SoC, but from some development board
> with a Pistachio SoC!

The board I have is labeled Creator Ci40, and grep'ing in the MIPS DT
files, led me to pistachio_marduk.dts.

> I thought those were dead, but it seems there are some Pistachio
> boards around ?

This was given to me by Imagination a couple years ago, but I never had
the time to get it into kernelCI, and then the interest from Imagination
"went away." ;)

If nobody cares about this particular board, I don't really want to
waste any time on it either.  But, if there are other boards that people
actually care about we should integrate into kernelCI, and that someone
wants to donate, I'd prefer to setup those.

Kevin
