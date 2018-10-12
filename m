Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] add a new config fragment to kernel/configs
References: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
Date: Fri, 12 Oct 2018 14:57:47 +0200
In-Reply-To: <CADYN=9KyT05X_SUPNacmNEkgPi=6Ya9oQB9XRRHOMpAp=tkbgg@mail.gmail.com>
	(Anders Roxell's message of "Fri, 12 Oct 2018 11:28:30 +0200")
Message-ID: <7hin27fhkk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: kernelci@groups.io

Anders Roxell <anders.roxell@linaro.org> writes:

> I've seen some confusion about what I'm trying to do with all_abi.config (maybe
> not the best name, suggestions are more than welcome).  I should of course
> reach out before I started to do this to see if it makes sense to do in the
> first place, but forgot about it, sorry.
>
> Let me try to explain what the idea with this new fragment is about.  Adding a
> fragment called all_abi.config (lets stick with this name throughout this
> email) in kernel/configs would be to enable as much as possible. Then we would
> be able to run any test suite with one kernel image.

Thanks for clarifing.  To me, that doesn't sound like ABI, and
especially not *all* ABIs.  It's just a set of interfaces used by common
test suites.  IMO, using ABI is misleading, as when people see that,
they think of all the userspace/kernel interfaces.

> There have been two different paths I've tried:
> 1. add fragments that is needed for kselftest, LTP and libhugetlbfs to the
> all_abi.config to be able to have the same test coverage as we have today in
> LKFT.
>
> 2. do allmodconfig and boot that, sadly that doesn't boot. I've tried to bisect
> the .config file and ended up with a pile of CONFIG_* options that has to be
> enabled/disabled so it booted. The idea was to add these options into the
> all_abi.config so we could do 'make allmodconfig all_abi.config'. There are
> different options that needs to be enabled/disabled between arm64 and x86
> (those are the architectures I've tried on so far).

Having this "minimal boot" defconfig sounds like a good thing to have
independently of the test fragments.

> If we don't think its doable to enable everything into one big kernel, maybe we
> can split up the fragments into different testing fragments like:
> kselftest.config (that should essentially be todays kselftest-merge, but in a
> more visible way), ltp.config, libhugetlbfs.config and so on. The downside here
> would be that random test-suites need to send a patch with the fragments that
> they have to enable for their test suite.

IMO, per test-suite fragments make the most sense, and will much easier
to maintain than one big fragment.  It's also more self-documenting, and
test-suite maintainers might be more motivated to keep things up to
date.   With one massive fragment, it would have to be well documented
(and kept that way) to understand why various options are present, and
which test suites required them etc.

Kevin






