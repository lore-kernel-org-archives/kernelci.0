MIME-Version: 1.0
References: <20180830233212.GA19856@delenn> <CAH1_8nBgsKO87oNxoeivwyVvOwG9j3dMotxRX9kN_+G1E7QQdA@mail.gmail.com>
 <7ho9db8wpe.fsf@baylibre.com>
In-Reply-To: <7ho9db8wpe.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 6 Sep 2018 13:49:04 +0100
Message-ID: <CAH1_8nABshi7GUMa20n66uUpPXT-g4FJu3O0ZH4oYAMw_b0nmw@mail.gmail.com>
Subject: Re: [kernelci] New images and possible arch rename
Content-Type: multipart/alternative; boundary="0000000000009eceae0575335141"
List-ID: <kernelci.groups.io>
To: khilman@baylibre.com
Cc: kernelci@groups.io

--0000000000009eceae0575335141
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 10:23 PM Kevin Hilman <khilman@baylibre.com> wrote:

> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>
> > Hi,
> >
> > On Fri, Aug 31, 2018 at 12:32 AM Ana Guerrero Lopez <
> > ana.guerrero@collabora.com> wrote:
> >
> >> Hi,
> >>
> >> After the PR for adding MIPS got accepted, I have built new debian
> rootfs
> >> images in staging.
> >> They are available at
> >>
> http://staging-storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/
> >> and
> >>
> http://staging-storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/
> >>
> >> The stretchtest images have been built with this patch
> >> https://github.com/kernelci/kernelci-build-staging/pull/54
> >> needed to fix the build of IGT GPU tools from git. Merge welcome!
> >>
> >
> > Thanks, it's now merged on staging.
> >
> > We have now images for 8 architectures:
> >>
> >> - armhf, 32 bits ARM v7 with floating point, little endian.
> >> - armel, 32 bits ARM v4t, little endian.
> >> - arm64, 64 bits ARM v8, little endian. Also known as AArch64.
> >> - x86, 32 bits. Also known as i386.
> >> - x86_64, 64 bits x86. Also known as amd64.
> >> - mips, 32 bits, big endian.
> >> - mipsel, 32 bits, little endian.
> >> - mips64el, 64 bits little endian.
> >>
> >> Except for x86 and x86_64, we're using the names used in debian for the
> >> archs.
> >> Any objection against renaming them in the future as i386 and amd64? Or
> at
> >> the very least to name
> >> x86 as i386? Guillaume has pointed to me that currently in the kernelci
> >> x86 means only x86 on 32 bits
> >> and we would need to introduce x86_64 (or amd64). So for avoiding
> >> confusion with x86 and x86_64,
> >> the rename would be a good idea.
> >>
> >
> > There's an "arch_map" YAML attribute in new file system
> > definitions which can be used to map the kernel-stype arch names
> > with arbitrary file system specific ones.  So yes I think the
> > Debian file systems should follow the standard Debian names, and
> > the map updated to do the translation.
> >
> > There is another related issue which needs a bit of
> > clarification.  At the moment we only build kernels with
> > ARCH=x86.  This results in binaries for different archs depending
> > on whether they were built with i386_defconfig or
> > x86_64_defconfig, which is fine.  However, it means that we can't
> > differentiate the user-space between i386 and x86_64.  To be
> > compatible with all the kernels, all the x86 builds end up
> > running with the i386 user-space and never the x86_64 one.
> >
> > It seems that running with x86_64 user-space would be a good
> > thing to extend the test coverage.  Would it be OK to fix this by
> > using i386 and x86_64 as kernel arch names instead of just x86?
>
> That seems like the right thing to do to me.
>

I've created a Github issue to capture that:
https://github.com/kernelci/lava-ci/issues/123

Guillaume

--0000000000009eceae0575335141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Wed, Sep 5, 2018 at 10:23 PM Kevin Hilman &lt;<a href=3D"mail=
to:khilman@baylibre.com">khilman@baylibre.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">&quot;Guillaume Tucker&quot; &=
lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillaum=
e.tucker@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Fri, Aug 31, 2018 at 12:32 AM Ana Guerrero Lopez &lt;<br>
&gt; <a href=3D"mailto:ana.guerrero@collabora.com" target=3D"_blank">ana.gu=
errero@collabora.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; After the PR for adding MIPS got accepted, I have built new debian=
 rootfs<br>
