MIME-Version: 1.0
References: <e32f672f-da87-7f89-c9b3-93a0a56aaad0@collabora.com>
 <df8ef2bb-b351-2003-5a1c-030a056d1d63@collabora.com> <CAFqH_500cnVrgknz5e7=QmH99KfBihLMNA2hee92jmVvQ4_XKw@mail.gmail.com>
 <142fbd32-4872-360e-89d2-3ca540df416e@collabora.com>
In-Reply-To: <142fbd32-4872-360e-89d2-3ca540df416e@collabora.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 12 Feb 2019 13:41:10 +0000
Message-ID: <CAH1_8nC=z=EBQCL5Hitwb_w6fo8QgEWVfxRTQdYiw8SNcGEJHw@mail.gmail.com>
Subject: Re: Baseline test plan and bootrr
Content-Type: multipart/alternative; boundary="00000000000099fe140581b29496"
List-ID: <kernelci.groups.io>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, kernelci@groups.io, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Anibal Limon <anibal.limon@linaro.org>, nicolas.dechesne@linaro.org, bjorn.andersson@linaro.org

--00000000000099fe140581b29496
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 12, 2019 at 6:52 AM Tomeu Vizoso <tomeu.vizoso@collabora.com>
wrote:

> I think I would personally just keep adding test suites, which of course
> would fail if the target device isn't present. This should also catch
> bugs that caused a dependency to fail probing (clocks, regulators,
> pinmux, etc).
>

Sure, we need to do that as well.  The idea here was to make an
improved boot test plan (I called it "baseline") to do quick
checks that can help detect if anything obvious went wrong during
boot, something we can run on all the devices ultimately instead
of the current boot-to-login test.

Guillaume

--00000000000099fe140581b29496
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Feb 12, 2019 at 6:52 AM Tomeu Viz=
oso &lt;<a href=3D"mailto:tomeu.vizoso@collabora.com">tomeu.vizoso@collabor=
a.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
I think I would personally just keep adding test suites, which of course <b=
r>
would fail if the target device isn&#39;t present. This should also catch <=
br>
bugs that caused a dependency to fail probing (clocks, regulators, <br>
pinmux, etc).<br></blockquote><div>=C2=A0</div><div><div>Sure, we need to d=
o that as well.=C2=A0 The idea here was to make an</div><div>improved boot =
test plan (I called it &quot;baseline&quot;) to do quick</div><div>checks t=
hat can help detect if anything obvious went wrong during</div><div>boot, s=
omething we can run on all the devices ultimately instead</div><div>of the =
current boot-to-login test.</div></div><div><br></div><div>Guillaume</div><=
/div></div></div>

--00000000000099fe140581b29496--
