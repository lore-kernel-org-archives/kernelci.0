Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2078C04
	for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682008683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HARdw4/kgl2BPJ8viJAFCPFbBzEbeN8WSy3mTgSimc=;
	b=b3x5OQCO7DXvjd8ADMaQ664np/4AsZvCPqb3X8oAQ4DLmrwfr8XEwfBcIGV/36526kPZ/d
	WG8eG6FxCNEa5LMyJKCZWFiUHUcvPbub/l2JyJ8k8YsbzPeYC1jMErrsDsRnPYuWMuUZ77
	LNeRpKuSljxyBiLKQ40hVjsKLBgqEcs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-NttylN93OzCgCgkjXHeYBA-1; Thu, 20 Apr 2023 12:38:02 -0400
X-MC-Unique: NttylN93OzCgCgkjXHeYBA-1
Received: by mail-wm1-f71.google.com with SMTP id k39-20020a05600c1ca700b003f17b10763aso2191611wms.2
        for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 09:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682008681; x=1684600681;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HARdw4/kgl2BPJ8viJAFCPFbBzEbeN8WSy3mTgSimc=;
        b=BnGeTY+jj274mKKVm7iw7lGCzT+tI0YL1NB2RPf/myP9qanFUjE47TmUGPetjbrrPH
         kS+Jkn0z+j7oWKbAQL96kZICRF/5YvmOPYvbTmYPu5mTgcJKG2Qy5B0FfLYfvGgu4y+8
         hV3sHdH8Ef1hqbPma/jNE28ZtEyEbOwLtSTc0gXE/bftI8z2njpVSALyRpHIceqEI0U/
         x7374miWJAZHHpu9wCg0CDECZXS/8zvrZVL9P4O1FXqWrs9eU/xNxNgLdUGdhfG0FoCd
         tmigfRgmppKTjqpYChhLTOeVLLhWB4n0RDLu9YieUJ3b3d3t1uO9L15VZmz6P2rIwJ6M
         6DVg==
X-Gm-Message-State: AAQBX9dFVYGMWMUv1DWLIfcxmvcheWSjrAxpeFPIarTPEeUs4Y8lcsuM
	b5ycu0trSpCRd2tlFX66TXMzsoivgu0dNHEazG0SOmHC3V0MyBxg5bin86fDnsagFcetC4mqaLg
	+sm/mQCGJuVZ4JktYM28=
X-Received: by 2002:a1c:f608:0:b0:3f1:8430:523 with SMTP id w8-20020a1cf608000000b003f184300523mr1757171wmc.14.1682008680096;
        Thu, 20 Apr 2023 09:38:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrMpMshK2Bri0C+rDj1ZYwp4bGH7N3NHN28kPGn5+XwUsYh0xXK/Uz+n2xDEYH/i+/2k9YIQ==
X-Received: by 2002:a1c:f608:0:b0:3f1:8430:523 with SMTP id w8-20020a1cf608000000b003f184300523mr1757155wmc.14.1682008679806;
        Thu, 20 Apr 2023 09:37:59 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002fddcb73162sm2345504wri.71.2023.04.20.09.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 09:37:59 -0700 (PDT)
Message-ID: <30ee8d77-3122-75d1-4a5e-c9f4a2d53b7f@redhat.com>
Date: Thu, 20 Apr 2023 19:37:57 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Automated-testing] KCIDB: Support one more test status
To: guillaume.tucker@collabora.com, "Bird, Tim" <Tim.Bird@sony.com>,
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
 <76255cf0-170b-a091-e7b7-544ce3d3af50@collabora.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <76255cf0-170b-a091-e7b7-544ce3d3af50@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Guillaume,

Thank you for your response!

Snipping & answering below.

On 4/20/23 08:53, Guillaume Tucker via lists.yoctoproject.org wrote:
> On 19/04/2023 21:38, Bird, Tim wrote:
>>> -----Original Message-----
>>> From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
>>> Hello everyone involved with, or interested in KCIDB,
>>>
>>> After the testing is done, or we gave up trying, we send the same KCIDB test
>>> objects to the database, but this time only containing whatever results we
>>> got, including the "status" fields. However, with the current set of status
>>> strings [1], the only way we can try to express "wanted to run, but couldn't"
>>> is with "SKIP", which is not supposed to alert anyone, yet this situation
>>> should be treated as a problem.
>>
>> Why can't "wanted to run, but couldn't" be expressed with "ERROR"?
> 
> There's also "wanted to run, but didn't" if the test wasn't
> actually run.  I guess failing to start the test is a harness
> problem, and a failure while it's running is more likely a test
> problem (but not necessarily).

Yes, that's the idea.

> But also, what if a test has disappeared from a test suite?

That depends where you slice your responsibility, I suppose.

If you want to control and make sure which exact sub-tests of a test suite 
should be executed, then you should report the disappeared test as "MISS", 
because it would be the fault of your harness not noticing that.

