MIME-Version: 1.0
References: <AM6PR04MB6742ECB366EF212E679DF213ABC70@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <478b4636-4d4b-f534-44fb-54e04703b250@collabora.com>
In-Reply-To: <478b4636-4d4b-f534-44fb-54e04703b250@collabora.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Mon, 14 Dec 2020 13:02:12 +0000
Message-ID: <CAJrz+7+=nKAw+EtVJD3Hf4rQOVGfZz3oe-X_xa=5zCBcABtPQg@mail.gmail.com>
Subject: Re: lab-nxp will be offline from 19 dec to 21 dec
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Suram Suram <suram@nxp.com>

On Mon, 14 Dec 2020 at 12:59, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 14/12/2020 10:52, Suram Suram wrote:
> > Hi,
> > lab-nxp will be offline from 19 Dec 2020 (0000HRS) to 21 Dec 2020(1159 HRS).
> > This is due to scheduled Annual Building Maintenance.
> >
> > An email notifcation  once the lab is UP and running.
> >
> > I request you to plan scheduling jobs accordingly.
>
> Thank you for the notice.  The kernelci.org pipeline first checks
> whether each lab is online, and if their device types are online

I'm not sure the latter is correct. I disabled thunderx in
lkft.validation.linaro.org and the jobs are still submitted.

milosz

> too, before scheduling any jobs.  So no configuration changes are
> required on this end, your lab will start receiving kernelci.org
> jobs automatically when it comes back online.
>
> Best wishes,
> Guillaume
>
>
> 
>
>
