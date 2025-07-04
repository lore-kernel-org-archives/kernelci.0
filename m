Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EC72E3702
	for <kernelci@lists.linux.dev>; Fri,  4 Jul 2025 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649486; cv=pass; b=Qc7xB0u1Z5y7aDNnqmR9MMtQ9md6nVHAwyBSE6imNHlkG15ibED85Af0qdBLpd+0cVVBSdQ9kwzkzAKyT83y5pkNAdA1nzGGQ7o6FIkeak9ulW9XS1gYdBo/4voquiv1pi3lLrewRNbwPzG+PKb9oSuzsWmNm8EFbg5FdPkaCF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649486; c=relaxed/simple;
	bh=T64y+YhW5tjbjaX7tG3/O0ySwwx8wn8m5M/vt3FFPqg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=GZ44Cu8Y+knqndQYpdYP+1+hoAUvNjyEQb6TytkIg/OcPAGXGNsxXbEsKEaOgT/LmKzKJUDntEJTnzyw2+1SyoKJOhtlVFN70LARYJykKQz4YQetJ+obPVb/kJXpTF/NOMKmdUnT7RJawES2Vx9tThWhwjCINGcDPspuP+PnxBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=ZBLAeM9I; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="ZBLAeM9I"
ARC-Seal: i=1; a=rsa-sha256; t=1751649482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QzVFVMbcUKV84a5sYk1Qq1J8SFFBrsIBp99NM6kDMQRDIDZNQ9y/3oS1FUbUpAKvAqFQMEfUnHyt3UvxEWGo3WQuMr/nfBkK23qAfgHbmwWZmyMfanH/aruYpMPdLEK2CbTtc8Km3c0qyWupSfBFmt/KUy4wLkO89Dnot1HVH2Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751649482; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=njpWMCRHhO/bQXFfxAgLCH4WqWqorjwQ31hNovrGHoI=; 
	b=OcpPBo5QlTn9858p/y5nBYFqp4TfCz3w//TL1BRM06zQh2YMWBuW3yvQGzeHz8bPT6YJ1APl+6xAb5KTv5DOHxpcM2KuHWRQW6PH+Cq2zemqD5NEC4HZvFxNnTSKOHFigygXjB4FaI7xRfzHrC+fA6SC8CzWmblltcxf/fG+D38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751649482;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=njpWMCRHhO/bQXFfxAgLCH4WqWqorjwQ31hNovrGHoI=;
	b=ZBLAeM9I7DH/vu4PsF1CMM7e9ckKRBqGBhX9clLr4ZXVFWQIxqHVByeyq5yxN1zz
	cFy7jH3U3EmCeC+a8d1WHCwHfcwmNrCZaEyH3Z6iFEC55YTZ8j7XvM3ArQbQ9BF7WHA
	/rj4+78CYKKzcb5pcuXro+HinAfguOoCMWr3sfPg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751649479617368.42753651692294; Fri, 4 Jul 2025 10:17:59 -0700 (PDT)
Date: Fri, 04 Jul 2025 14:17:59 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "kernelci" <kernelci@lists.linux.dev>
Message-ID: <197d671eb9e.126ad1ffd778607.8492163273409295826@collabora.com>
In-Reply-To: <20250704225909.52d1555d@canb.auug.org.au>
References: <20250704225909.52d1555d@canb.auug.org.au>
Subject: Re: feedback about KernelCI reports
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

Hi Stephen,

Thanks a lot for your email. We appreciate the feedback!


---- On Fri, 04 Jul 2025 09:59:09 -0300 Stephen Rothwell <sfr@canb.auug.org.au> wrote ---

 > Hi, 
 >  
 > Firstly, thanks for your testing and reporting. 
 >  
 > Just a couple of simple thing: 
 >  
 > It could be worth while reporting any tag on the HEAD commit.  This is 
 > especially true for linux-next which comes out every day (with a tag) 
 > - it would give people an upfront idea of which linux-next tree has a 
 > problem. 


For sure. I can fix that quickly for you next week. Adding the tags
is definitelly possible. 

 > Also, something is line wrapping your Log excerpt (and the reported 
 > error/warning) which makes it harder to read. 

I am aware of that and tried a few things to solve this. It is something
in the Gmail API handling for the KernelCI bot. We'll look into it again.

Let us know of anything else you'd need. linux-next is a foundamental
piece of the Linux kernel integration process and the KernelCI organization
 would be happy to look at other needs you have. 

In the coming months, we should bring up regression reporting for
execution issues, eg boot failures, kseltests regressions, etc. Today
we only give you the builds, but kernel boots and tests the kernel
on a huge range of hardware configurations. We are working on strategies
to clean up data, otherwise, we just add noise to you with yet another
bot reporting things.

Best,

- Gus


