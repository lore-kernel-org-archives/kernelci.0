Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC4811F7
	for <kernelci@lists.linux.dev>; Fri, 20 Sep 2024 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836331; cv=pass; b=WhE26GgUIkG4EcIjPtiCrlL2nUCspWS8Trh9TIXbH8DdLJCd4e1+jxaQGDwYlkOElKnhOHKhs6omQxea2qmzs3xEfcpRvEl5oWmLjAWBUXSuBbk+jPikvuhI3Hc78BKqXrhtkhxGrhhnlvaW3SXsWxkFYeJhVVXBFgL5PXnvSBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836331; c=relaxed/simple;
	bh=bvrYHhQzl5C8ZE1rgVaUClb/0mhD2k8tS6HhnzLe81o=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Nlyb7gBh1HMbbn86IaX3/UxvSSYOdzw9IAzj2zgebX9YW76vWM/UbJ7M+EcRbF7BZ1khnXwHpcabpKTnxJR4wKXaE0cgdvExTGL2NNv9YrJYa1LDRV20/PZqMs0moxDGXUm1XrDn2+D/EXCz2qBK8s54e1tTFs3gyTWZPy87jcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b=T+Vq/rOV; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b="T+Vq/rOV"
ARC-Seal: i=1; a=rsa-sha256; t=1726836327; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gxS5t01X5HZXEBFN1HQ450l5Xchv3R4731ieV/qOQUr3u00hfqICm4XEM/3Y6MypggQ6WaUjmVPSHmYxUag8+FiffdFCNibEzR6JokII7onFFuC8KmDNR6Njl+6/uhSj2p/Vg4qh90b/pr6cSYeZE2jzajPubk0xPSdCJybAuoA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726836327; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=bvrYHhQzl5C8ZE1rgVaUClb/0mhD2k8tS6HhnzLe81o=; 
	b=Fl2AGSTRKN7raBrP2A2CUx6CsiJrOrF3TCHgSqe1/Z6b/q7A0IRDjcGspiDrnD0oOq3IfVIxhLHAWVPOKC1py/94x947fJv+J1wDyik3XZMUIK9zYa/MWTEqyQplj9FHa7pOjucrSp9oOow8hV5h/e2DVK87Ybe4/I/U+YtvZ/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726836327;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=bvrYHhQzl5C8ZE1rgVaUClb/0mhD2k8tS6HhnzLe81o=;
	b=T+Vq/rOVgHWCepRuieTinaK7iWWtfeThBq5BI6ovoKeyZF492cCyYQOSTGw/XPO9
	7ZtZ3qyaidOe9yOtUniWDhQfUtRQk5hUdYohhtBAvCSES7CDfiSXWSW0wd1d9AkgTM8
	CxPP+3ImG99ahYasicIBXz/1Lz5YlBxsej2YnOB8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1726836325558637.9458419690432; Fri, 20 Sep 2024 05:45:25 -0700 (PDT)
Date: Fri, 20 Sep 2024 09:45:25 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>
Message-ID: <1920f773c71.b5f38e34367952.5923016543929330876@collabora.com>
Subject: Meeting about KCI Gitlab, KernelCI integration and testing catalog
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


Hello everyone,

We'll have a meeting today (20th of Sep) at 3pm in room 1.34 at Plumbers.

You're welcome to join the discussion!

Helen
