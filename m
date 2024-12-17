Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4521F541A
	for <kernelci@lists.linux.dev>; Tue, 17 Dec 2024 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444506; cv=pass; b=rNGXI0mP0kIsl4OUbFFHug/IcWO/VyoNOjJyVgLrXiGyGu//WJblADgp7QKuC8f48cyu5AwJ/kwIpcFKh4TY99MCxjuJwEAwshQmamzNQ/EEvqbUGHG/zd0SjcZZR0DQBjxjUSQaKKoCU2Kz4HEAdyoYIqAAGlwT3BKu9pguhUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444506; c=relaxed/simple;
	bh=L0XnB6EJi+nNovvdJoJO59VE1gdBcDhCSpNfZg3jzCY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=sW/Hbyn3C4SGRGY4Tj6BVh4gkfSpyALDqKXwTDkRN6QYnm9nw19a6n6jnr6gQlze6YqrjvJzU/BeUIYdzoZ8I+kagoHPBsCH3fW/c5ZWF99O/32975Rm0iQV4P+2z0kf/vocFFxI1ZqsWCZeuwSy0hpiiHHb2avHEL/R4AaXbrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=POc1JBuD; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="POc1JBuD"
ARC-Seal: i=1; a=rsa-sha256; t=1734444500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LbR4IuhSwf3Htazv4hDSp+bs1yUuORvmKQj46j9g7cdbNocPJmaGNTk0WKzQswIMluPKTCdJ02azWTGGkbLbKBAWyYTPlTSRuYxwCEjBYeB7Jsx688Diy1CDCFG+PHIUbCnfVPlYx9ToS5SnbCSeFTk2mzoMlGDHBtyo6ZsBoFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734444500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=27onBpfwPQscUayYyf8i/13GQ97yM6ax8/0ligUSl+c=; 
	b=TFuRRKYVtu365E25wlDpHMX2WWMu0znHk2BG/mczfG2G3fkjpfYzBCuf8o7UFUUhnOMAGPI3QXF5KVf6X8I4i2uqQOH2Zj1Mb54pVptEQ+C4j0vs9NvUJkTGG995sAcYV5BGk1168YVzzKp8SVCY9X1d+jOhZDeZK7PeEoStzjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734444500;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=27onBpfwPQscUayYyf8i/13GQ97yM6ax8/0ligUSl+c=;
	b=POc1JBuDq5S0+BrwPG1lf8jH3NGo7QbWIXRP0r9pdcfetOvGzRi5LijBbKU3BlmN
	w0wG/KFkUlV3DICDmWm0w3vK1SsHj+NrHPKWIiT/K5xqCUYsttS2L9dNdcAIC2mZGzQ
	jII//lN5YOUamkntIF1UfsJaAITzG/W7cfTrivU0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1734444497446468.1782248982976; Tue, 17 Dec 2024 06:08:17 -0800 (PST)
Date: Tue, 17 Dec 2024 11:08:17 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "sashal" <sashal@kernel.org>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"stable" <stable@vger.kernel.org>,
	"Engineering - Kernel" <kernel@collabora.com>,
	"Muhammad Usama Anjum" <usama.anjum@collabora.com>
Message-ID: <193d4f2b9cc.10a73fabb1534367.6460832658918619961@collabora.com>
In-Reply-To: 
Subject: add 'X-KernelTest-Commit' in the stable-rc mail header
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

Hey Greg, Sasha,


We are doing some work to further automate stable-rc testing, triage, validation and reporting of stable-rc branches in the new KernelCI system. As part of that, we want to start relying on the X-KernelTest-* mail header parameters, however there is no parameter with the git commit hash of the brach head.

Today, there is only information about the tree and branch, but no tags or commits. Essentially, we want to parse the email headers and immediately be able to request results from the KernelCI Dashboard API passing the head commit being tested.

Is it possible to add 'X-KernelTest-Commit'?

Thank you.

- Gus


--
Gustavo Padovan
Kernel Lead 

Collabora Ltd. 
Platinum Building, St John's Innovation Park 
Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


