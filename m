Date: Thu, 17 Sep 2020 17:22:42 +0100
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: Contributing ARM tests results to KCIDB
Message-ID: <20200917162242.GA18067@e119603-lin.cambridge.arm.com>
References: <20200917125044.GA29636@e119603-lin.cambridge.arm.com>
 <a46c273f-cc69-6748-d74f-02f5034be999@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a46c273f-cc69-6748-d74f-02f5034be999@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, broonie@kernel.org, basil.eljuse@arm.com

On Thu, Sep 17, 2020 at 04:52:30PM +0300, Nikolai Kondrashov wrote:
> Hi Christian,
> 
> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> > Hi Nikolai,
> >
> > I work at ARM in the Kernel team and, in short, we'd like certainly to
> > contribute our internal Kernel test results to KCIDB.
> 
> Wonderful!
> 
> > After having attended your LPC2020 TestMC and KernelCI/BoF, I've now cooked
> > up some KCIDB JSON test report (seemingly valid against your KCIDB v3 schema)
> > and I'd like to start experimenting with kci-submit (on non-production
> > instances), so as to assess how to fit our results into your schema and maybe
> > contribute with some new KCIDB requirements if strictly needed.
> 
> Great, this is exactly what we need, welcome aboard :)
> 
> Please don't hesitate to reach out on kernelci@groups.io or on #kernelci on
> freenode.net, if you have any questions, problems, or requirements.
> 
> > Is it possible to get some valid credentials and a playground instance to
> > point at ?
> 
> Absolutely, I created credentials for you and sent them in a separate message.
> 
> You can use origin "arm" for the start, unless you have multiple CI systems
> and want to differentiate them somehow in your reports.
> 
> Nick
> 
 Thanks !

It works too ... :D 

https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=playground_kernelci04&var-id=arm:2020-07-07:d3d7689c2cc9503266cac3bc777bb4ddae2e5f2e

..quick question though....given that now I'll have to play quite a bit
with it and see how's better to present our data, if anythinjg missing etc etc,
is there any chance (or way) that if I submmit the same JSON report multiple
times with slight differences here and there (but with the same IDs clearly)
I'll get my DB updated in the bits I have changed: as an example I've just
resubmitted the same report with added discovery_time and descriptions, and got
NO errors, but I cannot see the changes in the UI (unless they have still to
propagate...)..or maybe I can obtain the same effect by dropping my dataset
before re-submitting ?

Regards

Thanks

Cristian

> On 9/17/20 3:50 PM, Cristian Marussi wrote:
> > Hi Nikolai,
> >
> > I work at ARM in the Kernel team and, in short, we'd like certainly to
> > contribute our internal Kernel test results to KCIDB.
> >
> > After having attended your LPC2020 TestMC and KernelCI/BoF, I've now cooked
> > up some KCIDB JSON test report (seemingly valid against your KCIDB v3 schema)
> > and I'd like to start experimenting with kci-submit (on non-production
> > instances), so as to assess how to fit our results into your schema and maybe
> > contribute with some new KCIDB requirements if strictly needed.
> >
> > Is it possible to get some valid credentials and a playground instance to
> > point at ?
> >
> > Thanks
> >
> > Regards
> >
> > Cristian
> >
> >
> > 
> >
> >
> 
