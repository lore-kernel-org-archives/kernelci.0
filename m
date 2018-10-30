MIME-Version: 1.0
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
 <7hin27fhkk.fsf@baylibre.com> <20181012163939.GD2340@sirena.org.uk>
 <7h5zy3fjo1.fsf@baylibre.com> <20181015132921.GB12949@sirena.org.uk>
 <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com> <20181015140536.GC12949@sirena.org.uk>
In-Reply-To: <20181015140536.GC12949@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 30 Oct 2018 17:21:04 +0000
Message-ID: <CAH1_8nC9er4UhA1m9MEHwiQ370uaUyr9BtMxoxcxJMuiiUa9Rw@mail.gmail.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
Content-Type: multipart/alternative; boundary="000000000000bdac2705797569c3"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: khilman@baylibre.com, anders.roxell@linaro.org

--000000000000bdac2705797569c3
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 3:05 PM Mark Brown <broonie@kernel.org> wrote:

> On Mon, Oct 15, 2018 at 03:40:20PM +0200, Nicolas Dechesne wrote:
> > On Mon, Oct 15, 2018 at 3:29 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
> > > > Mark Brown <broonie@kernel.org> writes:
>
> > > > Personally, I think we should first try the "allmodconfig +
> > > > min_boot.config" approach.
>
> > > > If that works, would we still need all_abi.config?
>

Can we now drop the patch on staging which looks for the
all_abi.config fragment?


https://github.com/kernelci/kernelci-core-staging/commit/7ee5f44800a5b20ae7f3af308e16ae1502a643f2

Guillaume

--000000000000bdac2705797569c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Mon, Oct 15, 2018 at 3:05 PM Mark Brown &lt;<a h=
ref=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Oct 15, 2018 at=
 03:40:20PM +0200, Nicolas Dechesne wrote:<br>
&gt; On Mon, Oct 15, 2018 at 3:29 PM Mark Brown &lt;<a href=3D"mailto:broon=
ie@kernel.org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:<br>
&gt; &gt; &gt; Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org" target=
=3D"_blank">broonie@kernel.org</a>&gt; writes:<br>
<br>
&gt; &gt; &gt; Personally, I think we should first try the &quot;allmodconf=
ig +<br>
&gt; &gt; &gt; min_boot.config&quot; approach.<br>
<br>
&gt; &gt; &gt; If that works, would we still need all_abi.config?<br></bloc=
kquote><div><br></div><div><div><div>Can we now drop the patch on staging w=
hich looks for the</div><div>all_abi.config fragment?</div></div><div><br><=
/div><div>=C2=A0 =C2=A0 <a href=3D"https://github.com/kernelci/kernelci-cor=
e-staging/commit/7ee5f44800a5b20ae7f3af308e16ae1502a643f2">https://github.c=
om/kernelci/kernelci-core-staging/commit/7ee5f44800a5b20ae7f3af308e16ae1502=
a643f2</a></div></div><div><br></div><div>Guillaume</div></div></div></div>=
</div>

--000000000000bdac2705797569c3--
