MIME-Version: 1.0
In-Reply-To: <7hd0wbkeyj.fsf@baylibre.com>
References: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com> <7hd0wbkeyj.fsf@baylibre.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Thu, 28 Jun 2018 14:13:40 +0100
Message-ID: <CAH+k93F8WToYV+BR7G-sVTaoVbjMRRcfyYm+n8MbjxkekcAHqA@mail.gmail.com>
Subject: Re: [kernelci] Testing with distros
Content-Type: multipart/alternative; boundary="0000000000003af71c056fb3816e"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Guillaume Tucker <guillaume.tucker@gmail.com>

--0000000000003af71c056fb3816e
Content-Type: text/plain; charset="UTF-8"

On 28 June 2018 at 00:05, Kevin Hilman <khilman@baylibre.com> wrote:

> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>
> > One subject that comes up regularly is about testing distributions
> > against upstream kernels in KernelCI.  We've been historically using a
> > bare buildroot user-space to do boot testing and run very low-level test
> > cases.  We're now starting to produce Debian root file systems for more
> > advanced test plans and extend the coverage of kernel-user interfaces
> > (DRM, V4L2...).
> >
> > It seems like there would also be some value in having tests that
> > capture distro user-space breakages due to kernel changes.  This may
> > mean building upstream kernels with a distro config, booting with a
> > fixed stable user-space from that distro and detecting new failures.
> >
> > The next part to be defined would be what tests to run with these
> > distros, as even booting means choosing which services to start etc...
> > The point being to increase kernel test coverage without ending up
> > testing the user-space itself as this would seem outside of the scope of
> > KernelCI.
> >
> > Does this sound like a path worth exploring?
>
> It definitely sounds like a path worth exploring, but personally, I'd
> rather get our kernel-focused testing (and reporting!) figured out using
> our debian baseline before tackling distros.
>

I'd put distro testing as a long term interest. I like it, but there's a
lot of other things that should come first.



> In particular, I think a kselftest and/or LTP testplan should probably
> be next on the list.
>
> Kevin
>
> 
>
>

--0000000000003af71c056fb3816e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 28 June 2018 at 00:05, Kevin Hilman <span dir=3D"ltr">&lt;<a href=3D=
"mailto:khilman@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&quot;Gu=
illaume Tucker&quot; &lt;<a href=3D"mailto:guillaume.tucker@gmail.com">guil=
laume.tucker@gmail.com</a>&gt; writes:<br>
<br>
&gt; One subject that comes up regularly is about testing distributions<br=
>
&gt; against upstream kernels in KernelCI.=C2=A0 We&#39;ve been historical=
ly using a<br>
&gt; bare buildroot user-space to do boot testing and run very low-level t=
est<br>
&gt; cases.=C2=A0 We&#39;re now starting to produce Debian root file syste=
ms for more<br>
&gt; advanced test plans and extend the coverage of kernel-user interfaces=
<br>
&gt; (DRM, V4L2...).<br>
&gt;<br>
&gt; It seems like there would also be some value in having tests that<br>
&gt; capture distro user-space breakages due to kernel changes.=C2=A0 This=
 may<br>
&gt; mean building upstream kernels with a distro config, booting with a<b=
r>
&gt; fixed stable user-space from that distro and detecting new failures.<=
br>
&gt;<br>
&gt; The next part to be defined would be what tests to run with these<br>
&gt; distros, as even booting means choosing which services to start etc..=
.<br>
&gt; The point being to increase kernel test coverage without ending up<br=
>
&gt; testing the user-space itself as this would seem outside of the scope=
 of<br>
&gt; KernelCI.<br>
&gt;<br>
&gt; Does this sound like a path worth exploring?<br>
<br>
</span>It definitely sounds like a path worth exploring, but personally, I=
&#39;d<br>
rather get our kernel-focused testing (and reporting!) figured out using<b=
r>
our debian baseline before tackling distros.<br></blockquote><div><br></di=
v><div>I&#39;d put distro testing as a long term interest. I like it, but t=
here&#39;s a lot of other things that should come first.</div><div><br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
In particular, I think a kselftest and/or LTP testplan should probably<br>
be next on the list.<br>
<br>
Kevin<br>
<span class=3D""><br>
<br>
<br>
</div></div></blockquote></div><br></div></div>

--0000000000003af71c056fb3816e--
