Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD043C468
	for <kernelci@lists.linux.dev>; Thu,  1 Feb 2024 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706781234; cv=none; b=J+xYZXQ9AMGhu9wB7ekY8hUE8ODLPkVmB4PaMQztboJ/A09pjTa3Xh2wVYlUZxpUwby9gCMbqdeoN0cTOs+zI1Q2IP8qCVTIAPxzfLnuQmOCNnc4jH6uj0oTW+kvK6dAJUKux+jwGtZW2X58IHwCInX/la/WucOeng7hpLWTTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706781234; c=relaxed/simple;
	bh=ccbBS+TLfmXuYGxFIu0hG9D6oSXF+CGMn2TJtmO5V9k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=j3wiIPnvOxGiF7IkTtNGKcPdjiYWd1xiNR9NuUJys6lTF4Nt6ZqcOxbufRW4LzJFcuN4BS8Alhd4Zz0Ji3gjTRhHWcokCMiNawReCGLBhVtO4uircM0MdsoYwgPCwAY/LMKnJ3JM2m03//B8G1jkGW1u6zFXe62t/kt+wLJvCZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=NCbvgQ+D; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="NCbvgQ+D"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9444AC0009;
	Thu,  1 Feb 2024 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1706781229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWNXtsdys3cwkNMJooCaJ+d/KgyBjT9TPBJVVkDSZ6k=;
	b=NCbvgQ+DRIyAFz+8iMO6dkgZw7UhoyQPGqfonO0WC1vAsQwKnFkFC1A+5MNhwwjNggBkZz
	KTFk+6zVErDH0ReB0jnHKGTPJtLGnqyThWIiw4m7sth6VdKJP0LLyFVpO8RBs/ynrynWI9
	PV+GAvmp2OC/6F+buwfibWw0DIpT1Hzyc4kZZbDtFw09OfbAsSPlw8a9cTb17cWyOoFrS9
	gS/aMuC+g7W3AByHpUnX7jH3sYtDI4CRI2m8wBd4bJI/BLiTfWaToh+l7/tHdRyhjBE/5d
	Cn43OKr6cFru4vI/bX4PN/tkws96qbhI3WyBrVLbXByFdrBvu1xyk4wwJT6eDQ==
Message-ID: <85a638f1-bdaa-4b59-b373-64a1fcd37979@gtucker.io>
Date: Thu, 1 Feb 2024 10:53:47 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TSC votes and updates
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-members <kernelci-members@groups.io>, kernelci-tsc@groups.io,
 automated-testing@lists.yoctoproject.org
References: <260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io>
Organization: gtucker.io
In-Reply-To: <260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

+automated-testing

On 18/12/2023 21:34, Guillaume Tucker wrote:
> **Looking for a new Chair**
> 
> In January, we'll be looking for a new TSC Chair.  In any case, I
> think it would be valuable to onboard one or two new members from
> the wider kernel community such as well established maintainers
> who have an interest in automated testing.  I'll still be around
> during the next couple of months to help get someone new up to
> speed if needed.  So if you're interested or know someone, please
> reach out to me or anyone from the TSC.  Thanks!

We're still looking for a new TSC Chair, there hasn't been any
candidate so far.  We're planning to have a vote next Thursday
during the regular TSC monthly meeting so it's not too late yet.

Please note that this isn't strictly limited to current TSC
members, for example we could onboard an experienced kernel
maintainer with a handover period of a few weeks.

If you're unsure what the KernelCI TSC is then please take a look
at the documentation:

  https://kernelci.org/docs/org/tsc/

The Chair duties are essentially about ensuring TSC rules are
being followed, chairing monthly meetings with an agenda,
minutes, votes and public reports and attending biweekly Board
meetings to take part in votes alongside LF project members.
It's also about coordinating technical issues between the various
KernelCI maintainers and working groups.

It's a unique opportunity to make a change in the way the
upstream Linux kernel is being developed and tested.  Feel free
to reach out directly by email, on IRC libera.chat #kernelci or
on kernelci.slack.com.

Best wishes,
Guillaume

