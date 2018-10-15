Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
	<7hin27fhkk.fsf@baylibre.com> <20181012163939.GD2340@sirena.org.uk>
Date: Mon, 15 Oct 2018 15:01:34 +0200
In-Reply-To: <20181012163939.GD2340@sirena.org.uk> (Mark Brown's message of
	"Fri, 12 Oct 2018 18:39:39 +0200")
Message-ID: <7h5zy3fjo1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, kernelci@groups.io

Mark Brown <broonie@kernel.org> writes:

> On Fri, Oct 12, 2018 at 02:57:47PM +0200, Kevin Hilman wrote:
>> Anders Roxell <anders.roxell@linaro.org> writes:
>
>> > Let me try to explain what the idea with this new fragment is about.  Adding a
>> > fragment called all_abi.config (lets stick with this name throughout this
>> > email) in kernel/configs would be to enable as much as possible. Then we would
>> > be able to run any test suite with one kernel image.
>
>> Thanks for clarifing.  To me, that doesn't sound like ABI, and
>> especially not *all* ABIs.  It's just a set of interfaces used by common
>> test suites.  IMO, using ABI is misleading, as when people see that,
>> they think of all the userspace/kernel interfaces.
>
> Right, so when we were discussing this internally the thinking was that
> we could meet the need for a config fragement that enabled interfaces
> for testsuites by enabling all the ABIs that the kernel offers.  This is
> a useful thing to do anyway I think and it provides a concrete rule for
> what to put in there which is easy to follow and avoids debate about
> some of the tuning options that people like to twiddle.  There was also
> some thought that we could have other config fragments like one to
> enable useful and cheap debug features which could be useful separately.
>
> I do agree that if it is just a "stuff people might want for testing"
> config then we shouldn't call it all_abi.
>
>> > 2. do allmodconfig and boot that, sadly that doesn't boot. I've tried to bisect
>> > the .config file and ended up with a pile of CONFIG_* options that has to be
>> > enabled/disabled so it booted. The idea was to add these options into the
>> > all_abi.config so we could do 'make allmodconfig all_abi.config'. There are
>> > different options that needs to be enabled/disabled between arm64 and x86
>> > (those are the architectures I've tried on so far).
>
>> Having this "minimal boot" defconfig sounds like a good thing to have
>> independently of the test fragments.
>
> Definitely.
>
>> IMO, per test-suite fragments make the most sense, and will much easier
>> to maintain than one big fragment.  It's also more self-documenting, and
>> test-suite maintainers might be more motivated to keep things up to
>> date.   With one massive fragment, it would have to be well documented
>> (and kept that way) to understand why various options are present, and
>> which test suites required them etc.
>
> The idea with having this all_abi config which literally only has things
> that are ABIs was to have a simple, clear rule about what goes in which
> doesn't need input from most testsuite maintainers or particularly
> reference any individual testsuites but will do what's needed for most
> of them.  If something's an ABI it should be enabled, if it's not an ABI
> then it should be in some other fragment.  That sidesteps the issues
> with documentation.

If it's focused on ABI, that sounds fine to me.   However...

> Per testsuite configs have the disadvantage that you've got to work with
> every single testsuite to add them (or maintain them separately) and
> deal with any churn in kernel config requirements as you move between
> kernels with new options or whatever somehow.  Some of the testsuites
> will doubtless still end up needing them but hopefully most won't.

I don't have any proof of this, but I suspect there will testsuites that
are testing things that are not formally ABI, and we'll end up with
per-testsuite defconfigs anyways, which may need to duplicate stuff in
all_abi.config (or specify they need to be combined with all_abi.config)

Personally, I think we should first try the "allmodconfig +
min_boot.config" approach.

If that works, would we still need all_abi.config?

Kevin

