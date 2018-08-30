Date: Fri, 31 Aug 2018 01:32:12 +0200
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: New images and possible arch rename
Message-ID: <20180830233212.GA19856@delenn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

After the PR for adding MIPS got accepted, I have built new debian rootfs images in staging.
They are available at http://staging-storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/
and http://staging-storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/

The stretchtest images have been built with this patch https://github.com/kernelci/kernelci-build-staging/pull/54
needed to fix the build of IGT GPU tools from git. Merge welcome!


We have now images for 8 architectures:

- armhf, 32 bits ARM v7 with floating point, little endian.
- armel, 32 bits ARM v4t, little endian.
- arm64, 64 bits ARM v8, little endian. Also known as AArch64.
- x86, 32 bits. Also known as i386.
- x86_64, 64 bits x86. Also known as amd64.
- mips, 32 bits, big endian.
- mipsel, 32 bits, little endian.
- mips64el, 64 bits little endian.

Except for x86 and x86_64, we're using the names used in debian for the archs.
Any objection against renaming them in the future as i386 and amd64? Or at the very least to name
x86 as i386? Guillaume has pointed to me that currently in the kernelci x86 means only x86 on 32 bits
and we would need to introduce x86_64 (or amd64). So for avoiding confusion with x86 and x86_64,
the rename would be a good idea.

Cheers,

Ana
