Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E226524B27
	for <kernelci@lists.linux.dev>; Mon, 11 Dec 2023 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="pEqrtL8s"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8859C0008;
	Mon, 11 Dec 2023 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1702290448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/6heu20jtCcIBVW1PeAd2EU7XcCrMayd8BzvJVbKvQ=;
	b=pEqrtL8sGh+F5Zzhdw5gJm5o0fjEbzTc1sRuBydTQ34vMtdSv+F+sNTPCCwJyLjrWQK+Oj
	gEwDdvxt97/I8APMfZJ9Ql8KYRRZxFc7MEIWXiy8CthwUAqlwHC/4Hs5PY8EJc/ZIpdxAK
	2H9ZKtNO55oVrDBKcajAE8ZAPa9uh46IMV5to2ARTia79r1l7trs/6kyxMh5p0trTlG6GZ
	uM+JkWsLsfvmNt0n1E4G0zFhz7AO8y8U+FF+BknV5jTCeb/j2YSOzm0LAokNOmPnh5Q7wR
	fGPHxp7D5yQYvBSUGFfF0eEJlF9kmbmv6mWDFPoYYMSfd+S6f8mpkFtNUd91ew==
Message-ID: <7209686a-ce1c-49d1-bc09-3adbb0e009c0@gtucker.io>
Date: Mon, 11 Dec 2023 11:27:27 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: KernelCI API: Email Templates for User Management
Content-Language: en-GB
To: Jeny Sheth <jeny.sadadia@collabora.com>, kernelci@lists.linux.dev
References: <9895985b-e40f-40ed-936a-a27307343f53@collabora.com>
Cc: kernelci-webdashboard@groups.io
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <9895985b-e40f-40ed-936a-a27307343f53@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

+kernelci-webdashboard

On 09/12/2023 06:47, Jeny Sheth wrote:
> Hello,
> 
> We have recently integrated 'fastapi-users'[1]package for user management functionalities
> in the new API.
> With the integration, we have enabled support for email verification and password reset
> via email for user accounts.
> 
> The API uses 'jinja2' templates for sending emails to the user for the above-mentioned
> requests i.e. email verification and password reset. The initial email templates have been
> added here[2]. These templates arebasic and contain only the required information for the
> user.
> 
> We would love to hear from the community about how we can make these emails better and
> how they should look from the user's pov.
> I have initiated a Github discussion[3] to take this further. Please feel free to drop any
> comments/suggestions you may have.

Thanks for this.  I believe it's especially something for our
newly appointed UX experts to provide some feedback on with best
practices etc. as I would expect regular users to want this
to "just work".  I guess one particular requirement might be that
the emails are plain-text only and usable in a terminal client
such as mutt.

Cheers,
Guillaume

> [1] https://pypi.org/project/fastapi-users/
> [2] https://github.com/kernelci/kernelci-api/tree/main/templates
> [3] https://github.com/kernelci/kernelci-project/discussions/275

