Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3442D1DA29
	for <kernelci@lists.linux.dev>; Mon, 18 Dec 2023 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="EfJpKrOr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F26041C0002;
	Mon, 18 Dec 2023 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1702931659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I8DivkZbN6ZypS+FMFxow8wP9uuJREADNY4b4Nx46AY=;
	b=EfJpKrOrb5z1wFLmcHLo/bXM4KXdcDoqTDyZIsj8yuVVyaxGTcX2Kmzxhtq+v/96TcvhOr
	NeDpZ1HOh37hAlXOtI6JRSdG9jhVwJTY3GwDWEIVv5HFhYG4SsJw5mVaRsUSqWzKhb/iYN
	wK09DkkqUVR0dkhLRaBNrHnJ5keOT78aMNnIyLtS3jWRRev5fnQsEl2zdJBtQKXSFAQQgE
	E4Y7nwsl70GSNd1qMy9PyFRHuX4dpDQPwYoQ/AhD9k82p0NxwDSj7ID2y5QOEKAdy75uTQ
	mpnwbLVUT621CRTZiqQNzJguHyqmhopyCX7G88hVJQYAvY/lfztBsXzyJHhxew==
Message-ID: <260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io>
Date: Mon, 18 Dec 2023 21:34:15 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Guillaume Tucker <gtucker@gtucker.io>
Subject: TSC votes and updates
Organization: gtucker.io
Cc: kernelci-members <kernelci-members@groups.io>, kernelci-tsc@groups.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io

As per last week's TSC monthly meeting, a number of votes
resulted in the following changes:


**Jeny has now joined the TSC**

Jeny has played a key role in bootstrapping the new API &
Pipeline and has been a maintainer for kernelci-api and
kernelci-pipeline for a couple of years, so joining the TSC is
now a natural progression.  Congratulations and best of luck!

You can find the updated list of TSC members on the website:

  https://kernelci.org/docs/org/tsc/#members


**Denys has now gained the following access rights:**

  * GitHub KernelCI organization owner
  * kernelci-project repository maintainer
  * Docker Hub administrator

Thanks Denys for being available to pick up these various roles
which are complementary to the SysAdmin working group lead.  Best
of luck as well!


The detail of the motions which were voted last week can be found
on the website:

  https://kernelci.org/docs/org/tsc/votes/#2023-12-14


**Dealing with abstentions**

One thing that was discussed but failed to reach a clear outcome
yet is about dealing with abstentions in TSC votes, see this PR:

  https://github.com/kernelci/kernelci-project/pull/298

So, if you have some relevant experience in other community
projects and want to share some advice then please do.


**Looking for a new Chair**

In January, we'll be looking for a new TSC Chair.  In any case, I
think it would be valuable to onboard one or two new members from
the wider kernel community such as well established maintainers
who have an interest in automated testing.  I'll still be around
during the next couple of months to help get someone new up to
speed if needed.  So if you're interested or know someone, please
reach out to me or anyone from the TSC.  Thanks!

Best wishes,
Guillaume

