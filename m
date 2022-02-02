Return-Path: <skhan@linuxfoundation.org>
Subject: Re: kselftest tree on kernelci.org
References: <5fd1a35c-f84e-1c6a-4a3a-be76dda97ca3@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ece6ea91-c44b-0bea-c4a2-ec099fa94881@linuxfoundation.org>
Date: Wed, 2 Feb 2022 08:23:27 -0700
MIME-Version: 1.0
In-Reply-To: <5fd1a35c-f84e-1c6a-4a3a-be76dda97ca3@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>

Hi Guillaume,

On 2/2/22 6:32 AM, Guillaume Tucker wrote:
> Hi Shuah,
> 
> I've made this PR to start monitoring the "fixes" branch from the
> kselftest tree on kernelci.org:
> 
>    https://github.com/kernelci/kernelci-core/pull/998
> 

Thank you.

> While kselftest changes eventually land in linux-next, monitoring
> your tree directly means we can test it earlier and potentially
> enable more build variants or experimental tests.  Since
> kernelci.org also builds and runs some kselftests we're regularly
> finding issues and people are sending fixes for them.  See this
> recent story for example:
> 
>    https://twitter.com/kernelci/status/1488831497259921409
> 
> Keeping an eye on kselftest patches with kernelci.org means we
> can verify that fixes do what they're supposed to do with a much
> larger test coverage than what individual developers can do.
> We've been applying kselftest fixes on a branch managed by
> kernelci.org to verify them in the past, but having the actual
> kselftest tree part of the workflow would seem much better.
> 

Absolutely.

> There are several branches in your tree, while "fixes" seemed
> like the most useful one to pick I see there is also a "kernelci"
> branch too but it hasn't been updated for a while, reviving it
> could give you the possibility to test patches through
> kernelci.org before applying them on other branches that get
> pulled into linux-next and mainline.
> 

This branch was a topic branch specific for changes I made for
kernelci runs to be cleaner - I should delete this.

If you are looking for other branches to monitor in addition to
"fixes" branch, the following are the ones to add:

next (for the merge window), kunit (kunit changes slated for merge window),
kunit-fixes

> Many things could potentially be done with arbitrary builds and
> tests etc.  These are some initial suggestions.  How does this
> sound?

Sounds great to me. Since selftest patches flow through various
subsystem trees, having kernelci keep an eye is great. This would
be another pair of eyes in addition to occasional tests I run and
Linaro (LKTP) monitoring next.

How often do you send reports - I will watch out for them. Thanks
again for taking the initiative to add kselftest to kernelci.

thanks,
-- Shuah
