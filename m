Subject: Re: User Interface issues with kernelci.org
References: <AM6PR04MB67426851DFCCD4CF3F5F62A8AB3F0@AM6PR04MB6742.eurprd04.prod.outlook.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <2cdb32bb-ee58-0ed6-b236-d6b5e8314909@collabora.com>
Date: Wed, 23 Sep 2020 07:21:27 +0100
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB67426851DFCCD4CF3F5F62A8AB3F0@AM6PR04MB6742.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: suram@nxp.com
Cc: kernelci@groups.io, Aisheng Dong <aisheng.dong@nxp.com>

On 18/09/2020 10:26, Suram Suram wrote:
> Hi,
>=20
> When investigating some i.MX Upstream kernel boot failures, our engineer=
s have observed some issues with the User Interface.
>=20
> Following are the details of the issue.=A0 Requesting your help in impro=
ving the user interface.
>=20
>=20
> i.MX Local Upstream daily test reported some upstream kernel boot failur=
es.
>=20
> I checked with kernelci has the same issue. However, the kernelci report=
 seems not to be that clear.
>=20
> =A0
>=20
> From the log below, you can see MX6Q Sabresd board boot hanged and resul=
t is =93FAIL=94
>=20
> https://storage.kernelci.org/next/master/next-20200911/arm/imx_v6_v7_def=
config/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
>=20
> Boot log: imx6q-sabresd
>=20
> Warnings: 0
>=20
> Kernel Warnings: 0
>=20
> Errors: 0
>=20
> Boot result: FAIL
>=20
> Kernel Errors: 0
>=20
> =A0
>=20
> But from the the kernelci main page below, it didn=92t show those failur=
es.
>=20
> I guess they were categorized as =91Unknown=92 issues. However, even tho=
se failures were marked as =93Unknown=94 issues, another problem is that us=
ers has no way to
>=20
> Quickly filter out those =91Unknown=92 issues because the =91Unknown=92 =
button is grey.
>=20
> Can you help check those two issues and report to kernelci if it can be =
improved?
>=20
> =A0
>=20
> https://kernelci.org/soc/imx/job/next/kernel/next-20200911/plan/baseline=
/

Yes, this is a known issue with the web dashboard.  Currently, it
shows the following status:

* pass: test case passed
* regression: test case used to pass and started failing
* unknown: test case has always failed, or was skipped

So the "unknown" status is confusing, as you've found. For some
reason, this was not spotted as an issue when first deploying the
updated user interface to show test results.  It's now being
worked on to have 4 status:

* pass: test case passed
* fail: test case has always failed
* regression: test case used to pass and started failing
* unknown: test case was skipped or not run for some reason

This is the pull request implementing the changes described
above:

  https://github.com/kernelci/kernelci-frontend/pull/125

The work-in-progress version of this can be seen on:

  https://staging.kernelci.org

The pie charts haven't been updated yet, and there may be a few
small corner cases too.  This should all get resolved this week
and deployed in production next week, but please feel free to let
us know if it doesn't fix the issue you've found.

Best wishes,
Guillaume
