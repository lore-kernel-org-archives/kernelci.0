Date: Thu, 17 Oct 2019 13:01:25 -0400 (EDT)
From: "Veronika Kabatova" <vkabatov@redhat.com>
Message-ID: <1783449691.4379913.1571331685575.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191017160242.qgp5y56gnbxnmkaa@willie-the-truck>
References: <20191015202114.GA120152@google.com> <20191016123833.GG49619@arrakis.emea.arm.com> <20191016125416.GA11371@sirena.co.uk> <20191016164621.xa2nc6li2luiujug@willie-the-truck> <456755903.4221278.1571246924706.JavaMail.zimbra@redhat.com> <20191016235055.begiifweaxolgwih@willie-the-truck> <287771981.4310580.1571311874347.JavaMail.zimbra@redhat.com> <20191017160242.qgp5y56gnbxnmkaa@willie-the-truck>
Subject: Re: Branch for kernelci
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Will Deacon <will@kernel.org>
Cc: kernelci@groups.io, Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, tkjos@google.com



----- Original Message -----
> From: "Will Deacon" <will@kernel.org>
> To: "Veronika Kabatova" <vkabatov@redhat.com>
> Cc: kernelci@groups.io, "Mark Brown" <broonie@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
> tkjos@google.com
> Sent: Thursday, October 17, 2019 6:02:43 PM
> Subject: Re: Branch for kernelci
> 
> Hi Veronika,
> 
> On Thu, Oct 17, 2019 at 07:31:14AM -0400, Veronika Kabatova wrote:
> > > On Wed, Oct 16, 2019 at 01:28:44PM -0400, Veronika Kabatova wrote:
> > > > > I asked Todd about this yesterday because we're dealing with an ABI
> > > > > regression in 5.4 which wasn't picked up until -rc3, so figured that
> > > > > this
> > > > > was probably worth doing after all. Perhaps it wouldn't have helped
> > > > > for
> > > > > this
> > > > > specific case, but it turns out that one person's LTP isn't quite the
> > > > > same
> > > > > as another person's LTP!
> > > > > 
> > > > 
> > > > if you're mentioning the regression from this thread [0] you'd need to
> > > > have
> > > > the tree added to CKI, not KernelCI. Not sure if we're ready to handle
> > > > mainline/next speed of development yet but we can discuss the specifics
> > > > and
> > > > decide based on that. The issue/PR with details be submitted here [1].
> > > 
> > > Hopefully the two aren't mutually exclusive, so if you're able to add the
> > > branch to CKI as well then that would be great.
> > > 
> > 
> > Of course not. Is testing on aarch64 sufficient or do you need other
> > architectures too?
> 
> Oh, good question! I suppose the two targets we care about the most are
> arm64 kernel with both arm64 and arm32 userspace.
> 

I think we only have arm64. Thanks for answer, I'll adjust the tree
config to only use aarch64 for now.

> > I submitted [0] the initial config, please check if the repo and email
> > information are correct or if we should add e.g. ARM list (didn't see
> > it in the initial email but checking just in case).
> 
> Brilliant, thanks very much. I hadn't considered adding the list, but I
> guess it doesn't hurt so please feel free to add
> linux-arm-kernel@lists.infradead.org as well.
> 

Will add!

> Curious: why 'olddefconfig' instead of 'defconfig'? Are there some options
> required by CKI that aren't present in defconfig?
> 

We're using Fedora config files with this option. I honestly don't know if
there are any tests depending on it, but we are trying to build kernels
close to the Fedora ones.


I'll get all the CKI configs in place and the first test run should start
soon after they are merged.


Veronika

> Will
> 
