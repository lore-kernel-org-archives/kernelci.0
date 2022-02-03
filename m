Message-ID: <bc705b2c-b2d7-c80f-7020-ee52a2aeb061@collabora.com>
Date: Thu, 3 Feb 2022 18:19:31 +0000
MIME-Version: 1.0
Subject: Re: kselftest tree on kernelci.org
References: <5fd1a35c-f84e-1c6a-4a3a-be76dda97ca3@collabora.com>
 <ece6ea91-c44b-0bea-c4a2-ec099fa94881@linuxfoundation.org>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <ece6ea91-c44b-0bea-c4a2-ec099fa94881@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Collabora Kernel ML <kernel@collabora.com>

On 02/02/2022 15:23, Shuah Khan wrote:
> Hi Guillaume,
>=20
> On 2/2/22 6:32 AM, Guillaume Tucker wrote:
>> Hi Shuah,
>>
>> I've made this PR to start monitoring the "fixes" branch from the
>> kselftest tree on kernelci.org:
>>
>> =C2=A0=C2=A0 https://github.com/kernelci/kernelci-core/pull/998
>>
>=20
> Thank you.

You're welcome.

>> While kselftest changes eventually land in linux-next, monitoring
>> your tree directly means we can test it earlier and potentially
>> enable more build variants or experimental tests.=C2=A0 Since
>> kernelci.org also builds and runs some kselftests we're regularly
>> finding issues and people are sending fixes for them.=C2=A0 See this
>> recent story for example:
>>
>> =C2=A0=C2=A0 https://twitter.com/kernelci/status/1488831497259921409
>>
>> Keeping an eye on kselftest patches with kernelci.org means we
>> can verify that fixes do what they're supposed to do with a much
>> larger test coverage than what individual developers can do.
>> We've been applying kselftest fixes on a branch managed by
>> kernelci.org to verify them in the past, but having the actual
>> kselftest tree part of the workflow would seem much better.
>>
>=20
> Absolutely.
>=20
>> There are several branches in your tree, while "fixes" seemed
>> like the most useful one to pick I see there is also a "kernelci"
>> branch too but it hasn't been updated for a while, reviving it
>> could give you the possibility to test patches through
>> kernelci.org before applying them on other branches that get
>> pulled into linux-next and mainline.
>>
>=20
> This branch was a topic branch specific for changes I made for
> kernelci runs to be cleaner - I should delete this.
>=20
> If you are looking for other branches to monitor in addition to
> "fixes" branch, the following are the ones to add:
>=20
> next (for the merge window), kunit (kunit changes slated for merge window=
),
> kunit-fixes

I see these 4 branches (fixes, next, kunit, kunit-fixes) are all
merged into linux-next.  So it seems like the best thing to do
would be to cover them with a very lightweight number of builds and
tests focused on what they are about: only run kselftest on the
fixes and next branches, and only KUnit on kunit and kunit-fixes.
At the moment, KUnit is not run by kernelci.org (coming soon) so I
think we could just add the next branch for kselftest.  Then
linux-next will be tested with maximum coverage anyway so if
something subtle gets missed with the early tests it should get
caught the following day at the latest with linux-next.

>> Many things could potentially be done with arbitrary builds and
>> tests etc.=C2=A0 These are some initial suggestions.=C2=A0 How does this
>> sound?
>=20
> Sounds great to me. Since selftest patches flow through various
> subsystem trees, having kernelci keep an eye is great. This would
> be another pair of eyes in addition to occasional tests I run and
> Linaro (LKTP) monitoring next.
>=20
> How often do you send reports - I will watch out for them. Thanks
> again for taking the initiative to add kselftest to kernelci.

Builds and tests are run every time a new revision is detected on
the branches being monitored.  Then when they complete, a report
is sent.  It can take a while, but with a small number of builds
you could get results within an hour.  We could get the reports
sent to the linux-kselftest mailing list and your own address if
you want.

Also this configuration is all under source control on GitHub so
feel free to make changes to it in the future as you see fit.

Best wishes,
Guillaume
