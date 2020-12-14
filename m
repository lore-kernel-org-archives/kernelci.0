Subject: Re: lab-nxp will be offline from 19 dec to 21 dec
References: <AM6PR04MB6742ECB366EF212E679DF213ABC70@AM6PR04MB6742.eurprd04.prod.outlook.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <478b4636-4d4b-f534-44fb-54e04703b250@collabora.com>
Date: Mon, 14 Dec 2020 12:59:06 +0000
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB6742ECB366EF212E679DF213ABC70@AM6PR04MB6742.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Suram Suram <suram@nxp.com>, "kernelci@groups.io" <kernelci@groups.io>

On 14/12/2020 10:52, Suram Suram wrote:
> Hi,
> lab-nxp will be offline from 19 Dec 2020 (0000HRS) to 21 Dec 2020(1159 H=
RS).
> This is due to scheduled Annual Building Maintenance.
>=20
> An email notifcation=A0 once the lab is UP and running.
>=20
> I request you to plan scheduling jobs accordingly.

Thank you for the notice.  The kernelci.org pipeline first checks
whether each lab is online, and if their device types are online
too, before scheduling any jobs.  So no configuration changes are
required on this end, your lab will start receiving kernelci.org
jobs automatically when it comes back online.

Best wishes,
Guillaume
