MIME-Version: 1.0
References: <CAHRSSEwYiK2+hsCoKrBtUwHRHKLk2xzVq2-3aQG94g7QZWQDvA@mail.gmail.com>
In-Reply-To: <CAHRSSEwYiK2+hsCoKrBtUwHRHKLk2xzVq2-3aQG94g7QZWQDvA@mail.gmail.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 19:47:01 -0800
Message-ID: <CAKwvOd=_DqRf0Ex3Huo7n4sBvZqxMwtw7yCzR_oKYDO-Wzh0DQ@mail.gmail.com>
Subject: Re: errors due to clang-14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com
Cc: Steve Muckle <smuckle@google.com>

On Tue, Feb 1, 2022 at 5:15 PM Todd Kjos via groups.io
<tkjos=3Dgoogle.com@groups.io> wrote:
>
> We're seeing quite a few errors that appear to be related to clang-14 bui=
ld tools building android kernels (esp arm32 builds). Example: android13-5.=
15 kernel.
>
> I talked to our clang-built-kernel folks and they don't have any bandwidt=
h to help with this right now, so would it be possible to switch those buil=
ds to whatever is used for builds of stable (currently gcc-10)? We do our p=
roduct builds with clang, but the larger benefit for us in kernelci is to b=
e able to compare our android kernel builds with the stable kernel builds t=
o quickly find issues introduced via android-specific code or backports.

I'd rather builds of at91_dt_defconfig be turned off for the Android
tree. Android doesn't support ARMv4, and there's warning spew from
https://github.com/ClangBuiltLinux/linux/issues/964.  Regarding
bandwidth, that issue is no higher priority than any of the other open
issues in that issue tracker.

That doesn't mean we should move CI of Android trees off clang in general.

>
> So the request is: please use the same build tools for android kernels as=
 are used for the corresponding stable kernels.
>
> -Todd
>
>=20



--=20
Thanks,
~Nick Desaulniers
