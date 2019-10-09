MIME-Version: 1.0
References: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com> <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
 <20191009142505.GE3929@sirena.co.uk> <0e8e25e6-872e-7639-fea8-b743bc9d9913@collabora.com>
 <20191009160600.GJ2036@sirena.org.uk>
In-Reply-To: <20191009160600.GJ2036@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 9 Oct 2019 17:35:27 +0100
Message-ID: <CAH1_8nDtdsJKkCeB-3rFth8+BGKMpS=jWydegCEPSM-tVX3z2Q@mail.gmail.com>
Subject: Re: kernelci/staging.kernelci.org baseline: 59 runs, 1 regressions (staging-20191009.1)
Content-Type: multipart/alternative; boundary="00000000000002526d05947ce096"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, mgalka@collabora.com, alexandra.pereira@collabora.com, Dan Rue <dan.rue@linaro.org>, Matt Hart <matthew.hart@linaro.org>, kernelci@baylibre.com, Anders Roxell <anders.roxell@linaro.org>

--00000000000002526d05947ce096
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 9, 2019 at 5:06 PM Mark Brown <broonie@kernel.org> wrote:

> On Wed, Oct 09, 2019 at 03:40:22PM +0100, Guillaume Tucker wrote:
>
> > Yes that's not new but it's not great either, it means 1 failure
> > among 5 tests.  I think we should rather have the number of
> > passes and total as that's more intuitive, and replace "errors"
> > with "results" in the column title.
>
> That's a good idea - switching it to passes rather than fails
> makes the existing display work I think.
>

OK, running on staging.kernelci.org with this PR now:
https://github.com/kernelci/kernelci-backend/pull/167

> Showing just the number of failures also works but because we
> > don't have a functional web frontend yet it's actually very
> > helpful to know how many tests were run, to see whether it's the
> > expected number.  We should definitely be able to revisit and
> > simplify things in these emails once we can refer to a web page
> > with all the details.
>
> Yeah, a useful web UI would mean there's a lot of opportunity to
> revisit these.
>

More on this topic soon hopefully, with AGL's fork
kernelci-frontend being ported upstream.

Guillaume

--00000000000002526d05947ce096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 9, 2019 at 5:06 PM Mark Brown=
 &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, Oct 09, 2019 at 03:40:22PM +0100, Guillaume Tucker wro=
te:<br>
<br>
&gt; Yes that&#39;s not new but it&#39;s not great either, it means 1 failu=
re<br>
&gt; among 5 tests.=C2=A0 I think we should rather have the number of<br>
&gt; passes and total as that&#39;s more intuitive, and replace &quot;error=
s&quot;<br>
&gt; with &quot;results&quot; in the column title.<br>
<br>
That&#39;s a good idea - switching it to passes rather than fails<br>
makes the existing display work I think.<br></blockquote><div><br></div><di=
v>OK, running on <a href=3D"http://staging.kernelci.org">staging.kernelci.o=
rg</a> with this PR now:</div><div><a href=3D"https://github.com/kernelci/k=
ernelci-backend/pull/167">https://github.com/kernelci/kernelci-backend/pull=
/167</a>=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; Showing just the number of failures also works but because we<br>
&gt; don&#39;t have a functional web frontend yet it&#39;s actually very<br=
>
&gt; helpful to know how many tests were run, to see whether it&#39;s the<b=
r>
&gt; expected number.=C2=A0 We should definitely be able to revisit and<br>
&gt; simplify things in these emails once we can refer to a web page<br>
&gt; with all the details.<br>
<br>
Yeah, a useful web UI would mean there&#39;s a lot of opportunity to<br>
revisit these.<br></blockquote><div><br></div><div>More on this topic soon =
hopefully, with AGL&#39;s fork<br>kernelci-frontend being ported upstream.<=
br></div><div><br></div><div>Guillaume=C2=A0</div></div></div>

--00000000000002526d05947ce096--
