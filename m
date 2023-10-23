Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D914A99
	for <kernelci@lists.linux.dev>; Mon, 23 Oct 2023 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AfQvEstp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698059700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZLfctlRyNeTcc25g/JQXZaSbQYuP+VyVaudnPbp2gIY=;
	b=AfQvEstpdUzaUbD2eMUa/HVcAhOnpuH+SlLHsrXGW09qTOUnzxA3O5OAZer985ZbPBnyTh
	oPRNCQT7oAt7BSRY9z3rc/pwbez1nqZS/qXEIYAltyamt1VDVKTg/tDHb+uohVWCuSbAOb
	ri4EPP0dUzVaAxBKNVRss4TO2ItrAo0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-7ezu4uXsOp66mJFyc6or9g-1; Mon, 23 Oct 2023 07:14:59 -0400
X-MC-Unique: 7ezu4uXsOp66mJFyc6or9g-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b2e44c8664so5030212b6e.3
        for <kernelci@lists.linux.dev>; Mon, 23 Oct 2023 04:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059698; x=1698664498;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZLfctlRyNeTcc25g/JQXZaSbQYuP+VyVaudnPbp2gIY=;
        b=PBUDnPemCVPk+yxDVFlSpF6lwh0kth0/nzmDx/14JKHkWGP/4UVuEvpFtMv8ghR0Kn
         w2XIMyeHuGThIFxv1DhkpdGH9SuJEwTCM/UgCcaJnDKWJiB24SPm2E/Dk4GF+7rEl202
         Xx0QJHOD0IjXBwsQRPJTBijprqbLH+oJWo+KE2aM/hqUoIVje1+/v3SjZXTURKqylaqA
         g3HeSgt0r+DQ+XqMqRZ+QULMM1XFMMJMdUA7STO5RduOFVIlDrEyJA2Jw59F15sGI34n
         ZB6qiocW0UfVtNe8XlnHqmU1kkIMsoxQx2BRR2LUx3SDgXKWNGx/41SClu819xor8X5B
         qRyg==
X-Gm-Message-State: AOJu0YzmYc2n7LmQKjCcCqermj6uQjFukw2v6pUpUVuHWKU2CR0DzEE6
	A08drScZfEePDfI3qLkvtz0AxJ+ewdvp2OTfdJjopUPvX4ntjS4nvpCgujWMFm3GKkS6oLT1UQo
	UF8MM5+QIWlKMpeO5E8S4iuha1XMZvbbiUkjtwpw74xt5kDsSUT/whqF/LGc5EIwZX1EfnjKz1a
	0LRqI16TEiY1qEnVDRjN0=
X-Received: by 2002:a05:6808:a94:b0:3b2:e469:904c with SMTP id q20-20020a0568080a9400b003b2e469904cmr9643280oij.28.1698059698387;
        Mon, 23 Oct 2023 04:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESL8+JKSv+fWYkV0lJQ+dB9kNflvM7X7b5qAYVFMZmPrNDy6QPoGuxeCSaTgAURDzjtj0XIw==
X-Received: by 2002:a05:6808:a94:b0:3b2:e469:904c with SMTP id q20-20020a0568080a9400b003b2e469904cmr9643261oij.28.1698059698124;
        Mon, 23 Oct 2023 04:14:58 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id dw14-20020a0562140a0e00b0066d02f0af01sm2811227qvb.72.2023.10.23.04.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 04:14:57 -0700 (PDT)
Message-ID: <df217387-5e45-4b37-957f-5474a34af1db@redhat.com>
Date: Mon, 23 Oct 2023 14:14:53 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Subject: KCIDB: Add timestamp metadata
To: kernelci@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>,
 CKI <cki-project@redhat.com>, Mark Brown <broonie@kernel.org>,
 Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone involved with, or interested in KCIDB,

As we're working on transitioning away from BigQuery as our main database, and
lowering our growing costs, we have to implement data retention policies in
order to maintain performance of PostgreSQL as the replacement.

For that purpose I'd like to introduce a concept of "metadata" to the KCIDB
I/O schema. Specifically a timestamp field for each object. The change will
bump the latest schema to v4.3.

The "metadata" is any field with a name starting with an underscore ("_").
Such fields are always discarded on submission, and are not loaded into, or
fetched from the database, by default. The API and the tools will have the
option to load them, however. E.g. for transferring raw data between
databases.

The timestamp field will be called "_timestamp", and added to the schema of
each object. It will be impossible to submit it through normal means, and it
will be generated/updated by the database automatically on each submission.

The new field will allow us to implement a de-duplication deadline in
PostgreSQL, after which object updates won't be allowed, and the data could be
transferred into BigQuery for long-term storage and public access for
analysis. Allowing only de-duplicated data in BigQuery would let us partition
the dataset by timestamp, reducing query costs for public access.

The new field would also let us delete the data archived in BigQuery from
PostgreSQL, after a while, and thus help us maintain its performance for
notification generation and dashboards.

Note that the "_timestamp" field will be different from the existing
"start_time" fields. The former will be automatically-generated by the
database, and the latter are submitter-supplied and optional. However, when
the database schema is upgraded to support the "_timestamp" field, it will
receive the value of "start_time" where it exists and is specified, for
existing objects. Otherwise the existing objects will receive the time of
upgrade as its value.

Please respond with your comments here, or in the corresponding PR for
kcidb-io:

https://github.com/kernelci/kcidb-io/pull/76

Thank you.
Nick