If you'd prefer to leave it to the test suite maintainers to decide what 
running their test suite (or a subset of) means, then you just collect 
whatever you get, and only report "MISS" for the whole test suite when you 
failed to run it.

>>> If you look at the above closely, you will notice one possible state missing
>>> (because we didn't need to express failing harnesses), and that is the status
>>> we want to introduce:
>>>
>>>       STATUS      CODE TEST HARNESS+           LEGEND
>>>
>>>       FAIL        ❌   ✅   ✅                 ❌ - failure
>>>       ERROR       ➖   ❌   ✅                 ✅ - success
>>>   =>  MISS        ➖   ➖   ❌ <=              ➖ - no data
>>>       PASS        ✅   ✅   ✅
>>>       DONE        ➖   ✅   ✅
>>>       SKIP        ➖   ➖   ✅
>>>                   ➖   ➖   ➖
> 
> It seems there are many reasons for a test to not run correctly
> and trying to put them in buckets isn't as simple as that.  I
> would rather be in favour of having fewer states: pass, fail,
> skip and unknown for when there's no clear test result.

I agree, we could slice the test outcome into an infinite number of statuses, 
for every little thing, and keep adding them until the cows come home.

However, if you look at the above table, you would see that we have statuses 
strictly focusing on which part of the stack has passed/failed/had no data, 
and these parts of the stack correspond to the clearly-separate responsibility 
areas. We're just enumerating all the possibilities in that space, and "MISS" 
plugs the one remaining hole.

So, I think it has its place. That is unless we object to having harness (and 
higher) failures reported to KCIDB.

I would say, though, that we should accept them. Because, even if the CI 
systems try hard to avoid them, their failures will creep in anyway, and then 
the issue/incident system will be there to help them set the correct status 
after the fact, for the situations when they failed to execute the test and 
reported something else by mistake.

And of course, I'd be happy if this new status helps CKI keep using KCIDB for 
internal result reporting as well.

> On a side note, the last line with no data anywhere doesn't have
> a name.  Is the status field optional in KCIDB, so we can send
> data with no status?  That would match the last line I guess.  Or
> maybe it could be named as UNKNOWN or something.  I think that
> kind of relates to missing test results if there's no positive
> error reported by the test harness, see my other paragraph below.

Yes, the "status" field is optional (same as most other fields), and yes, the 
last line represents it missing (all missing fields represent "no data" in KCIDB).

I don't think we should add an explicit "UNKNOWN" status, because then we 
would have two kinds of "unknowns", with all the problems that follow.

>> I think I'm missing something.  Are you trying to distinguish these so you
>> can determine whether there is a problem with the test itself, vs. the harness?
>> Are you automatically re-running a test if the harness is the problem?
>>
>> Why do you want to distinguish these error cases?
> 
> I was wondering the same thing.  Is MISS effectively like
> a "null" default state for when the system knows a test has been
> started and a result is expected but hasn't arrived yet?  Whereas
> ERROR is when the test has clearly hit an error and failed to
> run?  For example, if a test suite changed and a test case
> disappeared or was renamed then you would see a MISS result with
> the old test case name and that's not really an error.

No, "MISS" is not the default state. The default state is the "status" field 
missing, which indicates that the test is planned, but not (completely) 
executed yet. That is the only field state that could be changed by the KCIDB 
protocol.

I.e. the only possible change to an already-submitted object is to add a 
missing field. It's not possible to deterministically do any other change.
Basically, whichever status string you submit is final for that test.

"MISS" is for when you sent your "test plan" in the form of a set of tests 
with missing "status" fields, proceeded to testing, and then e.g. network went 
down in the middle of it, and you couldn't reach your hosts to get the results 
until you ran out of time. Or e.g. you couldn't get the hosts you need for 
some of the tests in a reasonable time, because they were taken by someone 
else. Or the kernel simply failed to boot on some hosts, and no tests could be 
executed there.

In these cases, you can send the "MISS" status to indicate you gave up on this 
run. Then people and machines can stop waiting for those results and go do 
something else, like say "this version was not fully tested, so we cannot 
release it, and gonna ask for a retry", or "we did our best, upstream, here 
are your test results, such as they are, take 'em or leave 'em". Or you can 
use this status in internal communication, to trigger a re-run of those 
particular tests, before reporting the results to upstream KCIDB.

Yes, the "ERROR" status is for when we actually got to executing the test 
(suite), and then it messed up, and e.g. crashed in the middle of execution. 
This is likely a problem for test maintainers to solve, and not for the CI 
people (although they would do well to keep an eye on such results too).

Yes, as I also described above, if you care about which exact tests a test 
suite executes, and some tests in your previously-submitted plan didn't 
execute after all, then you would need to set their status to "MISS".

But if you only care that this suite executes, and runs whatever tests it 
deems important, you could e.g. send an object for the whole test suite with 
its status missing before starting. Then send its subtests with status filled 
in with whatever you get as they execute, capping off with the final status of 
the whole suite after it's done. And if you failed to run the suite for 
whatever reason, then you could send the "MISS" status for it instead.

Hope this helps :D
Nick

