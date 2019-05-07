Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS build failures in kernelCI
In-Reply-To: <7hy33ijlyi.fsf@baylibre.com>
References: <7hpnsgrgel.fsf@baylibre.com> <20190128223906.b73t4tympcpom5fl@pburton-laptop> <7hy33ijlyi.fsf@baylibre.com>
Date: Tue, 07 May 2019 10:08:07 -0700
Message-ID: <7hpnoujiq0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Kevin Hilman <khilman@baylibre.com> writes:

> Hi Paul,
>
> Paul Burton <paul.burton@mips.com> writes:
>
>> On Mon, Jan 28, 2019 at 03:44:02PM +0100, Kevin Hilman wrote:
>>> We're having various build failures for a handful of defconfigs with
>>> linux-next and mainline:
>>> 
>>> Go to one of these views, and click on "Failed":
>>> mainline: https://kernelci.org/build/mainline/branch/master/kernel/v5.0-rc4/
>>> 
>>> Some of those defconfig targets (decstation_defconfig,
>>> jmr3927_defconfig) are failing with:
>>> 
>>>      cc1: error: '-march=r3900' requires '-mfp32'
>>> 
>>> We're trying to use standard debian compilers for all targets, and for
>>> MIPS we're using: mips-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0
>>
>> Thanks for the report. I've just submitted a fix for that [1], and
>> assuming nobody points out a problem in the next day or so I'll apply it
>> to my mips-fixes branch.
>>
>>> The other build failures seem to be failing because there is no make
>>> target for uImage.gz (which we set as the default target for MIPS.)
>>> 
>>> We don't currently have a good way to have different make targets for
>>> different defconfigs.
>>
>> Would it be an option to build the 'all' target? That typically
>> generates the appropriate image for the configured platform.
>
> Revisiting this...
>
> Turns out that 'make all' doesn't build the uImage.gz target, which is
> what's used on the pistachio_marduk (with pistachio_defconfig) so we
> switched the builds back to 'make uImage.gz'.
>
> However, that fails for a few other defconfigs where that target doesn't
> work.
>
> What's your recommendation to have this working for all defconfigs?
>
> I'm guessing we should keep 'make all' but fix any defconfigs that are
> not building the uImage.gz target? 

I had a little closer look, and AFAICT, there's nothing to be added into
the defconfigs to enable the uImage.gz build.  It already gets added to
the available make targets (boot-y) if the platform-specific
kconfig/make fragments add a load address (load-y), which is already the
case for pistachio.

The problem is that the 'all' target doesn't build the boot-y targets,
so with the current Makefile, 'make all' will never build any of the
uImage targets, no matter what's in the defconfig.

As a quick hack, I enabled all the boot-y targets for all, which will
actually build all the targets, but unfortunately, a few of them don't
actually build[2].

Any recommendations for how to have a single make target for all MIPS
boards, that will also build bootable images?

The other option for kernelCI is to only build the defconfigs that we
know generate a bootable target for boards that we have.  But whis would
be less useful for MIPS maintainers, because I'm sure it would be more
useful for you guys to see build results for all the builds.

Kevin

[1]
$ git diff
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 5b174c3d0de3..0d920457427c 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -382,7 +382,7 @@ quiet_cmd_64 = OBJCOPY $@
 vmlinux.64: vmlinux
        $(call cmd,64)

-all:   $(all-y)
+all:   $(all-y) $(boot-y)

 # boot
 $(boot-y): $(vmlinux-32) FORCE

[2]

