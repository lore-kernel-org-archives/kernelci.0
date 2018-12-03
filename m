Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS test results
In-Reply-To: <20181130234118.3vntmrbz5vom2sji@pburton-laptop>
References: <20181128233013.nymedsx2ukdx2otq@pburton-laptop> <7hr2f3afkb.fsf@baylibre.com> <20181130234118.3vntmrbz5vom2sji@pburton-laptop>
Date: Mon, 03 Dec 2018 09:36:01 -0800
Message-ID: <7hh8fufr7i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: kernelci@groups.io

[ switching to the kernelci mailing list ]

Paul Burton <paul.burton@mips.com> writes:

[...]

>> In fact, while we're doing builds for MIPS, none of us are that familiar
>> with it, so we still had some basic questions on how to boot the
>> hardware, and which kernel images we should be using to boot the boards.
>
> I'm happy to help with that :)
>
>> For example, we're building all the upstream defconfigs for MIPS, and
>> you can see those here:
>> https://storage.kernelci.org/mainline/master/v4.20-rc4-98-g60b548237fed/mips/
>> 
>> Our build scripts are currently setup to save/upload the vmlinux.bin.z
>> file from the build, but we noticed that only some of the defconfigs
>> genrate the .z images.  e.g. nlm_xlp_defconfig genreates the .z, whereas
>> ath25_defconfig does not.
>> 
>> It looks like all the kernel builds generate a vmlinux.bin
>> (uncompressed) though, but until we have hardware that is using those
>> images, we decided not to upload the uncompressed images due to storage
>> space.
>> 
>> Once we have a better idea of how to actually boot the hardware we have,
>> with which kernel images, it might help us figure out what kernel images
>> we should be saving and uploading so any labs with MIPS hardware could
>> use them.
>
> One niggle we'll have is the plethora of boot options that various MIPS
> boards make use of... Gradually we're pushing towards a standard boot
> protocol & a single kernel image (in U-Boot's FIT/.itb format) but we're
> starting from a place very far away from that.
>
> If you could let me know which boards you have I can probably help you
> boot them - I was involved in all the MIPS boards Imagination produced &
> am familiar with a bunch of our customer's boards.

The board we have is a MIPS Creator C120, so let's start with what we
need to get that one working.

Kevin
