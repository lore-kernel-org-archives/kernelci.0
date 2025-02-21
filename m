Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9241A270
	for <kernelci@lists.linux.dev>; Fri, 21 Feb 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740145632; cv=pass; b=IVYWql0tc+y11p6d0jEinYMpQ6XXT+o0MGCg07gFfdJhNefQ61gZQiGPyCCHpa+ncc8uUIrmEIIdIgpsnC4TzdmkB/4FG3FzF3np1+4ySCImO9F4P3PJ0UCdV+jEIyQ4C2X6A18gT9Th0rhNwGDl7V3qU8xSAkIVtwFjmKmAOvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740145632; c=relaxed/simple;
	bh=4JM0hHO98ppvAFbZZbh2MsuDwFTGNWefDEK7B+fgMxg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=X9YysS5Qn3UB/VZeV5ko7b0YtXaD2aqv/iBKG5ciaayhzZ4kp8IjZPgW6M1r2BIz1P5OQqthoZtAt/nZqW+Z+0brcjYBDilsImU7NKa08F0bv+DWSqHduQbR5Kre6ZggwmzF73arLmxYlop9z9QwnO5MdDBOxLK08mHaofmlSBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=M+I2XbK/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="M+I2XbK/"
ARC-Seal: i=1; a=rsa-sha256; t=1740145628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RrvvA0dmD5eW8tKtAZS2KGYk7ZEaI4NrZqYYHASTfQuxaGKAOJssOB70BYrqA2QiRd6bVLQ4z3XQFUpoliEDZgXFqxzOMQrafKzs2gVdgGQe0IEvG3pJxr/eCL55MIFmQ27w5QMtn6zDwdJkSIWTEGG+/ePWwMdo5nL/jz73Wb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740145628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=byhqiXzbrwFd3VtqQ+ZT/LFyIcK3dMjV1rXs2cojJ/k=; 
	b=Ish1HjmVAxiYkA4Ps6Slak9PzoPY3HivLyQCmpSumr2sSCMthatX+ZSipGlZZtO1+Tjh6I1vgENBzVUs6+LzadT4ZQI72IlYL3tErOr4xmzwcuEFWPdKMhVBbvGts53bo4Wj4kC36jNvGFA7SDPoxl6BDTokKtHWrgM07eYW2yg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740145628;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=byhqiXzbrwFd3VtqQ+ZT/LFyIcK3dMjV1rXs2cojJ/k=;
	b=M+I2XbK/YOK7S9FGVxpj9ErZD6HeO4zalZqX6zEfMQfgO8vDKu+RaC/sZgaDIdUR
	9JzwYtl5HQDyimNu2nAxzQtmEw+N0oxJDuDMijZok6Rg/f2mHyJkTNsBaVwEv9hekoV
	Sk6/XXNvmZrx+0z72daxOSaEEOfeh+Ryf1IvHRQs=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740145626682833.7813829980666; Fri, 21 Feb 2025 05:47:06 -0800 (PST)
Date: Fri, 21 Feb 2025 10:47:06 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "Automated Testing" <automated-testing@lists.yoctoproject.org>
Message-ID: <19528c30e23.11942ea081305666.2937032966219928436@collabora.com>
In-Reply-To: 
Subject: KernelCI - February 2025 Project updates
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

Hello,

We just published a new blog post about the recent developmets in KernelCI:

https://kernelci.org/blog/2025/02/20/kernelci-february-2025-updates/

There you can check on the state of our new Web Dashboard[1], our log parsing capabilities, kci-dev cmdline and experimental regressions notifications.

Please share any feedback you may have!

Best,

- Gus


[1]: https://dashboard.kernelci.org/

--
Gustavo Padovan
Kernel Lead 

Collabora Ltd. 
Platinum Building, St John's Innovation Park 
Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

