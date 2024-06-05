Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415221946CA
	for <kernelci@lists.linux.dev>; Wed,  5 Jun 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582113; cv=none; b=PB6+5f/lpBMEw0vRAddkbb3AZKZwO/c0ql42U28O1MbIx2WluAn4V6aEYh8/cH2A4V+YLzIkuNiKeLjTaAn5CkX7+WFPdCHEyn783UTspg5zxLDz2M7udXv81Yyt6BFlR9PA24ciAwxm/JfuRNKYrA91QdrJD1dp7yKs4w1u1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582113; c=relaxed/simple;
	bh=JQdIW7EifaYiPz4TGzNwlFr7UV07lZAypu+znGdG2W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Mm8odUtUs5DvnshfxWjcrONq5PW/mrVWpXbziG64wBeHdgMcrLmarjZtG3OXFvceffMNhbiS6AUsDYgTb6rLI/SwwiNn1dcvwSJQavtHYl1uMpC9xYf4XRVEMXGdhxdqhFcJSUiaYx/d+FPPAnl5I2wAH/Zn9ZNuHBMAyHy51B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=h+1DulUs; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="h+1DulUs"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87B9540009;
	Wed,  5 Jun 2024 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1717582102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn+h7xpAvcibXjgRDJDZgBSp0UuLVu80VpUakEhqS/M=;
	b=h+1DulUsAkYC8RZb5jVpzaNlh99DALNttNKa1Rh2MZQQzZ2YIZZR4lPQs0qDN9QqJGEyB0
	cQPlJFoz/hI5uen7kYtEmOSPH82GaJzp2wPLP0rNd7vifsJH6FlV4z0vY2oYrx1VrDX8d8
	qvhY06eR5FPyeL+Gok2fQoVrNzAuzVoQcmbE8IlVNeGFO1a35ILRuuf7WOXPuHfHy8jFkA
	NPh5b9DVDqUxp6zGEOXTtvaXLBTMgfKXaSTZ3GslgCb1fePEy1bp+ZsgjDmRnPpCbDOWHk
	IqmBU4EZvkaKHHyawbX4HwWIiI9LInIl5lIRTeg1/l1cWFF0ayJPDa1wTtyYwA==
Message-ID: <8db63860-38a5-482e-8ef9-02acdf13c467@gtucker.io>
Date: Wed, 5 Jun 2024 12:08:23 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New name for new "KernelCI"
To: Nikolai Kondrashov <spbnick@gmail.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <20f8a3d0-2246-4762-a981-4690bf6afcf7@gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20f8a3d0-2246-4762-a981-4690bf6afcf7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

On 05/06/2024 12:00, Nikolai Kondrashov wrote:
> On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
>> As you know, we've been developing the new KernelCI API [1], and the
>> kernelci-pipeline [2] based on it, for quite a while.
>>
>> However, by now it seems that too many things are being called "KernelCI": the
>> project, pieces of the old system, pieces of the new system. We would also
>> like to give the name of KernelCI the project a wider scope than just a
>> particular CI system, and accommodate more packages/projects under its name.
>>
>> So we would like to propose to call the new system "KernelCI <Something>".
>>
>> And this message is about that "<Something>".
> 
> Almost two weeks have passed from my original message, and we have collected a
> number of opinions and potential names. So I went ahead and created a poll to
> help us pick the new name:
> 
> https://forms.gle/GY2uWw3yGLA6u5EbA
> 
> The poll requires authenticating to Google to limit the number of votes, but
> if anyone has a problem with that, just post your response here (pick all the
> options you like), and I'll add it myself. We'll close the poll in a week.
> 
> If you've already responded with your preferences on the maillists, and don't
> want them changed, there's no need to vote again (although you can).
> 
> Our options (assume each is used with "KernelCI" in front):
> 
> Anthill
> Arrow
> Kraken
> Lens
> Lighthouse
> Maestro
> Needle
> Nucleus
> PristineCI
> Pulse
> Sense
> Sensei
> Tamanduá
> Trails
> Warden
> Yuga

Would this encompass KCIDB or would it remain a separate project?

Guillaume
