Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828532;
	b=5oMF+g7PyrFMxcUocOyj0gn2T9ACzbiwS1bcEgMcKDpegs7GyW4Nk4vZ++lqrmTcmy7W
	 zIJndWLvTg2NGTzi2rEmE+JIpkL4ysRe3C/kQpLfRNkLS1PpM9ZyD/tFE44zzGCp3ihD0
	 2GllR2YiLFXZL0LO9wWrmvU1/fe9N25ZuqBQc6XdU4JVNiQBfZEel1o1m4ZgpEjZKG3AT
	 2D1+QIcpgnpxqo9No4TLvWeZgg41r+ODm92kxA0YVGvvwF6njqCl1aD0Qf/MypS+eVTWA
	 u0Sq6xs8BSlsgo2E7zlAromwkUq7zbwlXmUPgBLddxwDz10d4OycBIYs0FYtdOt4Wag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828532;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=VK35ntZATLdDOEIJ/ItRLCLCHUCKfTg8VKJTut8Xmpw=;
	b=oWDlMv/mf2eq6jyvX13sKg6mqyvVmpWeF6s5gNM6wAABbEsNmD2TEhLY3A6rs9vbAcfo
	 YceA/cUfCoFIf15DIww3PS7CGZya+K6fW6Wc5upuVhNRw5BC5qVX7ngZWvHvQSnGIc5GP
	 4/jNpP7T9A1XSq/cHY3eyDD8LveKEQyGzxzSO1aMTIaHG/u1qD3TlfF6eZWvtH6M2M1xD
	 8NZnKKuSr7CqwSVjbEW99FcnDz57fj2RpZisJqPy0pOGr1oGiwwUMgdEMq29hTxtmMtwN
	 l4pt6Ae44IE7zd0JCPalYRtja5e/bbOTluE6EvUfpbpgFQkMaS/orqevS+Hszny8FhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="D/Gj7OyN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A3606A337
	for <kernelci@lists.linux.dev>; Mon, 16 Nov 2026 11:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47A3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=D/Gj7OyN
ARC-Seal: i=1; a=rsa-sha256; t=1794828508; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ij5jzSDYGKYswotjaiqxs+ZK0RgmIsUT6+e53z7zo/aZvXvACUqGhvAXwQLk6uAEoOAg0mfWDFKqdd4d2iz3/8w3vM542IQEJB3yqCpCOnOUr81v0BchF335jrvwT1o6dujEd3qZIvAUHiIpNiec1T9uxgLYwmRmeYuLP663qDM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794828508; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VK35ntZATLdDOEIJ/ItRLCLCHUCKfTg8VKJTut8Xmpw=; 
	b=HJl1V4NvlI9WkxaTWw8M1uNz6lNeqFKaFob+75hC/T4TL4jVpX0HGkFlMFAtzdQBt1Fl9Gz8e4dXNij0nX3verF1/2J/so1XqVbq3QKl+eds8RIk0HYSgWXiauZLIeg/5pdEAqumRNWjTPnkuclRFS7fVHBfDYrnhFlW2mJnoyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: a=rsa-sha256; b=D/Gj7OyN5O6gUPuJYszl0qwQxwXId0US35+LbIze/dk44DyWCJxQOZAWewyi4XLRRN8hQ8Cy9oDk9drvO/pVvaEaTET/CloCfmPQGaL+sAflvFiLTtdOkQgqILPAprG5NqeWWhpyyT3WmdeRCQZ76Ad/7Y4ewwWHqK8eX5m59dg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=VK35ntZATLdDOEIJ/ItRLCLCHUCKfTg8VKJTut8Xmpw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1794828506821915.3498840423285; Mon, 16 Nov 2026 03:28:26 -0800 (PST)
Date: Mon, 16 Nov 2026 13:28:26 +0200
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: "kernelci" <kernelci@lists.linux.dev>,
	"John Ogness" <john.ogness@linutronix.de>
Message-ID: <1a1e41d96b1.3e56ef281896928.385630952830763087@collabora.com>
In-Reply-To: <20261116111135.Fsypfl7Z@linutronix.de>
References: <20261116111135.Fsypfl7Z@linutronix.de>
Subject: Re: Debugging PREEMPT_RT spikes on kernelci
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

I will do deploy production right now.
Usually changes are deployed weekly, unless there is breaking changes that might need more needing.


From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "kernelci"<kernelci@lists.linux.dev>
Cc: "John Ogness"<john.ogness@linutronix.de>
Date: Mon, 16 Nov 2026 13:11:35 +0200
Subject: Debugging PREEMPT_RT spikes on kernelci

 > Hi,
 > 
 > I have been looking at the results of meson-g12b-a311d-khadas-vim3 on
 > defconfig+preempt_rt. The run for v7.4-rc3 is available at
 >     https://dashboard.kernelci.org/test/maestro%3A6afa52b25b429d354e5ef864
 > 
 > which run about 10h ago. The reported cyclictest results were
 > | T: 0 (  482) P:98 I:1000 C: 441036 Min:      0 Act: 1258 Avg:  274 Max:    9556
 > | T: 1 (  489) P:98 I:1500 C: 360000 Min:      5 Act:    9 Avg:   17 Max:      85
 > 
 > and are a bit high. I opened a PR against kernelci-pipeline to change a
 > few config settings and hoped for the best. This PR was merged FRI 6th
 > NOV and according to the artifacts of this run, it is still the "old"
 > config.
 > I checked a few other trees and boards and none of them is using the
 > newer config. So either I did something wrong or the git repo was not
 > yet updated.
 > What would be the delay one can expect until the git tree is updated?
 > 
 > Sebastian
 > 
 > 


