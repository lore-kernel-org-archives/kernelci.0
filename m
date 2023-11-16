Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099945957
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ho/Yc2Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700136606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6w0c/6Mjt9S6ipZbdX2b4aG7B54ILnQ5DkOjrtik/4=;
	b=ho/Yc2KpTqtZv4HMbzCTi/HbgDA/lQfgVoLFILlRV788H36G16SuBQVCCsdmjPyLWHky6R
	KxEkI/pFV9IxE+bqk3xRfoiuXJNHJ815hzWzltD1Q2vAx6gmzCAkaQTTF4eU6SP8wj4XoJ
	GeuLp5P93iSlSVZmraqsxHmj+Q4urk8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-c908WRvAOZKWOyC37EonDQ-1; Thu, 16 Nov 2023 07:09:59 -0500
X-MC-Unique: c908WRvAOZKWOyC37EonDQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-677e948bcd4so4735456d6.1
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 04:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136599; x=1700741399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6w0c/6Mjt9S6ipZbdX2b4aG7B54ILnQ5DkOjrtik/4=;
        b=UFSTVBQxU+OkhCjUBRMkhVNuSb4hJuBQTjOTjB757ELRr7OiqdC4LFDFVBFWn2Qd1r
         eQfGDoRd1fbHRB3gjV0LqE85sgGr+Byc+U1OSnsSb1fxyYgGhOBUh2H78Xw9PphpTA59
         FaiVd4nuvhIUu1ZZFetq10IUU4rQYavolxGWXJ+Y3XZRYUs/EFtdWm4c+Rme0Ft4b0+I
         MPVM17W5SrB4aIuqdMaQpNxpznuAz2i85ojMghL0G3VdWr8XKSGUdUuvGGvgpfwqUs20
         DHmdHgvtzGTCG3GDkt1Jsu0Qd5GoU+gMUfWHop4fwYqGUNlWDfbBriub+jJnIe8cmebS
         Xhkg==
X-Gm-Message-State: AOJu0YyHK/Av+74U/DyEZ3eXb0IhIpje0menKoXQsCKc3VTEF8xOPOpz
	fASC7Iol7hhgAF3ENVCVrEviCAIPEtxnWSami1F8KDhoq6xqREnLyevXK3aWbcj79p5DxRG7Oma
	4EziKg5GRlEBzUbf7Ob4=
X-Received: by 2002:a05:6214:481:b0:670:63bc:a2ca with SMTP id pt1-20020a056214048100b0067063bca2camr10416123qvb.28.1700136599036;
        Thu, 16 Nov 2023 04:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH71Na6oMtgVxH7p4QiOqHTi/dcqvr3Ohm5MKFHhH9Kt+iUWX1LU0pvTZO2VvIJY7NykGZpBQ==
X-Received: by 2002:a05:6214:481:b0:670:63bc:a2ca with SMTP id pt1-20020a056214048100b0067063bca2camr10416108qvb.28.1700136598694;
        Thu, 16 Nov 2023 04:09:58 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id x9-20020a0ceb89000000b0067266b7b903sm1328321qvo.5.2023.11.16.04.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:09:58 -0800 (PST)
Message-ID: <cdf83c60-b89d-42b5-8f47-95a187693ac3@redhat.com>
Date: Thu, 16 Nov 2023 14:09:54 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Mark Brown <broonie@kernel.org>
Cc: workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
 David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Veronika Kabatova <vkabatov@redhat.com>,
 CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <7a4a71a2-cca3-401e-a7ad-16ee47812900@sirena.org.uk>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <7a4a71a2-cca3-401e-a7ad-16ee47812900@sirena.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 22:14, Mark Brown wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> 
>> Introduce a new tag, 'Tested-with:', documented in the
>> Documentation/process/submitting-patches.rst file. The tag is expected
>> to reference the documented test suites, similarly to the 'V:' field,
>> and to certify that the submitter executed the test suite on the change,
>> and that it passed.
> 
> This doesn't feel like it fits so well with git based flows - generally
> the tags end up in git one way or another so there'll be a strong
> tendency for this to end up getting added for one version and then
> carried forward to the next version.  The way the tooling is at present
> it doesn't really feel like there's a good point at which to insert the
> tag.
> 
> I'm not sure exactly what'd be better though.

Yeah, I agree that's a bit of a problem. One that only automated 
tools/testing/CI could fully solve. Cough, git forges, cough.

OTOH, once you managed to run an automated suite once, it's much easier to do 
it again, and most of the time developers *want* their code to work and pass 
the tests (it's much easier than manual testing after all). So it's likely 
they will keep running them for new revisions, even though they might not 
notice they simply reused the previously-added Tested-with: tag.

Still, one way to make this better could be requiring a URL pointing at test 
results to follow the test suite name in the Tested-with: tag. Then the 
maintainer could check that they're indeed fresh.

This would be however getting way ahead of ourselves and, with the current 
(average) state of testing infra, hard to do. Perhaps sometime later.

For now, I think this could already go a long way towards having more (and 
better) testing.

Nick

