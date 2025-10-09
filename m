Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5F23C505
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014312; cv=pass; b=eO7Jiz6Z+Xg5gz3KYOd57cVV6ybpWgBMObcdyIMnrBgV2IrgAX6cWbla5RGob2NKursmZ5c3cJjiXQTl2YjWwDsrDh49L6UdFZ0wrKKWsj7UZqtEOvbNc/nfAxwxqWeZ6gitu47nYGPvsh5wQVTPKKGRYtugKE16gJm2JVNKOa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014312; c=relaxed/simple;
	bh=gVM8uvWoVod1TaYZnRNokT/wP9rJubtY6/O5Fbd8VFI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sj70PSDWwNBuzG1nc8FCatlbnbFTLujB7mE9OWX3YlC+wyUKd2fDLOGn8cUKCt9rb5AkKVsX4md1WmEudjYgOhpo29DmBcpjNlXIXAdMqwGIew7XGzCdqI+5TpMH0NQJE8Lt/PD85cSnpymCimQY4y5UYkTCWVKiUajNNug6Svo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b=I7rFZYNO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gustavo.padovan@collabora.com header.b="I7rFZYNO"
ARC-Seal: i=1; a=rsa-sha256; t=1760014307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vp4nonlNO5DBvHlhFZssb5VI9sfvRx3HJb5EsQIPo7/5OwLWgfbXB725xWuZTsHEWlA9dGdtLWclV1m9mI6E4rIrObzQq3Xvzontwa77CckfbrDxGejlV3Z7lbqA2Dh+Qdu/+4qX7dHyy8HE2hgGT2xXP7WhKgFDmBqN11IG3yE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760014307; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iJNNi4QDf4vzSEQxI/a71iMX79sODKPRPanwJePgusQ=; 
	b=GoCkCP2iKxpY4uv4UH7/ImH/veKuRs6vNhw78/tpBSP3BRfURutgYHdrsGushCgGLI17TV+VBeOG7K3qkCT/GPgg5aCM7ox0IUer4xKfJuESaGKw3vkQoW00n1fMU9z5oPkfS4bs77FrIs88QCZpfhi/xeEneSX064tHZjhbCZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gustavo.padovan@collabora.com;
	dmarc=pass header.from=<gustavo.padovan@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760014307;
	s=zohomail; d=collabora.com; i=gustavo.padovan@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iJNNi4QDf4vzSEQxI/a71iMX79sODKPRPanwJePgusQ=;
	b=I7rFZYNOnIihxjWKHjAEVKRpXO0yZtdCy1HBqwQcVKcmWuXf1ZSbT0eeSBGd7NYz
	10LBofHjNmjq4iYmUJdDV80OzCYkmi3vZGIWH0h7NUSlJwsfvYLuwHSPMaOGjW4iZMs
	kJWGsewhhj4JHnkADYhtQXvJvbtSfeepHRROkx6c=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1760014304948561.5284185430941; Thu, 9 Oct 2025 05:51:44 -0700 (PDT)
Date: Thu, 09 Oct 2025 09:51:44 -0300
From: Gustavo Padovan <gustavo.padovan@collabora.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Arisu Tachibana" <arisu.tachibana@miraclelinux.com>,
	"kernelci" <kernelci@lists.linux.dev>
Message-ID: <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com>
In-Reply-To: <2025100911-unloaded-showbiz-4639@gregkh>
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com> <2025100911-unloaded-showbiz-4639@gregkh>
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

Hi Greg,

---- On Thu, 09 Oct 2025 07:48:45 -0300 Greg KH <gregkh@linuxfoundation.org> wrote ---

 > On Thu, Oct 09, 2025 at 07:43:08PM +0900, Arisu Tachibana wrote: 
 > > Hello everyone, 
 > > 
 > > as per the discussion of last week, 
 > > for moving on with the CRA compliance topic. 
 > > I propose to create a private mailing-list called 
 > > security@kernelci.org or security-kernelci@lists.linux.dev 
 > > 
 > > any objection ? or suggestion? 
 >  
 > Why is this needed?  Kernel.ci isn't going to be a "steward" of anything 
 > used in a commercial offering, is it?  If not, what would it be for? 

Indeed. Although KernelCI offer free testing services to the community, we are not offering any
products or commercial engagements. So we don't need CRA per se.  However, on a related front
we are working with LF Legal to protect the testing services surfaces as stuff that KernelCI creates
gets to run in internal networks across the industry.

Then for security breaches in KernelCI, it would be a best practice to create kernelci-security@
mailing list for people to report issues and for us to community privately with parties running 
KernelCI infra too.

Best,

- Gus




