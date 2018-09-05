Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] New images and possible arch rename
References: <20180830233212.GA19856@delenn>
	<CAH1_8nBgsKO87oNxoeivwyVvOwG9j3dMotxRX9kN_+G1E7QQdA@mail.gmail.com>
Date: Wed, 05 Sep 2018 14:23:57 -0700
In-Reply-To: <CAH1_8nBgsKO87oNxoeivwyVvOwG9j3dMotxRX9kN_+G1E7QQdA@mail.gmail.com>
	(Guillaume Tucker's message of "Mon, 3 Sep 2018 10:56:53 +0100")
Message-ID: <7ho9db8wpe.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> Hi,
>
> On Fri, Aug 31, 2018 at 12:32 AM Ana Guerrero Lopez <
> ana.guerrero@collabora.com> wrote:
>
>> Hi,
>>
>> After the PR for adding MIPS got accepted, I have built new debian rootfs
>> images in staging.
>> They are available at
>> http://staging-storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/
>> and
>> http://staging-storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/
>>
>> The stretchtest images have been built with this patch
>> https://github.com/kernelci/kernelci-build-staging/pull/54
>> needed to fix the build of IGT GPU tools from git. Merge welcome!
>>
>
> Thanks, it's now merged on staging.
>
> We have now images for 8 architectures:
>>
>> - armhf, 32 bits ARM v7 with floating point, little endian.
>> - armel, 32 bits ARM v4t, little endian.
>> - arm64, 64 bits ARM v8, little endian. Also known as AArch64.
>> - x86, 32 bits. Also known as i386.
>> - x86_64, 64 bits x86. Also known as amd64.
>> - mips, 32 bits, big endian.
>> - mipsel, 32 bits, little endian.
>> - mips64el, 64 bits little endian.
>>
>> Except for x86 and x86_64, we're using the names used in debian for the
>> archs.
>> Any objection against renaming them in the future as i386 and amd64? Or at
>> the very least to name
>> x86 as i386? Guillaume has pointed to me that currently in the kernelci
>> x86 means only x86 on 32 bits
>> and we would need to introduce x86_64 (or amd64). So for avoiding
>> confusion with x86 and x86_64,
>> the rename would be a good idea.
>>
>
> There's an "arch_map" YAML attribute in new file system
> definitions which can be used to map the kernel-stype arch names
> with arbitrary file system specific ones.  So yes I think the
> Debian file systems should follow the standard Debian names, and
> the map updated to do the translation.
>
> There is another related issue which needs a bit of
> clarification.  At the moment we only build kernels with
> ARCH=x86.  This results in binaries for different archs depending
> on whether they were built with i386_defconfig or
> x86_64_defconfig, which is fine.  However, it means that we can't
> differentiate the user-space between i386 and x86_64.  To be
> compatible with all the kernels, all the x86 builds end up
> running with the i386 user-space and never the x86_64 one.
>
> It seems that running with x86_64 user-space would be a good
> thing to extend the test coverage.  Would it be OK to fix this by
> using i386 and x86_64 as kernel arch names instead of just x86?

That seems like the right thing to do to me.

Kevin
