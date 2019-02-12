MIME-Version: 1.0
References: <c7f519e5-1945-bbf6-69b3-6ded932ceb50@collabora.com>
 <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20>
 <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com>
 <7h1s4egozv.fsf@baylibre.com> <CAJrz+7Kpsq6u7CVQsfa57XiWTqEw4tAUcDXfsRUJmms9zZF-Jg@mail.gmail.com>
 <7h4l99g650.fsf@baylibre.com>
In-Reply-To: <7h4l99g650.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 12 Feb 2019 13:36:03 +0000
Message-ID: <CAH1_8nDnirNN8K=Du-tLgVo-GFnBSKoytnsRaKePwj8NGQ-sGQ@mail.gmail.com>
Subject: Re: KernelCI modular pipeline design document
Content-Type: multipart/alternative; boundary="0000000000005a79780581b28287"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Milosz Wasilewski <milosz.wasilewski@linaro.org>, kernelci@groups.io, JanSimon.Moeller@gmx.de

--0000000000005a79780581b28287
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2019 at 1:14 AM Kevin Hilman <khilman@baylibre.com> wrote:

> Milosz Wasilewski <milosz.wasilewski@linaro.org> writes:
>
> > On Mon, 11 Feb 2019 at 18:27, Kevin Hilman <khilman@baylibre.com> wrote=
:
> >>
> >> "Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:
> >>
> >> > On Fri, 8 Feb 2019 at 16:33, "Jan-Simon M=C3=B6ller" <
> JanSimon.Moeller@gmx.de> wrote:
> >> >>
> >> >> Please do not just think of 'building the kernel' - ppl also want t=
o
> test and record/visualize userspace tests (aka custom-built
> kernel+filesystem).
> >> >> Yes, the linux kernel is the main focus for kernelci.org . But
> let's keep the other possible use-cases in mind.
> >> >>
> >> >
> >> > I don't think this is a good idea. Having other use cases in mind
> >> > takes you down a very deep rabbit hole. Creating a general purpose
> >> > result reporting tool is hard. Kernelci reports on kernel results an=
d
> >> > (as I understand) does it right. You can use these tools for other
> >> > purposes but that's a different story.
> >>
> >> Yes, we're focused on kernel-focused testing, but there are multiple
> >> ways to test the kernel, most of which require a combination of kernel=
 +
> >> userspace/distro.
> >>
> >> I think Jan-Simon's point is that as we evolve, while we might focus o=
n
> >> buildroot/debian, we chould not design things in a way that prohibit
> >> using the kernelCI code (and infra) for other types of kernel-focused
> >> testing (e.g. Yocto, other distros, etc.)
> >
> > I guess 'kernel focused' is the key here. I read 'other possible use
> > cases' as a request to build a general purpose reporting tool.
> >
> >>
> >> Stated differently, the current *service* provided by kernelCI.org is
> >> kernel-focused testing.  But, we could (and should, IMO) write the
> >> *software* behind that service in a way that it could be used more
> >> generically if desired.
> >
> > I've been trying to do that for last couple of years with no major
> > success. It might be just me or the fact that it's really hard. Once
> > you try to start reporting on android runtime or openstack things get
> > really complicated.
> >
> > So if you consider running tests that exercise different parts of
> > kernel (like graphics, scheduler...) as 'other use cases' than yes,
> > KCI software should be able to do that. But I don't think going the
> > route of 'general purpose reporting tool' is the right decision.
>
> Agreed.  We should stay focused on *kernel* CI.
>
> But, we don't want to (artificially) limit the types of
> tools/distros/stacks we use to beat up on the kernel.
>

So I think the key point is that root file systems may be coming
from a dynamically generated URL on a per-job basis, and with the
option to not include a ramdisk or a kernel image.  That would
make it possible to replace the regular KernelCI build jobs with
alternative ones that produce a full OS image or a Debian package
or anything more than a plain kernel image, and then feed that
into the reference implementation with LAVA etc...

In fact, I think it would just mean adding some template blocks
around the deploy definitions in the base template.  Then anyone
could crate a "downstream" test plan with alternative URLs using
variables such as the kernel revision to point to a rootfs.

As far as the design document is concerned, it seems that we just
need to state that we don't want to make it hard to achieve that.

On a related topic that has been discussed before, we may want to
use more distros and user-space variants to test the kernel as
part of KernelCI.  Say, to see whether the kernel doesn't hit any
bugs when running an unusual init process or libc implementation
etc...  That should be fine as long as the user-space is a means
of testing a pure upstream kernel revision, so we're not actually
testing the user-space itself or any downstream distro patches.

Guillaume

--0000000000005a79780581b28287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Feb=
 12, 2019 at 1:14 AM Kevin Hilman &lt;<a href=3D"mailto:khilman@baylibre.co=
