From: "Thayer, Thor" <thor.thayer@intel.com>
Subject: Re: Altera/Intel SOCFPGA Cyclone5 Boot testing.
Date: Fri, 6 Sep 2019 01:46:12 +0000
Message-ID: <FE4710B543D3A5458E117AFC3393E1E33A5C0321@fmsmsx122.amr.corp.intel.com>
References: <FE4710B543D3A5458E117AFC3393E1E33A5BFE49@fmsmsx122.amr.corp.intel.com>
 <7hblvztyb1.fsf@baylibre.com>
In-Reply-To: <7hblvztyb1.fsf@baylibre.com>
MIME-Version: 1.0
Return-Path: thor.thayer@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, "kernelci@groups.io" <kernelci@groups.io>, "info@kernelci.org" <info@kernelci.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, "Gong, Richard" <richard.gong@intel.com>

Thank you, Kevin.

Richard Gong attended and grabbed the slides for the KernelCI talk at the r=
ecent Embedded Linux Conference.

He forwarded the slides to me and it looks like those slides describe how t=
o setup the LAVA environment.

Thanks,

Thor

-----Original Message-----
From: Kevin Hilman <khilman@baylibre.com>=20
Sent: Wednesday, September 4, 2019 6:52 PM
To: kernelci@groups.io; Thayer, Thor <thor.thayer@intel.com>; info@kernelci=
.org
Cc: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: Altera/Intel SOCFPGA Cyclone5 Boot testing.

[ + Dinh Nguyen, socfpga maintainer ]

"Thayer, Thor" <thor.thayer@intel.com> writes:

> I'd like to run some boot tests with the Cyclone5 boards on your farm (so=
cfpga_cyclone5_de0_sockit and socfpga_cyclone5_socrates).
>
> From the API, I think I need to get an authentication token for running t=
ests.

Unfortunately, it's a bit more complicated than that.  We're currently only=
 doing boot testing for a fixed set of upstream-focused trees, including se=
veral maintainer trees, but we don't have an (easy) way for anyone to submi=
t a tree/branch for testing.

For platform-specific stuff, I would encourage you to work with the socpfga=
 maintainer (cc'd) to setup an experimental `for-kernelci` branch which we =
could add to the list.  Then anytime that branch changes, we'll build it an=
d run all our boot tests.

> We'd like to add more of our boards to your farm if we can get approval.

Right now, I think the only active socfpga board is the socfpga_cyclone5_de=
0_sockit (which is currently in my lab:
lab-baylibre-seattle).  I'm not finding any (current) data for socfpga_cycl=
one5_socrates in the database.

While there are existing labs that can potentially host more hardware, the =
best way to add more hardware is to host your own LAVA lab where you can ho=
st all the hardware you want.

We can then add your lab to the list of labs we submit jobs to, but then th=
at then allows you to use some of the same kernelCI tools/scripts to genera=
te your own jobs for your own kernels as well.

Kevin
