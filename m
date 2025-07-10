Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96F278771
	for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161869; cv=pass; b=X0JHtkVt5b2njEUBugCgIrgzfeCDFIzDLZOaxRRydZOkpFhXVCjvLo6fDb0ULynV3T9lLXksTUHWn7703hzBmC9E3a518/hX5FYyAxptZVz+PB9OFAefN8V68YiP//Wj/fFQVrBak2LQd6uEZlqe/PyPp9oeR7Y4NgAp/Mlva5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161869; c=relaxed/simple;
	bh=iVt5q81jTwbFQ6hF6hIn7nfFC9Iqap59hFOVj5mewI4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=CZZK+dUiWdGtbcoN8f2a/ZWmCL2CJZiaYnIQWBiGbxZnNikPQD72X6csYt1rAGiVTPD7ONYSBSNtn7B7zGy89+Tw28uIL4JvNLpollYATygMSt4IT8B0Cjhvu1za0gVHQMIShuHsKuYDGm3WLzmoUm3VJkjjYaEFGsCU1kfUSyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=YiTZdJ1L; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="YiTZdJ1L"
ARC-Seal: i=1; a=rsa-sha256; t=1752161865; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dIcjEdMdz6+Fw9DWkDM50OSmqalG4Jrgt4h2Xaq0ZkLL8C8o7n047++ET/Oz1DRUlhR/UjeWq2G0xH9rB1pVGTzAA6xs2fcHvcJ4vlnwqSZvT51x0p3376sTvOkIS0rmFuJYbC73kIhsN5R0/nm4fOAPGsxwNZA720iSPYxxj1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752161865; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ARPdJjRRieiyGid3qKyk2GaLRoF6L5HCSmc4bsbIjN8=; 
	b=CyRA75/ZqFIFuuPTTp4PI27rewuJwhJzs1fuOG3C2RMkT1Esx3ST3hFBYYNkPFoI5H5XInF0W0Vs9hsbDAmgYSkb8vr8bL0OjXtgzkoNXRv0P/ZrqU/MbHEAal8oiv/oSnHOc13gti3s/DQAk/y6Oe4T42xsQYgr4WoYSYNXr9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752161865;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ARPdJjRRieiyGid3qKyk2GaLRoF6L5HCSmc4bsbIjN8=;
	b=YiTZdJ1LSPpwKzpp114ryt1YbLakvn7oYK6ymzfwcfjJKWr6ZGXunuwzfK1FDVEr
	Ij5TiHoRZ/R0zE1sQZ16S3pIKLouyFJFg2OCxVzW2/JRMQvmtoOEdJQNiS4OAC7CxAB
	+XgFlGQk+ugVh9aIWpFdmGNyEslSPf+1GJsIWRxQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752161862828247.07210203624948; Thu, 10 Jul 2025 08:37:42 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:37:42 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "helpdesk" <helpdesk@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Message-ID: <197f4fc4468.7d520309253626.7085799435648700480@collabora.com>
In-Reply-To: 
Subject: kernel.org email account for KernelCI
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

At KernelCI we are currently struggling with the Gmail API and plain-text.
Our recipients keep getting emails with line wraps and we can't figure out 
why. Both myself and AI dived into it and no luck so far. End of the day
Gmail is really for HTML based emails.

We received a feedback from the linux-next folks[2] that the fact that
log excerpts shared in the regression report has line wraps makes it 
harder for them to read it. (examples [2}).

Would it be possible to setup ci@kernel.org or kernelci@kernel.org for
KernelCI to send its reports from there? That could be a great solution
to our problem if you can serve emails for us.

Best,

- Gus

[1] https://lore.kernel.org/kernelci/197e685ded3.e673ce7447423.785163730221310361@collabora.com/T/#t
[2] https://groups.io/g/kernelci-results/message/58934


--
Gustavo Padovan

Collabora Ltd.

