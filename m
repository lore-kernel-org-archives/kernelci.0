Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04655661
	for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681992528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pn78go24rJLZhBVsYkj1wDQEuZoJFwwOuKHugYs0q3o=;
	b=VqOKy/4y7KsE5o6wNW7dA6FfUbU44h+ZRjvT52k+EGCUMGIm+L1ly7AF2KNJKoHoPGQ82l
	xY9POxAhEvH3ZyK4fV0pbTBZ9l40hVfdPgGmcXhd6a70byiA+td9f0MzdKIk4izzCrUB+Q
	3xML93BZE5sY/AlnnKc6Ue1jUc1ZeL4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-orNlxu5zPjKQ9RHhukrpkg-1; Thu, 20 Apr 2023 08:08:47 -0400
X-MC-Unique: orNlxu5zPjKQ9RHhukrpkg-1
Received: by mail-wm1-f70.google.com with SMTP id fl8-20020a05600c0b8800b003f16fe94249so2015817wmb.9
        for <kernelci@lists.linux.dev>; Thu, 20 Apr 2023 05:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681992525; x=1684584525;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pn78go24rJLZhBVsYkj1wDQEuZoJFwwOuKHugYs0q3o=;
        b=OhDGV2wzuWLZTK/v9cW1Mvr9/5x7ZVIvJtaxhmNuF9m+cAdS/AIngpNCcM8ScdwOfu
         OFzzOppuTLm1spnlrUvuTCDrRUuG9286pSfVpYyiKsA53oCaUupdeUf9ikH6VMKpMZz/
         CqE33nDK/FA2S2leoLT6kj/1PXMiEGIxYoLihQPshdgv+rhfNylFIHHtrVHdsdR3BBHQ
         VS34LY5/NATe3sH/vh12UQ8L9lMCayWxGK4XCqddlIsSWkjYvaSVwWobYjLcyXh3urfZ
         Bnj0GaYGQgbtx8DV8jzH48nEqw9qPrdsMrt9sHwXKKgR5fY3j1iOCvGnn9rdkZgr23GT
         TkoQ==
X-Gm-Message-State: AAQBX9cAk09DoZ6VTsDvlC7mJ2duco0fkK1P06ECzzKu6PtkKzzOwJvd
	qIr07lmMZ8w4NVA8/Pf+96YoY9BbWZVUCqN861VK/6jQicni6eU1L1orgGvYptyfyMESZ4bB0xq
	xiHMT4lkyLDSZF6v6E8U=
X-Received: by 2002:a7b:cbd4:0:b0:3f1:7123:fd12 with SMTP id n20-20020a7bcbd4000000b003f17123fd12mr1098211wmi.34.1681992525543;
        Thu, 20 Apr 2023 05:08:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbJjesCCk2+HLNTuQX/p5O1k6M40/IC89WQLgkX0lBwlAvQW3l0vjnnXkbLaaLi8VZ11TRJw==
X-Received: by 2002:a7b:cbd4:0:b0:3f1:7123:fd12 with SMTP id n20-20020a7bcbd4000000b003f17123fd12mr1098190wmi.34.1681992525205;
        Thu, 20 Apr 2023 05:08:45 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id s12-20020a7bc38c000000b003f1739a0116sm1836250wmj.33.2023.04.20.05.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:08:44 -0700 (PDT)
Message-ID: <a5747b70-2dbe-769d-82be-9f9e96ee283f@redhat.com>
Date: Thu, 20 Apr 2023 15:08:42 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: KCIDB: Support one more test status
To: "Bird, Tim" <Tim.Bird@sony.com>,
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
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <BYAPR13MB2503FE8D3D92A95B8B331B8DFD629@BYAPR13MB2503.namprd13.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tim,

Thanks a lot for your response!
I will do some snipping and answering below.

On 4/19/23 22:38, Bird, Tim wrote:
>> After the testing is done, or we gave up trying, we send the same KCIDB test
>> objects to the database, but this time only containing whatever results we
>> got, including the "status" fields. However, with the current set of status
>> strings [1], the only way we can try to express "wanted to run, but couldn't"
>> is with "SKIP", which is not supposed to alert anyone, yet this situation
>> should be treated as a problem.
>
> Why can't "wanted to run, but couldn't" be expressed with "ERROR"?

This is a matter of responsibility area and distinguishing who should be 
fixing the problem.

