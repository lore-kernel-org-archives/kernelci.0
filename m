Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DD3BB30
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFML5kFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701879680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnDM1HJKqWOdQigrGIN1Lmh2VUfuZ+5e9f0FasCk2Cg=;
	b=aFML5kFJGwHZIWgcTf1/mGJfW+Nc+JwLd0ID7Rss04gY+24QmOs9Y7IJ1dsU5a16rZkerZ
	uLZZ4FnZaHyAW1dVLtwBQyhCJJBRepWjtd0l0F1vNt3V51Vyzdl96lmg1BGRg0/wMVnavc
	Y7lixbDME8qIOuIpr6N5IBcERzw7mlA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-OBODaQwIOQqV_bTtVse7MA-1; Wed, 06 Dec 2023 11:21:18 -0500
X-MC-Unique: OBODaQwIOQqV_bTtVse7MA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33335c6d495so744248f8f.2
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 08:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701879677; x=1702484477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnDM1HJKqWOdQigrGIN1Lmh2VUfuZ+5e9f0FasCk2Cg=;
        b=H/fwx2XD+Oz3C0py7vJ1UejGKHP5jo5AzpiA7JTmxmYgU9tWg8Oi7Gk+eOP+8CsJb9
         SKGenAzzglDfjjnxf7eNs/REFO7IQp49kshOCq4R7G+p9A2ItdjRQ7dr2qL5Yen44DA9
         Jge+yMYgeKAzHAKeKgCVy0FsGfTxyCpbGUiF5m2z4Bzysbj41eWKd0XcW4zD+veZ5ID2
         MolKVGpMCBu2m3ldGFwvueG4ptHovATDQvEIwNGZVjPXe9BJ8GfeaevOAG1KhCCk8FvN
         i/OkDysbhoQ5iCuSASst4DtTcaXBTZF73JWvRURCK1BXIJGy37DVtYa/RZ3EunnqbAk2
         iC3A==
X-Gm-Message-State: AOJu0YxvV0MMheSt4hLlad5SBw/fZEcyHOMTLbENbz/Qo6X0J1oIqe7k
	cz6STcaRdpWx+earLOmq57Z5McAP5dlUphNSC/9gbdDYOfS7ByooPAoWo1+il4VvfSmShyB7gqk
	8bEj18jlCbwiQ39Rj3vE=
X-Received: by 2002:a05:6000:104c:b0:333:381d:6a26 with SMTP id c12-20020a056000104c00b00333381d6a26mr659630wrx.135.1701879676953;
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0M8npnzyq3aNQOSPp1ixrdvrLxRqjwbHwEtuDDUKK7QuZkJOge4GzDtikk9SdC8IxUFmI1Q==
X-Received: by 2002:a05:6000:104c:b0:333:381d:6a26 with SMTP id c12-20020a056000104c00b00333381d6a26mr659614wrx.135.1701879676675;
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d53c5000000b003333c2c313bsm46918wrw.100.2023.12.06.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:21:16 -0800 (PST)
Message-ID: <5baadfe9-089d-4802-8f9f-5ed49103710c@redhat.com>
Date: Wed, 6 Dec 2023 18:21:14 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/10] MAINTAINERS: Introduce V: entry for tests
To: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-3-Nikolai.Kondrashov@redhat.com>
 <7181366346c744a544515f69b1c21d5dba6ab25a.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <7181366346c744a544515f69b1c21d5dba6ab25a.camel@perches.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/23 20:58, Joe Perches wrote:
> On Tue, 2023-12-05 at 20:02 +0200, Nikolai Kondrashov wrote:
>> Require the entry values to not contain the '@' character, so they could
>> be distinguished from emails (always) output by get_maintainer.pl.
> 
> Why is this useful?
> Why the need to distinguish?

This is because get_maintainer.pl seems to insist on *always* outputting 
emails. I guess that was its sole original purpose, and it stuck to it? It 
kinda makes sense to me, especially given the name of the script, but at the 
same time, as a consequence you can't query *only* the tests (or anything but 
emails, really).

Therefore we have to be able to somehow filter out the emails from the 
get_maintainer.pl output, to get only the tests. Email addresses *have* to 
have the '@' character (seems to be the only reliable thing about them :D), so 
naturally I chose that as the way to distinguish them from the tests.

It's ugly, but considering the get_maintainer.pl legacy, it's good enough.

I don't mind changing get_maintainer.pl, though, to stop it from outputting 
emails (e.g. given an option), if that works for everyone involved.

Nick

