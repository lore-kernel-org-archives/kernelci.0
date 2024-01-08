Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69814276
	for <kernelci@lists.linux.dev>; Mon,  8 Jan 2024 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOP41iJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704710553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+r2fYi5GswwOIpq/KUCbsfARWs5bIzb/5yg8FLKiuo=;
	b=XOP41iJxNDBRT1Hc7O5oCKPkHY4cTF6Gbh2IhR8w3kemyn1t+Rc9x/s+zarCFIZo6nGtWD
	0hXwYt1lgJReMHHvODkcp+FjL1N571i9KRlfGHaua5D4AeFNwSuaG/4gSIxrEf974UPKr5
	LUCzaz5Wh2pO/iId107WuSuxbjWsUjU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-xbOJDO44Nd-vQHDonRxFag-1; Mon, 08 Jan 2024 05:42:31 -0500
X-MC-Unique: xbOJDO44Nd-vQHDonRxFag-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7816e45f957so317791785a.1
        for <kernelci@lists.linux.dev>; Mon, 08 Jan 2024 02:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704710551; x=1705315351;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+r2fYi5GswwOIpq/KUCbsfARWs5bIzb/5yg8FLKiuo=;
        b=cQPZhp4E4ssCqqWsrq1z97xndowst0WtQZFRsNtQ9xzfeAC/BUjYyLJAmZSV54mNvG
         tUnqfsmC6va9Pn8LrUBQViCnIz9sA9Md4vjIILsO6H/9eUXoDC1Cl4W2O+KTFxBl1/TB
         dWc6pj2BNTX0qDbjOY/Jxxi6WQ7Y+sUM4el8MVWSAaLqKLbIdvurYKs/yTwswgnd9Q4b
         hbd/8cdUBVig8JDiDAW33a4k0KV0rdNpXFxiRaOzcH7Ji+a00CSf8Q/U0naM/VTf6FZE
         qjGXWvQBZpQqEqcvVkrZERd0kmyh/xVItJf2oyycVYcMytQi1cwPOWHnAgYq9w3H5kQ3
         BQTQ==
X-Gm-Message-State: AOJu0Yy6+xFqeolqb4g5QpPuVUDckPrx5ZMbsad7Ta6Ca0K6IMl95WLz
	riV3/MFskVRMUVF9tM5xpCjLe+w+70UiZhta6U2AOOcgx5B9iQ2shHrS5XmBVBUHb0iKk9EoR9z
	X7Y3HXu7PXea+iJZvtJ/gBzo6W3Q=
X-Received: by 2002:a05:620a:5343:b0:781:577b:7572 with SMTP id op3-20020a05620a534300b00781577b7572mr3517193qkn.67.1704710551409;
        Mon, 08 Jan 2024 02:42:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkW4yie3FuTD9oNS2SS1mGtIhe2UW2QQqteBJuOJDUuID0HDhy3F+KPbsT61NUAUiMF7Q4QQ==
X-Received: by 2002:a05:620a:5343:b0:781:577b:7572 with SMTP id op3-20020a05620a534300b00781577b7572mr3517186qkn.67.1704710551175;
        Mon, 08 Jan 2024 02:42:31 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id g17-20020a05620a219100b0078327d52206sm146382qka.63.2024.01.08.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 02:42:29 -0800 (PST)
Message-ID: <d2e2c852-aa6c-42b7-aa73-1b366dd48fcf@redhat.com>
Date: Mon, 8 Jan 2024 12:42:24 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/10] MAINTAINERS: Introduce V: entry for tests
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 20:02, Nikolai Kondrashov wrote:
> Alright, here's a second version, attempting to address as many concerns as
> possible. It's likely I've missed something, though.

Happy New Year, everyone! Hope your holidays went smoothly and peacefully.

Is anyone still interested in this effort? Any more feedback you have in mind?
Something to change?

Thanks!
Nick

