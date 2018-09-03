MIME-Version: 1.0
References: <20180830233212.GA19856@delenn>
In-Reply-To: <20180830233212.GA19856@delenn>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Mon, 3 Sep 2018 10:56:53 +0100
Message-ID: <CAH1_8nBgsKO87oNxoeivwyVvOwG9j3dMotxRX9kN_+G1E7QQdA@mail.gmail.com>
Subject: Re: [kernelci] New images and possible arch rename
Content-Type: multipart/alternative; boundary="0000000000003da33c0574f49081"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--0000000000003da33c0574f49081
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Aug 31, 2018 at 12:32 AM Ana Guerrero Lopez <
ana.guerrero@collabora.com> wrote:

> Hi,
>
> After the PR for adding MIPS got accepted, I have built new debian rootfs
> images in staging.
> They are available at
> http://staging-storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/
> and
> http://staging-storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/
>
> The stretchtest images have been built with this patch
> https://github.com/kernelci/kernelci-build-staging/pull/54
> needed to fix the build of IGT GPU tools from git. Merge welcome!
>

Thanks, it's now merged on staging.

We have now images for 8 architectures:
>
> - armhf, 32 bits ARM v7 with floating point, little endian.
> - armel, 32 bits ARM v4t, little endian.
> - arm64, 64 bits ARM v8, little endian. Also known as AArch64.
> - x86, 32 bits. Also known as i386.
> - x86_64, 64 bits x86. Also known as amd64.
> - mips, 32 bits, big endian.
> - mipsel, 32 bits, little endian.
> - mips64el, 64 bits little endian.
>
> Except for x86 and x86_64, we're using the names used in debian for the
> archs.
> Any objection against renaming them in the future as i386 and amd64? Or at
> the very least to name
> x86 as i386? Guillaume has pointed to me that currently in the kernelci
> x86 means only x86 on 32 bits
> and we would need to introduce x86_64 (or amd64). So for avoiding
> confusion with x86 and x86_64,
> the rename would be a good idea.
>

There's an "arch_map" YAML attribute in new file system
definitions which can be used to map the kernel-stype arch names
with arbitrary file system specific ones.  So yes I think the
Debian file systems should follow the standard Debian names, and
the map updated to do the translation.

There is another related issue which needs a bit of
clarification.  At the moment we only build kernels with
ARCH=x86.  This results in binaries for different archs depending
on whether they were built with i386_defconfig or
x86_64_defconfig, which is fine.  However, it means that we can't
differentiate the user-space between i386 and x86_64.  To be
compatible with all the kernels, all the x86 builds end up
running with the i386 user-space and never the x86_64 one.

It seems that running with x86_64 user-space would be a good
thing to extend the test coverage.  Would it be OK to fix this by
using i386 and x86_64 as kernel arch names instead of just x86?

Cheers,
Guillaume

--0000000000003da33c0574f49081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Fri, Aug 31, 2018 at 12:32 AM Ana Guerrero Lopez &lt;<a href=3D"mailto:ana.=
guerrero@collabora.com">ana.guerrero@collabora.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
After the PR for adding MIPS got accepted, I have built new debian rootfs i=
mages in staging.<br>
They are available at <a href=3D"http://staging-storage.kernelci.org/images=
/rootfs/debian/stretch/20180830.2/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://staging-storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/<=
/a><br>
and <a href=3D"http://staging-storage.kernelci.org/images/rootfs/debian/str=
etchtests/20180830.1/" rel=3D"noreferrer" target=3D"_blank">http://staging-=
storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/</a><br>
<br>
The stretchtest images have been built with this patch <a href=3D"https://g=
ithub.com/kernelci/kernelci-build-staging/pull/54" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/kernelci/kernelci-build-staging/pull/54</a>=
<br>
needed to fix the build of IGT GPU tools from git. Merge welcome!<br></bloc=
kquote><div>=C2=A0</div><div>Thanks, it&#39;s now merged on staging.=C2=A0<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
We have now images for 8 architectures:<br>
<br>
- armhf, 32 bits ARM v7 with floating point, little endian.<br>
- armel, 32 bits ARM v4t, little endian.<br>
- arm64, 64 bits ARM v8, little endian. Also known as AArch64.<br>
- x86, 32 bits. Also known as i386.<br>
- x86_64, 64 bits x86. Also known as amd64.<br>
- mips, 32 bits, big endian.<br>
- mipsel, 32 bits, little endian.<br>
- mips64el, 64 bits little endian.<br>
<br>
Except for x86 and x86_64, we&#39;re using the names used in debian for the=
 archs.<br>
Any objection against renaming them in the future as i386 and amd64? Or at =
the very least to name<br>
x86 as i386? Guillaume has pointed to me that currently in the kernelci x86=
 means only x86 on 32 bits<br>
and we would need to introduce x86_64 (or amd64). So for avoiding confusion=
 with x86 and x86_64,<br>
the rename would be a good idea.<br></blockquote><div>=C2=A0</div><div><div=
><div>There&#39;s an &quot;arch_map&quot; YAML attribute in new file system=
</div><div>definitions which can be used to map the kernel-stype arch names=
</div><div>with arbitrary file system specific ones.=C2=A0 So yes I think t=
he</div><div>Debian file systems should follow the standard Debian names, a=
nd</div><div>the map updated to do the translation.</div></div><div><br></d=
iv><div><div><div>There is another related issue which needs a bit of</div>=
<div>clarification.=C2=A0 At the moment we only build kernels with</div><di=
v>ARCH=3Dx86.=C2=A0 This results in binaries for different archs depending<=
/div><div>on whether they were built with i386_defconfig or</div><div>x86_6=
4_defconfig, which is fine.=C2=A0 However, it means that we can&#39;t</div>=
<div>differentiate the user-space between i386 and x86_64.=C2=A0 To be</div=
><div>compatible with all the kernels, all the x86 builds end up</div><div>=
running with the i386 user-space and never the x86_64 one.</div></div></div=
><div><br></div><div><div>It seems that running with x86_64 user-space woul=
d be a good</div><div>thing to extend the test coverage.=C2=A0 Would it be =
OK to fix this by</div><div>using i386 and x86_64 as kernel arch names inst=
ead of just x86?</div></div></div><div><br></div><div>Cheers,</div><div>Gui=
llaume</div></div></div>

--0000000000003da33c0574f49081--
