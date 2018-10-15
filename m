MIME-Version: 1.0
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
 <7hin27fhkk.fsf@baylibre.com> <20181012163939.GD2340@sirena.org.uk>
 <7h5zy3fjo1.fsf@baylibre.com> <20181015132921.GB12949@sirena.org.uk>
In-Reply-To: <20181015132921.GB12949@sirena.org.uk>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 15 Oct 2018 15:40:20 +0200
Message-ID: <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Kevin Hilman <khilman@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>

On Mon, Oct 15, 2018 at 3:29 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
> > Mark Brown <broonie@kernel.org> writes:
>
> > > Per testsuite configs have the disadvantage that you've got to work with
> > > every single testsuite to add them (or maintain them separately) and
> > > deal with any churn in kernel config requirements as you move between
> > > kernels with new options or whatever somehow.  Some of the testsuites
> > > will doubtless still end up needing them but hopefully most won't.
>
> > I don't have any proof of this, but I suspect there will testsuites that
> > are testing things that are not formally ABI, and we'll end up with
> > per-testsuite defconfigs anyways, which may need to duplicate stuff in
> > all_abi.config (or specify they need to be combined with all_abi.config)
>
> Oh, there definitely are.
>
> > Personally, I think we should first try the "allmodconfig +
> > min_boot.config" approach.
>
> > If that works, would we still need all_abi.config?

how about making a new tree (in kernelci.org?) that contains "test"
config fragments and maintain them outside of linux master?
kernelci.org could decide which fragment to use for which 'build'. If
some fragments are good enough for mainline, then we might end up
trying to upstream them at some point. That would at least ensure that
everything is properly archived and reproducible. We can mimic what
AOSP is doing for their custom config fragments
(https://android.googlesource.com/kernel/configs/+/master).

>
> Possibly not, the concerns I guess would be size of the image (though we
> could probably arrange to not actually ship all the modules to all the
> boards if it was getting in the way) and if all the random debug options
> that allmodconfig turns on might be too disruptive (I'm not sure if we'd
> be able to turn them off with just a straight min_boot fragment, though
> you could extend merge_config).
>
> 
>