The three layers I listed below correspond to the three distinct parties 
involved in testing, at Red Hat, and other large CI systems: "CODE" is for 
kernel developers/maintainers, "TEST" is for test maintainers, and "HARNESS+" 
is for CI system maintainers.

At Red Hat we have the CKI project, which is responsible for maintaining the 
pipeline, builds, provisioning, reporting, etc - "HARNESS+". Then we have *a 
lot* of test maintainers, both internal (for the tests Red Hat needs), and 
external (for test suites like LTP) - "TEST". Finally, we have the kernel 
developers/maintainers, of course - "CODE".

Naturally, if there was an issue with the test (normally reported as ERROR), 
we don't want to bother kernel developers. A test maintainer would need to 
deal with that (and they would get their notification), although they would be 
interested in just regular PASS/FAIL results too.

Similarly, if the CI system couldn't manage to run the test, we won't want to 
report it as ERROR, because that would alert the test maintainer, while it 
wouldn't be their fault at all, and they shouldn't go and waste their time 
investigating it.

Now, of course, this particular split is not always there, or it's not so 
clear-cut. E.g. kunit tests are normally maintained by kernel developers 
themselves. So they would be interested in both "CODE" and "TEST" layers for 
those, and so wouldn't really need the "ERROR" status - "FAIL" would be enough.

CI system maintainers often take the role of test maintainers as well, and 
they wouldn't really need to distinguish "TEST" and "HARNESS+", for them it 
would be "TEST+", and they wouldn't need the "MISS" status - "ERROR" would be 
enough.

However, this split (and the various statuses) is a good tool for handling all 
the various responsibility combinations the CI systems submitting to KCIDB 
have. It allows precise targeting of notifications and dashboard data, saving 
time and effort in many cases.

>> We propose to call this new status "MISS" (as in "the test result should be
>> there, but isn't"), and think it would be useful to others as well.
>>
>> We can break down the testing stack into three layers: the tested code, the
>> test, and the harness (and everything above it) that runs the test. If we then
>> express each existing test status as one trinary outcome per each of those
>> layers, we would get this table (in order of descending status priority):
>>
>>       STATUS      CODE TEST HARNESS+           LEGEND
>>
>>       FAIL        ❌   ✅   ✅                 ❌ - failure
>>       ERROR       ➖   ❌   ✅                 ✅ - success
>>       PASS        ✅   ✅   ✅                 ➖ - no data
>>       DONE        ➖   ✅   ✅
>>       SKIP        ➖   ➖   ✅
>>                   ➖   ➖   ➖
>>
>> If you look at the above closely, you will notice one possible state missing
>> (because we didn't need to express failing harnesses), and that is the status
>> we want to introduce:
>>
>>       STATUS      CODE TEST HARNESS+           LEGEND
>>
>>       FAIL        ❌   ✅   ✅                 ❌ - failure
>>       ERROR       ➖   ❌   ✅                 ✅ - success
>>   =>  MISS        ➖   ➖   ❌ <=              ➖ - no data
>>       PASS        ✅   ✅   ✅
>>       DONE        ➖   ✅   ✅
>>       SKIP        ➖   ➖   ✅
>>                   ➖   ➖   ➖
>>
>> Please respond with comments, objections, and (counter-)proposals,
>> if you have them.
> 
> I don't understand the rationale for distinguishing a test error from a harness
> error.  In either case the test was not executed properly, and so there is no
> useful test result data available.  Diagnostic information should enable
> the user to determine whether the problem was due to the test code failing
> or the test harness failing.

This works when the test maintainer and the harness/framework/CI system 
maintainer are the same person or team. This doesn't work when everything from 
CI system down to the test (suite) harness is maintained by one team, and the 
test by a completely different team (e.g. CKI and LTP).

> I think I'm missing something.  Are you trying to distinguish these so you
> can determine whether there is a problem with the test itself, vs. the harness?

Yes.

> Are you automatically re-running a test if the harness is the problem?

We do try rerunning tests in case we hit a faulty host in our inventory (this 
happens), or e.g. a network problem occurred. However, at some point we gotta 
give up, and then we need a way to say: "this test result is not just missing 
or in progress (as specified by a missing "status" property), but we're done 
testing, and we couldn't run that test".

Because we usually run multiple suites on each machine, one after another, if 
one of them crashes/locks up the machine (we're testing the kernel after all), 
then the following suites won't be able to run. In this case we also need a 
way to say "we finished testing, but those tests didn't even get to run".

> Why do you want to distinguish these error cases?

As described above, to alert the right people and avoid wasting time of others.

Nick

