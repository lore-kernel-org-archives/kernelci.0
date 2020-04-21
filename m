Return-Path: <dan.rue@linaro.org>
Date: Tue, 21 Apr 2020 12:32:51 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: kci_build proposal
Message-ID: <20200421173251.bhdnx6hil4mwjgqw@xps.therub.org>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
 <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
 <20200421155359.GD4540@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200421155359.GD4540@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, guillaume.tucker@gmail.com

On Tue, Apr 21, 2020 at 04:53:59PM +0100, Mark Brown wrote:
> On Tue, Apr 21, 2020 at 04:46:34PM +0100, Guillaume Tucker wrote:
> > On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:
> 
> > > I've been working on a kernel building service/api that's designed to
> > > perform
> > > massive numbers of builds. The actual kernel build implementation reuses
> > > kernelci's kci_build script.
> 
> > Out of interest, how do you manage the builders?
> 
> > We're looking into Kubernetes now so we might find issues similar
> > to those in your use-case.
> 
> Indeed if the tool that you're working on is free software (I'm guessing
> it might be if it's for Linaro?) then it might make sense to just deploy
> a copy of that software rather than developing something similar.

Hi Mark -

The cloud orchestration stuff isn't public at this point, but it is
available as a service for interested parties.

Thanks,
Dan

-- 
Linaro LKFT
https://lkft.linaro.org
