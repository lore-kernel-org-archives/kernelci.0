MIME-Version: 1.0
References: <CAHRSSExW6ig0=1Kx3jEM0mHEbh7W5G9yJGN0BxBfTiN9MBungA@mail.gmail.com>
 <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com>
 <CAH+k93EFwUw4KsKZirJKDOF=Xi8SCk80KyVYfJmFYxzLP69qJA@mail.gmail.com>
 <CAHRSSEw_3QEb6NS51LGN+FGjYeKma4=WO5kfjHrKM46+SofiEw@mail.gmail.com>
 <CAHRSSEz4n+=gAokMj4p5w++VDBPWic_rodvaUS-1eSp5rUpWNg@mail.gmail.com>
 <CAHRSSExgOW4CWc_YfUQcx_sJYanBNTrLiNntt67zxcWUPudcjQ@mail.gmail.com>
 <7hsgpu9snm.fsf@baylibre.com> <CAHRSSEwmxUXjD5DYJNXRJKsYPKyC54a9vrY=bRZLuEOZfJLmwQ@mail.gmail.com>
 <CAH+k93G8PmCM5fZ_Tavm--H3CETzW6znKcS1BDPyZvhXEBsV0Q@mail.gmail.com>
 <CAHRSSEytdV_pGQvH7+NGLMU3V3zDN43PxwgcWG3HQR8gqueghA@mail.gmail.com>
 <CAH+k93GhFGf9U2Am-V+ivf3Wn8d7H8vjg==8BGN0g8UW-p0K=A@mail.gmail.com>
 <CAHRSSEzg++6oUoG38v2x+e8K3H07q+k3jTnG6GPCgFSp-yLA=Q@mail.gmail.com> <CAHRSSEx=-rJGjk2USG+ghvf66+NaWtv5jEQzZ08=WHFoKh1cPg@mail.gmail.com>
In-Reply-To: <CAHRSSEx=-rJGjk2USG+ghvf66+NaWtv5jEQzZ08=WHFoKh1cPg@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 21 Nov 2019 13:54:06 -0800
Message-ID: <CAHRSSEyz+SVUspLjwDJBVLjnNtqXd8gKH+3hiitw70M=N1qw-Q@mail.gmail.com>
Subject: Re: Please add/remove android branches from kernelci + clang builds
Content-Type: multipart/alternative; boundary="000000000000bf10360597e256fc"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io, Anmar Oueja <anmar.oueja@linaro.org>

--000000000000bf10360597e256fc
Content-Type: text/plain; charset="UTF-8"

...also please delete the following 3 obsolete android branches:

android-3.18-n-release
android-4.4-n
android-4.4-n-release


On Thu, Nov 14, 2019 at 5:25 PM Todd Kjos <tkjos@google.com> wrote:

> Sorry about this request... please undo my previous request to enable
> testing on "-r" branches (top of this thread).
>
> Specifically:
>
> repo: https://android.googlesource.com/kernel/common
>
> 1) android-4.14 will live on and android-4.14-r won't
>
> delete: android-4.14-r
> add: android-4.14
>
> 2) android-4.19 will live on and android-4.19-r won't
>
> delete: android-4.19-r
> add: android-4.19
>
> On Thu, Aug 22, 2019 at 10:14 AM Todd Kjos <tkjos@google.com> wrote:
>
>> Thanks!
>>
>> On Thu, Aug 22, 2019 at 10:09 AM Matt Hart <matthew.hart@linaro.org>
>> wrote:
>> >
>> > On Thu, 22 Aug 2019 at 17:55, Todd Kjos <tkjos@google.com> wrote:
>> > >
>> > > On Thu, Aug 22, 2019 at 9:53 AM Matt Hart <matthew.hart@linaro.org>
>> wrote:
>> > > >
>> > > > On Wed, 21 Aug 2019 at 21:26, Todd Kjos <tkjos@google.com> wrote:
>> > > > >
>> > > > > On Wed, Aug 21, 2019 at 1:21 PM Kevin Hilman <
>> khilman@baylibre.com> wrote:
>> > > > > >
>> > > > > > " via Groups.Io" <tkjos=google.com@groups.io> writes:
>> > > > > >
>> > > > > > > 4 requests related to android kernels (repo:
>> > > > > > > https://android.googlesource.com/kernel/common):
>> > > > > > >
>> > > > > > > 1) android-4.14 is being moved to android-4.14-r (currently
>> mirrored
>> > > > > > > so testing can be moved to new branch)
>> > > > > > >
>> > > > > > > delete: android-4.14
>> > > > > > > add: android-4.14-r
>> > > > > > >
>> > > > > > > 2) android-4.19 is being moved to android-4.19-r (currently
>> mirrored
>> > > > > > > so testing can be moved to new branch)
>> > > > > > >
>> > > > > > > delete: android-4.19
>> > > > > > > add: android-4.19-r
>> > > > > > >
>> > > > > > > 3) android-4.9 is obsolete
>> > > > > > >
>> > > > > > > delete: android-4.19
>> > > > > >
>> > > > > > I assume you meant android-4.9 here (based on the previous
>> sentence)?
>> > > > >
>> > > > > Indeed. Thanks.
>> > > >
>> > > > I'm doing a pull request for these changes now. Did you mean all
>> > > > android-4.9 trees are obsolete or only the exact "android-4.9"
>> branch?
>> > >
>> > > Just the exact "android-4.9" branch. The others are all still
>> > > supported (and will be for a long time).
>> >
>> > Understood, I've done the PR
>> https://github.com/kernelci/kernelci-core/pull/153
>>
>