#
# make -j42 -k -s ARCH=mips HOSTCC=gcc CROSS_COMPILE=mips-linux-gnu- CC="ccache mips-linux-gnu-gcc" O=build-mips pistachio_defconfig
#
#
# make -j42 -k -s ARCH=mips HOSTCC=gcc CROSS_COMPILE=mips-linux-gnu- CC="ccache mips-linux-gnu-gcc" O=build-mips all
#
make[2]: *** No rule to make target '../arch/mips/pistachio//vmlinux.its.S', needed by 'arch/mips/boot/vmlinux.its.S'.
make[2]: *** No rule to make target '../arch/mips/pistachio//vmlinux.its.S', needed by 'arch/mips/boot/vmlinux.its.S'.
make[2]: *** No rule to make target '../arch/mips/pistachio//vmlinux.its.S', needed by 'arch/mips/boot/vmlinux.its.S'.
make[2]: *** No rule to make target '../arch/mips/pistachio//vmlinux.its.S', needed by 'arch/mips/boot/vmlinux.its.S'.
make[2]: *** No rule to make target '../arch/mips/pistachio//vmlinux.its.S', needed by 'arch/mips/boot/vmlinux.its.S'.
wrote 20 byte file header.
wrote 56 byte a.out header.
wrote 120 bytes of section headers.
wrote 12 byte pad.
writing 10346464 bytes...
make[2]: Target 'arch/mips/boot/vmlinux.itb' not remade because of errors.
arch/mips/Makefile:389: recipe for target 'vmlinux.itb' failed
make[1]: *** [vmlinux.itb] Error 2
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:00:59 2019
Image Type:   MIPS Linux Kernel Image (uncompressed)
Data Size:    10342400 Bytes = 10100.00 KiB = 9.86 MiB
Load Address: 80400000
Entry Point:  80b52710
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:01:00 2019
Image Type:   MIPS Linux Kernel Image (gzip compressed)
Data Size:    4439071 Bytes = 4335.03 KiB = 4.23 MiB
Load Address: 80400000
Entry Point:  80b52710
  Image arch/mips/boot/uImage is ready
make[2]: Target 'arch/mips/boot/vmlinux.gz.itb' not remade because of errors.
arch/mips/Makefile:389: recipe for target 'vmlinux.gz.itb' failed
make[1]: *** [vmlinux.gz.itb] Error 2
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:01:00 2019
Image Type:   MIPS Linux Kernel Image (gzip compressed)
Data Size:    4439071 Bytes = 4335.03 KiB = 4.23 MiB
Load Address: 80400000
Entry Point:  80b52710
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:01:00 2019
Image Type:   MIPS Linux Kernel Image (bzip2 compressed)
Data Size:    4056266 Bytes = 3961.20 KiB = 3.87 MiB
Load Address: 80400000
Entry Point:  80b52710
make[2]: Target 'arch/mips/boot/vmlinux.bz2.itb' not remade because of errors.
arch/mips/Makefile:389: recipe for target 'vmlinux.bz2.itb' failed
make[1]: *** [vmlinux.bz2.itb] Error 2
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:01:00 2019
Image Type:   MIPS Linux Kernel Image (lzo compressed)
Data Size:    4899144 Bytes = 4784.32 KiB = 4.67 MiB
Load Address: 80400000
Entry Point:  80b52710
make[2]: Target 'arch/mips/boot/vmlinux.lzo.itb' not remade because of errors.
arch/mips/Makefile:389: recipe for target 'vmlinux.lzo.itb' failed
make[1]: *** [vmlinux.lzo.itb] Error 2
make[2]: Target 'arch/mips/boot/vmlinux.lzma.itb' not remade because of errors.
arch/mips/Makefile:389: recipe for target 'vmlinux.lzma.itb' failed
make[1]: *** [vmlinux.lzma.itb] Error 2
Image Name:   Linux-5.0.0-rc7+
Created:      Tue May  7 10:01:04 2019
Image Type:   MIPS Linux Kernel Image (lzma compressed)
Data Size:    3180212 Bytes = 3105.68 KiB = 3.03 MiB
Load Address: 80400000
Entry Point:  80b52710
make[1]: Target 'all' not remade because of errors.
Makefile:152: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2
make: Target 'all' not remade because of errors.
