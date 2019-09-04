Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Altera/Intel SOCFPGA Cyclone5 Boot testing.
In-Reply-To: <FE4710B543D3A5458E117AFC3393E1E33A5BFE49@fmsmsx122.amr.corp.intel.com>
References: <FE4710B543D3A5458E117AFC3393E1E33A5BFE49@fmsmsx122.amr.corp.intel.com>
Date: Wed, 04 Sep 2019 16:51:46 -0700
Message-ID: <7hblvztyb1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, thor.thayer@intel.com, "info@kernelci.org" <info@kernelci.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>

[ + Dinh Nguyen, socfpga maintainer ]

"Thayer, Thor" <thor.thayer@intel.com> writes:

> I'd like to run some boot tests with the Cyclone5 boards on your farm (socfpga_cyclone5_de0_sockit and socfpga_cyclone5_socrates).
>
> From the API, I think I need to get an authentication token for running tests.

Unfortunately, it's a bit more complicated than that.  We're currently
only doing boot testing for a fixed set of upstream-focused trees,
including several maintainer trees, but we don't have an (easy) way for
anyone to submit a tree/branch for testing.

For platform-specific stuff, I would encourage you to work with the
socpfga maintainer (cc'd) to setup an experimental `for-kernelci` branch
which we could add to the list.  Then anytime that branch changes, we'll
build it and run all our boot tests.

> We'd like to add more of our boards to your farm if we can get approval.

Right now, I think the only active socfpga board is the
socfpga_cyclone5_de0_sockit (which is currently in my lab:
lab-baylibre-seattle).  I'm not finding any (current) data for
socfpga_cyclone5_socrates in the database.

While there are existing labs that can potentially host more hardware,
the best way to add more hardware is to host your own LAVA lab where you
can host all the hardware you want.

We can then add your lab to the list of labs we submit jobs to, but then
that then allows you to use some of the same kernelCI tools/scripts to
generate your own jobs for your own kernels as well.

Kevin
