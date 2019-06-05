MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com> <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
In-Reply-To: <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 5 Jun 2019 14:01:13 +0100
Message-ID: <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: multipart/alternative; boundary="000000000000e1a347058a9331e2"
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

--000000000000e1a347058a9331e2
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Tue, Feb 26, 2019 at 3:15 PM Linus Walleij <linus.walleij@linaro.org>
wrote:

> On Mon, Feb 25, 2019 at 2:04 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> > On Fri, Feb 1, 2019 at 12:18 PM Linus Walleij <linus.walleij@linaro.org>
> wrote:
>
> >> The best would be that the tree be checked once per 24 hrs
> >> at my nighttime for if any changes done during the day.
> >> I think that would seldom amount to it running two days in
> >> a row except during intense times (merge window).
> >
> > I see there's now a PR to add these branches:
> >
> >   https://github.com/kernelci/kernelci-core-staging/pull/100
>
> Sweet!
>
> > I've added a comment about the number of builds, as at the moment
> > we can't easily configure to only check these branches every 24h
> > when all the other branches are being checked every hour.
>
> Fair enough, I don't think it will stress the system too much.
>

While there is still some headroom in the build capacity, it
seems worthwhile reviewing what each maintainer tree actually
needs to build.  Some maintainers need to have full coverage, but
often it's not necessary to build more than the defconfigs for
all the architectures.

By doing this, we can enable many more maintainer trees and also
reduce the turnaround time.

Could you please confirm which combinations of architectures,
defconfigs and fragments you need for each branch in your
linux-gpio tree?

Thanks,
Guillaume

--000000000000e1a347058a9331e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Linus,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 26, 2019 at 3:15 PM =
Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org">linus.walleij=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Feb 25, 2019 at 2:04 PM Guillaume Tucker<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Feb 1, 2019 at 12:18 PM Linus Walleij &lt;<a href=3D"mailto:li=
nus.walleij@linaro.org" target=3D"_blank">linus.walleij@linaro.org</a>&gt; =
wrote:<br>
<br>
&gt;&gt; The best would be that the tree be checked once per 24 hrs<br>
&gt;&gt; at my nighttime for if any changes done during the day.<br>
&gt;&gt; I think that would seldom amount to it running two days in<br>
&gt;&gt; a row except during intense times (merge window).<br>
&gt;<br>
&gt; I see there&#39;s now a PR to add these branches:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kernelci/kernelci-core-stagi=
ng/pull/100" rel=3D"noreferrer" target=3D"_blank">https://github.com/kernel=
ci/kernelci-core-staging/pull/100</a><br>
<br>
Sweet!<br>
<br>
&gt; I&#39;ve added a comment about the number of builds, as at the moment<=
br>
&gt; we can&#39;t easily configure to only check these branches every 24h<b=
r>
&gt; when all the other branches are being checked every hour.<br>
<br>
Fair enough, I don&#39;t think it will stress the system too much.<br></blo=
ckquote><div><br></div><div>While there is still some headroom in the build=
 capacity, it<br>seems worthwhile reviewing what each maintainer tree actua=
lly<br>needs to build.=C2=A0 Some maintainers need to have full coverage, b=
ut<br>often it&#39;s not necessary to build more than the defconfigs for<br=
>all the architectures.<br><br>By doing this, we can enable many more maint=
ainer trees and also<br>reduce the turnaround time.<br><br>Could you please=
 confirm which combinations of architectures,<br>defconfigs and fragments y=
ou need for each branch in your<br>linux-gpio tree?<br></div><div><br></div=
><div>Thanks,</div><div>Guillaume</div></div></div>

--000000000000e1a347058a9331e2--