m">khilman@baylibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Milosz Wasilewski &lt;<a href=3D"mailto:milosz.wasil=
ewski@linaro.org" target=3D"_blank">milosz.wasilewski@linaro.org</a>&gt; wr=
ites:<br>
<br>
&gt; On Mon, 11 Feb 2019 at 18:27, Kevin Hilman &lt;<a href=3D"mailto:khilm=
an@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &quot;Milosz Wasilewski&quot; &lt;<a href=3D"mailto:milosz.wasilew=
ski@linaro.org" target=3D"_blank">milosz.wasilewski@linaro.org</a>&gt; writ=
es:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Fri, 8 Feb 2019 at 16:33, &quot;Jan-Simon M=C3=B6ller&quot=
; &lt;<a href=3D"mailto:JanSimon.Moeller@gmx.de" target=3D"_blank">JanSimon=
.Moeller@gmx.de</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Please do not just think of &#39;building the kernel&#39;=
 - ppl also want to test and record/visualize userspace tests (aka custom-b=
uilt kernel+filesystem).<br>
&gt;&gt; &gt;&gt; Yes, the linux kernel is the main focus for <a href=3D"ht=
tp://kernelci.org" rel=3D"noreferrer" target=3D"_blank">kernelci.org</a> . =
But let&#39;s keep the other possible use-cases in mind.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I don&#39;t think this is a good idea. Having other use cases=
 in mind<br>
&gt;&gt; &gt; takes you down a very deep rabbit hole. Creating a general pu=
rpose<br>
&gt;&gt; &gt; result reporting tool is hard. Kernelci reports on kernel res=
ults and<br>
&gt;&gt; &gt; (as I understand) does it right. You can use these tools for =
other<br>
&gt;&gt; &gt; purposes but that&#39;s a different story.<br>
&gt;&gt;<br>
&gt;&gt; Yes, we&#39;re focused on kernel-focused testing, but there are mu=
ltiple<br>
&gt;&gt; ways to test the kernel, most of which require a combination of ke=
rnel +<br>
&gt;&gt; userspace/distro.<br>
&gt;&gt;<br>
&gt;&gt; I think Jan-Simon&#39;s point is that as we evolve, while we might=
 focus on<br>
&gt;&gt; buildroot/debian, we chould not design things in a way that prohib=
it<br>
&gt;&gt; using the kernelCI code (and infra) for other types of kernel-focu=
sed<br>
&gt;&gt; testing (e.g. Yocto, other distros, etc.)<br>
&gt;<br>
&gt; I guess &#39;kernel focused&#39; is the key here. I read &#39;other po=
ssible use<br>
&gt; cases&#39; as a request to build a general purpose reporting tool.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Stated differently, the current *service* provided by kernelCI.org=
 is<br>
&gt;&gt; kernel-focused testing.=C2=A0 But, we could (and should, IMO) writ=
e the<br>
&gt;&gt; *software* behind that service in a way that it could be used more=
<br>
&gt;&gt; generically if desired.<br>
&gt;<br>
&gt; I&#39;ve been trying to do that for last couple of years with no major=
<br>
&gt; success. It might be just me or the fact that it&#39;s really hard. On=
ce<br>
&gt; you try to start reporting on android runtime or openstack things get<=
br>
&gt; really complicated.<br>
&gt;<br>
&gt; So if you consider running tests that exercise different parts of<br>
&gt; kernel (like graphics, scheduler...) as &#39;other use cases&#39; than=
 yes,<br>
&gt; KCI software should be able to do that. But I don&#39;t think going th=
e<br>
&gt; route of &#39;general purpose reporting tool&#39; is the right decisio=
n.<br>
<br>
Agreed.=C2=A0 We should stay focused on *kernel* CI.<br>
<br>
But, we don&#39;t want to (artificially) limit the types of<br>
tools/distros/stacks we use to beat up on the kernel.<br></blockquote><div>=
=C2=A0</div><div>So I think the key point is that root file systems may be =
coming</div><div>from a dynamically generated URL on a per-job basis, and w=
ith the</div><div>option to not include a ramdisk or a kernel image.=C2=A0 =
That would</div><div>make it possible to replace the regular KernelCI build=
 jobs with</div><div>alternative ones that produce a full OS image or a Deb=
ian package</div><div>or anything more than a plain kernel image, and then =
feed that</div><div>into the reference implementation with LAVA etc...</div=
><div><br></div><div><div>In fact, I think it would just mean adding some t=
emplate blocks</div><div>around the deploy definitions in the base template=
.=C2=A0 Then anyone</div><div>could crate a &quot;downstream&quot; test pla=
n with alternative URLs using</div><div>variables such as the kernel revisi=
on to point to a rootfs.</div></div><div><br></div><div>As far as the desig=
n document is concerned, it seems that we just</div><div>need to state that=
 we don&#39;t want to make it hard to achieve that.</div><div><br></div><di=
v><div>On a related topic that has been discussed before, we may want to</d=
iv><div>use more distros and user-space variants to test the kernel as</div=
><div>part of KernelCI.=C2=A0 Say, to see whether the kernel doesn&#39;t hi=
t any</div><div>bugs when running an unusual init process or libc implement=
ation</div><div>etc...=C2=A0 That should be fine as long as the user-space =
is a means</div><div>of testing a pure upstream kernel revision, so we&#39;=
re not actually</div><div>testing the user-space itself or any downstream d=
istro patches.</div></div><div><br></div><div>Guillaume=C2=A0</div></div></=
div></div></div></div>

--0000000000005a79780581b28287--
