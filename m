Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0882585
	for <kernelci@lists.linux.dev>; Mon, 12 Dec 2022 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670849673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dORjaDqZdkVrEHnEH9OBMSXOY9Rl+QHhTxsjYUTnWL8=;
	b=KdCpio88c49PhyJ2+YsAjPudOc1YHEr/qiJQFnHrHwovAg6+MNSTYnPEEpeAKP04jeGTyi
	JWyN0bgIvyiXCD1lY+MfEiWCm2bi9SQimBt0YFNeUeYWNOmGxVR2+FsYjF5KoMp/Y1TpFJ
	i9mR03bSvxTp3gCaQHzbo2cgOkVUbVI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-3CqQ-spPMqOu7vfri4_6DQ-1; Mon, 12 Dec 2022 07:54:33 -0500
X-MC-Unique: 3CqQ-spPMqOu7vfri4_6DQ-1
Received: by mail-wm1-f70.google.com with SMTP id f20-20020a7bc8d4000000b003d1cda5bd6fso1957674wml.9
        for <kernelci@lists.linux.dev>; Mon, 12 Dec 2022 04:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dORjaDqZdkVrEHnEH9OBMSXOY9Rl+QHhTxsjYUTnWL8=;
        b=pPmYFamy2A6JtoBpXcQOT7ibQfkOWWZXsL9dkAJjjUvIyZiecW/i4qsRkARXv25t/L
         yXR8l9VXoNTYSJ965gPqXC+9PwVtbmGPmrpUUpDWAz1hwnccTMWDtSWKEtCafpe5PZIe
         y5027HqA/LkrKSZMywUyTLzrtMKIpeo18UBPOcbCshGELVc/CT45KJ1ycZDyEtK4CxqT
         S0UvDC6Ck4i0y38kMcdWisYep5/QDid1xr8Z91Yqtees4OJZvlaJYd4RhESKQKjLh2hW
         IrzTLEFoQzOaK5aTK9rYqG9lCEziSONm2hAxttgNhfc4rAVJXfv9fcizqY3rmSiW2chn
         atSw==
X-Gm-Message-State: ANoB5pkheRqVFUub/44AG7hBWPJRhE5xyEVQHmW4qqgPtoXbrPi3mBoN
	ajeBVXDSFktHGd7wd1p3i+ErJ6mktTdfSCgDNMIuuR1Ff2+xVUqtdP068SyHjlJhuQzu9tOZasV
	nlNA65wJK5PqAjNokdbQ6lJi8MsTVIBZoYRojlE9XhZcCLnhx/IiQl5Dd6MOsoEr1K4SNKYOKmK
	wgtZlBtPjT
X-Received: by 2002:adf:cd8a:0:b0:242:32c3:1ac4 with SMTP id q10-20020adfcd8a000000b0024232c31ac4mr10774295wrj.23.1670849671089;
        Mon, 12 Dec 2022 04:54:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf42nQDzdOs41341g/oCnNb9DF/2GbJEciTucs6HMJgFjirpOZixqohW8CmFKv52/O0ptQ/Xsw==
X-Received: by 2002:adf:cd8a:0:b0:242:32c3:1ac4 with SMTP id q10-20020adfcd8a000000b0024232c31ac4mr10774275wrj.23.1670849670803;
        Mon, 12 Dec 2022 04:54:30 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d60c1000000b00241c712916fsm10435765wrt.0.2022.12.12.04.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 04:54:30 -0800 (PST)
Message-ID: <95765418-69ce-54de-93ed-25e29e6c08ea@redhat.com>
Date: Mon, 12 Dec 2022 14:54:28 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: KCIDB schema for known issues
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: kernelci@lists.linux.dev, Veronika Kabatova <vkabatov@redhat.com>,
 Andrzej Szczepaniak <aszczepa@redhat.com>, Dmitry Vyukov
 <dvyukov@google.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>
References: <182b43fa-0261-11b7-2edb-f379a669bc28@redhat.com>
In-Reply-To: <182b43fa-0261-11b7-2edb-f379a669bc28@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/22 21:10, Nikolai Kondrashov wrote:
> Hello everyone involved with, or interested in KCIDB,
> 
> As you probably know, I've been working on a schema to represent "known"
> issues and incidents in KCIDB for a while, and now (I think) I have something
> we could start with.
> 
> Feel free to respond here, or in the kcidb-io PR introducing
> the schema changes:
> 
>      https://github.com/kernelci/kcidb-io/pull/59

Merging this on Wednesday, Dec 14, unless there are objections.

Nick