--000000000000bf10360597e256fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">...also please delete the following 3 obsolete android bra=
nches:<div><br></div><div>android-3.18-n-release<br></div><div>android-4.4-=
n<br></div><div>android-4.4-n-release<br></div><div><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 1=
4, 2019 at 5:25 PM Todd Kjos &lt;<a href=3D"mailto:tkjos@google.com">tkjos@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Sorry about this request... please undo my prev=
ious request  to enable testing on &quot;-r&quot; branches=C2=A0(top of thi=
s thread).=C2=A0<div><br></div><div>Specifically:<div><br></div><div>repo:=
=C2=A0<a href=3D"https://android.googlesource.com/kernel/common" rel=3D"nor=
eferrer" target=3D"_blank">https://android.googlesource.com/<span>kernel</s=
pan>/common</a><br></div><div><br></div><div>1) android-4.14 will live on a=
nd android-4.14-<span>r</span>=C2=A0won&#39;t<br><br>delete: android-4.14-r=
<br>add: android-4.14<br><br>2) android-<span>4.19</span>=C2=A0will live on=
 and android-<span>4.19</span>-<span>r won&#39;t</span><br><br>delete: andr=
oid-<span>4.19-r</span><br>add: android-<span>4.19</span><br></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Aug 22, 2019 at 10:14 AM Todd Kjos &lt;<a href=3D"mailto:tkjos@google=
.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Thanks!<br>
<br>
On Thu, Aug 22, 2019 at 10:09 AM Matt Hart &lt;<a href=3D"mailto:matthew.ha=
rt@linaro.org" target=3D"_blank">matthew.hart@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 22 Aug 2019 at 17:55, Todd Kjos &lt;<a href=3D"mailto:tkjos@go=
ogle.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Aug 22, 2019 at 9:53 AM Matt Hart &lt;<a href=3D"mailto:m=
atthew.hart@linaro.org" target=3D"_blank">matthew.hart@linaro.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, 21 Aug 2019 at 21:26, Todd Kjos &lt;<a href=3D"mailt=
o:tkjos@google.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Aug 21, 2019 at 1:21 PM Kevin Hilman &lt;<a hre=
f=3D"mailto:khilman@baylibre.com" target=3D"_blank">khilman@baylibre.com</a=
>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &quot; via Groups.Io&quot; &lt;tkjos=3D<a href=3D"=
mailto:google.com@groups.io" target=3D"_blank">google.com@groups.io</a>&gt;=
 writes:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 4 requests related to android kernels (repo:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://android.googlesource.com/k=
ernel/common" rel=3D"noreferrer" target=3D"_blank">https://android.googleso=
urce.com/kernel/common</a>):<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 1) android-4.14 is being moved to android-4.1=
4-r (currently mirrored<br>
&gt; &gt; &gt; &gt; &gt; &gt; so testing can be moved to new branch)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; delete: android-4.14<br>
&gt; &gt; &gt; &gt; &gt; &gt; add: android-4.14-r<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 2) android-4.19 is being moved to android-4.1=
9-r (currently mirrored<br>
&gt; &gt; &gt; &gt; &gt; &gt; so testing can be moved to new branch)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; delete: android-4.19<br>
&gt; &gt; &gt; &gt; &gt; &gt; add: android-4.19-r<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; 3) android-4.9 is obsolete<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; delete: android-4.19<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I assume you meant android-4.9 here (based on the =
previous sentence)?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Indeed. Thanks.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m doing a pull request for these changes now. Did you =
mean all<br>
&gt; &gt; &gt; android-4.9 trees are obsolete or only the exact &quot;andro=
id-4.9&quot; branch?<br>
&gt; &gt;<br>
&gt; &gt; Just the exact &quot;android-4.9&quot; branch. The others are all=
 still<br>
&gt; &gt; supported (and will be for a long time).<br>
&gt;<br>
&gt; Understood, I&#39;ve done the PR <a href=3D"https://github.com/kernelc=
i/kernelci-core/pull/153" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/kernelci/kernelci-core/pull/153</a><br>
</blockquote></div>
</blockquote></div>

--000000000000bf10360597e256fc--
