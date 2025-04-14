Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB542750F2
	for <kernelci@lists.linux.dev>; Mon, 14 Apr 2025 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640611; cv=none; b=IiTH7RBkH7Qybl0ROmR2wVJwQHzz9qoxE0VCm5ZzjzMa87WP6JRZLdVIN+3n+RbVk7M07mbiyqzWwP+nywoosaDUjFY/DDQh05A47NvwqN4v2/oz7N27yciiytQzHaNPXJHpxAHFg05ZLKgsWlZq+O5qRzoWLdLgjgg+xVNjf90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640611; c=relaxed/simple;
	bh=3HfnSoykwQBm4O7rJnPBrjQ3MLdN3ezVDIcUNH99Mwg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=E4ANjhw66/vvQeEwKDPtxO9mhUnDKNccVOBuoTqDtuSuojkW031NsnQ0rq5FGTd+5nTdBEQklAaXdyo7WcpxQhHKv0F4gDen8PA++2Dhe7SL9z6Eq/yN6BAshfmFgrM5EyT4DSgXhYj8wEOn7Hk6z4Fm7LZm/jURK2cd+WjSR8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtShg9rX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtShg9rX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso33618105e9.2
        for <kernelci@lists.linux.dev>; Mon, 14 Apr 2025 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744640608; x=1745245408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HfnSoykwQBm4O7rJnPBrjQ3MLdN3ezVDIcUNH99Mwg=;
        b=KtShg9rXAw8oK6QrHzkgtBldgZYKtz3YCGoPr3z3Y/aE2e9Mn2UZD30X1KI1OeZ+ii
         EUtvOr28wgc+jUxlvc7ttcFdbWw23idxX2feA3BpYa0JsTVmzSgcq31dwFKy61rwXB7V
         hZ2cY0GKu21TwWnwbHc5zEJcO3O7oM2YUPM4fLQmnlSExTThM93GpJigxLUXFpdHIp+m
         fI8kZCHI+mJYjheOtZJJNtI2SkTiK5Yi5MiJQuV3bhaBoXJUYeo+pjpvHxQPfeX1V+ju
         aONu6E3b2Opsb2CzqSV0Z104DtA5H8fbW8tQwP1MUnlW610b68hxA5i1nbdYIyB3XqEA
         xB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640608; x=1745245408;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HfnSoykwQBm4O7rJnPBrjQ3MLdN3ezVDIcUNH99Mwg=;
        b=fBUaLsHScPRPOU44Qds58DAx4FdR5E6MxmZ9wHofZzfY43Dx2YgDaF9IOtKbAZxiId
         q1+j3yKkcVIhjqKSEFDFLVT5xeo18mqVh1u8HU+O9lvBi2Wf2ltAEoHbxErOV8C/2yUK
         Qlz0Zs8Vx+IMIZ15iJeFTrLYAUsl11UJwM34MRJ32elByLieJ3tICqoS+UMPbn9IUdR5
         Ehr19wH+uujqYZZzbcNrF0l+IyBM95sKYEoL/3B8MtIeFU/bWeAC3BYR3/4Y0HpFgdIr
         oOZIW1TIHoxkv4gLZzS32ce7GBHCB7YapW+LGrxusKRpewKk5aetUZsV4PKVtuJhUBbQ
         y8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVqMRkNeAIperVdq0PdKDhB3FpsFtbuHO8eJo4plgwqSaEuzz5HT0tFaacS6I9nFoKX0Q0j3QReQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqlEOIv7Jw4rWzBTcHMkaiOoWOa5MnRDx4eR/uAeajuS3zMMc5
	hXlhZc8AZqJb7LDcWtIjRi75w1lgWKt7r9uMyOjOKY3F0GGudTcx
X-Gm-Gg: ASbGncuRpdAItaSIuSYdM5EKHq7/+KILAIKlNMolCKwDmq5WjUvh7cM0Qf2lG2rEO7V
	oasTiEDpclG+2+7dAa/MJsHzEN4/vhxMnMxj2Tvds6ih7mPKkqj6Wg38HBUPPdZSGucu47XZFiH
	qffgQLXR9/cTLO6+35LhFD/f6+uPGqP74UjIYFR+PfDwu6DKYb+ff+rp5GAgVPbhOY0uAqqYcIr
	+0Wd8Nr5xWrRkfw6qtzU3MPYy/RSTSVTXOzqElcCl072QnSqt69psGodxbJsAcOOsANaGorUeWV
	czDOYXq/XvwbYbUopLpAdiKBDIuqmY1gYdlz2AXyibNTfbfbfvgCLuHNuI1HjgOvyBqQmd1eGAE
	/
X-Google-Smtp-Source: AGHT+IFqTY4s1prkZ90gnxE5B1a168CDJ+OcsCJZGddzRXEsCZ/zttjsa5lEciBlp+mCphfu4/1vIw==
X-Received: by 2002:a05:600c:3ac4:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43f3a93cf3fmr113964455e9.11.1744640607520;
        Mon, 14 Apr 2025 07:23:27 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963fccsm11072634f8f.3.2025.04.14.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:23:27 -0700 (PDT)
Message-ID: <43f4fcf5-647e-4d2e-957c-a861fc458257@gmail.com>
Date: Mon, 14 Apr 2025 17:23:25 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: Stepping down
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io,
 Simone Tollardo <tollsimy.dev@protonmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, everyone involved with sending results to KCIDB,

I'm stepping down from designing, developing, and maintaining KCIDB and its
deployments at the end of this Thursday, Apr 17, 2025.

Afterwards I will still be available for questions about past work and for
opinions and advice, but I won't be working on the design, code, or
deployments anymore.

With these please reach out to the kernelci@lists.linux.dev maillist, or throw
your request into a channel on the KernelCI Discord server:

https://discord.gg/Xz95Wh6p (link only valid for 7 days?)

Thank you everyone for the ride, it was awesome!

See you around.
Nick
