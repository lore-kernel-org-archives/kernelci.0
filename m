Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADED5111BA
	for <kernelci@lists.linux.dev>; Fri,  8 Dec 2023 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="EpBstOZE"
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A06A3C29FC
	for <kernelci@lists.linux.dev>; Fri,  8 Dec 2023 09:07:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8886EC0003;
	Fri,  8 Dec 2023 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1702026431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwFbi0wTBj2zwEPbEHT5HueBZwuCgRqD9FdrAfEyvro=;
	b=EpBstOZEZl76KznnPXJZR0knfVrXXwQD9k/N1tI4tAM0HTWsna5fmcT5TD5o6f6jeD4Adl
	sLtv/UQExfJnQMEmAQh2vxutr8fMf2f9jSMyDUfLYlaPP98lf/5sxf53qh7UMJeY9kiTIz
	8k8S7IEgIF/p5DrSP/TeGhZJUy2bBVdl8bv2k8u2iJxXsoOAW4zgEeDjzZvo+92ujGFMGk
	MNwYD1eJGGQsuNMaLuHEFyE0Qg4OMSmLFCNL7C0PaKU32k3+9UOHTSAf7aUtRRnYBxCzdQ
	KULVXH61C0nyMYjhQmS+fkm/DRT+FBDuanfBv0FRdzHZkY/cV3EZkIKUqioFgg==
Message-ID: <3eee2197-4780-2240-5d6a-e5ea3f97e6c8@gtucker.io>
Date: Fri, 8 Dec 2023 10:07:09 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: KernelCI API Early Access
Content-Language: en-GB
To: kernelci@lists.linux.dev
Cc: kernelci-members <kernelci-members@groups.io>,
 automated-testing@lists.yoctoproject.org, kernelci-tsc@groups.io
References: <7bc25730-b522-3345-8291-fdbd3ad33ce3@collabora.com>
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <7bc25730-b522-3345-8291-fdbd3ad33ce3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

On 04/09/2023 22:19, Guillaume Tucker wrote:
> Today is the beginning of the Early Access phase for the new
> KernelCI API.  As explained briefly in the previous blog post[1],
> this is to give everyone a chance to create a user account and
> start using the API for beta-testing purposes.  There's now an
> Early Access[2] documentation page with a quick guide to get
> started, so please go take a look there and start taking part.
> 
> For a bit more context, see also the blog post:
> 
>   https://kernelci.org/blog/posts/2023/api-early-access/

According to the published timeline[1], the Early Access phase
ended last week and this Monday 4th December was the Production
milestone.  Unfortunately, for a number of reasons but mainly due
to fewer people available to work on the new API than
anticipated, this milestone wasn't met.  I'm also in the process
of leaving Collabora and ramping down my involvement in KernelCI,
meanwhile there isn't a clear plan yet for a replacement TSC
chair or technical lead / architect.

So while we did make a fair amount of progress during the Early
Access phase, we didn't benefit from it to its full extent as
documentation and the command line tool were not in a good enough
shape.  The list of missing required features is reducing but
some substantial development is still needed until we have an
actual first release candidate.  The production deployment
solution is not finalised yet either.  If more developers and a
new technical person able to coordinate this work become
available early 2024 then a revised timeline could see the Legacy
System Deprecation milestone land in May or June instead of
March.  But this is pure speculation, as of today there isn't
enough visibility to make any concrete plans.

Let's hope things will bounce back at some point.  In the
meantime, please stay tuned and thank you for your patience and
understanding.

Best wishes,
Guillaume

> [1] https://kernelci.org/blog/posts/2023/api-timeline/
> [2] https://kernelci.org/docs/api/early-access/

