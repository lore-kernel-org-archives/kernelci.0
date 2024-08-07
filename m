Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC2328B6
	for <kernelci@lists.linux.dev>; Wed,  7 Aug 2024 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723045772; cv=none; b=ZzqK8g66JxkQwgk5yaMy0QfgL+qQYWmYulSYP/ElvUn59ZR849rivFeSnzWoMhVW3k05cijIWuQ/ddNFnuIPuZzJy1+N7vNZ0XTWZ97r2Lzyu/50j/gpiWJ3KVh/MRYM13AAH6jtv3YLYcZ8ACi6iUqWwyO2SolG1hQo0PFm4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723045772; c=relaxed/simple;
	bh=0oOPyl0bbhfWYWeTcnzu4S3irPUCUxex5jBn7DDPFXk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvJi9oarAPNqvb6ckTJ0HhpE+AyYYKDQUoI12kKBDg5waToWO6uqk0gubCyure3fdtNSUvNAJSrkS4cNVBWPiQlJkHO9AReGI/7IHemiXOT5SnnTzC+6BTRWM54wtuXb/DOlkZ2mhIS8UH3+ArgEBmx+B+9/GdDv7BbfR3L6kGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXVyohuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXVyohuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D58C32781
	for <kernelci@lists.linux.dev>; Wed,  7 Aug 2024 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723045771;
	bh=0oOPyl0bbhfWYWeTcnzu4S3irPUCUxex5jBn7DDPFXk=;
	h=Date:From:To:Subject:From;
	b=XXVyohuuPA0jZVckwUJo0H76M2fDJg70mZMnlSchuWZswB66p7etZ1Bn8dYSigcWU
	 86AHwtP686Kf9khjy35IvTLg2ibHpv7KcsgLaoWo2/S6w+rqBnPMGeJArOSai0HfPK
	 uCSyUv94WdOGDNn+aa8AsHFG67kOHFCiTyePGZkIDhFdBKCn5jtMXZhW7DlAu4ErBM
	 XdAvgznTHSQEibDNB9mP7RnYy4v0KCsGajizwZfINOCJUifV/8FM+cvyBQTJMY6tXU
	 XRpAAIDr/b2yTwNEV8iywNSCinuq+KI8/mMw+hxLL8OfLcQb7S/omgN0mqD+UadP2R
	 IL044+jEGCtxA==
Date: Wed, 7 Aug 2024 10:49:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: kernelci@lists.linux.dev
Subject: Kcidb access request
Message-ID: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm using api.kernelci.org for reporting test results from my kernelci
lab, as well as scraping test reports for Qualcomm boards for local
aggregation and presentation.

As part of the transition to the new KernelCI APIs, I would like access
to KCIDB.


My (custom) test reporting tool today uses the LAVA callback interface,
and thereby follows this schema for the report, groups and cases. I can
continue to follow this schema, or change the schema as you prefer.
Please let me know.

Regards,
Bjorn
