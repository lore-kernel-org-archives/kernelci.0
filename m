Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CC2207A3B
	for <kernelci@lists.linux.dev>; Fri, 21 Feb 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740136168; cv=pass; b=gHzv5QvJ9F0U8PLsKTMHg7nW4nZM8Q20Gw3Nd7JiNc//VceDrQhGA1kxr/DzAVYFhPVUhHzGJhFCtNtHWUiXftUTzrqbqqVbrWECAFKfXJRDHFu9Sx+60FaoZKmjZSc5MIIvsu7Dr9PnZcQsEpP++uXf2S8yJPzodRtb5UkMcJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740136168; c=relaxed/simple;
	bh=RzP69mkxaIchBQkztCas2zW9iV+08/L+YXZOhFY7T40=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QtmGCRe7qxpM4KBfjMCtazzrCE3Ym08ZK6ocLLxKd0OsOw8DwXDga4njTwTp9YtEahQVPWr7h0wtke8calaYz7AqNIqjOlDfBJafnYbsvHEsW6S2lcQI34YfkioneUCax7beCnhOMqgATszynel6cQjxhBdeMDoVSUAt+TJVzx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=O5E9UPYK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="O5E9UPYK"
ARC-Seal: i=1; a=rsa-sha256; t=1740136165; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WH44VRl3ATbnpfki/5yyndROJp1RxiU6zfDfzaAgG4uBCGf/vuSM4OwzTFe41gSdl3xQ0WZHoMdiq5y3PVjnQ2HoJQ6w3Cp5SeWZaTpDsUcUfQMxVMHjPLWxUo3qrppCAc/7wL6QTd1DgyXlgd2O/UZ2+UMWkDWOdmY/HP0hIDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740136165; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XZZsSwc8qzmEQGpfkE36vZwvrWmlaTcdRvW6yyQ+sII=; 
	b=kP4nIhwst6iccTmPG7BUIvVxT4dfRhjh3jiZv0ecar6xkkGxlnsvj9rPEDOlVpRZp+8+CWHAGHgtN2e83S+6vMelgNSvLbFoMChn8zJJ6nHCSNDDgSkGuGX+9sBJP1KH7CvtGIajGwTl0LFHW4GWuOORQ6kdStIZs3iV+1JctE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740136165;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XZZsSwc8qzmEQGpfkE36vZwvrWmlaTcdRvW6yyQ+sII=;
	b=O5E9UPYK0D+kVlmrTrWK1ruHem+ll307mJi9a5MNy5y6wOlcyfMhwhApVRH7H6JG
	rRSMaE1rFHYaIYbUAkK8A72zU5WHUfxtU12gvKSNICPYbVmDAeAsA3veW2TdH7may11
	4iQNRUeShLK3gf8/cCoV6sdoTLcdb97gnAL7S7ko=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740136162510670.9214336592745; Fri, 21 Feb 2025 03:09:22 -0800 (PST)
Date: Fri, 21 Feb 2025 08:09:22 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "timbird" <tim.bird@sony.com>
Cc: "Tim Bird via lists.yoctoproject.org"
 <tim.bird=sony.com@lists.yoctoproject.org>,
	"automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Laura Nao" <laura.nao@collabora.com>
Message-ID: <1952832a4b6.d0d15aed1251473.1259835302068680712@collabora.com>
In-Reply-To: <MW5PR13MB5632B7EB58214F663F45288FFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1826117EE2C56F0A.25123@lists.yoctoproject.org> <MW5PR13MB5632B7EB58214F663F45288FFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
Subject: Re: [Automated-testing] [boot-time] Call for boot time data!!
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

---- On Thu, 20 Feb 2025 21:41:35 -0300 Tim Bird via lists.yoctoproject.org  wrote ---

 > Oops.  I probably should have told you where you can get the tool. 
 > A link to it, and instructions, are at: https://birdcloud.org/boot-time/Boot-time_Tools 
 >  
 > > -----Original Message----- 
 > > From: automated-testing@lists.yoctoproject.org automated-testing@lists.yoctoproject.org> On Behalf Of Tim Bird via lists.yoctoproject.org 
 > > Dear Linux testers, 
 > > 
 > > I could really use more boot data for the initcall and boot region analysis I am doing. (I'm trying to build 
 > > a system of reference value files for an initcall duration regression test I'm writing for the Linux kernel). 
 > > 
 > > If you have a machine, or particularly any embedded dev boards (like a beagleplay, beaglebone (*), raspberry pi, etc.), it 
 > > would help me out a lot of you could run this tool: grab-boot-data.sh 


One can create a KernelCI job with this in the rootfs and grab this data for **all** devices. We'd be happy to support that in KernelCI as we really want to grow boot time testing capabilities.

Best,

- Gus



