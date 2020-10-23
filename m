Subject: Re: User Interface issues with kernelci.org
References: <AM6PR04MB67426851DFCCD4CF3F5F62A8AB3F0@AM6PR04MB6742.eurprd04.prod.outlook.com>
 <2cdb32bb-ee58-0ed6-b236-d6b5e8314909@collabora.com>
 <AM6PR04MB4966A8E1F2B5FAA3DB8A0ED380380@AM6PR04MB4966.eurprd04.prod.outlook.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <533922c4-7f73-76c1-4729-4e22949df9af@collabora.com>
Date: Fri, 23 Oct 2020 14:15:32 +0100
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB4966A8E1F2B5FAA3DB8A0ED380380@AM6PR04MB4966.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, aisheng.dong@nxp.com, Suram Suram <suram@nxp.com>

On 23/09/2020 08:14, Aisheng Dong wrote:
>> From: Guillaume Tucker <guillaume.tucker@collabora.com>
>> Sent: Wednesday, September 23, 2020 2:21 PM
>> On 18/09/2020 10:26, Suram Suram wrote:
>>> Hi,
>>>
>>> When investigating some i.MX Upstream kernel boot failures, our engine=
ers
>> have observed some issues with the User Interface.
>>>
>>> Following are the details of the issue.=C2=A0 Requesting your help in =
improving the
>> user interface.
>>>
>>>
>>> i.MX Local Upstream daily test reported some upstream kernel boot fail=
ures.
>>>
>>> I checked with kernelci has the same issue. However, the kernelci repo=
rt seems
>> not to be that clear.
>>>
>>>
>>>
>>> From the log below, you can see MX6Q Sabresd board boot hanged and res=
ult
>> is =E2=80=9CFAIL=E2=80=9D
>>>
>>> Boot log: imx6q-sabresd
>>>
>>> Warnings: 0
>>>
>>> Kernel Warnings: 0
>>>
>>> Errors: 0
>>>
>>> Boot result: FAIL
>>>
>>> Kernel Errors: 0
>>>
>>>
>>>
>>> But from the the kernelci main page below, it didn=E2=80=99t show thos=
e failures.
>>>
>>> I guess they were categorized as =E2=80=98Unknown=E2=80=99 issues. How=
ever, even those
>>> failures were marked as =E2=80=9CUnknown=E2=80=9D issues, another prob=
lem is that
>>> users has no way to
>>>
>>> Quickly filter out those =E2=80=98Unknown=E2=80=99 issues because the =
=
=E2=80=98Unknown=E2=80=99 button is
>> grey.
>>>
>>> Can you help check those two issues and report to kernelci if it can b=
e
>> improved?
>>>
>>>
>>
>> Yes, this is a known issue with the web dashboard.  Currently, it shows=
 the
>> following status:
>>
>> * pass: test case passed
>> * regression: test case used to pass and started failing
>> * unknown: test case has always failed, or was skipped
>>
>> So the "unknown" status is confusing, as you've found. For some reason,=
 this
>> was not spotted as an issue when first deploying the updated user inter=
face to
>> show test results.  It's now being worked on to have 4 status:
>>
>> * pass: test case passed
>> * fail: test case has always failed
>> * regression: test case used to pass and started failing
>> * unknown: test case was skipped or not run for some reason
>>
>> This is the pull request implementing the changes described
>> above:
> ...
>>
>>
>>
>> The work-in-progress version of this can be seen on:
> ...
>>
>> The pie charts haven't been updated yet, and there may be a few small c=
orner
>> cases too.  This should all get resolved this week and deployed in prod=
uction
>> next week, but please feel free to let us know if it doesn't fix the is=
sue you've
>> found.
>=20
> Good to know the progress.
> Thanks a lot for the feedback.

This has now been fixed, for example see the latest results for
linux-next:

  https://kernelci.org/test/job/next/branch/master/kernel/next-20201023/pl=
an/baseline/

There were a few failures in lab-nxp, and they're listed
as "failures".  Test cases that used to pass and started failing
are listed as "regressions", and tests that were not run or have
no clear pass/fail status are listed as "unknown".

Meanwhile, there are some known performance issues with the SoC
views.  It was improved in yesterday's update but it appears that
some views are still slow to load.  We'll be working on fixing
that very shortly, sorry for the inconvenience.

Best wishes,
Guillaume
