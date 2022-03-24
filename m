Date: Thu, 24 Mar 2022 12:54:52 +0000
From: "Mark Brown" <broonie@kernel.org>
Subject: Re: FW: [EXT] Re: Fw: kernelci report issue
Message-ID: <YjxqHNXYPe6H6RK4@sirena.org.uk>
References: <AM6PR04MB4966F4DA3ECB2A26A30956E080230@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB6742157AD086BB2E4AA69684AB3E0@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <CAOi56cUuyYFSgoT1eS41PAV3H+8_7SJUApGtgKUvDD=6essTmA@mail.gmail.com>
 <AM6PR04MB6742E327C1C1B8F37EC72971AB3F0@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <VI1PR04MB4254637900797902C72EA771AB199@VI1PR04MB4254.eurprd04.prod.outlook.com>
 <AS1PR04MB940760E948EE73B1AA551BE1FE199@AS1PR04MB9407.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AS1PR04MB940760E948EE73B1AA551BE1FE199@AS1PR04MB9407.eurprd04.prod.outlook.com>
Content-Type: multipart/mixed; boundary="Groupsio=7DrHS9rSLTw4XT8NWuPH"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, srinivas.dubasi@nxp.com
Cc: Kevin Hilman <khilman@baylibre.com>

--Groupsio=7DrHS9rSLTw4XT8NWuPH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2022 at 10:57:50AM +0000, Srinivas Dubasi wrote:

> In general, do you trigger on all the boards available or on specific
> boards @ lab-nxp?

KernelCI will submit jobs for all boards that it knows about which it
has access to and knows about, it does need to have a configuration for
each device type.  There's no specific filter configured for the NXP
lab.

--Groupsio=7DrHS9rSLTw4XT8NWuPH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI8ahwACgkQJNaLcl1U
h9CfUAf9En5eQUzqO1nqWbAQOAfaDuSDiSZOZD+eAcSf/XtY6Dxk5NYMcfhHs25E
IW2EY6CzQA7PqhTV5G9T4LgmRJ0u1UUzKvLouBVC0m5B+KnaswxEyB69viCscBzb
w7N9BNofv0bH5L9eW11FRoL5p2QiiDuCwtq94BSm5AD1eQpP0AklLp2Eb+cLOqxi
6LXWF+ap5LLG5ukwoGPYS/D/TndOkVKj0vnY6c6qK8hIlTHIb0EdrrQZlP/8A0NF
y3UiWi42dr8CoR3XYZ1vHjQvtU5yDuswl2wBvjrmi+M2EATuUposY18y9jljIAGb
JST1NBEs2zEhcmUYoYM+hyyIKrdGhw==
=+oE5
-----END PGP SIGNATURE-----

--Groupsio=7DrHS9rSLTw4XT8NWuPH--