&gt;&gt; images in staging.<br>
&gt;&gt; They are available at<br>
&gt;&gt; <a href=3D"http://staging-storage.kernelci.org/images/rootfs/debia=
n/stretch/20180830.2/" rel=3D"noreferrer" target=3D"_blank">http://staging-=
storage.kernelci.org/images/rootfs/debian/stretch/20180830.2/</a><br>
&gt;&gt; and<br>
&gt;&gt; <a href=3D"http://staging-storage.kernelci.org/images/rootfs/debia=
n/stretchtests/20180830.1/" rel=3D"noreferrer" target=3D"_blank">http://sta=
ging-storage.kernelci.org/images/rootfs/debian/stretchtests/20180830.1/</a>=
<br>
&gt;&gt;<br>
&gt;&gt; The stretchtest images have been built with this patch<br>
&gt;&gt; <a href=3D"https://github.com/kernelci/kernelci-build-staging/pull=
/54" rel=3D"noreferrer" target=3D"_blank">https://github.com/kernelci/kerne=
lci-build-staging/pull/54</a><br>
&gt;&gt; needed to fix the build of IGT GPU tools from git. Merge welcome!<=
br>
&gt;&gt;<br>
&gt;<br>
&gt; Thanks, it&#39;s now merged on staging.<br>
&gt;<br>
&gt; We have now images for 8 architectures:<br>
&gt;&gt;<br>
&gt;&gt; - armhf, 32 bits ARM v7 with floating point, little endian.<br>
&gt;&gt; - armel, 32 bits ARM v4t, little endian.<br>
&gt;&gt; - arm64, 64 bits ARM v8, little endian. Also known as AArch64.<br>
&gt;&gt; - x86, 32 bits. Also known as i386.<br>
&gt;&gt; - x86_64, 64 bits x86. Also known as amd64.<br>
&gt;&gt; - mips, 32 bits, big endian.<br>
&gt;&gt; - mipsel, 32 bits, little endian.<br>
&gt;&gt; - mips64el, 64 bits little endian.<br>
&gt;&gt;<br>
&gt;&gt; Except for x86 and x86_64, we&#39;re using the names used in debia=
n for the<br>
&gt;&gt; archs.<br>
&gt;&gt; Any objection against renaming them in the future as i386 and amd6=
4? Or at<br>
&gt;&gt; the very least to name<br>
&gt;&gt; x86 as i386? Guillaume has pointed to me that currently in the ker=
nelci<br>
&gt;&gt; x86 means only x86 on 32 bits<br>
&gt;&gt; and we would need to introduce x86_64 (or amd64). So for avoiding<=
br>
&gt;&gt; confusion with x86 and x86_64,<br>
&gt;&gt; the rename would be a good idea.<br>
&gt;&gt;<br>
&gt;<br>
&gt; There&#39;s an &quot;arch_map&quot; YAML attribute in new file system<=
br>
&gt; definitions which can be used to map the kernel-stype arch names<br>
&gt; with arbitrary file system specific ones.=C2=A0 So yes I think the<br>
&gt; Debian file systems should follow the standard Debian names, and<br>
&gt; the map updated to do the translation.<br>
&gt;<br>
&gt; There is another related issue which needs a bit of<br>
&gt; clarification.=C2=A0 At the moment we only build kernels with<br>
&gt; ARCH=3Dx86.=C2=A0 This results in binaries for different archs dependi=
ng<br>
&gt; on whether they were built with i386_defconfig or<br>
&gt; x86_64_defconfig, which is fine.=C2=A0 However, it means that we can&#=
39;t<br>
&gt; differentiate the user-space between i386 and x86_64.=C2=A0 To be<br>
&gt; compatible with all the kernels, all the x86 builds end up<br>
&gt; running with the i386 user-space and never the x86_64 one.<br>
&gt;<br>
&gt; It seems that running with x86_64 user-space would be a good<br>
&gt; thing to extend the test coverage.=C2=A0 Would it be OK to fix this by=
<br>
&gt; using i386 and x86_64 as kernel arch names instead of just x86?<br>
<br>
That seems like the right thing to do to me.<br></blockquote><div><br></div=
><div>I&#39;ve created a Github issue to capture that:</div><div><a href=3D=
"https://github.com/kernelci/lava-ci/issues/123">https://github.com/kernelc=
i/lava-ci/issues/123</a><br></div><div><br></div><div>Guillaume</div></div>=
</div></div>

--0000000000009eceae0575335141--
