Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929422941D
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2QLY1OA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700136870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bNUOH0W+hzau0QOi98ae0r3jNAzrQ9c27bIiiL1MLQ=;
	b=g2QLY1OAicyHxqBknC/LBO1nCsKpIAVCPxHLYy2xuDIlA3gZfl9hKCUF09mVNH9jcnzAHM
	gdtzMTQ0ZcNPZD74u7PwZZWsKthboH2/Ny4sQlNYGaqqmmvYgZwgi3829/MTsjrnjAN6+e
	KgzpyOjAwxNZfzmX9m9vkeASaG7RY+A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-09G7vmP2Pta0qZzg1ukq1Q-1; Thu, 16 Nov 2023 07:14:29 -0500
X-MC-Unique: 09G7vmP2Pta0qZzg1ukq1Q-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-421ad4ca88dso8252101cf.1
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 04:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136869; x=1700741669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bNUOH0W+hzau0QOi98ae0r3jNAzrQ9c27bIiiL1MLQ=;
        b=IoFYDLkcg9k2LHmz+N3QSNFWOgHPW5UjddlMi5rVcB3vgLFmKkOJNVz2oyS4vJY97c
         aj1RUpWEmbMzmZejtMepVj8MuRvDdzsvF/kaR7857bcu/npAdQiumaaYaeE4bBnnVzLM
         jOhuX+jwNISgylOydxUiGRb+mgZ02LWv0Daob6HJznTx/G76lBkw/fe4EdAhTnYtCnS0
         EHcJKk53aAJ2oiU2+iMtsEZRfNEjKSlUTJTsk8oIbYyd8eGNAIIoH658sL8YibyexBdN
         iXXtQWDnujZ4NJm4lPIRBpyifYhC+ewXt7Zq1CMfH+xiXaZwepKQVJWAUQ6GTth8+XNr
         C+JQ==
X-Gm-Message-State: AOJu0YxmxXfmdfyEvl2OQIZOA5UxXHqTay3iDZT4TV8axzSbQ83tjUrW
	KRDeZjNNiHtlXVEcpTlacthIY9+TIhM8YvPZlSUR+HZM//O6g7FLDOaKa2LPUW/cy7u/+vI+Wbr
	EkNROtm9c/E/einiyR3I=
X-Received: by 2002:ac8:7f4c:0:b0:41c:dd22:e7bf with SMTP id g12-20020ac87f4c000000b0041cdd22e7bfmr10072036qtk.42.1700136868940;
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPGczeFtCmKIQDf7fheNsirZABfTHQecH6L89Gj9lo6GuRXElt/m+iwntGdSDoB0dFD/x7OA==
X-Received: by 2002:ac8:7f4c:0:b0:41c:dd22:e7bf with SMTP id g12-20020ac87f4c000000b0041cdd22e7bfmr10072017qtk.42.1700136868716;
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id g9-20020ac84dc9000000b0041cb787ff41sm4251329qtw.67.2023.11.16.04.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:14:28 -0800 (PST)
Message-ID: <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
Date: Thu, 16 Nov 2023 14:14:24 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
 David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Veronika Kabatova <vkabatov@redhat.com>,
 CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 22:38, Konstantin Ryabitsev wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
>> Introduce a new tag, 'Tested-with:', documented in the
>> Documentation/process/submitting-patches.rst file. The tag is expected
>> to reference the documented test suites, similarly to the 'V:' field,
>> and to certify that the submitter executed the test suite on the change,
>> and that it passed.
> 
> I'm not sure it should be a tag that stays all the way through git commit.
> How about making it a cover letter/first patch footer?
> 
> tested-with: <suite>

Yes, that would be better indeed. However, checkpatch.pl doesn't process cover 
letters, and so we would have no automated way to advertise and nudge people 
towards testing.

Nick

P.S. Git forges do that for you by nature of actually running the tests 
themselves, automatically. *Ducks*

