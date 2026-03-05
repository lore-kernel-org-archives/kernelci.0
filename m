Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09FB3D3D1C
	for <kernelci@lists.linux.dev>; Thu,  5 Mar 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729267; cv=none; b=ke9bI3FAXKqMxaEzpSN8j+vaRG73QWDPXXS8/7n42LYTvwZ15iX59tBoN0458U62DWGOY9/ErFDGXNR09+wv/wNKg6m30xwLzsjcfowMed1LJkkqdrwG0XjAYN4ZR89f9LNNVDWTMfRf4aFSUdMABrMyBL4+ZIvF+c9THuUFxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729267; c=relaxed/simple;
	bh=5N8ag+FVN5jP+YMxsF4GI+X6kVgyTPm7h3RFEyfGivg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lBFQTlRAWSFy0Zz6jZcgG007aKwGbuvDG6hiy5dlD3gTV4TmT8CMZAyhymmUtdCWym8fVb+OjLxlP2QMB4pn56Pafl36kWICmeScnSb4/O002yMOVcSKtF1pEBRjRL0/1TJVWTdCUeJagUgknWxcM8ZCLWR0+gPAvWjYNWFDLJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=E5EDZBap; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="E5EDZBap"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AFCE3EC2F;
	Thu,  5 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1772729257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npliA9ruDqB9IfcqFGI1xjrERJEyOXamonuNkiYlCzs=;
	b=E5EDZBapEN3nzmGEzkmt3NDChaSyQ6K4fZnV8o3jfBSs50RZEgrk09wm5lrQ/ijhHCLN5t
	/cZRnMRlbFuu7yD8aaLbhEtJv+qVuu+hPm2F2hK0USnQpR9PH228hofEaxamDje5yKOKUV
	K92DpTFQSqQ4nTT4xYjWAHrFYLkSREADr7weMtk2gIB2LPRPakYm7UNmsFox/xUp4w6md/
	/1IAGWg1CqUKkYJjqwb8sEjLv+7++D1Dzwd9Y9sjm273wLrJmmRlwBxMFumiu0IgqkiGCr
	GZRDdLs03Ihz4jih5KuJ68HgtxwPu0BhubIQQme0OFtUwRDzLvDZGRtyxU0c1Q==
Message-ID: <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io>
Date: Thu, 5 Mar 2026 17:47:36 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Meeting proposal for KernelCI Bisection
To: Ben Copeland <ben.copeland@linaro.org>,
 "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeiledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepffdtiedvjeefffeludfhtdfhueehgefgheduheeggeefveegieethfdtueefjeevnecuffhomhgrihhnpehgthhutghkvghrrdhiohenucfkphepudejiedrudehledrudeluddruddvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirdduheelrdduledurdduvdegpdhhvghloheplgduledvrdduieekrdduheejrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupedttefhvefgfefgvedvhfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsggvnhdrtghophgvlhgrnhgusehlihhnrghrohdrohhrghdprhgtphhtthhopehkvghrnhgvlhgtiheslhhishhtshdrlhhinhhugidruggvvh
X-GND-State: clean

Hi Ben,

On 04/03/2026 6:28 pm, Ben Copeland wrote:
> Hello all,
> 
> On the KernelCI roadmap, I propose we start a discussion on adding
> Automated Bisection into KernelCI.
> 
> We have many options and have learnt many lessons from past
> experiences. KernelCI today lacks the ability to do automated
> bisection. So I would like to put the meeting together to cover
> 
>   - What bisection in Kernelci should look like
>   - How do we go about Bisection at an efficient computational cost
>   - What are the options for automation
>   - Put together actions list
> 
> Bisection needs to fit into KernelCI V2 tooling (i.e., Kubernetes,
> kci-dev). We also want to provide bisected results to the Maestro
> mailing list.
> 
> I have a list of people to include on a call. If you are interested,
> please let me know, and I will add you to the meeting.
> 
> I propose the meeting for Thursday, 19 March, at 15:00 UTC.

Many thanks for starting this thread.  I'm available to join the
meeting and I would be happy to collaborate on this topic.

As some of you already know, I've independently made an automated
bisection PoC[1] based on the lessons learnt from previous KernelCI
implementations and community feedback.  This addresses several key
issues that have been identified over the years.  I'm now working on
a first stable release and a roadmap with extra features.  I can
prepare a breakdown of how this may apply to KernelCI as it currently
stands ahead of the meeting.

I believe this is related but not quite the same use case as enabling
developers to run bisections locally while accessing hardware remote
labs, which would seem like where kci-dev would help.  I'd be good if
we could share some logic with a common library if applicable and
coordinate these various efforts as much as we can in general.

Best wishes,
Guillaume

[1] https://gtucker.io/posts/2026-02-02-vixi-and-renelick/

