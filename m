Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEF199956
	for <kernelci@lists.linux.dev>; Fri, 13 Dec 2024 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081727; cv=none; b=VXlSCT5emtjEvB7oqEjh6GIOifHwEPVY78nQzlXbj214TIoTzDOxSPRLbb7LMGjABbdh9MIMTYBxFnLs2LsUO07nuZzmsKJdPDhYEm/orlm5PBsQRn+BS+85Nm7qfZ09VCNOPk3ndAGXduSlsKR6R/iuHSxeojCN3oNSc1om99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081727; c=relaxed/simple;
	bh=Tefjj1WIrrn3d1by0JezMExKStFLZo4V8zt0H270al0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NXOiijm/YyNV/xBQt2Qk/m/BinPrKTGWWYhi4ChNESFCPEsJsqotSIZ+AmqYLFlCEtX1KnanmIVxRjVcnw9xr2dJFhDAv0fOqRHcsBMtl+WGIl4fT7A5P4LxVtm1dWZOIQkPzmfRy40whJyP5mT+Z58OftuS0UY9Lyo+IXDBh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=DCvQUcf1; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="DCvQUcf1"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17195FF808;
	Fri, 13 Dec 2024 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1734081717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQWApN/JZfQ40f2B6hIEsk+lmCBbxs6l6RHvE910Rug=;
	b=DCvQUcf1zVAoR869w+4DnQ5+C7LBtrWTqnkjP1ZOdOhcjpVJfWm1KZlnfHaCff/A67kqHP
	vLN8LlPZHWycL81nhDnEw+Aa63kYcFNfA1jmuJPuXsFrjtXDw8Tg97Icqv+jj8ylti8Tfb
	NrkQMKQGO2/qfoXH/UvlfPmZGauSrmyiKRgm0CYzhVkbhWy+/z8oszWxzwnk07oqf40l0+
	Lw8zQDTJbOW5tB7zZngf7/R9/6zwg1l0VlFAmmIyEZalnL4fA/Lf5UYhhjfXkTxgzEmhsD
	GB4plKioI09OoeDX0V9A0QDNWT3jTVQTrVbdp6IWSnk9BoxNp5Rwl+DO55scoA==
Message-ID: <93e6a57b-9b89-4319-b52c-26f89333c0aa@gtucker.io>
Date: Fri, 13 Dec 2024 10:21:56 +0100
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
X-GND-Sasl: gtucker@gtucker.io

Hello,

Thanks Denys for the comprehensive weekly news.

On 11/12/2024 10:53 pm, Denys Fedoryshchenko wrote:
> - **New Pub/Sub Subsystem Design**
>    Work is underway on a new Pub/Sub subsystem to address fundamental
> issues with the current implementation, including non-guaranteed
> message delivery and the lack of load-balancing features.
>    - The new subsystem will use Redis Streams as its foundation.
>    - It will be backward-compatible, requiring no API changes, enabling
> seamless migration for clients.

This looks similar to the Task concept which was introduced in Renelick 
after the initial fork, see some WIP documentation here:

https://gtucker.gitlab.io/renelick/tasks/

Some polishing is still needed but the main concept has now been 
stabilised.  Basically they rely on message queues which guarantee each 
message to be delivered to exactly one consumer.  Any API client can 
schedule a task, typically this is done by an orchestrator service, then 
the task object will need to be accepted by a single compatible 
scheduler which will be responsible for executing it.  If you have 
multiple instances of the same scheduler, it balances the load between 
them by design.  It also makes it possible to implement retries and 
other features related to task management.

By contrast, Pub/Sub events aren't guaranteed to be delivered since 
they're not destined to any particular recipient.  They enable a 
decoupled, modular architecture where you can add and remove subscribers 
without changing anything in the existing system.

Let me know if you want to discuss it further, also I'll be covering 
this in an upcoming blog post.

Guillaume

