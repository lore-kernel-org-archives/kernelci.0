Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF31C6FF6
	for <kernelci@lists.linux.dev>; Sat,  6 Sep 2025 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757160567; cv=none; b=FkL/EFhdyknvD1gPqBYO5708A5ZIs7oRedCO9ldd6boEMYq2eBXLb3PISI/4L0fs/O9wiLVpCs+iURHAK5pq9vRpgBnhoKjYbKUrgT6Gg1T+WA7FfcGkiaW7RxLBptovZ5ha146P99zFzYufBlrgSfThYaX3qVrMD7EESV8Ag44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757160567; c=relaxed/simple;
	bh=NfSAV17gq6P49MDEiIAROen37Pr5jhSrH09siCYYgM8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=keyZCmdfRSRbjs1tQA6Jy8NI0Dvp8UOPBfUK1oYuYC0zhceKb0n2eIBVWKzFzJIgHlrO9y9YE9KoV2lIEE1YPdwiq5+TamL7qXXkH7Zy6HNW4SljCwlZns/xSfQA+VP85hTe2d4wqosmjcEXqXfoHlMB3HdkSNBHsNeEFzbvbrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=iI548alx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="iI548alx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1135443908;
	Sat,  6 Sep 2025 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1757160556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+sc5T3pRr9QuDSlUKq82ak64D/SPDpzIbLntRCuMzM=;
	b=iI548alxLeR0E+LEC3tD0sN003499ocR8qzM8UrWpShk+FVjchWH0V1HosBltZ5Bwz+lcV
	74w2StavtV0WPdiub2l6Fx4IQp+gg10FF1SDBXmokq21ZIrtIxsitzB9+RVPTrquk3UH2f
	GqPGVJ5VyCykHB0598qKzIyYU678aVj47RXEqjCvj4Xh0gwrjLMplW+RCc8KwOiBYoXlLG
	7F6VaKPbv+ufR16/8yB8b5ayrSqzC3zpNuZofZVnFqzBAbgIu0u4YAaXjrrPNc4r15dU/E
	0aHnXtsSkRefkr4kof1ZenWt7NcE0h8CQkiq4hahtQ+OhQU1xNYKDirTybxMng==
Message-ID: <de0ace4c-387d-49c6-98a9-d3b88aaf338d@gtucker.io>
Date: Sat, 6 Sep 2025 14:09:15 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI TSC nomination request
From: Guillaume Tucker <gtucker@gtucker.io>
To: Donald Zickus <dzickus@redhat.com>, kernelci <kernelci@lists.linux.dev>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
 mwaqar <mwaqar@linuxfoundation.org>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <0cae39a1-03fc-430d-b8ab-cd0f1838df81@gtucker.io>
Content-Language: en-US
In-Reply-To: <0cae39a1-03fc-430d-b8ab-cd0f1838df81@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfevfhgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepfeffgeevudfguefhhfefheejkeduffeuveettdetueejhfeujeekhfegleefueeinecukfhppedujeeirddukedtrdelgedrfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudektddrleegrdeftddphhgvlhhopegludelvddrudeikedrieehrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhnsggprhgtphhtthhopeegpdhrtghpthhtohepugiiihgtkhhushesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhgvrhhnvghltghisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepghhushhtrghvohdrphgrughovhgrnhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmfigrqhgrrheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: gtucker@gtucker.io

Hello,

On 05/09/2025 9:27 am, Guillaume Tucker wrote:
> Hi Don,
> 
> On 02/09/2025 9:24 pm, Donald Zickus wrote:
>> (resending text/plain)
>>
>> Hello KernelCI community!
>>
>> We have recently revised the KernelCI TSC charter[0] to establish a
> 
> It looks like the link to the charter is missing.
> 
>> more effective approach for our future work. The TSC will continue to
>> monitor and provide technical direction for all activities and
>> services related to KernelCI. Additionally, with the inception of the
>> Infrastructure Working Group, the TSC will serve as the primary
>> interface between the KernelCI community and our key users (kernel
>> maintainers and developers, hardware/cloud vendors, etc.), translating
>> user needs to the Infrastructure WG.
>>
>> The updated charter requires a new committee to be elected, consisting
>> of no more than four members, each serving a one-year term, with only
>> one member per company.
>>
>> If you would like to nominate yourself for a committee position on the
>> TSC, please reply to this email with your nomination request.
> 
> Thank you, I would like to nominate myself.

My first contribution to KernelCI was the automated bisection tool in
2017, followed by the blueprints for the new API (now called Maestro)
and more advanced bisection at LPC 2019 before focusing on Chromebook
enablement at every level, from Depthcharge to a scalable LAVA lab
with a dedicated instance running Chrome OS user-space.  In parallel,
I was the initial TSC chair and then Board chair from 2020 to 2023
during which time I initiated the Sysadmin WG (now Infrastructure),
the community survey, the new API roadmap as well as the RFP for the
new web dashboard.  Since I stepped down in early 2024, the KernelCI
team has been through a healthy renewal while I pursued my own path
and worked on a fork of the API called Renelick with several
use-cases related to automated kernel testing in the continuation of
my earlier work.

As of today, I can dedicate some time to contribute relevant
experience from an independent point of view and also expand the
outreach of the project via my growing involvement with the LF Energy
community since Linux is also present in electrical grids.

Best wishes,
Guillaume

