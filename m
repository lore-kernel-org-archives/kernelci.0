Return-Path: <dan.rue@linaro.org>
Date: Mon, 4 Mar 2019 09:30:01 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: Weekly Meeting 2019-03-04 #minutes
Message-ID: <20190304153001.zzpbeanpbgejcj25@xps.therub.org>
References: <1588C97FEBB21F35.22229@groups.io>
MIME-Version: 1.0
In-Reply-To: <1588C97FEBB21F35.22229@groups.io>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On Mon, Mar 04, 2019 at 09:00:19AM -0600, Dan Rue via Groups.Io wrote:
> - Attendees: Charles Oliveira, Guenter Roeck, Dan Rue, Mark Brown, Matt
>   Hart, Amro Hassan, Anders Roxell, Michal Galka, Daniel Díaz, Guillaume
>   Tucker, Alice Ferrazzi
> - Matt
>   - I will do the PR to move clang builds to production
>     - Will also move the google builders
>   - Using idle cpu time on builders to run randconfig builds
>     - Ask Arnd
> - Broonie
>   - rmk complaining it’s taking ~4 days to build his tree
>     - There was a massive backlog last week somehow
>     - Looks like it might’ve been to do with rolling out gtucker’s
>       changes, cleared now anyway.
> - Dan
>   - Adding x15’s and naming convention
>     - Linaro lab uses name ‘x15’ for board, not the dtb name. Won’t be
>       possible to rename boards in linaro lab.
>     - Lava supports aliases
>       - But do they work as expected?
>         - [drue]....no.

About this, there are a few options and I'm wondering which is
preferred by the kernelci community:

Option 1:
- I can set the name of my x15 in lab-drue to am57xx-beagle-x15 and then
  I can add it to kernelci once my lab is in production (it's in staging
  as of today)
  - Maybe eventually either lava or kernelci will be improved to be able
    to deal with alternative device names, at which time lkft's devices
    can be added

Option 2:
- I can add x15 to kernelci using the name 'x15', in which case the 11
  x15 devices[1] in the lkft lab would immediately become available

Opinions?

Thanks,
Dan

[1] https://lkft.validation.linaro.org/scheduler/device_type/x15

>     - There are two different boards named x15, and x15 can boot with
>       two different DTBs
>     - Will look at adding a naming convention page to kernelci wiki - i
>       guess i’ll post to mailing list first for review.
> - Daniel
>   - Working on a bisection shell script for lkft
>   - Interested in helping decouple the kernelci bisection from jenkins
>     and working together
>     - [guillaume] it’s not really coupled with jenkins right now, though
>       it is hard to use on the command line.
>     - Intel freedesktop folks have some advanced bisection tools too
>       https://gitlab.freedesktop.org/gfx-ci
> - Amro
>   - Just touching base on behalf of Charles on his PR for extra callback
>     to ES experimental. Any further holdoffs?
>     - https://github.com/kernelci/kernelci-core-staging/pull/68
> 
> 
> 

-- 
Linaro - Kernel Validation
