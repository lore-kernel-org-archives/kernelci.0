Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A4C19BDB
	for <kernelci@lists.linux.dev>; Mon, 23 Oct 2023 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gSMtnBD6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698064482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=749HwME0c9wbHgni4/eKqEcZ4e2a0x+WnrEqVdyYKu8=;
	b=gSMtnBD6RSpoyYg//JK220Q5vgOZXXKyXAwCZUJpHhwiI8Hd16hwT0HkOLSZxxhwVCXoim
	Dn/74HQpZFlqe5dZliC+Tb2gbEp+qYhTiC99r2RyOvq2yNpfvMBs8tPfl3C/RLwuGxf+m/
	GH3bzXQ8jBPN4k9Vnp4f9RTUgbedefM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-LvdLSfgzMzGcKM5jf7S1Ig-1; Mon, 23 Oct 2023 08:34:36 -0400
X-MC-Unique: LvdLSfgzMzGcKM5jf7S1Ig-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66d026cae6eso51054776d6.3
        for <kernelci@lists.linux.dev>; Mon, 23 Oct 2023 05:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698064474; x=1698669274;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=749HwME0c9wbHgni4/eKqEcZ4e2a0x+WnrEqVdyYKu8=;
        b=s7usQ73i8qxMmI+te5WuyLXDTp0wUpO+XHp2LkgFOryb7UjcjDjqhV4BhR/7SOdtkR
         TBPsmnzGE9Q1M1o/meQyIy3L0BY1/DU5i4B+ID5cKYuQgNgN2L0dUl+dwZuusIyGuqgo
         4mvtfLiRe92XVoaKv/gEoKMQnmhFyJN7PM93D0v+a2wTmNbY67+Ui5F6k2GjHU5Fka2B
         FcT+kzgIGX5XFYOk8IumCvO+YTNDxe2aVjasqK8+uvkB1/FiugJIHye4bgKXdg9BPQMf
         h4Q51iIwECU5P1eMpnb2OJftQVYMUculqrFwu41IoXCNm5RAPK2+RPkrQTukm1qKYeKI
         tiQA==
X-Gm-Message-State: AOJu0YyGpahtJ5SxXdROoLbSIiNtNjw/61iSnSdBwmucY2JoiTK7QF/Q
	AQpOeJqVnWNeTkrcxBMkR6bHMSuqbfl5eWzH8Z6gD6XSXCG15xZgKWGR5FKpZeu2XFBW1O5perY
	hvgjkwEpwKfyhlIsG39HTwZZXPYmM5ydIx+4LdQNiYS4Y5bOpnHOg0eW0aQhygreqM5VKVk0Qhn
	n2FT4UyTlFgDQimr2tX2k=
X-Received: by 2002:ad4:5c62:0:b0:66d:145b:4591 with SMTP id i2-20020ad45c62000000b0066d145b4591mr10696218qvh.27.1698064474766;
        Mon, 23 Oct 2023 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL5UOLqgy7qWPBHffcoJo9PCp3KQvq3xvLNDEOWqc0GSh507gt0erizEBkJWxWNcNz3W42Zg==
X-Received: by 2002:ad4:5c62:0:b0:66d:145b:4591 with SMTP id i2-20020ad45c62000000b0066d145b4591mr10696190qvh.27.1698064474476;
        Mon, 23 Oct 2023 05:34:34 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id r15-20020a05620a03cf00b007742c2ad7dfsm2669300qkm.73.2023.10.23.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 05:34:33 -0700 (PDT)
Message-ID: <d2e2dfc9-2d67-4d23-8729-28bf683e276b@redhat.com>
Date: Mon, 23 Oct 2023 15:34:30 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Add timestamp metadata
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: kernelci@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>,
 CKI <cki-project@redhat.com>, Mark Brown <broonie@kernel.org>,
 Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>
References: <df217387-5e45-4b37-957f-5474a34af1db@redhat.com>
In-Reply-To: <df217387-5e45-4b37-957f-5474a34af1db@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/23 14:14, Nikolai Kondrashov wrote:
> As we're working on transitioning away from BigQuery as our main database, and
> lowering our growing costs, we have to implement data retention policies in
> order to maintain performance of PostgreSQL as the replacement.
> 
> For that purpose I'd like to introduce a concept of "metadata" to the KCIDB
> I/O schema. Specifically a timestamp field for each object. The change will
> bump the latest schema to v4.3.
> 
> Please respond with your comments here, or in the corresponding PR for
> kcidb-io:
> 
> https://github.com/kernelci/kcidb-io/pull/76

I will merge this next Monday, Oct 30, if there are no remaining objections by 
that time.

I'm already finishing support for this on the database/API/tool side.

Nick

