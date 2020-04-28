From: Peng Fan <peng.fan@nxp.com>
Subject: Re: next/master bisection: baseline.dmesg.alert on imx8mn-ddr4-evk
Date: Tue, 28 Apr 2020 05:54:18 +0000
Message-ID: 
 <DB6PR0402MB2760E36D267024A3C028630788AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <5ea44ff8.1c69fb81.f246c.d02d@mx.google.com>
 <8af4842d-d576-fd6f-ac6b-2ef3482742b7@collabora.com>
 <20200428041636.loakok7yfqg3hcsl@vireshk-i7>
In-Reply-To: <20200428041636.loakok7yfqg3hcsl@vireshk-i7>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Viresh Kumar <viresh.kumar@linaro.org>, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Subject: Re: next/master bisection: baseline.dmesg.alert on
> imx8mn-ddr4-evk
>=20
> On 27-04-20, 14:00, Guillaume Tucker wrote:
> > Please see the bisection report below about a boot failure.
> >
> > Reports aren't automatically sent to the public while we're trialing
> > new bisection features on kernelci.org but this one looks valid.
>=20
> @Peng: I have dropped your patch now, please resend it once you have fixe=
d
> the issue.

Sorry, I used an old base for the patch, the cpu_dev should be applied befo=
re
check cpu-supply property.

        if (!of_find_property(cpu_dev->of_node, "cpu-supply", NULL))
                return -ENODEV;

        cpu_dev =3D get_cpu_device(0);  --> put before the upper code.

I'll post new version.

Thanks,
Peng.

>=20
> --
> viresh
