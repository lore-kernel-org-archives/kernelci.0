Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346AE223DD4
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032571; cv=pass; b=EVzoHoiLPZosVj9fVg9iII9VU2s7k4ey4y+9WARic1iU3XY1HEPkT9T5xYBj8OUveCiC2ghsHegmvVq6/QFYHjuXnvpFPXGS+n6GDigMEAy+jx0C7nYqY069VwS1HRsEn25y++hCACyMS42fXHpNWiVSXx6MDnLuJ9iEZ9zEOqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032571; c=relaxed/simple;
	bh=HjKs4KW2yoRLOgU6gTRpGdRO20X/m09IWDc0c+UkQYg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=uuWpt1fjIDq423tGV6UPw3UWxc8w82tIT6D1PU6aK89yrHaDKLZ5qo9y8GYWv720UysRUNun9kkstVrkpXb1Erjxz8WBRHqIL92UJ+V4duGIgZU2cSfwQMMTVhTTE5nd4R5iYeDgpPWugVCcest3+MpmUO25KtMusaoRS8QZc3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b=NG78MuGv; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b="NG78MuGv"
ARC-Seal: i=1; a=rsa-sha256; t=1760032565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D+836Odsd17wZhDdMNfJpAA4u1ZSNE3u2hAJ0fmgdGs7R5AMtFBmNWu1SqG9zPYY9H5HtrjNf5Bgt09WxY8B4ZMhlQNvkWTlrqzw/KlwdO7EjxqRGlXzs44Erxzg9O/VvreOlxdMV3UWwkEV1iGBpOPE5U/JWAh2LH/quI4Xwb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760032565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h/rfaxvI36N8vOB7+C1jdljA8ZWKcVsHe+No4AW/KKo=; 
	b=hYZHx2FJe4O+ONNxntWU3Qu3229CkAiER/0fUDIscNVwZTNirshcwxdIuWOsko2Pc27O2cyUMnPd8K0wxNImTEjLvAu/UwxHj+NYGZwfTZebscXsNdrMMFusISI/ACtkMQI49ypVOEoKsNomr1wEyWoiBt4ZiH4KwO2RwT5Dp3g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gustavo.padovan@collabora.com;
	dmarc=pass header.from=<gustavo.padovan@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760032565;
	s=zohomail; d=collabora.com; i=gustavo.padovan@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=h/rfaxvI36N8vOB7+C1jdljA8ZWKcVsHe+No4AW/KKo=;
	b=NG78MuGvqz1bKA8pIikyjIb5ZgfFCvpkh3Od9CQtxZ5nhqY+Hr34pbJq9xSSMGU2
	ojH5+SjNaiv8l1kBCTMV25Jir3SQlDkuSwX2rY5nP1/t+N3S30wMuD9IdpSdZHiJqEA
	MfNb5oNaeD7Sw7dJqwckxMc0ZzLDjfnLioynj3bU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1760032564097326.45259546711986; Thu, 9 Oct 2025 10:56:04 -0700 (PDT)
Date: Thu, 09 Oct 2025 14:56:04 -0300
From: Gustavo Padovan <gustavo.padovan@collabora.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Arisu Tachibana" <arisu.tachibana@miraclelinux.com>,
	"kernelci" <kernelci@lists.linux.dev>
Message-ID: <199ca1da36f.3eb5d2d71134650.481452717096278691@collabora.com>
In-Reply-To: <2025100944-spinning-clicker-4c03@gregkh>
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
 <2025100911-unloaded-showbiz-4639@gregkh>
 <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com> <2025100944-spinning-clicker-4c03@gregkh>
Subject: Re: CRA compliance
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



---- On Thu, 09 Oct 2025 10:06:42 -0300 Greg KH <gregkh@linuxfoundation.org> wrote ---

 > On Thu, Oct 09, 2025 at 09:51:44AM -0300, Gustavo Padovan wrote: 
 > > Hi Greg, 
 > > 
 > > ---- On Thu, 09 Oct 2025 07:48:45 -0300 Greg KH <gregkh@linuxfoundation.org> wrote --- 
 > > 
 > >  > On Thu, Oct 09, 2025 at 07:43:08PM +0900, Arisu Tachibana wrote: 
 > >  > > Hello everyone, 
 > >  > > 
 > >  > > as per the discussion of last week, 
 > >  > > for moving on with the CRA compliance topic. 
 > >  > > I propose to create a private mailing-list called 
 > >  > > security@kernelci.org or security-kernelci@lists.linux.dev 
 > >  > > 
 > >  > > any objection ? or suggestion? 
 > >  > 
 > >  > Why is this needed?  Kernel.ci isn't going to be a "steward" of anything 
 > >  > used in a commercial offering, is it?  If not, what would it be for? 
 > > 
 > > Indeed. Although KernelCI offer free testing services to the community, we are not offering any 
 > > products or commercial engagements. So we don't need CRA per se.  However, on a related front 
 > > we are working with LF Legal to protect the testing services surfaces as stuff that KernelCI creates 
 > > gets to run in internal networks across the industry. 
 >  
 > That's great, but that has nothing to do with the CRA :) 

FWIW, I just pushed a PR adding some remarks about reporting security vulnerabilities to KernelCI:

https://github.com/kernelci/kernelci-project/pull/553

Best,

- Gus

