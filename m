Return-Path: <skhan@linuxfoundation.org>
Subject: Re: kselftest tree on kernelci.org
References: <5fd1a35c-f84e-1c6a-4a3a-be76dda97ca3@collabora.com>
 <ece6ea91-c44b-0bea-c4a2-ec099fa94881@linuxfoundation.org>
 <bc705b2c-b2d7-c80f-7020-ee52a2aeb061@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8813e862-c280-c6c6-abc5-b62b372ff34a@linuxfoundation.org>
Date: Thu, 3 Feb 2022 15:48:24 -0700
MIME-Version: 1.0
In-Reply-To: <bc705b2c-b2d7-c80f-7020-ee52a2aeb061@collabora.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>

On 2/3/22 11:19 AM, Guillaume Tucker wrote:
> On 02/02/2022 15:23, Shuah Khan wrote:
>> Hi Guillaume,
>>

> 
> I see these 4 branches (fixes, next, kunit, kunit-fixes) are all
> merged into linux-next.  So it seems like the best thing to do
> would be to cover them with a very lightweight number of builds and
> tests focused on what they are about: only run kselftest on the
> fixes and next branches, and only KUnit on kunit and kunit-fixes.
> At the moment, KUnit is not run by kernelci.org (coming soon) so I
> think we could just add the next branch for kselftest.  Then
> linux-next will be tested with maximum coverage anyway so if
> something subtle gets missed with the early tests it should get
> caught the following day at the latest with linux-next.
> 
>>> Many things could potentially be done with arbitrary builds and
>>> tests etc.  These are some initial suggestions.  How does this
>>> sound?
>>

Sounds good to me. The things that tend to break are:

- test builds at times due to seemingly innocuous changes to fix
   static analysis warnings. build test is good for catching these
-

>> Sounds great to me. Since selftest patches flow through various
>> subsystem trees, having kernelci keep an eye is great. This would
>> be another pair of eyes in addition to occasional tests I run and
>> Linaro (LKTP) monitoring next.
>>
>> How often do you send reports - I will watch out for them. Thanks
>> again for taking the initiative to add kselftest to kernelci.
> 
> Builds and tests are run every time a new revision is detected on
> the branches being monitored.  Then when they complete, a report
> is sent.  It can take a while, but with a small number of builds
> you could get results within an hour.  We could get the reports
> sent to the linux-kselftest mailing list and your own address if
> you want.
> 

Please send it to my email address as well.

> Also this configuration is all under source control on GitHub so
> feel free to make changes to it in the future as you see fit.
> 

Will do.

thanks,
-- Shuah

