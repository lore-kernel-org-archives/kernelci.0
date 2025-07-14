Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E088257448
	for <kernelci@lists.linux.dev>; Mon, 14 Jul 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502010; cv=pass; b=gpWxzRZjWdsZxaYsA1TAWIQorbFghFz8Tx/k/caEZpXuu5DzDRKizMy7aBlCE2jZXZ+ihWXcbdMqBOKFFzkI0U6MYks/ZID1yJ7A9at7TQGJ7STs2oFuUoI1+IviqG2gVMU9P/EnRMO1Nni7mVq/gYFn5VktIFrHz2Bes7ZpTUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502010; c=relaxed/simple;
	bh=tU7HXnHp7K9MSYbgo3deRiYFSLMxnf3vfjcdxJOTDvE=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=T7N1TgmeQYXA1563ucSIoCY9C5rxKFN3nJ1Oz9SH2JSvSqQqy3eSas7wIi4U3T+YUjmoA00b1UQ4CStbxyHla3stPnAsI5/VsSUg9nmdp3kTI/zU7iJ9K+YrvssVrCHp5Vc3N+6bIDN/ueTV8Ihh52OzUJtyLqJmeRFdsMpph7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=lCTmXGZs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="lCTmXGZs"
ARC-Seal: i=1; a=rsa-sha256; t=1752502005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l7DXCEtjBRUpG+U34aheHjNlNCwTWCb7GznJ8qNK9haMDeFMwk+UCvwdTBH0qA7QBQtHYc7+YTUq6u9mklbJepHLyEOLrU4RWYuhp0qpszg2QmXrz6PAJY7YdYJNb9izjVoJRA9vYp7CVoCTRfHDtDfiJ3ijcXFsA8uAYIt8tQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752502005; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Jy7baaugCX9j0frCqrykV3NoCsSZACRLMY6u3PfPuxA=; 
	b=m47nArOsXRihvx1ae/cxaM4m4Ur4lHAqOFShwRabIIWOniLHvtaRnZTCZ2uRQfgnPsN//N1yqNz/srOVc+i1kJt8P8rYvNTASgCOLYGL8uBHPG2BU5hQsmo+qqk9yJuMv5GL8EetfHinh3WQJLcLjZVIZHWsICee5y1g41wUWO8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752502005;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Jy7baaugCX9j0frCqrykV3NoCsSZACRLMY6u3PfPuxA=;
	b=lCTmXGZs4cSYyCXlbR5pppVpwtAI7TSjmyaTiYqgAOvscAuWkmkeB6PFPhOrNEbg
	/qpawQrwZhLI+MD2fooXU1D83QZcVbiLP+oHBwsd6oW4PkiPUifvf9HDB2kSxOH2ugK
	VptQqe9j3M4/0K8wvGXy1JfjFATDQ60odTDL4ZV0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752502004035289.37526612552654; Mon, 14 Jul 2025 07:06:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 11:06:43 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Automated Testing" <automated-testing@lists.yoctoproject.org>,
	"KernelCI Members" <kernelci-members@groups.io>,
	"kernelci-hw-vendors" <kernelci-hw-vendors@groups.io>
Message-ID: <19809426904.3c4822be1251531.2628638964882412232@collabora.com>
In-Reply-To: 
Subject: KernelCI Workshop in Amsterdam on Aug 28th
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

We will run a KernelCI Workshop on August 28th right after Open Source Summit Europe(OSSEU) in Amsterdam. The location is not too far from the main OSSEU venue.

The goal of the workshop is to discuss the current architecture and roadmap of the project and refine our directions forward as a community. The workshop will run as an un-conference style with agenda discussed and decided at the beginning of workshop.

If you want to take part, please manifest your interest at:
    https://forms.gle/SwanWMQnwg6F6UAx9

For any questions don't hesitate to reach out to me.

- The KernelCI team

--
Gustavo Padovan

Collabora Ltd.

