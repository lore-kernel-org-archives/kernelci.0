Date: Thu, 17 Oct 2019 07:31:14 -0400 (EDT)
From: "Veronika Kabatova" <vkabatov@redhat.com>
Message-ID: <287771981.4310580.1571311874347.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191016235055.begiifweaxolgwih@willie-the-truck>
References: <20191015202114.GA120152@google.com> <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com> <20191016095636.GA4881@sirena.co.uk> <20191016123833.GG49619@arrakis.emea.arm.com> <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck> <456755903.4221278.1571246924706.JavaMail.zimbra@redhat.com> <20191016235055.begiifweaxolgwih@willie-the-truck>
Subject: Re: Branch for kernelci
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, will@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, tkjos@google.com



----- Original Message -----
> From: "Will Deacon" <will@kernel.org>
> To: "Veronika Kabatova" <vkabatov@redhat.com>
> Cc: kernelci@groups.io, "Mark Brown" <broonie@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
> tkjos@google.com
> Sent: Thursday, October 17, 2019 1:50:55 AM
> Subject: Re: Branch for kernelci
> 
> On Wed, Oct 16, 2019 at 01:28:44PM -0400, Veronika Kabatova wrote:
> > ----- Original Message -----
> > > From: "Will Deacon" <will@kernel.org>
> > > To: "Mark Brown" <broonie@kernel.org>
> > > Cc: "Catalin Marinas" <catalin.marinas@arm.com>, kernelci@groups.io,
> > > tkjos@google.com
> > > Sent: Wednesday, October 16, 2019 6:46:22 PM
> > > Subject: Re: Branch for kernelci
> > > 
> > > On Wed, Oct 16, 2019 at 01:54:16PM +0100, Mark Brown wrote:
> > > > On Wed, Oct 16, 2019 at 01:38:34PM +0100, Catalin Marinas wrote:
> > > > > On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:
> > > > 
> > > > > > Are you sure they are interested in this?  When asked previously
> > > > > > they
> > > > > > indicated that they didn't see any extra value in covering their
> > > > > > tree
> > > > > > specifically separately to -next.
> > > > 
> > > > > Will can comment on the reasoning but I guess it came as a request
> > > > > from
> > > > > him since he also created the arm64/for-kernelci branch. This might
> > > > > as
> > > > > well be the same as for-next/core but tested in isolation rather than
> > > > > with the whole linux-next tree.
> > > > 
> > > > Yeah, that was what you'd both rejected doing before which was why I
> > > > was
> > > > surprised (plus the fact that this was coming via Todd rather than one
> > > > of you).
> > > 
> > > I asked Todd about this yesterday because we're dealing with an ABI
> > > regression in 5.4 which wasn't picked up until -rc3, so figured that this
> > > was probably worth doing after all. Perhaps it wouldn't have helped for
> > > this
> > > specific case, but it turns out that one person's LTP isn't quite the
> > > same
> > > as another person's LTP!
> > > 
> > 
> > if you're mentioning the regression from this thread [0] you'd need to have
> > the tree added to CKI, not KernelCI. Not sure if we're ready to handle
> > mainline/next speed of development yet but we can discuss the specifics and
> > decide based on that. The issue/PR with details be submitted here [1].
> 
> Hopefully the two aren't mutually exclusive, so if you're able to add the
> branch to CKI as well then that would be great.
> 

Of course not. Is testing on aarch64 sufficient or do you need other
architectures too?

I submitted [0] the initial config, please check if the repo and email
information are correct or if we should add e.g. ARM list (didn't see
it in the initial email but checking just in case).


[0] https://gitlab.com/cki-project/pipeline-data/merge_requests/19/diffs


Veronika

> Will
> 
> 
> 
> 
