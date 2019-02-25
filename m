MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com> <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
In-Reply-To: <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Mon, 25 Feb 2019 13:03:58 +0000
Message-ID: <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: multipart/alternative; boundary="0000000000008929170582b793d5"
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>

--0000000000008929170582b793d5
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 1, 2019 at 12:18 PM Linus Walleij <linus.walleij@linaro.org>
wrote:

> On Thu, Jan 31, 2019 at 7:37 PM Matt Hart <matthew.hart@linaro.org> wrote:
> > On Thu, 31 Jan 2019 at 18:28, Guillaume Tucker
> > <guillaume.tucker@gmail.com> wrote:
>
> > >> could the GPIO tree:
> > >>
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/
> > >>
> > >> Branches "devel", "fixes" and "for-next" (no others!) be added to
> > >> the kernelci loop?
> >
> > How often are they updated?
>
> Depends on my work schedule, I suppose weekly to biweekly
> but when I focus on it they change several times the same
> day.
>
> The best would be that the tree be checked once per 24 hrs
> at my nighttime for if any changes done during the day.
> I think that would seldom amount to it running two days in
> a row except during intense times (merge window).
>

I see there's now a PR to add these branches:

  https://github.com/kernelci/kernelci-core-staging/pull/100

I've added a comment about the number of builds, as at the moment
we can't easily configure to only check these branches every 24h
when all the other branches are being checked every hour.

Guillaume

--0000000000008929170582b793d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 1, 2019 at 1=
2:18 PM Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org">linus=
.walleij@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Thu, Jan 31, 2019 at 7:37 PM Matt Hart &lt;<a href=3D=
"mailto:matthew.hart@linaro.org" target=3D"_blank">matthew.hart@linaro.org<=
/a>&gt; wrote:<br>
&gt; On Thu, 31 Jan 2019 at 18:28, Guillaume Tucker<br>
&gt; &lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">gu=
illaume.tucker@gmail.com</a>&gt; wrote:<br>
<br>
&gt; &gt;&gt; could the GPIO tree:<br>
&gt; &gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/li=
nusw/linux-gpio.git/" rel=3D"noreferrer" target=3D"_blank">https://git.kern=
el.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Branches &quot;devel&quot;, &quot;fixes&quot; and &quot;for-n=
ext&quot; (no others!) be added to<br>
&gt; &gt;&gt; the kernelci loop?<br>
&gt;<br>
&gt; How often are they updated?<br>
<br>
Depends on my work schedule, I suppose weekly to biweekly<br>
but when I focus on it they change several times the same<br>
day.<br>
<br>
The best would be that the tree be checked once per 24 hrs<br>
at my nighttime for if any changes done during the day.<br>
I think that would seldom amount to it running two days in<br>
a row except during intense times (merge window).<br></blockquote><div><br>=
</div><div><div>I see there&#39;s now a PR to add these branches:</div><div=
><br></div><div>=C2=A0 <a href=3D"https://github.com/kernelci/kernelci-core=
-staging/pull/100">https://github.com/kernelci/kernelci-core-staging/pull/1=
00</a></div><div><br></div><div>I&#39;ve added a comment about the number o=
f builds, as at the moment</div><div>we can&#39;t easily configure to only =
check these branches every 24h</div><div>when all the other branches are be=
ing checked every hour.</div></div><div><br></div><div>Guillaume</div></div=
></div></div>

--0000000000008929170582b793d5--
