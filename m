MIME-Version: 1.0
References: <AM6PR04MB6742ECB366EF212E679DF213ABC70@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <478b4636-4d4b-f534-44fb-54e04703b250@collabora.com> <CAJrz+7+=nKAw+EtVJD3Hf4rQOVGfZz3oe-X_xa=5zCBcABtPQg@mail.gmail.com>
 <2c130328-41b6-0e3f-d128-3a31618f17de@collabora.com>
In-Reply-To: <2c130328-41b6-0e3f-d128-3a31618f17de@collabora.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Mon, 14 Dec 2020 14:04:26 +0000
Message-ID: <CAJrz+7K5RN_pv8ETzevSLMSjO9xK+gX1=FBPZESQx47DEZ0DvA@mail.gmail.com>
Subject: Re: lab-nxp will be offline from 19 dec to 21 dec
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Suram Suram <suram@nxp.com>

On Mon, 14 Dec 2020 at 13:34, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 14/12/2020 13:02, Milosz Wasilewski wrote:
> > On Mon, 14 Dec 2020 at 12:59, Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >>
> >> On 14/12/2020 10:52, Suram Suram wrote:
> >>> Hi,
> >>> lab-nxp will be offline from 19 Dec 2020 (0000HRS) to 21 Dec 2020(1159 HRS).
> >>> This is due to scheduled Annual Building Maintenance.
> >>>
> >>> An email notifcation  once the lab is UP and running.
> >>>
> >>> I request you to plan scheduling jobs accordingly.
> >>
> >> Thank you for the notice.  The kernelci.org pipeline first checks
> >> whether each lab is online, and if their device types are online
> >
> > I'm not sure the latter is correct. I disabled thunderx in
> > lkft.validation.linaro.org and the jobs are still submitted.
>
> There seems to have been only one ThunderX device in LKFT's lab,
> and you retired it on 2nd December:
>
>   https://lkft.validation.linaro.org/scheduler/device/thx2-01#device_log_
>
> The last kernelci.org jobs were submitted on 2nd December, up to
> the point when it was retired:
>
>   https://lkft.validation.linaro.org/scheduler/queue?length=25&search=thunderx#table
>
> Maybe jobs should have stopped getting scheduled earlier if the
> device was not working, but I don't know about that.  If it was
> the case then please report an issue in the kernelci-core project
> on GitHub.  In any case, they have definitely stopped now.

Thanks Guillaume!
I can see the number isn't growing any more. Maybe I looked too early.

milosz

>
> Best wishes,
> Guillaume
