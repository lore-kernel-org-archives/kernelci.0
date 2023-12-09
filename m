Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32AB17EA
	for <kernelci@lists.linux.dev>; Sat,  9 Dec 2023 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hIdjkkSI"
Received: from [100.97.141.225] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D55A6607385
	for <kernelci@lists.linux.dev>; Sat,  9 Dec 2023 05:47:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702100862;
	bh=ql59A+7wRpnvgJqm//5dr4kCz1MhHtzkH4oRqLVw2E4=;
	h=Date:To:From:Subject:From;
	b=hIdjkkSIQmuJBoriLE0F3I0KDDBb4z40k7tVoz62jiQCyLUVSWQWc0MbrJmEwNe7u
	 tnknUgf/ii9DrUAvD/ByPNxSk5MDpXv0LFK9BC8Orhkv2ao/6KMCoc6Fz6XsYGhZ0c
	 aWdDNPG0ZXucF/mqlPynf/l7RVtrJQC77Te77eTe8Ax1ScLcZ65x2DA2D+KymPc9Av
	 FOBJS+d/96D3p3/HYHAXi2yfiSZksxMgy57XzFTw5XTdQh2Qg/eA60n1U+YpgKRKKz
	 PW3l+Nrm9MWR/sFOF0ehi9YrAGc358VlOd0NNrGMfUPrUCKWXg3DMctytNanRbXkVH
	 89UQuADv6dJfA==
Message-ID: <9895985b-e40f-40ed-936a-a27307343f53@collabora.com>
Date: Sat, 9 Dec 2023 11:17:31 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Jeny Sheth <jeny.sadadia@collabora.com>
Subject: KernelCI API: Email Templates for User Management
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

We have recently integrated 'fastapi-users'[1]package for user 
management functionalities
in the new API.
With the integration, we have enabled support for email verification and 
password reset
via email for user accounts.

The API uses 'jinja2' templates for sending emails to the user for the 
above-mentioned
requests i.e. email verification and password reset. The initial email 
templates have been
added here[2]. These templates arebasic and contain only the required 
information for the
user.

We would love to hear from the community about how we can make these 
emails better and
how they should look from the user's pov.
I have initiated a Github discussion[3] to take this further. Please 
feel free to drop any
comments/suggestions you may have.


Thank you,
Jeny


[1] https://pypi.org/project/fastapi-users/
[2] https://github.com/kernelci/kernelci-api/tree/main/templates
[3] https://github.com/kernelci/kernelci-project/discussions/275


