Date: Wed, 6 Mar 2019 17:00:38 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: Hourly, daily, weekly monitoring
Message-ID: <20190306170038.GC21220@sirena.org.uk>
References: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
 <20190305121412.GA7513@sirena.org.uk>
 <20190305220439.bzmsdtpd5gvrr3t6@xps.therub.org>
 <CAH1_8nAYcGBO61hsbe1-8tJpcBE5=QZ6XmLY81h7jhoVu9av4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nAYcGBO61hsbe1-8tJpcBE5=QZ6XmLY81h7jhoVu9av4g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Dan Rue <dan.rue@linaro.org>, kernelci@groups.io, Linus Walleij <linus.walleij@linaro.org>

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2019 at 09:16:18AM +0000, Guillaume Tucker wrote:
> On Tue, Mar 5, 2019 at 10:04 PM Dan Rue <dan.rue@linaro.org> wrote:
> > On Tue, Mar 05, 2019 at 12:14:12PM +0000, Mark Brown wrote:
> > > On Mon, Mar 04, 2019 at 01:20:25PM +0000, Guillaume Tucker wrote:

> > > One big concern I have with this is latency.  One of the common cases
> > > where people don't need builds all the time is when they're mainly
> > > looking for checks before they submit pull requests.  For those if you
> > > might have to wait almost a day before we even queue the build it might
> > > be a bit of an issue.  If it was just a "skip this tree if we built it
> > > in the past X time" check that wouldn't be such an issue, it's just if
> > > the daily check runs at some fixed time each day or whatever that it
> > > might add huge extra latency.

> These are different use-cases, some people have said that they
> wanted their branches checked every morning (linusw) or every
> Monday (media).  For real-time feedback, we need to do something
> quite different indeed.  With the ability to whitelist some
> defconfigs and arches, we could have quick builds for some
> maintainers' trees to optimise the turnaround time / test
> coverage ratio.

I don't know that we need super real time for most things (though I'm
sure some people would find it useful), more just that we don't want to
be adding huge delays in - it was the scenario where you miss your
single check for the day and add on a whole day of latency on that
worried me.  I think both Linus' case and the media case would be
handled fine by the skip built in last X time suggestion.

> What I think we should have is some kind of OOM system, to track
> that if the queue keeps increasing from one day to the next then
> some builds need to be killed, because there really isn't any
> choice in that situation.  We're still running at about 75% of
> our capacity and builds can be cancelled manually if anything
> goes very wrong, so it's not a practical concern right now.

Yeah, though we have been building up some very big backlogs which users
have been noticing (Google and rmk have both reported things recently).

> > This way, load is evened out a bit (no spikes when 'weekly' or even
> > 'hourly' runs), kernelci is more realtime (to Mark's point), and
> > configuration is granular and per-tree (we can still offer standard
> > cool-off periods, of course).

> The issue here is that it would be doing the opposite of what
> some people want.  For example, when a branch gets updated
> several times during a day, some developers don't want the first
> ones to be tested but rather let the system wait until the
> evening before doing a build so they get the results the next
> morning (see Linus' comment on the GPIO thread).

I'm not sure how many would mind intermediate results being generated,
some will though.

> > The only state that has to be tracked is the time of the last build per
> > tree, though I have no idea about the ease of implementation.

> The implementation will depend on a lot of things, i.e. the build
> automation tool (Jenkins or other) and the backend / storage
> server where previous builds are stored.  At the moment we're
> keeping a file containing the commit sha from last time a branch
> was sampled, it wouldn't be hard to add date and time information
> to that for example (or get the last modified date of that file).

Yes, that's what I was thinking - just add a check for the modification
time on (I'm doing that with some of my scripting for my upstream
handling, works pretty effectively).  Jenkins does feel like a bit of a
limitation sometimes with the simple FIFO queue it has.

> As mentioned before, in some cases we could be using a hook to
> trigger a build directly from the git server every time a commit
> is pushed (like a real CI system).  We should also have a way to
> define that in the YAML config, probably by not setting any
> polling interval.

My faith in the robustness of computers and the internet is such that
I'd suggest making it a separate config so that we can also have a
(fairly long) poll time and fall back to polling if the callback stops
working for some reason :/

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlx//LUACgkQJNaLcl1U
h9Atjwf+IbrqtxrPlnnGtUbuvzdi+McBog1t5LqlqijihM+kfGBhY479x54hpN/n
WiXcmHaxqNorNK/zUucJYiF1loFB0yhFfYBrNARTq8AnN9ejky7PWaTmVTNunYe6
JOMTBRoHPmVW+hOLG0EpJmpPbkU3spT5JIuLIrqlqPNcoGlVqKBl+wyiuuVuMWCu
zNM0+/QUn0aC1l80AGM70bZ7u11aQfE399cSdfakvz3ei+6ktKEugJSSi9CT+gnF
0ZskXrkc32yrdnZskyhS5Nq31u1ncbuYI/y9yZasiiIrRREgPQFBgAEylJKFL3hD
cGRAn1SS3RgN9RtKvvOLuTEaWykdMw==
=AXvy
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
