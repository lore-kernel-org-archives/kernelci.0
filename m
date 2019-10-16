Date: Wed, 16 Oct 2019 13:38:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Branch for kernelci
Message-ID: <20191016123833.GG49619@arrakis.emea.arm.com>
References: <20191015202114.GA120152@google.com>
 <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk>
MIME-Version: 1.0
In-Reply-To: <20191016095636.GA4881@sirena.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, tkjos@google.com, will@kernel.org

On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:
> On Tue, Oct 15, 2019 at 01:52:36PM -0700, Todd Kjos via Groups.Io wrote:
> > Please add testing for Will Deacon's ARM64 staging tree to kernelci:
> 
> > [web] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-kernelci
> > [git] git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> 
> > It would make sense to have dashboard available as "arm64" or some
> > other unique tree name (eg "https://kernelci.org/job/arm64").
> 
> > The owners of this tree are the ARM64 maintainers: will@kernel.org and
> > catalin.marinas@arm.com (CC'd)
> 
> Are you sure they are interested in this?  When asked previously they
> indicated that they didn't see any extra value in covering their tree
> specifically separately to -next.

Will can comment on the reasoning but I guess it came as a request from
him since he also created the arm64/for-kernelci branch. This might as
well be the same as for-next/core but tested in isolation rather than
with the whole linux-next tree.

-- 
Catalin
