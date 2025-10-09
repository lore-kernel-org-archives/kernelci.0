Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3A1B4F1F
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997249; cv=pass; b=aa+JGq+WLTUcwdbgRqxDDt7NjFUBarePo52dOL2xnS7vNaQknAzYERUXazAK1YRjUtGWpnekVEyLH4+NwetahWoOYvz7+f9dELZtvB9jMjewzohxeH0zdUtW3YO3csxIdmyI2BdB+A5JhVTuKtvyd9ONuHj/odFYpEk8OBA5XLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997249; c=relaxed/simple;
	bh=1TqJKoNjn4ByF2OBPsOxZSrUxIxSHN1fOI8Af51L3tI=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=q85MFTTJSZMw/OzHTrCb+Csb899RIRNfJ7StvEo6J0qlLF+W03aG3WF23KrHcRJ+A3hbck8VDzxK8n4uxS+Qb38SQJHBau55JZgBJWDtsq7JvERQ+UsfAdiPnsFbpFMk2HjJzaTNHnOE3HS77wwRAE1oyNHLm8Vtlj1LNIPMtMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=jeny.sadadia@collabora.com header.b=gU7qMnTi; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=jeny.sadadia@collabora.com header.b="gU7qMnTi"
ARC-Seal: i=1; a=rsa-sha256; t=1759997246; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HWm+Q0DUlNswCeu8tdWIszKtWikE0XN0s4k/DiDmasL9O/Lip1/9Mnz38JoS2EQIrSEynUjWnLCAdG414DZ3ja48L2SAtpRnZv4AjYZSNca7AcF5Eg+YqBBQX9HPIsOCBK2WMisdVHX2hXWeio+i1wlaABdWgSLS7zVBGwTmaIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759997246; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x8svHb6yuc1S8dctiui6bkh0b1fGXHADHkGDiAQEQMg=; 
	b=Ha109OUl8dyPeYYN3m9FLLK8q7voQcQpH0ph/lSP0PxAbkfTI4wAGss4H1X/TroPTQzTFazRj+djUzminLO4MlGdM6zz5jH5YbCnrvmnN6k3SvbUyI2RTp661EQL0U1HAyEpZlwgai8Q4OqXFBt6ZYbVVjPieTui7nwP8QBSVPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=jeny.sadadia@collabora.com;
	dmarc=pass header.from=<jeny.sadadia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759997246;
	s=zohomail; d=collabora.com; i=jeny.sadadia@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=x8svHb6yuc1S8dctiui6bkh0b1fGXHADHkGDiAQEQMg=;
	b=gU7qMnTi4sgbonZNTVXUiXy3Cljx4lkvSopNqNtoD4Mcd27h5cFnO9Hk9j3V95wf
	ma/FpNprtpoIQvt9sUWC0EfcB0ceu34zoZV5eRpz9MRRRCiSbEVEwIC6BIr8oyxPozx
	koI7cL7CVOaDvmAFNcyh1/lkDjDneNNCUO75+F4E=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1759997244207180.55987407903524; Thu, 9 Oct 2025 01:07:24 -0700 (PDT)
Date: Thu, 09 Oct 2025 13:37:24 +0530
From: Jeny Sheth <jeny.sadadia@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>
Cc: "Gustavo Padovan" <gustavo.padovan@collabora.com>,
	"Denys Fedoryshchenko" <denys.f@collabora.com>
Message-ID: <199c802b31a.87bfe0c3749015.1897839108561675072@collabora.com>
Subject: Core pipeline discussion topics
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
 
As a part of KernelCI roadmap 2026, we have listed down a few
discussion topics.
Here is the link to the document: 
https://docs.google.com/document/d/1VVD1bSIv2Y9_dMiNrnwrr8kaf3v8F_t-m4LtrEWDQJs/edit?usp=sharing

We would like to bring this up in the community meeting today
as a part of Infrastructure WG discussion. The aim is to gather
feedback/suggestions from the community and improve KernelCI core
pipeline accordingly, to deliver quality results.

Feel free to take a look at the document and add your suggestions/comments.

Thanks,
Jeny
Collabora Ltd.




