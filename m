From: Paul Burton <paul.burton@mips.com>
Subject: Re: MIPS test results
Date: Wed, 12 Dec 2018 20:02:47 +0000
Message-ID: <20181212200246.vfeemrt2tjz7moj5@pburton-laptop>
References: <20181128233013.nymedsx2ukdx2otq@pburton-laptop>
 <7hr2f3afkb.fsf@baylibre.com>
 <20181130234118.3vntmrbz5vom2sji@pburton-laptop>
 <7hh8fufr7i.fsf@baylibre.com>
In-Reply-To: <7hh8fufr7i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AEABBF18818CF944B8AEE6225C8631F6@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>, "ezequiel@collabora.com" <ezequiel@collabora.com>

Hi Kevin,

On Mon, Dec 03, 2018 at 09:36:01AM -0800, Kevin Hilman wrote:
> >> Our build scripts are currently setup to save/upload the vmlinux.bin.z
> >> file from the build, but we noticed that only some of the defconfigs
> >> genrate the .z images.  e.g. nlm_xlp_defconfig genreates the .z, where=
as
> >> ath25_defconfig does not.
> >>=20
> >> It looks like all the kernel builds generate a vmlinux.bin
> >> (uncompressed) though, but until we have hardware that is using those
> >> images, we decided not to upload the uncompressed images due to storag=
e
> >> space.
> >>=20
> >> Once we have a better idea of how to actually boot the hardware we hav=
e,
> >> with which kernel images, it might help us figure out what kernel imag=
es
> >> we should be saving and uploading so any labs with MIPS hardware could
> >> use them.
> >
> > One niggle we'll have is the plethora of boot options that various MIPS
> > boards make use of... Gradually we're pushing towards a standard boot
> > protocol & a single kernel image (in U-Boot's FIT/.itb format) but we'r=
e
> > starting from a place very far away from that.
> >
> > If you could let me know which boards you have I can probably help you
> > boot them - I was involved in all the MIPS boards Imagination produced =
&
> > am familiar with a bunch of our customer's boards.
>=20
> The board we have is a MIPS Creator C120, so let's start with what we
> need to get that one working.

Apologies for the slow response - busy week..!

For the Ci20 there are 2 main options:

  1) Use a U-Boot uImage.

     The Ci20 ships with the U-Boot bootloader by default, and expects
     to load kernels packages in the legacy U-Boot uImage format. When
     you build the kernel, if you have the U-Boot mkimage tool in your
     $PATH, you should get a arch/mips/boot/uImage.gz file. You then
     load this into DDR using U-Boot, for example using the tftp
     command, and run the bootm command to boot the kernel.

     Of note is that Ezequiel Garcia, CC'd, is currently working on
     upstreaming Ci20 support in U-Boot.

  2) Use my ci20-usb-boot tool [1].

     Alternatively you could use my ci20-usb-boot tool to bypass U-Boot
     entirely. It boots a kernel ELF (ie. either vmlinux or vmlinuz) on
     a Ci20 connected to a host machine via USB. This relies upon the
     board/SoC powering up in USB boot mode, and how to do that depends
     on the revision of the board. The later ones should show the
     correct jumper settings on the PCB silkscreen though. I find the
     easiest way to do this is to configure the board to boot from SD
     card but have no SD card present, which causes the boot ROM to fall
     back to USB boot mode.

     Once you can see the USB device on the host (ID a108:4780) and have
     read/write permissions for it in /dev, it should be as easy as:

     $ ci20-usb-boot vmlinux

     The tool has a --serial option to select between boards if you have
     more than one connected to a host, and it can optionally wait for
     the board to appear if you have a race condition between powering
     it on & running the tool.

     One limitation of this method is that it doesn't currently allow
     you to specify a kernel command line, though that shouldn't be
     difficult to implement.

Thanks,
    Paul

[1] https://github.com/paulburton/ci20-tools
