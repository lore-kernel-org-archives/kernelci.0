Return-Path: <khilman@baylibre.com>
References: <CAOi56cVeis2079Fe_Kn9zRf5AZcZf0rRz+z_5xYM81hB_6P6eA@mail.gmail.com> <4aeb14c51ed09fffc4273795eb3c3fb7958c522f.camel@synopsys.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kernelCI: kernel builds for ARCH=arc
In-reply-to: <4aeb14c51ed09fffc4273795eb3c3fb7958c522f.camel@synopsys.com>
Date: Mon, 05 Nov 2018 15:23:29 -0800
Message-ID: <7hefbz3y8e.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>, Vineet Gupta <vineet.gupta1@synopsys.com>, "kernelci@groups.io" <kernelci@groups.io>


Alexey Brodkin writes:

[...]

> Also note messages like "arch/arc/Makefile:27: *** Toolchain not configured for ARCompact builds."
> are gone with older kernels as in 4.19 I removed it, see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=615f64458ad890ef94abc879a66d8b27236e733a

This error is still a problem when using your released toolchains on any
kernel before that commit was merged.  Basically, anything before v4.19.

This is a problem for kernelCI since developer branches may still be
based on v4.19-rc tags, but more importantly because we also build older
kernels from the stable tree (back to v3.18.)

Do you have any plans to backport that fix to older kernels?  If not,
we'll have to blacklist kernel builds for ARC for anything before v4.19.

Kevin
