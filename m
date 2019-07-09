MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
 <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
 <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
 <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com>
 <CAH1_8nAnOJE5vO9YNxbrWZfwbHgMa8ScSNahbpqmjqw-k9cbzA@mail.gmail.com> <CACRpkdb_mfh=14rAgMSWPg7FXokQyDfAzMaEzYTr-7xGnY1p5w@mail.gmail.com>
In-Reply-To: <CACRpkdb_mfh=14rAgMSWPg7FXokQyDfAzMaEzYTr-7xGnY1p5w@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 9 Jul 2019 13:44:17 +0100
Message-ID: <CAH1_8nBA6NgEixrfZfN5qhyoByXDXeJqMnmfiJ3HHBw=_hcVjA@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: multipart/alternative; boundary="000000000000e0d6a0058d3eeb37"
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

--000000000000e0d6a0058d3eeb37
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 12:27 PM Linus Walleij <linus.walleij@linaro.org>
wrote:

> On Tue, Jul 9, 2019 at 12:52 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
>
> > Sounds good, I've made a PR to only build the defconfig of each
> > arch, which amounts to 6 builds:
>
> Sounds good.


Great.

> Here are some results from a staging run with the devel branch:
> >
> >   https://staging.kernelci.org/job/linusw/branch/devel/
>
> This isn't working right now the page is full of error messages.
>

Oops, there was a broken change being tested there.  It should be
back on track now.


> > Also I've noticed there aren't any email reports associated with
> > your tree, so they just get sent to a default alias instead.
> > Maybe at least the linux-gpio list should be added?  Let me know
> > and I can add that to the PR.
>
> Yes linux-gpio@vger.kernel.org should probably be added.
>

OK I've added a path to the PR to add that, with just build and
boot reports for now.  I guess it would be useful to run some
GPIO tests at some point (libgpiod was mentioned earlier on this
thread), and then enable email reports for that.

Thanks,
Guillaume

--000000000000e0d6a0058d3eeb37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jul 9, 2019 at 12:27 PM Linus Wal=
leij &lt;<a href=3D"mailto:linus.walleij@linaro.org">linus.walleij@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Tue, Jul 9, 2019 at 12:52 PM Guillaume Tuck=
er<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Sounds good, I&#39;ve made a PR to only build the defconfig of each<br=
>
&gt; arch, which amounts to 6 builds:<br>
<br>
Sounds good.</blockquote><div><br></div><div>Great.=C2=A0</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Here are some results from a staging run with the devel branch:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://staging.kernelci.org/job/linusw/branch/=
devel/" rel=3D"noreferrer" target=3D"_blank">https://staging.kernelci.org/j=
ob/linusw/branch/devel/</a><br>
<br>
This isn&#39;t working right now the page is full of error messages.<br></b=
lockquote><div><br></div><div>Oops, there was a broken change being tested =
there.=C2=A0 It should be<br>back on track now.<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Also I&#39;ve noticed there aren&#39;t any email reports associated wi=
th<br>
&gt; your tree, so they just get sent to a default alias instead.<br>
&gt; Maybe at least the linux-gpio list should be added?=C2=A0 Let me know<=
br>
&gt; and I can add that to the PR.<br>
<br>
Yes <a href=3D"mailto:linux-gpio@vger.kernel.org" target=3D"_blank">linux-g=
pio@vger.kernel.org</a> should probably be added.<br></blockquote><div><br>=
</div><div>OK I&#39;ve added a path to the PR to add that, with just build =
and<br>boot reports for now.=C2=A0 I guess it would be useful to run some<b=
r>GPIO tests at some point (libgpiod was mentioned earlier on this<br>threa=
d), and then enable email reports for that.<br></div><div>=C2=A0<br>
</div><div>Thanks,</div><div>Guillaume</div></div></div>

--000000000000e0d6a0058d3eeb37--
