MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
 <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
 <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com> <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com>
In-Reply-To: <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 9 Jul 2019 11:51:55 +0100
Message-ID: <CAH1_8nAnOJE5vO9YNxbrWZfwbHgMa8ScSNahbpqmjqw-k9cbzA@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: multipart/alternative; boundary="000000000000fdbd29058d3d591f"
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

--000000000000fdbd29058d3d591f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 7, 2019 at 9:48 PM Linus Walleij <linus.walleij@linaro.org>
wrote:

> On Wed, Jun 5, 2019 at 3:01 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
>
> > While there is still some headroom in the build capacity, it
> > seems worthwhile reviewing what each maintainer tree actually
> > needs to build.  Some maintainers need to have full coverage, but
> > often it's not necessary to build more than the defconfigs for
> > all the architectures.
> >
> > By doing this, we can enable many more maintainer trees and also
> > reduce the turnaround time.
> >
> > Could you please confirm which combinations of architectures,
> > defconfigs and fragments you need for each branch in your
> > linux-gpio tree?
>
> I just need the defconfigs for sure, all architectures have GPIO
> except UML and S390 so these two can be skipped. Also any
> virtualization targets if there are such.
>

Sounds good, I've made a PR to only build the defconfig of each
arch, which amounts to 6 builds:

  https://github.com/kernelci/kernelci-core/pull/118

Here are some results from a staging run with the devel branch:

  https://staging.kernelci.org/job/linusw/branch/devel/

Can you please confirm these are the builds you need, for your 3
branches?

Also I've noticed there aren't any email reports associated with
your tree, so they just get sent to a default alias instead.
Maybe at least the linux-gpio list should be added?  Let me know
and I can add that to the PR.

Guillaume

--000000000000fdbd29058d3d591f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 7, 2019 at 9:48 PM Linus Wall=
eij &lt;<a href=3D"mailto:linus.walleij@linaro.org">linus.walleij@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Jun 5, 2019 at 3:01 PM Guillaume Tucker<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br>
<br>
&gt; While there is still some headroom in the build capacity, it<br>
&gt; seems worthwhile reviewing what each maintainer tree actually<br>
&gt; needs to build.=C2=A0 Some maintainers need to have full coverage, but=
<br>
&gt; often it&#39;s not necessary to build more than the defconfigs for<br>
&gt; all the architectures.<br>
&gt;<br>
&gt; By doing this, we can enable many more maintainer trees and also<br>
&gt; reduce the turnaround time.<br>
&gt;<br>
&gt; Could you please confirm which combinations of architectures,<br>
&gt; defconfigs and fragments you need for each branch in your<br>
&gt; linux-gpio tree?<br>
<br>
I just need the defconfigs for sure, all architectures have GPIO<br>
except UML and S390 so these two can be skipped. Also any<br>
virtualization targets if there are such.<br></blockquote><div><br></div>So=
unds good, I&#39;ve made a PR to only build the defconfig of each<br>arch, =
which amounts to 6 builds:<br><br>=C2=A0 <a href=3D"https://github.com/kern=
elci/kernelci-core/pull/118">https://github.com/kernelci/kernelci-core/pull=
/118</a><br><br>Here are some results from a staging run with the devel bra=
nch:</div><div class=3D"gmail_quote"><br>=C2=A0 <a href=3D"https://staging.=
kernelci.org/job/linusw/branch/devel/">https://staging.kernelci.org/job/lin=
usw/branch/devel/</a><br><br>Can you please confirm these are the builds yo=
u need, for your 3<br>branches?<br><br>Also I&#39;ve noticed there aren&#39=
;t any email reports associated with<br>your tree, so they just get sent to=
 a default alias instead.<br>Maybe at least the linux-gpio list should be a=
dded?=C2=A0 Let me know<br><div>and I can add that to the PR.</div><div><br=
></div><div>Guillaume=C2=A0</div></div></div>

--000000000000fdbd29058d3d591f--
