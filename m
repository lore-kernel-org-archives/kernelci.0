MIME-Version: 1.0
References: <20181026151956.GG2015@sasha-vm>
In-Reply-To: <20181026151956.GG2015@sasha-vm>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 26 Oct 2018 17:34:53 +0100
Message-ID: <CAH1_8nAAAw+2yunnWtet=OreRtD_u3M_Su3S7Dnd+2suypfczQ@mail.gmail.com>
Subject: Re: [kernelci] branch inclusion request
Content-Type: multipart/alternative; boundary="0000000000003a78bf0579244da2"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--0000000000003a78bf0579244da2
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Fri, Oct 26, 2018 at 5:08 PM Sasha Levin <sashal@kernel.org> wrote:

> Hi all,
>
> Right now I'm pushing stable patches to Greg for his weekly releases,
> and for those branches I only do basic cross-compilation and no
> boot/functional testing at all.
>
> I'd like to modify my process to rely on KernelCI testing instead. This
> means I'd like to include my branches (one for each stable kernel) into
> the build system.
>
> These branches get pushed a few times per week, and sometimes a few
> times a day, so this will generate a fair amount of builds. OTOH, I
> don't really need to keep the build results for too long as I try to
> address any issues that come up the same day.
>

This sounds like a good idea in principle, but what is the actual
gain given the extra load it would take to build and test all
these branches?

Of course it's very important to test stable releases, but they
typically show very few build or test failures and there is
already stable-rc to catch any of these.  It seems to me that
development branches are where extra testing efforts would be
required the most, to catch issues earlier.

If adding your stable branches to KernelCI would save you a lot
of manual effort, then yes I guess that would probably be a good
reason.  If you'll still be doing the same manual builds and
checks before pushing your branches, then I'm not really sure
it's worth adding them to KernelCI as it currently stands.

Let's see what others think the priorities should be wrt adding
more branches.

Guillaume


>
>

--0000000000003a78bf0579244da2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Sasha,<br><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Oct 26, 2018 at 5:08 PM Sasha =
Levin &lt;<a href=3D"mailto:sashal@kernel.org">sashal@kernel.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
Right now I&#39;m pushing stable patches to Greg for his weekly releases,<=
br>
and for those branches I only do basic cross-compilation and no<br>
boot/functional testing at all.<br>
<br>
I&#39;d like to modify my process to rely on KernelCI testing instead. Thi=
s<br>
means I&#39;d like to include my branches (one for each stable kernel) int=
o<br>
the build system.<br>
<br>
These branches get pushed a few times per week, and sometimes a few<br>
times a day, so this will generate a fair amount of builds. OTOH, I<br>
don&#39;t really need to keep the build results for too long as I try to<b=
r>
address any issues that come up the same day.<br></blockquote><div><br></d=
iv><div>This sounds like a good idea in principle, but what is the actual</=
div><div>gain given the extra load it would take to build and test all</div=
><div>these branches?</div><div><br></div><div>Of course it&#39;s very impo=
rtant to test stable releases, but they</div><div>typically show very few b=
uild or test failures and there is</div><div>already stable-rc to catch any=
 of these.=C2=A0 It seems to me that</div><div>development branches are whe=
re extra testing efforts would be</div><div>required the most, to catch iss=
ues earlier.</div><div><br></div><div>If adding your stable branches to Ker=
nelCI would save you a lot</div><div>of manual effort, then yes I guess tha=
t would probably be a good</div><div>reason.=C2=A0 If you&#39;ll still be d=
oing the same manual builds and</div><div>checks before pushing your branch=
es, then I&#39;m not really sure</div><div>it&#39;s worth adding them to Ke=
rnelCI as it currently stands.=C2=A0</div><div><br></div><div><div>Let&#39;=
s see what others think the priorities should be wrt adding</div><div>more =
branches.</div></div><div><br></div><div>Guillaume</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
</blockquote></div></div></div></div>

--0000000000003a78bf0579244da2--
