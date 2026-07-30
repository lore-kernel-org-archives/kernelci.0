Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5995409280
	for <kernelci@lists.linux.dev>; Thu, 30 Jul 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413625; cv=none; b=hZ9CVUDWlXimr7LKr5Q4hdXxeUOd/zjrXtct0kT6O37nQaeaVWzQEWM3iEuYEIdjhVSJkbyiGmvr4dPYUZ/wR9oPBTANAhkKtJnwz+VGYzQsVBkPjBXzcQ47OYqHyJsIxLbFKMjNM0D7i5BozdYaxvBWPKWBCZso7TcaQHrhQSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413625; c=relaxed/simple;
	bh=9IF4FW6WYK1FcrlEAIqTK+W0WLx3IZsDYTvzUr66Hs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeaoFIDTfN9A09CrWvMzT1nYRsxyMo9BcYqXWIdEeX/Bueld/q1KzZdbgHeRYCdP9JrSgsc+uVWiiwlZtelU89XaMt0UYTjhQETGT6NyC/fhube2Cyw+v40eIMWNlj9F68r+VQLXVEI2cNf9gGyBGp4TFdz+ph4XfbQfHSTeCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bofAsHTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bofAsHTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19F41F000E9;
	Thu, 30 Jul 2026 12:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413624;
	bh=9IF4FW6WYK1FcrlEAIqTK+W0WLx3IZsDYTvzUr66Hs8=;
	h=Date:From:To:Cc:Subject;
	b=bofAsHTmDMLT2GXAJfkIgUzy0/O0NHOT6HJDb6KGyqiuA5k4xmfKuLVlfaOS7JJYL
	 AzJWKIGAph4M2pNWsX6zMpzfstIltKs+g0o1isQkORnXZw3GSJJguyWbXKDg30Z0+I
	 HveG3sweSTYuti7OJHD0VUcprzdZBe0aUcho7Yv6o0mgTT3Cvc5YZpN2ZiWxvj/zae
	 vFNaTudgQhjaVDlk0RnW1yuTXWuAVxkq8hgusdd8H2v0jhmf/EwjJUU88xMpdvrbot
	 ANekLB7ufuNL9i1fNy1FHZdY8c0GXVgrcF2+gyj0HZqERVVwtrSi+Bp0gs1as4qiid
	 5TpsoLYwB4vBw==
Date: Thu, 30 Jul 2026 13:13:40 +0100
From: Will Deacon <will@kernel.org>
To: kernelci@lists.linux.dev
Cc: catalin.marinas@arm.com
Subject: Missing kernelci bot emails?
Message-ID: <ams_9JHxvOVUFX_W@willie-the-truck>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

The last email I got from the KernelCI Bot was on 20th June:

https://lore.kernel.org/all/178192264021.17323.9854948270991678156@330cfa3079ca/

I've updated the arm64 for-kernelci branch since then, but I don't seem
to have received another update. Is something broken?

Cheers,

Will
