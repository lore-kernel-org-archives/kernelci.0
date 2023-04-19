Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35A7C941
	for <kernelci@lists.linux.dev>; Wed, 19 Apr 2023 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681924089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NdYf3dh6jpahIfMaK2ODlzr2JB+SyVpjnmXWfjT+Yc4=;
	b=EizJovtGF2cyfGZFVgNMnZa3vFVybEoZHANO3QENK/Kk7IfP28rIwHwQlqBC6IYfeg/Ndc
	BFmModcLws5CNjdrltXuK+KUqg8TtjZm0SEBjGg3XPhU04PYccgHXZc1Oue3SOqFx1veBp
	3LHqj7itZclzkMkp6G5DY9YpS9Gcfqg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-YeZKYXwDMvuiHxYr1lEcSg-1; Wed, 19 Apr 2023 13:08:07 -0400
X-MC-Unique: YeZKYXwDMvuiHxYr1lEcSg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2a8b2ff4379so12478041fa.1
        for <kernelci@lists.linux.dev>; Wed, 19 Apr 2023 10:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681924085; x=1684516085;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdYf3dh6jpahIfMaK2ODlzr2JB+SyVpjnmXWfjT+Yc4=;
        b=aTSzHanbD7oWdeORsSRFR5WvuaFqas9ZhFkehv8S8gTGPC0r1k3QqAAI+u5TF5DnI2
         svz2Y8On/KZ5rUvRJxGdAuYDguyTV6mAoaQlNUArPt4kvMAlJsgps1/W1UZZx32r1Hv+
         dCcq8Lz2sBllaYOehhUJVK5HqFLFvJUfWK/nMK8AycxPAItyHZDqLtCpzWk4zDFW53v3
         qugz5Wc6r0dRmZmaLeTPPuOjeu6R4ioWe8i5I5+Xa6i5dAgN2R6NPYV0+PBe+l8BqRUG
         Ah5m/yh84GOg82L8z63aEEgjbeBvCURA0ztHsDmiSyuTfgnLrWuJSho5l4JoAaraF/fv
         NKoQ==
X-Gm-Message-State: AAQBX9deoPsywM1brAlfRANmIYFZ9JLT1qp6obAlufeuEVYaSm0VWf4y
	IrJRx28DXjHVjXqlCS2GXPh8tTWVkUgN24UVjYpbuyYx8Ls/OUwNPImiJH11iCTHL3gXvkRtCl3
	BrfQC6df9lrEH05/WiURgq0HzRl7LaYuN8ztC2r/lZJLP0FdBLUAcb76INhq+BSQyrVzoHKbMxY
	d+0808PDUAXnY1377vfZx2dA==
X-Received: by 2002:ac2:4309:0:b0:4eb:104b:bf61 with SMTP id l9-20020ac24309000000b004eb104bbf61mr4486162lfh.58.1681924085655;
        Wed, 19 Apr 2023 10:08:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9gV/jQaurL0ufH0Qx/s4Ni2KPNwWe1dYaq3sLLyBqT3Itkc8hPI8ONYxEV2HFtqgirNvo6Q==
X-Received: by 2002:ac2:4309:0:b0:4eb:104b:bf61 with SMTP id l9-20020ac24309000000b004eb104bbf61mr4486142lfh.58.1681924085254;
        Wed, 19 Apr 2023 10:08:05 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id c15-20020ac2530f000000b004edc3f06f5csm1206927lfh.296.2023.04.19.10.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 10:08:04 -0700 (PDT)
Message-ID: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
Date: Wed, 19 Apr 2023 20:08:03 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB: Support one more test status
To: kernelci@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>,
 CKI <cki-project@redhat.com>, Mark Brown <broonie@kernel.org>,
 Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone involved with, or interested in KCIDB,

I would like to make KCIDB I/O schema accept one more test status string:
"MISS" (preliminary name), meaning the test was supposed to run, but didn't
because of a harness/framework/infrastructure/CI system failure.

This would be distinct from the "SKIP" status, meaning the test was supposed
to run, but didn't (or didn't complete), because it was not applicable.

Here's the PR in question: https://github.com/kernelci/kcidb-io/pull/74

I'll merge it in two weeks, on Wed, May 3, if there are no unresolved
objections by that time.

Read on for details, and respond either to this message, or in the PR.

At CKI we have both tests that skip themselves for valid reasons, and tests
that should've executed, but didn't. Because e.g. the previous test has
crashed the machine, or the tested kernel failed to boot. At the same time, we
want to make sure all the tests we planned to execute had their chance.

Before testing, we send our plan to our database as a KCIDB dataset with all
tests listed without the "status" field. According to KCIDB schema/protocol a
missing "status" field simply means no data, and is canonically interpreted as
"execution in progress".

After the testing is done, or we gave up trying, we send the same KCIDB test
objects to the database, but this time only containing whatever results we
got, including the "status" fields. However, with the current set of status
strings [1], the only way we can try to express "wanted to run, but couldn't"
is with "SKIP", which is not supposed to alert anyone, yet this situation
should be treated as a problem.

We propose to call this new status "MISS" (as in "the test result should be
there, but isn't"), and think it would be useful to others as well.

We can break down the testing stack into three layers: the tested code, the
test, and the harness (and everything above it) that runs the test. If we then
express each existing test status as one trinary outcome per each of those
layers, we would get this table (in order of descending status priority):

     STATUS      CODE TEST HARNESS+           LEGEND

     FAIL        ❌   ✅   ✅                 ❌ - failure
     ERROR       ➖   ❌   ✅                 ✅ - success
     PASS        ✅   ✅   ✅                 ➖ - no data
     DONE        ➖   ✅   ✅
     SKIP        ➖   ➖   ✅
                 ➖   ➖   ➖

If you look at the above closely, you will notice one possible state missing
(because we didn't need to express failing harnesses), and that is the status
we want to introduce:

     STATUS      CODE TEST HARNESS+           LEGEND

     FAIL        ❌   ✅   ✅                 ❌ - failure
     ERROR       ➖   ❌   ✅                 ✅ - success
=>  MISS        ➖   ➖   ❌ <=              ➖ - no data
     PASS        ✅   ✅   ✅
     DONE        ➖   ✅   ✅
     SKIP        ➖   ➖   ✅
                 ➖   ➖   ➖

Please respond with comments, objections, and (counter-)proposals,
if you have them.

Thank you for your attention!
Nick (and the CKI team)

[1] The current set of supported status strings
 
https://github.com/kernelci/kcidb-io/blob/0bb7ffff3fe012ae138dd2f7c1d817034fe2c0ba/kcidb_io/schema/v04_01.py#L126

