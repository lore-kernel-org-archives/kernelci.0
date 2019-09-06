Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Altera/Intel SOCFPGA Cyclone5 Boot testing.
In-Reply-To: <FE4710B543D3A5458E117AFC3393E1E33A5C0321@fmsmsx122.amr.corp.intel.com>
References: <FE4710B543D3A5458E117AFC3393E1E33A5BFE49@fmsmsx122.amr.corp.intel.com> <7hblvztyb1.fsf@baylibre.com> <FE4710B543D3A5458E117AFC3393E1E33A5C0321@fmsmsx122.amr.corp.intel.com>
Date: Fri, 06 Sep 2019 10:09:04 -0700
Message-ID: <7hr24tgxn3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: "Thayer, Thor" <thor.thayer@intel.com>, "kernelci@groups.io" <kernelci@groups.io>
Cc: Dinh Nguyen <dinguyen@kernel.org>, "Gong, Richard" <richard.gong@intel.com>

Great, if you have any issues don't hesitate to ask here on the list.

And based on what you mentioned earlier, it sounds like you might not
need to setup an entire kernelCI environment.  If you just want to add a
LAVA lab to the existing kernelCI set of labs, you probably just need
to setup the LAVA part.

If that's the case, you might want to have a look at lava-docker, where
we've abstracted a bit of the LAVA setup and containerized it for easy
setup/maintenance: https://github.com/kernelci/lava-docker

Hope that helps,

Thanks,

Kevin

"Thayer, Thor" <thor.thayer@intel.com> writes:

> Thank you, Kevin.
>
> Richard Gong attended and grabbed the slides for the KernelCI talk at the recent Embedded Linux Conference.
>
> He forwarded the slides to me and it looks like those slides describe how to setup the LAVA environment.
>
> Thanks,
>
> Thor
>
> -----Original Message-----
> From: Kevin Hilman <khilman@baylibre.com> 
> Sent: Wednesday, September 4, 2019 6:52 PM
> To: kernelci@groups.io; Thayer, Thor <thor.thayer@intel.com>; info@kernelci.org
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Subject: Re: Altera/Intel SOCFPGA Cyclone5 Boot testing.
>
> [ + Dinh Nguyen, socfpga maintainer ]
>
> "Thayer, Thor" <thor.thayer@intel.com> writes:
>
>> I'd like to run some boot tests with the Cyclone5 boards on your farm (socfpga_cyclone5_de0_sockit and socfpga_cyclone5_socrates).
>>
>> From the API, I think I need to get an authentication token for running tests.
>
> Unfortunately, it's a bit more complicated than that.  We're currently only doing boot testing for a fixed set of upstream-focused trees, including several maintainer trees, but we don't have an (easy) way for anyone to submit a tree/branch for testing.
>
> For platform-specific stuff, I would encourage you to work with the socpfga maintainer (cc'd) to setup an experimental `for-kernelci` branch which we could add to the list.  Then anytime that branch changes, we'll build it and run all our boot tests.
>
>> We'd like to add more of our boards to your farm if we can get approval.
>
> Right now, I think the only active socfpga board is the socfpga_cyclone5_de0_sockit (which is currently in my lab:
> lab-baylibre-seattle).  I'm not finding any (current) data for socfpga_cyclone5_socrates in the database.
>
> While there are existing labs that can potentially host more hardware, the best way to add more hardware is to host your own LAVA lab where you can host all the hardware you want.
>
> We can then add your lab to the list of labs we submit jobs to, but then that then allows you to use some of the same kernelCI tools/scripts to generate your own jobs for your own kernels as well.
>
> Kevin
