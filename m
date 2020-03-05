MIME-Version: 1.0
References: <CAHRSSEy0WwprMwvLP1ZUXpi66o5ObwD_zvrs_jjmNED_Sfi8gg@mail.gmail.com>
In-Reply-To: <CAHRSSEy0WwprMwvLP1ZUXpi66o5ObwD_zvrs_jjmNED_Sfi8gg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 5 Mar 2020 21:49:48 +0000
Message-ID: <CAH1_8nBqa1Dy0pNJwGoSVjW--S2zBusf8H+tG=BXw+5zvHJBbw@mail.gmail.com>
Subject: Re: dumb question regarding "x86_64_defconfig+kselftest"
Content-Type: multipart/alternative; boundary="000000000000bfc74f05a02284b7"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Todd Kjos <tkjos@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>

--000000000000bfc74f05a02284b7
Content-Type: text/plain; charset="UTF-8"

Hi Todd,

On Thu, Mar 5, 2020 at 7:42 PM Todd Kjos via Groups.Io <tkjos=
google.com@groups.io> wrote:

> I'm probably missing something obvious, but I have a failure for the
> "x86_64_defconfig+kselftest" build of the android-4.19 branch. There is no
> failure with the "x86_64_defconfig" build.
>
> How do I reproduce the "+kselftest"? I don't see any "kselftest" string in
> the build.log.
>

The +kselftest syntax is a KernelCI convention to show that a
kselftest config fragment was added on top of the base defconfig.
The code that generates the fragment can be found here:


https://github.com/kernelci/kernelci-core/blob/master/kernelci/build.py#L249

It can typically be run by the following command, using the
kernelci-core tool kci_build:

  ./kci_build generate_fragments --config=mainline --kdir=~/src/linux

Please note that the --config option in this command is not the
kernel config but the build config from build-configs.yaml to
know which fragments need to be generated for each kernel branch.

With kernelci.org builds, the fragments are first added to a
kernel source tarball which is then used in all subsequent builds
for a given revision.  If I pick the latest mainline one:


https://storage.kernelci.org/mainline/master/v5.6-rc4-78-g9f65ed5fe41c/linux-src_mainline.tar.gz

I can see it has this fragment:

  kernel/configs/kselftest.config

which I've copied here to save people's time:

  https://people.collabora.com/~gtucker/kernelci/doc/kselftest.config


There's a similar fragment for every kernel revision being built,
including the android branches.

Guillaume

>

--000000000000bfc74f05a02284b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Todd,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2020 at 7:42 PM Todd Kjos via =
Groups.Io &lt;tkjos=3D<a href=3D"mailto:google.com@groups.io">google.com@gr=
oups.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">I&#39;m probably missing something obvious, but I h=
ave a failure for the &quot;x86_64_defconfig+kselftest&quot; build of the a=
ndroid-4.19 branch. There is no failure with the &quot;x86_64_defconfig&quo=
t; build.<div><br></div><div>How do I reproduce the &quot;+kselftest&quot;?=
 I don&#39;t see any &quot;kselftest&quot; string in the build.log.</div></=
div></blockquote><div><br></div><div>The +kselftest syntax is a KernelCI co=
nvention to show that a<br>kselftest config fragment was added on top of th=
e base defconfig.<br>The code that generates the fragment can be found here=
:<br><br>=C2=A0 <a href=3D"https://github.com/kernelci/kernelci-core/blob/m=
aster/kernelci/build.py#L249">https://github.com/kernelci/kernelci-core/blo=
b/master/kernelci/build.py#L249</a><br><br>It can typically be run by the f=
ollowing command, using the<br>kernelci-core tool kci_build:<br><br>=C2=A0 =
./kci_build generate_fragments --config=3Dmainline --kdir=3D~/src/linux<br>=
<br></div><div>Please note that the --config option in this command is not =
the<br>kernel config but the build config from build-configs.yaml to<br>kno=
w which fragments need to be generated for each kernel branch.</div><div><b=
r>With <a href=3D"http://kernelci.org">kernelci.org</a> builds, the fragmen=
ts are first added to a<br>kernel source tarball which is then used in all =
subsequent builds<br>for a given revision.=C2=A0 If I pick the latest mainl=
ine one:<br><br>=C2=A0 <a href=3D"https://storage.kernelci.org/mainline/mas=
ter/v5.6-rc4-78-g9f65ed5fe41c/linux-src_mainline.tar.gz">https://storage.ke=
rnelci.org/mainline/master/v5.6-rc4-78-g9f65ed5fe41c/linux-src_mainline.tar=
.gz</a><br><br>I can see it has this fragment:<br><br>=C2=A0 kernel/configs=
/kselftest.config<br><br>which I&#39;ve copied here to save people&#39;s ti=
me:<br><br>=C2=A0 <a href=3D"https://people.collabora.com/~gtucker/kernelci=
/doc/kselftest.config">https://people.collabora.com/~gtucker/kernelci/doc/k=
selftest.config</a><br><br><br>There&#39;s a similar fragment for every ker=
nel revision being built,<br>including the android branches.<br></div><div>=
<br></div><div>Guillaume<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">

<p></p><p></p></blockquote></div></div>

--000000000000bfc74f05a02284b7--
