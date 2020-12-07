Subject: Re: RFC: dashboards, visualization and analytics for test results
From: "Chris Fiege" <cfi@pengutronix.de>
MIME-Version: 1.0
Date: Mon, 07 Dec 2020 03:26:18 -0800
References: <7hk0w2c4i3.fsf@baylibre.com>
In-Reply-To: <7hk0w2c4i3.fsf@baylibre.com>
Message-ID: <8699.1607340378432797045@groups.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io

Hey Kevin,

On Wed, Oct  7, 2020 at 10:47 AM, Kevin Hilman wrote:

>
> The KernelCI project is starting to look at what's next for dashboards,
> visualization and analytics for the various Linux focused testing
> projects.
>=20
> (...)
>=20
> So the next question is... how do we best use all of this data?
>=20
> To that end, we're starting to collect a set of user stories to help us
> brainstorm a new design for web based dashboard and analytics, and we'd
> like to hear from you.

for us at Pengutronix Kernel-CI has always been a good way to present our
Kernel maintenance / development activities to our customers.

We are currently missing a few of the old views. I'll try to describe our
use-cases in some short user stories. Feel free to ask for more details.

A customer tries to evaluate whether to use  mainline Linux or a vendor ke=
rnel:
  - View of list of all hardware / SoC currently tested in all labs
  - View job history on all devices with a specific hardware / SoC
  - View statistics of failing / passing Tests over time for a specific ha=
rdware / SoC.

A member of sales department uses the contribution to Kernel-CI as an indi=
cation
for our effort to maintain systems for a long time.
  - View a list of hardware / SoC in a specific lab.
  - Send a link to said list to a costumer.
  - View the status of hardware in a specific lab:
    Are jobs scheduled for a specific hardware?
  - View the history of jobs for a specific lab.


Regards,
Chris
