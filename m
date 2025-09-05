Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886B2FB60D
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059855; cv=none; b=lxq6ZKElYjQO2PsWhqZu41hz9Iudhf+8HDnABOiTzI1+LT5Z4G9gGu5qtUwKJSIheXYIGh4GuOvurtP3hxskL2QVnh3AX5FXZJwgZTVvsXNdPTgHDD0F3RbiefP3afxlLM7zPFmLgu51sFe3axSY733s4DC+y+MDVDi2pLaVIYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059855; c=relaxed/simple;
	bh=kuDz8IbdhROGYfm8ehuK6XS+XmjprH5YxjIEiy4s41k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs6wZsxPixM1Oay8DjAmA3E1M3Nxnw9IjKQzssdmuandBP0YseZ4cbzO+wRy+5qiTt1nuv6QYfNpqvNq/4xukJBv0NAL5cetDyEWznu5qBH8pAPh7q49MTTq2M7klvGPWhd9k2LVrj4nfHFsyz1rphu4GHwKNz1tDnUqJFCtIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Hl1xr3sx; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Hl1xr3sx"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id B2709580381
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 07:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B85BC43F16;
	Fri,  5 Sep 2025 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1757057275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csr6U8LhzgQDM3k1eM5GO5FXqKAWWrXjnEDmTr1Whho=;
	b=Hl1xr3sxjkvkaRzcPeR9k86NoFx593ZPpRNjnxSAUovlJbqJdy2FXf25Xmnrj8/495mTu6
	4sircx5wZdjelaInCBcxHY7HbNlcClVtQsXXZW+/qRfY17rZSSEi8ykjsM9ZFjgftigEjp
	3E/qM1oOavggwziQ1I98TCjDoMYMJXJ7wMDLQrMbZmxhW6IBCQv7EKuJX04wdBmKS1PoKu
	LedUaSLFWFdeDsdqr9LmjmQSJD6UOp/BYGenCK1H4hHtk91dt8JqqiqDv4zIlK5m3bz4oP
	6JcOe1UYI9ALXP77g8ON6LAz8y2g/w5BbllO4+RoaIhcjTt4icCVug7WfyZaZA==
Message-ID: <0cae39a1-03fc-430d-b8ab-cd0f1838df81@gtucker.io>
Date: Fri, 5 Sep 2025 09:27:54 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI TSC nomination request
To: Donald Zickus <dzickus@redhat.com>, kernelci <kernelci@lists.linux.dev>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
 mwaqar <mwaqar@linuxfoundation.org>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedtjeehjeehffevvdfhffdtfeduvdekvdevveelueeigeekueekvdeufedvjeetfeenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeeijegtfeemfegssgemheejvddvmeejgegufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemieejtgefmeefsggsmeehjedvvdemjeegugefpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeeijegtfeemfegssgemheejvddvmeejgegufegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhnsggprhgtphhtthhopeegpdhrtghpthhtohepugiiihgtkhhushesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhgvrhhnvghltghisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepghhushhtrghvohdrphgrughovhgrn
 hestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehmfigrqhgrrheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: gtucker@gtucker.io

Hi Don,

On 02/09/2025 9:24 pm, Donald Zickus wrote:
> (resending text/plain)
> 
> Hello KernelCI community!
> 
> We have recently revised the KernelCI TSC charter[0] to establish a

It looks like the link to the charter is missing.

> more effective approach for our future work. The TSC will continue to
> monitor and provide technical direction for all activities and
> services related to KernelCI. Additionally, with the inception of the
> Infrastructure Working Group, the TSC will serve as the primary
> interface between the KernelCI community and our key users (kernel
> maintainers and developers, hardware/cloud vendors, etc.), translating
> user needs to the Infrastructure WG.
> 
> The updated charter requires a new committee to be elected, consisting
> of no more than four members, each serving a one-year term, with only
> one member per company.
> 
> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.

Thank you, I would like to nominate myself.

Best wishes,
Guillaume

