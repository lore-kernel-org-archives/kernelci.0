Date: Wed, 31 Oct 2018 10:26:54 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: [kernelci] Bisection email recipients
Message-ID: <20181031102654.GC1761@sirena.org.uk>
References: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com>
 <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: kernelci@groups.io

--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:
> On 10/30/18 6:08 PM, Guillaume Tucker wrote:

> > * author of the commit
> > * committer
> > * Signed-off-by
> > * Acked-by
> > * Reported-by

I'd just include any e-mail address in the tags for the mail - tested-by
is definitely fair game (there's a decent chance they'll want to be
involved in testing further fixes), and it's a fairly common practice
for other kinds of reporting to just include everyone rather than
explicitly learning all the random tags different maintainers use.

> > * mailing list associated with the tree (like for test reports)
> > * maintainers of the parts of the code touched (using
> >    scripts/get_maintainer.pl and diff stat)

If you're using get_maintainer I'd make sure to use --nogit so that you
don't get false positives for people doing cleanup patches.  You can
probably just format the patch with git format-patch and then use
get_maintainer normally.

> > I also think it would be worth sending an email to the stable
> > mailing list, and probably also lkml to explain what we're doing
> > and warn people that we're turning this on.

Seems sensible.  It's a shame that we can't turn this on for -next yet,
but obviously the way that's built isn't super helpful.

> I think that regardless of how well it's working already, it could make
> sense to increase the list of recipients incrementally, starting with those
> most likely to appreciate the email, and growing towards those less likely.
> Maybe I'm being overly cautious, but from past experiences I don't think we
> want to risk too much antagonizing people.

> Once we have a feeling that the recipients in a stage are happy with getting
> the emails, we can expand to other recipients in the next stage.

> So, to illustrate the point, we could start with the author and
> kernel-build-reports@lists.linaro.org, then include ackers, reviewers,
> reporter and sobers, then mailing lists.

Not copying enough people can also cause issues as people will expect
other relevant people to be copied in and be annoyed about having to do
it themselves or possibly even just miss handling the report if they
expect someone has been CCed who hasn't - for example if we only send to
the patch author then maintainers might be annoyed if they later find
out there was a problem we didn't tell them about.  People will
definitely get annoyed about reports being off list because then the
discussion of the problem doesn't get archived for other people who
might benefit from it in future.

It is already common practice for people doing testing to copy fairly
widely so it shouldn't be that much of a surprise.

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvZg20ACgkQJNaLcl1U
h9BHxAf+PEEWtFaKWd0rcE7RHF4cwAmkDwPZM8b0N7yB52ABNHc1NmSkIzCTfGtj
Nmy0aXl3yTJbEhFJttfdZG5QkJe1bYvN/OOj9pF7WY4CKD78x9F00Ip4BwsrCx0z
pYAaT2Eto00oAPZvCR+egdduk92SiFI/yTVsdC3BwETkOJKyUNt5mDZqYaqhEmwm
+8i1y3EAuzX9ifwvbWSVcnp1vSL1qT9kCL8MhRn3swwi13vJDN/gE0SBzEbZelxR
7I72XILvX1fcVarwWz7n17NiGM82yZUC1rD7qi/e6m5GlPvN6qc1bsd6fLQtwcor
2l7bs3YjC6T9HisJWwTBE+GmoZXvuQ==
=z5cH
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
