Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02432C878
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XxX8W8mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700136053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJEaqLcE8LMZlLtaRlJKiYIAGpgF6F9Co9xx2cwkfaM=;
	b=XxX8W8mjweTUldTqCoqSGmRBm5UPsXLG0k4RWD0ku1Bloe1jGx0+uPqQ7hfg4DNqiwils1
	Ij5w6KHOfV7XAj0zLpdNnZVm+rE15x8nUESBkm2sN4KFLLToGRFxeQz7KE8sg0tLNCZ8co
	2IQOk7kn+wCulv3juefIUKZ+II8b7uo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-fKxx5oNaMha8s3zUew4W6Q-1; Thu, 16 Nov 2023 07:00:52 -0500
X-MC-Unique: fKxx5oNaMha8s3zUew4W6Q-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41bf9a5930aso8827511cf.2
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 04:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136052; x=1700740852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJEaqLcE8LMZlLtaRlJKiYIAGpgF6F9Co9xx2cwkfaM=;
        b=ncwo+dUXDm8cfC1niuG7UgcxRg/Mm54YSaITeLTPz6Pg6VReQa2GqaE0x8bstFn8w+
         qPM1VNMGOrxWneBm/1uBrEVo+yxOyqL3uv/DHwxvuIe+EnfuWYtl40W8SOT0KWPuyXIM
         zOwYqC5PyDHl8q69xXrypc1NV1Hf5OFVKb9pp9zg0wCpJHdV/b8oGtg8sUwA7O0Cu/A9
         DxDSCJ/URH3KaSCmsaD0DXA4lMloNWYMMw3Xl39rcIwZTnNOQKU+UDCKau+NhhBrBsEn
         zgmQLiJ0PEgwTMawAjhy4xb5tvn7tDg9GPT4Y+fIfbbL91x0voDrEgGeXhjc3CKwiF0i
         aLFw==
X-Gm-Message-State: AOJu0YztIAbZ0eNxDDESDE2S1QqnIzUHDMbWYTw2IS226JSlXJNt/P6j
	nCeEy0IRjlh2N3GA1PCGgRpP8mYzqLQeZaAjrrXK0lrOg0OksNQyEFcaPEGzJqY7Nu/8IQUEayb
	hQWuV4faWmVjL+LHuU0A=
X-Received: by 2002:ac8:4e56:0:b0:421:c9a0:3e9b with SMTP id e22-20020ac84e56000000b00421c9a03e9bmr10037087qtw.3.1700136052283;
        Thu, 16 Nov 2023 04:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1/IWAdCHnltnz/yj6txJliOQv9AD9LCa2gapSrP4v9cvJOfR3amYIwYxVui43ueMcT5wRmg==
X-Received: by 2002:ac8:4e56:0:b0:421:c9a0:3e9b with SMTP id e22-20020ac84e56000000b00421c9a03e9bmr10037062qtw.3.1700136051926;
        Thu, 16 Nov 2023 04:00:51 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id df4-20020a05622a0ec400b0040331a24f16sm4294893qtb.3.2023.11.16.04.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:00:51 -0800 (PST)
Message-ID: <e2d18278-1fdb-440e-8009-4ec49749b71c@redhat.com>
Date: Thu, 16 Nov 2023 14:00:46 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 Andy Whitcroft <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>,
 David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "Darrick J . Wong" <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <2e8979163c8ed93f6990c6a91c34cdf96a76daaf.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <2e8979163c8ed93f6990c6a91c34cdf96a76daaf.camel@perches.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/23 20:31, Joe Perches wrote:
> On Wed, 2023-11-15 at 19:43 +0200, Nikolai Kondrashov wrote:
>> Introduce a new 'V:' ("Verify") field to MAINTAINERS. The field accepts
>> a name of a test suite which is required to be executed for each
>> contribution to the subsystem.
> 
> Perhaps this is simply too much overhead
> process requirements for most kernel work.
> 
> While the addition of V: seems ok, I think
> putting the verification in checkpatch is
> odd at best and the verification of test
> execution should be a separate script.

I agree that this extends checkpatch.pl responsibilities somewhat. In the 
sense that it requires you to do something beside changing the patch itself. 
OTOH, checkpatch.pl already requires Signed-off-by:, which prompts you to 
check and clear up your authorship, similarly requiring work outside the patch.

At the same time, you're supposed to test your changes anyway. Sometimes it's 
manual and one-off, but often times running an existing test suite is at least 
beneficial, if not required.

In a sense, this is not *checkpatch.pl* itself requiring testing, but 
subsystem maintainers (who are opting in), and checkpatch.pl simply provides 
convenient means and an entry point for raising attention to maintainer's 
requests, and making it easier to discover the tests.

It also does *not* verify test execution, only alerts the contributors to the 
need, and requires certification. Again, similar to Signed-off-by:.

Nick

