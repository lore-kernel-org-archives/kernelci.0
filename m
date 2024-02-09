Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4769E16
	for <kernelci@lists.linux.dev>; Fri,  9 Feb 2024 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494547; cv=none; b=eGKTsNkC0doWCqwD7oMzK7cG6aGidAx9SxAAGO7d4zlXnpAW9m/6b6DgxG8QDBA6TIjZNSp+Pq6j8y2d1WZdRX2LHP9R/7PVskOf7+DSCXChYfc4WSZEp52aUxp1UF4dtSeegAhf7xMnqwz4GQutZpGQDiEnHQEmXlilHXvpuPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494547; c=relaxed/simple;
	bh=hoQKyNs6mbHbus+3x4s8ZkD2OSWR89g+UCGz1vrJIMw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AaX1o2/KCZ89q/yJ07l1K7S8z8UmV2MKYY2kMqNJwaTPYTFiPX59Rg0yvTPKxGs81PPPVus/3rYz+yOob2rbU3dIUcE8BREc8mNrQyCcUFZ7ZSwt83uC6L7Vn3TTL+9DLj29OwA+d0n1oW2Yan1ODKBT9dFUDZlKiaPuzOeNWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=DKmuhLA9; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="DKmuhLA9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81F24C0002;
	Fri,  9 Feb 2024 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1707494541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HyftZ/aeKQ5sEFLcUjxwHRzOEmFoBniulRHmOL9Qrts=;
	b=DKmuhLA9uxTQPppSE1924zlGKu83QgGLZa2xuGQaTUV1NoKzd9oZ1+D465EUYvvVii/73R
	8k4iy6A30pQsTTAaSb3VQSMGXT3JtWbs0tOCkemKmgb+2xXW9dJH5RvTpmvkuhGhW3dkkI
	CV3ndnHK6YSQiblavPetFhYcxd7zTYYPaZOY3wu4MXfCy99aWFQOVre2tmSNikXkhG6IvB
	4kcldfeZLwFGGwDgn0r0pd5i0vfgT0H3XdViAdQUGV1mkouhF5vQwB7hYk0rL/Ecmx24a/
	TiClVLgZUwIsjnV9QptNxPWLZnujOxDRcH5D3nY/McV/+ynjIfwNPMn0wljmdw==
Message-ID: <7e83f05e-3d99-446e-8364-15273124c414@gtucker.io>
Date: Fri, 9 Feb 2024 17:02:20 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>,
 kernelci-members <kernelci-members@groups.io>
From: Guillaume Tucker <gtucker@gtucker.io>
Subject: TSC update - 2024-02-08
Organization: gtucker.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io

Please find below a summary of yesterday's TSC monthly meeting:

*Paweł Wieczorek is joining the TSC*

Following Denys' proposal, the TSC voted yesterday in favour of
Paweł Wieczorek getting onboard.  In spite of his relatively
recent direct contributions to KernelCI, he has been following
the project for a longer period of time and his on-going work on
LAVA as well as his Kubernetes experience will be very valuable
to the team.  Congratulations Paweł and best of luck!

Note: I'm in the process of making a PR to update the docs
etc. so all the formalities and admin should come into effect
early next week.

*Rotating TSC representatives*

As we're still looking for a new TSC chair, we've agreed to opt
for the alternative solution offered by the Linux Foundation
Technical Charter[1] and have a TSC representative to attend
Advisory Board meetings and take part in votes on behalf of the
TSC instead of an elected Chair person.  However, as there also
isn't anyone really available to do this continuously, we've
agreed to have a pool of representatives and rotate between them.
Call it musical TSC chairs if you wish...  So far we have Nikolai
and Denys in the pool, in fact this is a nice way of bringing the
Board and TSC closer together so I would encourage all TSC
members to take part within practical limits - the timezone for
the biweekly meetings[2] isn't very APAC-friendly unfortunately.

The original timeline for the TSC Chair handover process was
meant to complete on 19th Feb so I shall stick to the plan and
step down on that date.

*groups.io owners*

The TSC also voted in favour to give full ownership to the
designated groups.io maintainers[3], namely Kevin, Gustavo and
Mark.  While we're now using this regular kernel mailing list as
the main public discussion forum, groups.io is still needed for
private KernelCI topics among the TSC, Board, and working groups
such as Sysadmin and Web Dashboard.  The
kernelci-members@groups.io address is also the one for potential
new project members to get in touch as advertised on
https://kernelci.org so it's very important to make sure there's
always someone available to respond.  We've had suboptimal
moderation mechanisms in place recently, hopefully this will
help.


Please feel free to reply and ask for any additional information,
as always.

Best wishes,
Guillaume


[1] https://kernelci.org/docs/org/#technical-charter
[2] https://kernelci.org/docs/org/#advisory-board
[3] https://kernelci.org/docs/org/maintainers/#groupsio
