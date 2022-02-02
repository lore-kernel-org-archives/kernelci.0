MIME-Version: 1.0
References: <CAHRSSEwYiK2+hsCoKrBtUwHRHKLk2xzVq2-3aQG94g7QZWQDvA@mail.gmail.com>
 <CAKwvOd=_DqRf0Ex3Huo7n4sBvZqxMwtw7yCzR_oKYDO-Wzh0DQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=_DqRf0Ex3Huo7n4sBvZqxMwtw7yCzR_oKYDO-Wzh0DQ@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 2 Feb 2022 08:45:12 -0800
Message-ID: <CAHRSSEwQDtqh13+jdxSRr019bmBcCaesV2w2HSNHGmyh9AkWUw@mail.gmail.com>
Subject: Re: errors due to clang-14
Content-Type: multipart/alternative; boundary="0000000000009c6d1c05d70bbeb2"
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@groups.io, Steve Muckle <smuckle@google.com>

--0000000000009c6d1c05d70bbeb2
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 7:47 PM Nick Desaulniers <ndesaulniers@google.com>
wrote:

> On Tue, Feb 1, 2022 at 5:15 PM Todd Kjos via groups.io
> <tkjos=google.com@groups.io> wrote:
> >
> > We're seeing quite a few errors that appear to be related to clang-14
> build tools building android kernels (esp arm32 builds). Example:
> android13-5.15 kernel.
> >
> > I talked to our clang-built-kernel folks and they don't have any
> bandwidth to help with this right now, so would it be possible to switch
> those builds to whatever is used for builds of stable (currently gcc-10)?
> We do our product builds with clang, but the larger benefit for us in
> kernelci is to be able to compare our android kernel builds with the stable
> kernel builds to quickly find issues introduced via android-specific code
> or backports.
>
> I'd rather builds of at91_dt_defconfig be turned off for the Android
> tree. Android doesn't support ARMv4, and there's warning spew from
> https://github.com/ClangBuiltLinux/linux/issues/964.  Regarding
> bandwidth, that issue is no higher priority than any of the other open
> issues in that issue tracker.
>
> That doesn't mean we should move CI of Android trees off clang in general.
>

How about we move the arm32 builds off of clang-14 until they are fixed. It
makes it harder to manage the branch when there are so many failures that
force us to always click in to see what is wrong -- we need the builds to
be all green (or at least non-red), so let's disable arm32 clang-14 builds
until they are fixed -- then we can turn them back on.

If you are willing to treat these as urgent issues and fix them quickly,
I'm fine with leaving clang-14 on, but I didn't get the impression you
considered this to be important when we swapped mail on this.


>
> >
> > So the request is: please use the same build tools for android kernels
> as are used for the corresponding stable kernels.
> >
> > -Todd
> >
> > 
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
>

--0000000000009c6d1c05d70bbeb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2022 at 7:47 PM Nick D=
esaulniers &lt;<a href=3D"mailto:ndesaulniers@google.com">ndesaulniers@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Feb 1, 2022 at 5:15 PM Todd Kjos via <a href=3D"http://groups=
.io" rel=3D"noreferrer" target=3D"_blank">groups.io</a><br>
&lt;tkjos=3D<a href=3D"mailto:google.com@groups.io" target=3D"_blank">googl=
e.com@groups.io</a>&gt; wrote:<br>
&gt;<br>
&gt; We&#39;re seeing quite a few errors that appear to be related to clang=
-14 build tools building android kernels (esp arm32 builds). Example: andro=
id13-5.15 kernel.<br>
&gt;<br>
&gt; I talked to our clang-built-kernel folks and they don&#39;t have any b=
andwidth to help with this right now, so would it be possible to switch tho=
se builds to whatever is used for builds of stable (currently gcc-10)? We d=
o our product builds with clang, but the larger benefit for us in kernelci =
is to be able to compare our android kernel builds with the stable kernel b=
uilds to quickly find issues introduced via android-specific code or backpo=
rts.<br>
<br>
I&#39;d rather builds of at91_dt_defconfig be turned off for the Android<br=
>
tree. Android doesn&#39;t support ARMv4, and there&#39;s warning spew from<=
br>
<a href=3D"https://github.com/ClangBuiltLinux/linux/issues/964" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/ClangBuiltLinux/linux/issues/9=
64</a>.=C2=A0 Regarding<br>
bandwidth, that issue is no higher priority than any of the other open<br>
issues in that issue tracker.<br>
<br>
That doesn&#39;t mean we should move CI of Android trees off clang in gener=
al.<br></blockquote><div><br></div><div>How about we move the arm32 builds =
off of clang-14 until they are fixed. It makes it harder to manage the bran=
ch when there are so many failures that force us to always click in to=C2=
=A0see what is wrong -- we need the builds to be all green (or at least non=
-red), so let&#39;s disable arm32 clang-14 builds until they are fixed -- t=
hen we can turn them back on.</div><div><br></div><div>If you are willing t=
o treat these as urgent issues and fix them quickly, I&#39;m fine with leav=
ing clang-14 on, but I didn&#39;t get the impression you considered this to=
 be important when we swapped mail on this.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; So the request is: please use the same build tools for android kernels=
 as are used for the corresponding stable kernels.<br>
&gt;<br>
&gt; -Todd<br>
&gt;
<br>
<br>
<br>
-- <br>
Thanks,<br>
~Nick Desaulniers<br>
</blockquote></div></div>

--0000000000009c6d1c05d70bbeb2--
