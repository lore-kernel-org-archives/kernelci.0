Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16756322A
	for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 13:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669729068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SCaSE4Bisb0C6e5jKpGVEzDdYv/tWH+zbWIpsjAqrFo=;
	b=YCtQa+SbZo8dFL61RJX9sFTFlT25JeO1GBgSMjwnOeA5Ton5qi0f/e6zG5V9Kx/JlMo+KT
	mcH0k+UTfwvKCADFwCpK52v9B3iyAUxCdAnrNxbsJqGNoHF2KJrfYD9i8gimTZmOK6aJ1V
	iE1+wXP0nHbkbnXqwvPPWboq7cjqJ6w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-dByJqlM0NbOjEIembV6HOQ-1; Tue, 29 Nov 2022 08:37:44 -0500
X-MC-Unique: dByJqlM0NbOjEIembV6HOQ-1
Received: by mail-wr1-f71.google.com with SMTP id w11-20020adfbacb000000b002418a90da01so2798887wrg.16
        for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 05:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCaSE4Bisb0C6e5jKpGVEzDdYv/tWH+zbWIpsjAqrFo=;
        b=PsVVu1tOayGILGr+oRRUUKR/vd7imXOB09hETU0gXVTNGuCau0prFJEkwLsST9LkwG
         mawl7/eRkSSfvYuvpxFgUEB5Te/8gS3WVzKzz6K2VcvnumFjrmslCTGmrfhlOybGtiEW
         qBVip2M4dNtySMxfZvN7Y6g381odZiD2K6R3II35vLsyCX1pQNfoSDFPCygLiiabopv9
         pAu8jj7K10C+NBit6Nc9EbkaOUthFpxrOIkixU9vH7J1Pxf1X8+C9pBZn/Bg5Uw5IKCk
         TzjczC34kBI0zddj6025QOl9RgVtkszh/mqjuA4v1f1XpGXOWTooc6ejB6Lrm3G1dHHW
         1i1A==
X-Gm-Message-State: ANoB5pk3khZZ1n18uRg7sFoQBKNmBfNRG4yodYZFeqezUteB4oSx4Dpl
	/2BXJVpu2lNjlNr5chVtlnHFKuY/PZ7AF4wFmKQ8GpHNNwdStqaj5mb8TP0E46s9tIxV1Kqs5eU
	ANKX8jWOqbYqZidDQy69gpWIpFkPSelLMJldzRNw9jvCFUySiv3/cICfkl3g8gOz8MUmbpEETDT
	mmL2cnm4Oh
X-Received: by 2002:a05:600c:1f1b:b0:3c5:a867:e59f with SMTP id bd27-20020a05600c1f1b00b003c5a867e59fmr26821573wmb.146.1669729063055;
        Tue, 29 Nov 2022 05:37:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mNGBzhMsqkheI5W62bt9AuQObVXtwjMVh01n4Ds9IzF3xvXHfO7XiE3KUxE2ky9Cbc160Eg==
X-Received: by 2002:a05:600c:1f1b:b0:3c5:a867:e59f with SMTP id bd27-20020a05600c1f1b00b003c5a867e59fmr26821548wmb.146.1669729062768;
        Tue, 29 Nov 2022 05:37:42 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id b10-20020adfee8a000000b00241dec4ad16sm13570736wro.96.2022.11.29.05.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:37:42 -0800 (PST)
Message-ID: <2fdeabb7-3902-c325-f2de-ecd77227a162@redhat.com>
Date: Tue, 29 Nov 2022 15:37:40 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
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
>      "incidents": [
>          {
>              "id" : "redhat:702958255_x86_64_debug_upt_6:1593:1",
>              "origin": "redhat",
>              "issue_id" : "redhat:1593",
>              "issue_version": 1,
>              "test_id" : "redhat:702958255_x86_64_debug_upt_6",
>              "present": true
>          },
>          {
>              "id" : "redhat:702958255_x86_64_debug_upt_6:1593:1",
>              "origin": "redhat",
>              "issue_id" : "redhat:1593",
>              "issue_version": 2,
>              "test_id" : "redhat:702958255_x86_64_debug_upt_6",
>              "present": true
>          },
>      ]

Correction: These two incidents (in both examples) should have different IDs. 
Otherwise submitting this data would result in a single incident in the 
database with differing field values ("issue_version" and "present") chosen 
non-deterministically.

Nick

