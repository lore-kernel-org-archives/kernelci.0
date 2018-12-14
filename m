In-Reply-To: <7h5zvxorrd.fsf@baylibre.com>
From: "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
Date: Fri, 14 Dec 2018 04:43:09 +0000
MIME-Version: 1.0
Message-ID: <997-5c133500-1-763d5380@188620748>
Subject: Re: MIPS test results
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Paul Burton <paul.burton@mips.com>, =?utf-8?q?kernelci=40groups=2Eio?= <kernelci@groups.io>

On Thursday, December 13, 2018 21:51 -03, Kevin Hilman <khilman@baylibr=
e.com> wrote: 
 
> Paul Burton <paul.burton@mips.com> writes:
> 
> [...]
> 
> > For the Ci20 there are 2 main options:
> >
> >   1) Use a U-Boot uImage.
> >
> >      The Ci20 ships with the U-Boot bootloader by default, and expe=
cts
> >      to load kernels packages in the legacy U-Boot uImage format. W=
hen
> >      you build the kernel, if you have the U-Boot mkimage tool in y=
our
> >      $PATH, you should get a arch/mips/boot/uImage.gz file. You the=
n
> >      load this into DDR using U-Boot, for example using the tftp
> >      command, and run the bootm command to boot the kernel.
> >
> >      Of note is that Ezequiel Garcia, CC'd, is currently working on=

> >      upstreaming Ci20 support in U-Boot.
> 
> u-boot is the preferred option, and I just tried it on my Ci20, but i=
t
> seems the u-boot on this board doesn't find the network, so I can't
> DHCP/TFTP (log below[1]).
> 
> If I just let the kernel boot that is flashed on the board, it boots =
up
> an OpenWRT image and is able to DHCP and get an IP address, so I know=

> the network interface is working.
> 
> Maybe Ezequiel has a newer version of u-boot with working network
> support I could try?  If so, please also send instructions for how to=

> (re)flash u-boot, (or maybe boot a new u-boot from the SD card?)
> 

Hey Kevin,

Yes, I have. I will push a branch for you and let you know,
so you can test with some recent U-Boot.

However... this log you have here is not from the CI20 board,
which is JZ4780 SoC, but from some development board
with a Pistachio SoC!

I thought those were dead, but it seems there are
some Pistachio boards around ?


Ezequiel

> Kevin
> 
> [1]
> U-Boot SPL 2015.07-rc2 (Jul 14 2016 - 12:16:30)
> 
> 
> U-Boot 2015.07-rc2 (Jul 14 2016 - 12:16:30 +0000)
> 
> MIPS(interAptiv): IMG Pistachio 546MHz.
> Model: IMG Marduk
> DRAM:  256 MiB
> NAND:  512 MiB
> MMC:   Synopsys Mobile storage: 0
> SF: Detected W25Q16CL with page size 256 Bytes, erase size 4 KiB, tot=
al 2 MiB
> *** Warning - bad CRC, using default environment
> 
> In:    uart@18101500
> Out:   uart@18101500
> Err:   uart@18101500
> Net:   No valid Mac-addr found from dtb
> 
> Error: ethernet@18140000 address not set.
> No ethernet found.
> Hit any key to stop autoboot:  0 
> pistachio # dhcp
> mdio=5Fregister: non unique device name 'ethernet@18140000'
> ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting =
to ethernet@18140000
> 
> Error: ethernet@18140000 address not set.
> mdio=5Fregister: non unique device name 'ethernet@18140000'
> ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting =
to ethernet@18140000
> 
> Error: ethernet@18140000 address not set.
> mdio=5Fregister: non unique device name 'ethernet@18140000'
> ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting =
to ethernet@18140000
> 
> Error: ethernet@18140000 address not set.
> mdio=5Fregister: non unique device name 'ethernet@18140000'
> ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting =
to ethernet@18140000
> 
> Error: ethernet@18140000 address not set.
> No ethernet found.
> mdio=5Fregister: non unique device name 'ethernet@18140000'
> ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting =
to ethernet@18140000
> 
> Error: ethernet@18140000 address not set.
> pistachio #

