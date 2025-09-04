Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732AF3451AE
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010379; cv=pass; b=DBPFFvO1z5ih7RyUwbBIbqC9rG3Gzy7wTlDQdrZYjtSpg1rg1hw/THKbJ/NgQ0IEivTCZCsGJLXK0wJZba9/HCvtM9hAlDO1AVyHepoeB8p0wQB9qRQReGde0b+fcVKof/q6GLRgW1dnzkrUU8s0IMPY3zcYW7KrtL9q31xi5bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010379; c=relaxed/simple;
	bh=aTGj8DWpl1dTvN+tZcTzrwZDBM+kv/JcJkJB+wwYdSk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=u/73956BNlu/+9LUG9+oqP0WTyWDlKnKVtxXQ2mqboKxQucbdeBZmUOtS7G11bnjX5R4dOE1Dqh7xp6CPX5GAIsPMjHeqoglcEHPovl2QJqN19dzN6bl/7QKb/POCGH9cg3vXCIAKE+WJA1OVxAQ0fbHE6/O5s8/Ugovu9rJ6qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b=bxacKZbE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b="bxacKZbE"
ARC-Seal: i=1; a=rsa-sha256; t=1757010370; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ow0aK+Ul7nhfbwHXAKeonC4GcYkJxNogHnnPQ83sgmUG2BijWGDn0inyb0E6O35bWyZLkZv57BDIpXbtA2AmprDAMdioRW3tHjTsCA1yGuIQQWtyCWC5McL7fJUmMfTroo3nzgRfile0xML0zdX93/W33goZaEyGyD89E1pyrE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757010370; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QnhYy44fn0cVLLjf/HXv+BsXKl6j3wm+G5COSwinCx0=; 
	b=MtSXk/P4Skan6wFf7yr7xQHzplOe+Khun8Z84JWeNFzQ4fy2W6LCO5ebUeRdKcBFY7W/kErnwULMugUNmUBFvlNa7Oys6rkuQAz72NJQEVACweqhAbLdEoDALpKUJ73yZJfqkdvJxvUdvtIvoVkoExvX0ibFtvj9wLjAtbWkxBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gustavo.padovan@collabora.com;
	dmarc=pass header.from=<gustavo.padovan@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757010370;
	s=zohomail; d=collabora.com; i=gustavo.padovan@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QnhYy44fn0cVLLjf/HXv+BsXKl6j3wm+G5COSwinCx0=;
	b=bxacKZbEYLpNr5a3V0QLB540IPsQ5YYEOYsVvbXMsxLlIMKJYhTmnmfeZPAXnu7F
	lKJbo4Q+aFpkdkR7JWF/7ZvzqgurIgS5s/BwiV9xZGd1AknT1HK7/IY+qneoEpm43nd
	ocCT0T0pp3BhzFYX04thkwA5ed2AzZw4jxHhBQak=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1757010369016770.2023263580115; Thu, 4 Sep 2025 11:26:09 -0700 (PDT)
Date: Thu, 04 Sep 2025 15:26:08 -0300
From: Gustavo Padovan <gustavo.padovan@collabora.com>
To: "Donald Zickus" <dzickus@redhat.com>
Cc: "kernelci" <kernelci@lists.linux.dev>,
	"mwaqar" <mwaqar@linuxfoundation.org>
Message-ID: <19915fa99e5.7b0518867233639.6735313177092517749@collabora.com>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
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


---- On Tue, 02 Sep 2025 16:24:13 -0300 Donald Zickus <dzickus@redhat.com> wrote ---

 > (resending text/plain) 
 >  
 > Hello KernelCI community! 
 >  
 > We have recently revised the KernelCI TSC charter[0] to establish a 
 > more effective approach for our future work. The TSC will continue to 
 > monitor and provide technical direction for all activities and 
 > services related to KernelCI. Additionally, with the inception of the 
 > Infrastructure Working Group, the TSC will serve as the primary 
 > interface between the KernelCI community and our key users (kernel 
 > maintainers and developers, hardware/cloud vendors, etc.), translating 
 > user needs to the Infrastructure WG. 
 >  
 > The updated charter requires a new committee to be elected, consisting 
 > of no more than four members, each serving a one-year term, with only 
 > one member per company. 
 >  
 > If you would like to nominate yourself for a committee position on the 
 > TSC, please reply to this email with your nomination request. 

I am adding my nomination too to run the elections for a TSC seat.

In the past two years, I have been heavily involved in the strategic directions
and technical architecture of KernelCI. During this time I have been representing
the project in various conferences and community meetings. I am also a
contributor to several projects in our github codebase.

Best,

- Gus


