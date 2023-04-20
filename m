Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDE23A3
	for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 05:52:40 +0000 (UTC)
Received: from [192.168.196.47] (unknown [80.215.6.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20A2A66031CD;
	Thu, 20 Apr 2023 06:52:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681969952;
	bh=Vi2hx0M5RSTGOwI+zMRYhXpF/UQ4aH1iYiIASDepC4s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=N6KPjJIVT+LR7L6J1f19lILY3J2yTeQnrjS5HhvUxrOCSxKczTksOb+YsccwarHbr
	 xSzpmA/MQUwge/zuaJafwi+ojk0mfPVVlyqFvfXfoOep1Gs6gqqR4Por4kTv126+5c
	 oNWCG8yAahFPyM1v3js8FVDN0VTHuwG7R5qdv0AKSNcOvTgn7ONxu1BijqdWZI9jVM
	 UAjmyzCqCld0Ub6hj3pNwVXKJBX7xk/ksBu/q9bTakkwy274BmippjgdUYpK434F2U
	 7BgifP2wJn2OJ4pRzmGBHHSEp3SrNg2vQo7Ng4um9fi9/2foH3pQMq2A/RL8prIBI6
	 rXlCfVOP82nXg==
Message-ID: <76255cf0-170b-a091-e7b7-544ce3d3af50@collabora.com>
Date: Thu, 20 Apr 2023 07:53:29 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: KCIDB: Support one more test status
Content-Language: en-US
To: "Bird, Tim" <Tim.Bird@sony.com>,
 Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>, CKI <cki-project@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>
References: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
 <BYAPR13MB2503FE8D3D92A95B8B331B8DFD629@BYAPR13MB2503.namprd13.prod.outlook.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <BYAPR13MB2503FE8D3D92A95B8B331B8DFD629@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/04/2023 21:38, Bird, Tim wrote:
> 
>> -----Original Message-----
>> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>> Hello everyone involved with, or interested in KCIDB,
>>
>> I would like to make KCIDB I/O schema accept one more test status string:
>> "MISS" (preliminary name), meaning the test was supposed to run, but didn't
>> because of a harness/framework/infrastructure/CI system failure.
> 
>>
>> This would be distinct from the "SKIP" status, meaning the test was supposed
>> to run, but didn't (or didn't complete), because it was not applicable.
>>
>> Here's the PR in question: https://github.com/kernelci/kcidb-io/pull/74
>>
>> I'll merge it in two weeks, on Wed, May 3, if there are no unresolved
>> objections by that time.
>>
>> Read on for details, and respond either to this message, or in the PR.
>>
>> At CKI we have both tests that skip themselves for valid reasons, and tests
>> that should've executed, but didn't. Because e.g. the previous test has
>> crashed the machine, or the tested kernel failed to boot. At the same time, we
>> want to make sure all the tests we planned to execute had their chance.
>>
>> Before testing, we send our plan to our database as a KCIDB dataset with all
>> tests listed without the "status" field. According to KCIDB schema/protocol a
>> missing "status" field simply means no data, and is canonically interpreted as
>> "execution in progress".
>>
>> After the testing is done, or we gave up trying, we send the same KCIDB test
>> objects to the database, but this time only containing whatever results we
>> got, including the "status" fields. However, with the current set of status
>> strings [1], the only way we can try to express "wanted to run, but couldn't"
>> is with "SKIP", which is not supposed to alert anyone, yet this situation
>> should be treated as a problem.
> Why can't "wanted to run, but couldn't" be expressed with "ERROR"? 

There's also "wanted to run, but didn't" if the test wasn't
actually run.  I guess failing to start the test is a harness
problem, and a failure while it's running is more likely a test
problem (but not necessarily).  But also, what if a test has
disappeared from a test suite?

>> We propose to call this new status "MISS" (as in "the test result should be
>> there, but isn't"), and think it would be useful to others as well.
>>
>> We can break down the testing stack into three layers: the tested code, the
>> test, and the harness (and everything above it) that runs the test. If we then
>> express each existing test status as one trinary outcome per each of those
>> layers, we would get this table (in order of descending status priority):
>>
>>      STATUS      CODE TEST HARNESS+           LEGEND
>>
>>      FAIL        ❌   ✅   ✅                 ❌ - failure
>>      ERROR       ➖   ❌   ✅                 ✅ - success
>>      PASS        ✅   ✅   ✅                 ➖ - no data
>>      DONE        ➖   ✅   ✅
>>      SKIP        ➖   ➖   ✅
>>                  ➖   ➖   ➖
>>
>> If you look at the above closely, you will notice one possible state missing
>> (because we didn't need to express failing harnesses), and that is the status
>> we want to introduce:
>>
>>      STATUS      CODE TEST HARNESS+           LEGEND
>>
>>      FAIL        ❌   ✅   ✅                 ❌ - failure
>>      ERROR       ➖   ❌   ✅                 ✅ - success
>> =>  MISS        ➖   ➖   ❌ <=              ➖ - no data
>>      PASS        ✅   ✅   ✅
>>      DONE        ➖   ✅   ✅
>>      SKIP        ➖   ➖   ✅
>>                  ➖   ➖   ➖

It seems there are many reasons for a test to not run correctly
and trying to put them in buckets isn't as simple as that.  I
would rather be in favour of having fewer states: pass, fail,
skip and unknown for when there's no clear test result.

On a side note, the last line with no data anywhere doesn't have
a name.  Is the status field optional in KCIDB, so we can send
data with no status?  That would match the last line I guess.  Or
maybe it could be named as UNKNOWN or something.  I think that
kind of relates to missing test results if there's no positive
error reported by the test harness, see my other paragraph below.

>> Please respond with comments, objections, and (counter-)proposals,
>> if you have them.
> 
> I don't understand the rationale for distinguishing a test error from a harness
> error.  In either case the test was not executed properly, and so there is no
> useful test result data available.  Diagnostic information should enable
> the user to determine whether the problem was due to the test code failing
> or the test harness failing.
> 
> I think I'm missing something.  Are you trying to distinguish these so you
> can determine whether there is a problem with the test itself, vs. the harness?
> Are you automatically re-running a test if the harness is the problem?
> 
> Why do you want to distinguish these error cases?

I was wondering the same thing.  Is MISS effectively like
a "null" default state for when the system knows a test has been
started and a result is expected but hasn't arrived yet?  Whereas
ERROR is when the test has clearly hit an error and failed to
run?  For example, if a test suite changed and a test case
disappeared or was renamed then you would see a MISS result with
the old test case name and that's not really an error.

Thanks,
Guillaume

>> Thank you for your attention!
>> Nick (and the CKI team)
>>
>> [1] The current set of supported status strings
>>
>> https://github.com/kernelci/kcidb-io/blob/0bb7ffff3fe012ae138dd2f7c1d817034fe2c0ba/kcidb_io/schema/v04_01.py#L126
> 

