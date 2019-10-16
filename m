Date: Wed, 16 Oct 2019 13:28:44 -0400 (EDT)
From: "Veronika Kabatova" <vkabatov@redhat.com>
Message-ID: <456755903.4221278.1571246924706.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191016164621.xa2nc6li2luiujug@willie-the-truck>
References: <20191015202114.GA120152@google.com> <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com> <20191016095636.GA4881@sirena.co.uk> <20191016123833.GG49619@arrakis.emea.arm.com> <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck>
Subject: Re: Branch for kernelci
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, will@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, tkjos@google.com



----- Original Message -----
> From: "Will Deacon" <will@kernel.org>
> To: "Mark Brown" <broonie@kernel.org>
> Cc: "Catalin Marinas" <catalin.marinas@arm.com>, kernelci@groups.io, tkjos@google.com
> Sent: Wednesday, October 16, 2019 6:46:22 PM
> Subject: Re: Branch for kernelci
> 
> On Wed, Oct 16, 2019 at 01:54:16PM +0100, Mark Brown wrote:
> > On Wed, Oct 16, 2019 at 01:38:34PM +0100, Catalin Marinas wrote:
> > > On Wed, Oct 16, 2019 at 10:56:36AM +0100, Mark Brown wrote:
> > 
> > > > Are you sure they are interested in this?  When asked previously they
> > > > indicated that they didn't see any extra value in covering their tree
> > > > specifically separately to -next.
> > 
> > > Will can comment on the reasoning but I guess it came as a request from
> > > him since he also created the arm64/for-kernelci branch. This might as
> > > well be the same as for-next/core but tested in isolation rather than
> > > with the whole linux-next tree.
> > 
> > Yeah, that was what you'd both rejected doing before which was why I was
> > surprised (plus the fact that this was coming via Todd rather than one
> > of you).
> 
> I asked Todd about this yesterday because we're dealing with an ABI
> regression in 5.4 which wasn't picked up until -rc3, so figured that this
> was probably worth doing after all. Perhaps it wouldn't have helped for this
> specific case, but it turns out that one person's LTP isn't quite the same
> as another person's LTP!
> 

Hi,

if you're mentioning the regression from this thread [0] you'd need to have
the tree added to CKI, not KernelCI. Not sure if we're ready to handle
mainline/next speed of development yet but we can discuss the specifics and
decide based on that. The issue/PR with details be submitted here [1].


We only enabled Sasha's stable-next branch two weeks ago and openposix tests
last week so we're definitely happy they are catching issues right away!

We are actively collaborating with KernelCI but right now the testing
systems, machine pools and testsuites are pretty much independent.

> So yes, I'm interested in having our for-kernelci branch picked up despite
> not seeing the benefit in the past.
> 

Glad to see the interest for CI!

Let me know if you have any questions,
Veronika


[0] https://lists.linaro.org/pipermail/linux-stable-mirror/2019-October/137969.html
[1] https://gitlab.com/cki-project/pipeline-data

> Thanks,
> 
> Will
> 
> 
> 
> 
