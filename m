Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827499;
	b=K2WYi5LZpH+l/CuUZGyWyN88l/6iaEe9bHrXYjR/BQT5ttM9/LYUbyjS5mtWj85at+jW
	 FVkaoNMep7icdbiqfMghO3eINVfVdNZFiz9gu5eoXy9vr6zku2D+dWyUxjU+IXQMFRCo6
	 zqB5mhlOCmKTC2/RWzexGYnJc+zKwlVA2B7US3GTYWwjrue3GZzy5m3zUfh67mJKNel0m
	 rzGCzG1CGSvycfOcgUTWRGpQeMM8xoGG//y5OJnsFYLzEBZYxx5DYziX9hOM5kJIK2FoK
	 NcpjKe6JeTPRme04b5x2I2vVW1KNufAZocLPc+kWrKKuvxek1ZYKu6FWw0azZO0samA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827499;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=4RWHYXo+rUb+cT05qeuM02zOIjjfgw1LApNrZ4mrq74=;
	b=H8F3tTjj1qeaTXYOgRVOlq6+GZYh3ljH8j134/0G3kQEB8VAEIN6yIHlV8vA6pz8KFhT
	 EDcSd6rcp1cCmSZ2Ngewu+5TS67uucQ0MEZoR1AFeW9ISB9rLVZgIxiDhcL2ndcnk1rFJ
	 Yeh+cvEMz7d5IlM1g4wVuFtKaDfX1tSkh+7jncbILgJh3AkpUa6IURqHjoZf/6V4/hLww
	 fkv30e7WXkBX47h9P6kDjw5po8e8KP2B8UOSjwX+1RuXrBZ83RJX2NdIVjkIqjZISQnIY
	 qxU82nQgJM+u9vNaLdjOK+J+4U0XmRvO3i65wB8od9ZMdyO7nt8/caErBYmwDM/lcOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2+Ezu4f0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="rkj/Xsms";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1CF6072DC1
	for <kernelci@lists.linux.dev>; Mon, 16 Nov 2026 11:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1CF6072DC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2+Ezu4f0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rkj/Xsms
Date: Mon, 16 Nov 2026 12:11:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794827496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4RWHYXo+rUb+cT05qeuM02zOIjjfgw1LApNrZ4mrq74=;
	b=2+Ezu4f0WZVM+awCMRxEY/9d5Qbmccx0FFjPhAoRYUj6S+vq/ktwnCsrrtI3VQF5kwD6F1
	laar44wyb9+Lf2NL3zWcwhwohU5jlFK7eHAAjDSCW4HAgr5DYxibFkB5xwnL37pQ6OxFMM
	4KW4ymMt/W4+cTa1yNK8EUVYJFmWdce9EB9XeS6E6+sdL+iCF894Ox2p13mkJfemPPcarG
	fDfiHj2F3TgcJ2snkCinv85zibKsUyom/9o3D4aRqBTtr8rXmjuctrSkVAs8KRtch7/YqE
	/O/gNRdIbNRXY4Vsn1ni9xfvJs/Mfwu3R+++8lQIr1IQTIcE4wcFDhXZYra2Mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794827496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4RWHYXo+rUb+cT05qeuM02zOIjjfgw1LApNrZ4mrq74=;
	b=rkj/Xsms+BpYeCMc/Qrwx2jcIAkQ2vVp/fHQiKfsyEQBW2fgRUShkMFbF4xACociMC1Cor
	FqT6IXvD6v53UuCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernelci <kernelci@lists.linux.dev>
Cc: John Ogness <john.ogness@linutronix.de>
Subject: Debugging PREEMPT_RT spikes on kernelci
Message-ID: <20261116111135.Fsypfl7Z@linutronix.de>
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I have been looking at the results of meson-g12b-a311d-khadas-vim3 on
defconfig+preempt_rt. The run for v7.4-rc3 is available at
	https://dashboard.kernelci.org/test/maestro%3A6afa52b25b429d354e5ef864

which run about 10h ago. The reported cyclictest results were
| T: 0 (  482) P:98 I:1000 C: 441036 Min:      0 Act: 1258 Avg:  274 Max:    9556
| T: 1 (  489) P:98 I:1500 C: 360000 Min:      5 Act:    9 Avg:   17 Max:      85

and are a bit high. I opened a PR against kernelci-pipeline to change a
few config settings and hoped for the best. This PR was merged FRI 6th
NOV and according to the artifacts of this run, it is still the "old"
config.
I checked a few other trees and boards and none of them is using the
newer config. So either I did something wrong or the git repo was not
yet updated.
What would be the delay one can expect until the git tree is updated?

Sebastian
