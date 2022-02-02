MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Tue, 1 Feb 2022 16:50:57 -0800
Message-ID: <CAHRSSEwYiK2+hsCoKrBtUwHRHKLk2xzVq2-3aQG94g7QZWQDvA@mail.gmail.com>
Subject: errors due to clang-14
Content-Type: multipart/alternative; boundary="000000000000ed21c605d6fe693f"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Steve Muckle <smuckle@google.com>

--000000000000ed21c605d6fe693f
Content-Type: text/plain; charset="UTF-8"

We're seeing quite a few errors that appear to be related to clang-14 build
tools building android kernels (esp arm32 builds). Example: android13-5.15
kerne
<https://linux.kernelci.org/build/android/branch/android13-5.15/kernel/ASB-2022-01-05_13-5.15-1323-g2b3eb6227c38/>
l.

I talked to our clang-built-kernel folks and they don't have any bandwidth
to help with this right now, so would it be possible to switch those builds
to whatever is used for builds of stable (currently gcc-10)? We do our
product builds with clang, but the larger benefit for us in kernelci is to
be able to compare our android kernel builds with the stable kernel builds
to quickly find issues introduced via android-specific code or backports.

So the request is: please use the same build tools for android kernels as
are used for the corresponding stable kernels.

-Todd

--000000000000ed21c605d6fe693f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;re seeing quite a few errors that appear to be rela=
ted to clang-14 build tools building android kernels (esp arm32 builds). Ex=
ample: <a href=3D"https://linux.kernelci.org/build/android/branch/android13=
-5.15/kernel/ASB-2022-01-05_13-5.15-1323-g2b3eb6227c38/">android13-5.15 ker=
ne</a>l.<div><br></div><div>I talked to our clang-built-kernel folks and th=
ey don&#39;t have any bandwidth to help with this right now, so would it be=
 possible to switch those builds to whatever is used for builds of stable (=
currently gcc-10)? We do our product=C2=A0builds with clang, but the larger=
 benefit for us in kernelci is to be able to compare our android kernel bui=
lds with the stable kernel builds to quickly find issues introduced=C2=A0vi=
a android-specific code or backports.</div><div><br></div><div>So the reque=
st is: please use the same build tools for android kernels as are used for =
the=C2=A0corresponding stable kernels.</div><div><br></div><div>-Todd</div>=
<div><br></div></div>

--000000000000ed21c605d6fe693f--
