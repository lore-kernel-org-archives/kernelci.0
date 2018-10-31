MIME-Version: 1.0
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
 <7hin27fhkk.fsf@baylibre.com> <20181012163939.GD2340@sirena.org.uk>
 <7h5zy3fjo1.fsf@baylibre.com> <20181015132921.GB12949@sirena.org.uk>
 <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com>
 <20181015140536.GC12949@sirena.org.uk> <CAH1_8nC9er4UhA1m9MEHwiQ370uaUyr9BtMxoxcxJMuiiUa9Rw@mail.gmail.com>
 <7hsh0nt1qn.fsf@baylibre.com>
In-Reply-To: <7hsh0nt1qn.fsf@baylibre.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 31 Oct 2018 08:21:33 +0100
Message-ID: <CADYN=9K96m15bDSYrMdooX5-PubKBooUHNTnNtXvm=bHd46Jkw@mail.gmail.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: khilman@baylibre.com
Cc: guillaume.tucker@gmail.com, kernelci@groups.io

On Wed, 31 Oct 2018 at 01:10, Kevin Hilman <khilman@baylibre.com> wrote:
>
>
> Guillaume Tucker writes:
>
> > On Mon, Oct 15, 2018 at 3:05 PM Mark Brown <broonie@kernel.org> wrote:
> >
> >> On Mon, Oct 15, 2018 at 03:40:20PM +0200, Nicolas Dechesne wrote:
> >> > On Mon, Oct 15, 2018 at 3:29 PM Mark Brown <broonie@kernel.org> wrote:
> >> > > On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
> >> > > > Mark Brown <broonie@kernel.org> writes:
> >>
> >> > > > Personally, I think we should first try the "allmodconfig +
> >> > > > min_boot.config" approach.
> >>
> >> > > > If that works, would we still need all_abi.config?
> >>
> >
> > Can we now drop the patch on staging which looks for the
> > all_abi.config fragment?
>
> Yes please.

Yes, that make sense.

Anders
