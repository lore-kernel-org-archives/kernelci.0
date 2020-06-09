MIME-Version: 1.0
Date: Tue, 09 Jun 2020 08:56:12 +0200
From: Michael Walle <michael@walle.cc>
Subject: Kernel CI board addition
Message-ID: <456bf4081b13663a33f80e14837b69a3@walle.cc>
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: info@kernelci.org
Cc: michael.walle@kontron.com

Hi all,

our board (Kontron SMARC-sAL28 [1], based on the NXP Layerscape
architecture) got upstream support in 5.7 [2]. I would be interested to
add it to your kernelci.org setup. We could provide you a board together
with the carrier board [3]. Are there any other requirement?

 From your website:

> Must be able to boot a current build and defconfig from a 
> mainline/upstream
> Linux tree, to a shell prompt. No vendor kernels or out-of-tree 
> patchsets.

Possible since 5.7.

> Have a contact/maintainer who will react to boot failures. We do not 
> want
> to waste effort adding boards that will never get fixed, and then have 
> to
> remove them.

That would be me [but I'm not in linux/MAINTAINERS].

> Ideally, be supported by LAVA v2 for ease of integration.

What means "supported" in this case? I had a look at [4], but couldn't
find if there are any public "device-types" for the current boards in
kernelci.

Maybe a little bit about our bootflow: After the SoC comes out of reset,
by default the RCW gets loaded from EEPROM, which then loads u-boot from
a writeable SPI flash partition. U-Boot then loads the linux kernel from
whatever source (USB, sd card, network, ..).
The board is fully failsafe, which means there is a read-only (and
hardware write-protected) SPI partition which holds the failsafe RCW and
bootloader. By default, the u-boot start is supervised by an external
watchdog and automatically switches to failsafe mode if there is an 
error.

Current pending u-boot patches do not support this external watchdog yet
and because of this, if you like to use upstream u-boot (if the patches
are accepted) you will have to disable the external watchdog for now. If
something go wrong, you will have to manually assert the FORCE_RECOV#
input (either by button or if you have something like remote controlled
relays or GPIOs).

Long story short, if you have this kind of equipment to control two
signals remotely, FORCE_RECOV# and RESET#, then it would be possible
to even update the bootloader in kernelci or failsafe from a remote
location.

Please note, although its an aarch64 SoC, it does not support TF-A
(yet).

-michael

[1] 
https://www.kontron.de/products/boards-and-standard-form-factors/smarc/smarc-sal28.html
[2] https://kernelnewbies.org/Linux_5.7#ARM
[3] 
https://www.kontron.de/products/boards-and-standard-form-factors/smarc/smarc-evaluation-carrier-2.0.html
[4] 
https://validation.linaro.org/static/docs/v2/devicetypes.html#device-types
