From: Srinivas Dubasi <srinivas.dubasi@nxp.com>
Subject: Re: FW: [EXT] Re: Fw: kernelci report issue
Date: Thu, 24 Mar 2022 12:58:15 +0000
Message-ID: 
 <AS1PR04MB940706E321AD64D1E3A25830FE199@AS1PR04MB9407.eurprd04.prod.outlook.com>
References: 
 <AM6PR04MB4966F4DA3ECB2A26A30956E080230@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB6742157AD086BB2E4AA69684AB3E0@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <CAOi56cUuyYFSgoT1eS41PAV3H+8_7SJUApGtgKUvDD=6essTmA@mail.gmail.com>
 <AM6PR04MB6742E327C1C1B8F37EC72971AB3F0@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <VI1PR04MB4254637900797902C72EA771AB199@VI1PR04MB4254.eurprd04.prod.outlook.com>
 <AS1PR04MB940760E948EE73B1AA551BE1FE199@AS1PR04MB9407.eurprd04.prod.outlook.com>
 <YjxqHNXYPe6H6RK4@sirena.org.uk>
In-Reply-To: <YjxqHNXYPe6H6RK4@sirena.org.uk>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>, "kernelci@groups.io" <kernelci@groups.io>
Cc: Kevin Hilman <khilman@baylibre.com>

Hi,

Thanks for the clarification.

Regards,
Srinivas

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Thursday, March 24, 2022 6:25 PM
To: kernelci@groups.io; Srinivas Dubasi <srinivas.dubasi@nxp.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Subject: Re: FW: [EXT] Re: Fw: kernelci report issue

On Thu, Mar 24, 2022 at 10:57:50AM +0000, Srinivas Dubasi wrote:

> In general, do you trigger on all the boards available or on specific=20
> boards @ lab-nxp?

KernelCI will submit jobs for all boards that it knows about which it has a=
ccess to and knows about, it does need to have a configuration for each dev=
ice type.  There's no specific filter configured for the NXP lab.
