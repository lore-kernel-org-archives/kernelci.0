Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F6219A68
	for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713556; cv=none; b=I/rgd2YcGitCRLNQSyATWPucpt9dgDFmmU25pUmDyjtO3jx91q5vlXhMtJrzrv/6rThs0PwynTrr3jRLgMDy9IBSmzhYGlgzJ1aHNdx0uErxiNzBU6sUdoXQaYofGyHSHf5/6704BAIsWkOBLVyPsggmdnkdgE/9n29ns5WQzg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713556; c=relaxed/simple;
	bh=UfgS02pAUa+ePGgnieVixDzw+SBCOXQQt8HCa4cH8wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y6daftq8AgXcA3X2i0eSEj3iOrqF+if8IXQ/pSsx85Tu7+JBD1ygJkBHOz4RyDM96fTk2pWy7bvqPUGK4ZjsEX0JpZrz/PExjOVAce9mlaRYA2Ld2kO+W2EXDrrcFy44dmxBtlhbDWjDPIVJO7w4srD5ofVlB0xflq1yJNa10RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=PcNvVS3f; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="PcNvVS3f"
Received: from relay0.mail.gandi.net (relay0.mail.gandi.net [IPv6:2001:4b98:dc4:8::220])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 0F2255801A4
	for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 10:06:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6826E44089;
	Fri, 24 Jan 2025 10:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1737713202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzTKBK+WuPNtIv4dZRT1MpAuGWSso9ZmNuJG3gF30dg=;
	b=PcNvVS3fiB9WUYWNntZ3xFdrqSZhcDoO7hd9bWNECuW0Z8RciPMEpYBSVZD4TdySNyp8HN
	s4QBf8FTOssSp3icPbwODEj3ztMsZp05gGuepvfkpQ/+mfBRLQU5E++oDoZwr/VHeeM6yE
	SQfxbqR3BrFvDmwzHGuCfYgF3ptRFpPM7YIidtoLrwnf/XV+lM6eOFSiBcrngms8APiWkX
	aZWq7Qicy8WNXD+4A2l6h7JwtN7+xScoMiTEdrBSywby1DsoBN6MfHCId09YymiHU30vel
	mwqnnloxd3SXhMhAtUKc4eJz8qsE/kvQXtuPwa0YHb55ILTWE2t1XxUUc02CnQ==
Message-ID: <9a24892b-f123-4259-b0b4-34557491b862@gtucker.io>
Date: Fri, 24 Jan 2025 11:06:42 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Weekly Newsletter (Week 50)
To: Denys Fedoryshchenko <denys.f@collabora.com>, kernelci@lists.linux.dev
References: <4fd04778fbcbe65d889fb68ebaaaed4f5ff6ec69.camel@collabora.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <4fd04778fbcbe65d889fb68ebaaaed4f5ff6ec69.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedggedvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpefgveffffeutdehvefhvdettdehudegueejkeelhedvveffteduhfdtkeehgeegleenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgthhutghkvghrrdhiohenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejgegsfeemvgdurgdvmegsvgeisgemvggvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejgegsfeemvgdurgdvmegsvgeisgemvggvfhgupdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejgegsfeemvgdurgdvmegsvgeisgemvggvfhgungdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguvghnhihsrdhfsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepkhgvrhhnvghltghisehli
 hhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: gtucker@gtucker.io

On 11/12/2024 10:53 pm, Denys Fedoryshchenko wrote:
> - `/latest/docs` and `openapi.json` are currently returning a 500
> error. We are investigating the issue.

Not sure if you've fixed this already but I've hit the same issue
with Renelick.  The workaround I've found was to downgrade Beanie
to v1.27.0 since v1.28.0 which was released in December appears
to be breaking Pydantic validation.  The latest Beanie v1.29.0
also shows the same problem, and upgrading Pydantic didn't solve
the error either.

I've created this GitLab issue to keep track of it, aiming to
have it resolved by the end of next week:

   https://gitlab.com/gtucker.io/renelick/-/issues/133

Hope this helps,
Guillaume

