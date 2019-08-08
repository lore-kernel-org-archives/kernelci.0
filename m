MIME-Version: 1.0
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
 <20190806190254.GH4527@sirena.org.uk> <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
 <20190806200809.GI4527@sirena.org.uk> <CABXOdTcWG-wh9ZHMVmON+B4cxV64-8HDkTvpG61eTNAOYbs-jw@mail.gmail.com>
 <20190807123854.GB4048@sirena.co.uk>
In-Reply-To: <20190807123854.GB4048@sirena.co.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 8 Aug 2019 23:31:51 +0200
Message-ID: <CAH1_8nDY-WOySK94u7WrDdgndfyca-XhLgtbG=VmL54V6pqfow@mail.gmail.com>
Subject: Re: aarch64 Big Endian
Content-Type: multipart/alternative; boundary="0000000000009d6b6b058fa1cae4"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, broonie@kernel.org
Cc: Guenter Roeck <groeck@google.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>

--0000000000009d6b6b058fa1cae4
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 2:38 PM Mark Brown <broonie@kernel.org> wrote:

> On Tue, Aug 06, 2019 at 01:45:44PM -0700, Guenter Roeck wrote:
>
> > FWIW, I generated a big endian aarch64 root file system with buildroot
> > and gave it a try with gcc 8.3.0. Works fine for me, at least with "-M
> > virt" in qemu. I have not yet tried any other machines.
>
> Yeah, the GCC big endian boots have been working fine.  It's just clang
> builds.
>

It turns out that there are several issues: one in the kernelci
build scripts, one in merge_config.sh and also one allegedly in
the kernel top-level Makefile.  I've described all this in detail
here:


https://github.com/kernelci/kernelci-core/issues/136#issuecomment-519691794

I've run some builds with these fixes on staging and it does
work, here's a "good" kernel defconfig created as a result using
my kernel branch with a patch in the Makefile:


https://staging-storage.kernelci.org/gtucker/kernelci-local/kernelci-local-snapshot-048-1-gb60ff4593140/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/clang-8/kernel.config

As you can see, it has CONFIG_CPU_BIG_ENDIAN=y as one would
expect.  I haven't found any big endian boot results though, I
guess all the relevant platforms were probably offline or not
available for staging runs but only in production.

Guillaume

--0000000000009d6b6b058fa1cae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 2:38 PM Mark Brown=
 &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 06=
, 2019 at 01:45:44PM -0700, Guenter Roeck wrote:<br>
<br>
&gt; FWIW, I generated a big endian aarch64 root file system with buildroot=
<br>
&gt; and gave it a try with gcc 8.3.0. Works fine for me, at least with &qu=
ot;-M<br>
&gt; virt&quot; in qemu. I have not yet tried any other machines.<br>
<br>
Yeah, the GCC big endian boots have been working fine.=C2=A0 It&#39;s just =
clang<br>
builds.<br></blockquote><div><br></div>It turns out that there are several =
issues: one in the kernelci<br>build scripts, one in merge_config.sh and al=
so one allegedly in<br>the kernel top-level Makefile.=C2=A0 I&#39;ve descri=
bed all this in detail<br>here:<br><br>=C2=A0 <a href=3D"https://github.com=
/kernelci/kernelci-core/issues/136#issuecomment-519691794">https://github.c=
om/kernelci/kernelci-core/issues/136#issuecomment-519691794</a><br><br>I&#3=
9;ve run some builds with these fixes on staging and it does<br>work, here&=
#39;s a &quot;good&quot; kernel defconfig created as a result using<br>my k=
ernel branch with a patch in the Makefile:<br><br>=C2=A0 <a href=3D"https:/=
/staging-storage.kernelci.org/gtucker/kernelci-local/kernelci-local-snapsho=
t-048-1-gb60ff4593140/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/clang-8/ker=
nel.config">https://staging-storage.kernelci.org/gtucker/kernelci-local/ker=
nelci-local-snapshot-048-1-gb60ff4593140/arm64/defconfig+CONFIG_CPU_BIG_END=
IAN=3Dy/clang-8/kernel.config</a><br><br>As you can see, it has CONFIG_CPU_=
BIG_ENDIAN=3Dy as one would<br>expect.=C2=A0 I haven&#39;t found any big en=
dian boot results though, I<br>guess all the relevant platforms were probab=
ly offline or not<br><div>available for staging runs but only in production=
.</div><div><br></div><div>Guillaume</div></div></div>

--0000000000009d6b6b058fa1cae4--
