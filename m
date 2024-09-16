Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883691465AB
	for <kernelci@lists.linux.dev>; Mon, 16 Sep 2024 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726486991; cv=none; b=UMZF/SRROwmUVUh4vLn60QKi9YKS7h8KJ1DaOmi3W7Anu0h2sre+1mNHoOa/Lq65KGC4AcdG2Trz8vAMqEw8g3Gsrfwe4OktYsAeigcuZvTWy8I3lYveK8APXZ+xjdc34nEPFRql9bRFhN4Yz6O0RNCkPq/DxNTw3AGueChzHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726486991; c=relaxed/simple;
	bh=7UMz5cQL3FWSDCicUrSaQrE/2CqTHVRSJo1//9PpV5Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KjCFT2J/mv6AFXwKMvMNZowgmY+YIi6NbJq5jOGfT5kV/2TUyYZxwreb1cGpPHL4+5Fy8lXJLlLoq8BzcFMKFO+gU61DkVF7x1FWHrgUDiDgxKCLfhk9KTcx0mS3QM0iJF1WYcUlZJDoXq1RJUVMvhRJA6shdRc7Da/Hy4l4Hkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYUnswb2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYUnswb2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso33515175e9.0
        for <kernelci@lists.linux.dev>; Mon, 16 Sep 2024 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726486988; x=1727091788; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNq1m8uYP5q5xF3l3xY7VI/ZrVWOlvx02Sb6GJ3b+jg=;
        b=jYUnswb2RE1rhCsctzhT9A/v+/yUjCCpmUPsL2mftAMkGp/iDdbsN+i94r67hKKi2A
         kw2XF0dDPDSn2zjZ5M0XXPqQa6z4cGHeTlRKIaajRDoBBdCgJwPY6B8zS2j/PG4+G/Ap
         jifIdfYJydLsGkNFbz8EtxdzZLxUe4YQgGMQirN8RvdUub+wdLyk4NLuK80QHhleBXA+
         bb8XfK+6IEMI4IAHA5iXx+Zt1iZFL0igc8cdYbe49NmoumzWR1fHh4Ib0TInBEb9kL6O
         B9XdPZIIP1RWvzYgDX5vK7dJJND5dffJeRynEQubjtuswP3YLnD08D+ndpZHTr593TI3
         0/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726486988; x=1727091788;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNq1m8uYP5q5xF3l3xY7VI/ZrVWOlvx02Sb6GJ3b+jg=;
        b=R4PKuJlK+/AfyULyXxWvcGPQgpgcZzA8vpyGhffIE6Y/7zmkqbHZYo0qEQU6icK1P0
         5148ZfFX/Ur+lY3aJrk5xc725ylHycQRX/eSU8DMk1Dqktc7747tmdrPHg8SclF05/a3
         r+qmzx/Oc2cTqliHu2aNWo6KhD8MEmQBBMkQMS8ci5nmUQwt9FuUk2fQsKYaLkgi7xeP
         jbO5C5zcqZL23VmaiU+YVVSzU4BJkH7LmJjPT+V3S4BM4tYqmDbjF73woQiFpxz5Cinq
         V4lLHmnl40LOsTuDbTDD4S7hh71rSqspfnd8uxBXWRU1Slb2liS7lZc9EphU7ZOJvTZM
         tNHg==
X-Forwarded-Encrypted: i=1; AJvYcCWx7X+Dxh02yQTlBpnLWnixd5hgUjnz6kbBcmQXghbqkK0VYVhuYIEF31B5iVQiSVRJ4MCb5qXA4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya1u9Z+3VbRBDGArkgU3k1wg/jLXQEw9a70hTnCNVdlKnS4JtC
	pFOnZQjjz/XbQ0kO24O9lCaMGmesu+vKc5X1XFMW86xlrcxhk17l
X-Google-Smtp-Source: AGHT+IEhecH03Yfxi41gNK1hbdYrmcm5znBdh53eu0xiDAaYM515kwGsvc5oH5TD7C7pSaFidP72qQ==
X-Received: by 2002:a5d:4ec9:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-378a89e6350mr12961939f8f.3.1726486986750;
        Mon, 16 Sep 2024 04:43:06 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b055052sm109885825e9.9.2024.09.16.04.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 04:43:06 -0700 (PDT)
Message-ID: <370c2b62-032a-4997-9ecb-10f58d8f3b80@gmail.com>
Date: Mon, 16 Sep 2024 14:43:04 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support more checkout data
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <9ea96b8e-6490-4541-81eb-8bab011c8918@gmail.com>
Content-Language: en-US
In-Reply-To: <9ea96b8e-6490-4541-81eb-8bab011c8918@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/24 8:02 PM, Nikolai Kondrashov wrote:
> Hello again, everyone (potentially) involved with sending data to KCIDB,
> 
> The previous schema update (v4.4, test data enhancements) is already being
> deployed, but I have prepared more backwards-compatible changes to go out with
> v4.5.

Support for this has been deployed last week.

Please consider sending the `git_repository_branch_tip` boolean field, if you
can, as it will help us move forward on regression detection.

The commit messages would help us make dashboards more useful, and tags would
help us track release history.

Thank you!
Nick

