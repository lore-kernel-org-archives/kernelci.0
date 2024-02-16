Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226AE433B0
	for <kernelci@lists.linux.dev>; Fri, 16 Feb 2024 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708113192; cv=none; b=gBucSDgPpGdoFHOzuKrDhTMeyrjmC5apCHmlSf0HrNDEwbl83cqslYehLmkRaiJRj2kgIPDUfRyQS4Il7h/A1snyLyS88ZYeSCucVUHo8ipuKsyZSuY1PUUDeYn8pu4OkPjosy//sGlXNFYJDkTaZrratcuHW6qnrKLgfGXc/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708113192; c=relaxed/simple;
	bh=V99x6pevSrUoIIc/DxYKCzasgcHPu/zA+9YYdEv7dR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUaCG4U/eeYgvMOClzkNwWYmAvBeo1be+5ubWPf5PoYxvc91bnvE2Zchb8DyKMRu6zOEk7wYfVQiK3Vlcmjxaqmj6ry6D9LIS3ZinD+yTzJk6G9bBG1OAGoaFJq4W4JSOph3SJf/H1p2Q0E0yfiowkjhi4mzTVyEA2EFVaeMZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=aCw524p/; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="aCw524p/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 528A760002;
	Fri, 16 Feb 2024 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1708113187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msvdq+/QFSOkFNbsYOhJ/aUl+Pdm8tcbjwfL9kLfX/U=;
	b=aCw524p/0daxJZuShIuzSi9NavOIMSMFDKEz7rJVlT/17pY9f9m7ViDMMjjMEaF/+akwVd
	iRXoVT2BV4NL7vZJsnuQM9i9gC1VDRe592ILlyB+a0N1hQ+znKrqadQxVdQ6yA3ltLXocl
	Jer7GF3wU+pQNGC3Ow1jar6auGJnjflr4dcGcOdmVnfEtQwbf/DIxkkbSdRcnsfdHDQGww
	P5bruzWrbOfuVs07uIpYF2aFglANH9APdt++K1H4OHfNEig0qwJG+n1aJVePNZkxzLR26c
	7ewLr70uCERCXPVtWXrG3CHp9ZUpRpituozCMrlpq+eE9NE2s4TaOjeBQzrOJQ==
Message-ID: <5a96f289-c882-4bb9-b274-7a25c0036c5d@gtucker.io>
Date: Fri, 16 Feb 2024 20:53:06 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shuah Khan - Self nomination for KernelCI TSC Chair
Content-Language: en-GB
To: Shuah Khan <skhan@linuxfoundation.org>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-members@groups.io, kernelci-tsc@groups.io,
 shuah <shuah@kernel.org>
References: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

Hi Shuah,

On 15/02/2024 01:04, Shuah Khan wrote:
> I would like to submit my nomination for KernelCI TSC Chair.

Let me join others and thank you once again for nominating
yourself.  The handover process is not complete yet but I must
say this comes with a degree of relief on my last week as Chair.

I trust the current TSC and everyone involved are now all set to
answer any queries you may have and help onboard you should you
be elected.  Please also do not hesitate to reach out to me
directly if there's anything in particular I can help with.

Best wishes,
Guillaume

