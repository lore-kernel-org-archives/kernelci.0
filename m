Date: Mon, 18 Feb 2019 16:54:02 +0000
From: Steve McIntyre <93sam@debian.org>
Subject: Testing Debian kernels on kernelci?
Message-ID: <20190218165402.obkznz2itzlqeys7@tack.einval.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Ben Hutchings <benh@debian.org>

[ CC: to Ben, the debian kernel team lead ]

Hi folks,

In Debian we've just been bitten by quite a nasty kernel bug in our
latest stable release [1], and this has clearly managed to make it
into a release due to a insufficient testing of our kernels on all our
platforms. Most people only have x86 hardware, and doing full
regression testing across multiple Arm, MIPS, etc. platforms is beyond
our capabilities. You know, the usual situation... :-)

Due to my position in the LAVA team in Linaro, I know quite a bit
about kernelci and I'm wondering if it would be possible to get some
of our Debian kernel branches added to the list for at least some
automated boot testing. This would be major help for us.

[1]  https://bugs.debian.org/922478

-- 
Steve McIntyre, Cambridge, UK.                                steve@einval.com
"I suspect most samba developers are already technically insane... Of
 course, since many of them are Australians, you can't tell." -- Linus Torvalds

