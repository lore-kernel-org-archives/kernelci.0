MIME-Version: 1.0
References: <CACT4Y+bt8r-1t7=sFtH75_Bj-xBdTTUkM-tZ=GEoy2B=rCYQOg@mail.gmail.com>
 <20190829121441.GD4118@sirena.co.uk>
In-Reply-To: <20190829121441.GD4118@sirena.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 30 Aug 2019 12:07:47 -0700
Message-ID: <CACT4Y+Zn-q=iAnLttLKSPVAg-u_4sGv4YxT4hfGc+N=UrMf6vw@mail.gmail.com>
Subject: Re: Some questions about KernelCI
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>

On Thu, Aug 29, 2019 at 5:14 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 28, 2019 at 02:03:22PM -0700,  via Groups.Io wrote:
>
> Just responding for me, this hasn't been reviewed by anyone else.

Hi Mark,

Thanks for providing info!
2 comments below.

> > 1. Do I understand it correctly that KernelCI is still mostly about
> > building/booting, it started running tests some time ago but few tests
> > are currently onboarded? Is there a full list of tests? I looked at
> > lava-kernel-tests repo, but on the dashboard I also seen "networking"
> > tests, so I am not sure if lava-kernel-tests is the full list. There
> > are plans to onboard more tests in the future, right?
>
> There's also some of the v4l tests running.  The plan is to get the UI
> working well and figure out what we're doing in terms of hardware to run
> things on before expanding testsuite coverage.  I'll let the people
> working on that provide more detail on how that's going.
>
> > 2. Are there test coverage reports anywhere? Is it in plans?
>
> There's some e-mail reports for tests which are sent to developers at
> the minute, the web UI is being looked at as well since as you've
> noticed it's currently not great.

I meant code coverage reports/stats, which show what's being tested
and what's not tested.


> > 3. Does KernelCI use any of KASAN, LOCKDEP, KMEMLEAK, FAULT_INJECTION,
> > DEBUG_OBJECTS, DEBUG_VM runtime debugging features?
>
> Not at the current time except in so far as they appear in defconfigs,
> we do talk about it sometimes - some of them would even be useful during
> boot testing - but we've had resource issues in the past with adding the
> extra configs.
>
> > 4. Do I understand it correctly that test failures are currently not
> > reported in any way (other than being shown on the dashboard)? Who
> > looks at the dashboard? Is there constant monitoring of all results?
> > Is automatic reporting in plans?
>
> The test support is pretty much in development at the moment, until
> we've got the infrastructure working well we're not really pushing on
> reporting things out too much.

This equally applies to build and boot testing too. If code does not
build, this needs to be reported. How does this happen?

> > 5. There is no pre-commit testing, right?
>
> Right.  It's a feature that gets talked about from time to time but
> nobody's stepped forward to implement it and we'd need to figure out
> resources to run the tests as well.
>
> > 6. What are the major TODO items for near/mid-term future?
>
> There's a bunch of issues in github:
>
>         https://github.com/kernelci
>
> but really a lot of it is about people scratching their own itches, for
> example I want to do some work on the e-mail build reports since they're
> not very usable right now but I've never got round to filing an issue
> for it.
>
> > 7. What is rough approximation of total engineer-years spent on the
> > project? What are the major time sinks? Pain points?
>
> Finger in the air I'd guess more than 8, possibly quite a bit - the
> project has been going for a bit over 5 years, we've had periods where
> there's been multiple people working on it pretty much full time but
> also periods where it's been mostly in maintanence mode.
>
> For me the biggest specific pain point right now is front end developers
> able to work on the UI.
