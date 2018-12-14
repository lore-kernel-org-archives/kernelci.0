Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS test results
In-Reply-To: <20181212200246.vfeemrt2tjz7moj5@pburton-laptop>
References: <20181128233013.nymedsx2ukdx2otq@pburton-laptop> <7hr2f3afkb.fsf@baylibre.com> <20181130234118.3vntmrbz5vom2sji@pburton-laptop> <7hh8fufr7i.fsf@baylibre.com> <20181212200246.vfeemrt2tjz7moj5@pburton-laptop>
Date: Thu, 13 Dec 2018 16:51:02 -0800
Message-ID: <7h5zvxorrd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>, "ezequiel@collabora.com" <ezequiel@collabora.com>

Paul Burton <paul.burton@mips.com> writes:

[...]

> For the Ci20 there are 2 main options:
>
>   1) Use a U-Boot uImage.
>
>      The Ci20 ships with the U-Boot bootloader by default, and expects
>      to load kernels packages in the legacy U-Boot uImage format. When
>      you build the kernel, if you have the U-Boot mkimage tool in your
>      $PATH, you should get a arch/mips/boot/uImage.gz file. You then
>      load this into DDR using U-Boot, for example using the tftp
>      command, and run the bootm command to boot the kernel.
>
>      Of note is that Ezequiel Garcia, CC'd, is currently working on
>      upstreaming Ci20 support in U-Boot.

u-boot is the preferred option, and I just tried it on my Ci20, but it
seems the u-boot on this board doesn't find the network, so I can't
DHCP/TFTP (log below[1]).

If I just let the kernel boot that is flashed on the board, it boots up
an OpenWRT image and is able to DHCP and get an IP address, so I know
the network interface is working.

Maybe Ezequiel has a newer version of u-boot with working network
support I could try?  If so, please also send instructions for how to
(re)flash u-boot, (or maybe boot a new u-boot from the SD card?)

Kevin

[1]
U-Boot SPL 2015.07-rc2 (Jul 14 2016 - 12:16:30)


U-Boot 2015.07-rc2 (Jul 14 2016 - 12:16:30 +0000)

MIPS(interAptiv): IMG Pistachio 546MHz.
Model: IMG Marduk
DRAM:  256 MiB
NAND:  512 MiB
MMC:   Synopsys Mobile storage: 0
SF: Detected W25Q16CL with page size 256 Bytes, erase size 4 KiB, total 2 MiB
*** Warning - bad CRC, using default environment

In:    uart@18101500
Out:   uart@18101500
Err:   uart@18101500
Net:   No valid Mac-addr found from dtb

Error: ethernet@18140000 address not set.
No ethernet found.
Hit any key to stop autoboot:  0 
pistachio # dhcp
mdio_register: non unique device name 'ethernet@18140000'
ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting to ethernet@18140000

Error: ethernet@18140000 address not set.
mdio_register: non unique device name 'ethernet@18140000'
ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting to ethernet@18140000

Error: ethernet@18140000 address not set.
mdio_register: non unique device name 'ethernet@18140000'
ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting to ethernet@18140000

Error: ethernet@18140000 address not set.
mdio_register: non unique device name 'ethernet@18140000'
ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting to ethernet@18140000

Error: ethernet@18140000 address not set.
No ethernet found.
mdio_register: non unique device name 'ethernet@18140000'
ethernet@18140000:0 is connected to ethernet@18140000.  Reconnecting to ethernet@18140000

Error: ethernet@18140000 address not set.
pistachio # 
