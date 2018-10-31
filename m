Return-Path: <khilman@baylibre.com>
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com> <7hin27fhkk.fsf@baylibre.com> <20181012163939.GD2340@sirena.org.uk> <7h5zy3fjo1.fsf@baylibre.com> <20181015132921.GB12949@sirena.org.uk> <CAP71WjywZ=iqwZCTEYB7XjhO=r+hXhVzzjiS+XjztgGrK9HOOg@mail.gmail.com> <20181015140536.GC12949@sirena.org.uk> <CAH1_8nC9er4UhA1m9MEHwiQ370uaUyr9BtMxoxcxJMuiiUa9Rw@mail.gmail.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
In-reply-to: <CAH1_8nC9er4UhA1m9MEHwiQ370uaUyr9BtMxoxcxJMuiiUa9Rw@mail.gmail.com>
Date: Tue, 30 Oct 2018 17:10:24 -0700
Message-ID: <7hsh0nt1qn.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, khilman@baylibre.com, anders.roxell@linaro.org


Guillaume Tucker writes:

> On Mon, Oct 15, 2018 at 3:05 PM Mark Brown <broonie@kernel.org> wrote:
>
>> On Mon, Oct 15, 2018 at 03:40:20PM +0200, Nicolas Dechesne wrote:
>> > On Mon, Oct 15, 2018 at 3:29 PM Mark Brown <broonie@kernel.org> wrote:
>> > > On Mon, Oct 15, 2018 at 03:01:34PM +0200, Kevin Hilman wrote:
>> > > > Mark Brown <broonie@kernel.org> writes:
>>
>> > > > Personally, I think we should first try the "allmodconfig +
>> > > > min_boot.config" approach.
>>
>> > > > If that works, would we still need all_abi.config?
>>
>
> Can we now drop the patch on staging which looks for the
> all_abi.config fragment?

Yes please.

Kevin

>
> https://github.com/kernelci/kernelci-core-staging/commit/7ee5f44800a5b20ae7f3af308e16ae1502a643f2
>
> Guillaume

