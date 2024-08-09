Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13665190693
	for <kernelci@lists.linux.dev>; Fri,  9 Aug 2024 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723197259; cv=pass; b=KQhfQOXhW6nFjuebqFKb5Gs2u+2Ra8DhfqdrQLiU805tTC6SY5iDQQUW2aHvoeFH4ixLVBXyNBxzDvL8pKLChGtT+nDkwjqvNwBXxHQ7vPAWLUgoYbM3qBMuXDRCAPdsHQeDJe0Twn/96lM4PLs9/GOsFT1Q0x136tnDxmSCVOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723197259; c=relaxed/simple;
	bh=oH7zGf9BsTrCOQ1kT3MgJlQheo+P8Zb1VfmCZUdM2+4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XQrkwYCSndks5J3rYUAOPWeuNsI64isLTYjzbjse8mRTIUvF54d/BLkZTLExJ3rFBZoMM6+oxXgqWaCG5IXOxU5oWw+Ez8NonVJXMKQSDQ3lcjeMHRK/H6KIuZZIQ0QlJ0NDQjvEFy7dhqmaCvRPj3g89G5FxPmw/DzaaP07Jao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=W7TSfmcS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="W7TSfmcS"
ARC-Seal: i=1; a=rsa-sha256; t=1723197254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hmPGWNtx3mVZcPGc7QBeFh89X4/6xfECyPl3kBqcyLKPbtmBA1HbTAnYao0rvVjbtTdtJpynurGR5jiH0jSc7Q5/KpNJyOzDO7O9u/qyMOA27RLAyA2mirseH8cPqTrdwkpEdQE842dEsOxb1Aqnkq7WZE7baYi8u9eYNk51pQI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723197254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5VGo5f4pMIp1JLRInvDVVLVPUsolNCWMVVD4hIrh/XY=; 
	b=HD1bM7RKS48Tc0HRYnliLm7pjWL6qquFo2w/4F5KrruiXtBHMXIxafbvWOvCdXbyZtYdzjaZhokQuubvzLaSMNwH/Z5VhVeOGYsSVJjQskZj9CDHl6zp0ZNj9mPCG3ih8x4aM3KONuK5fDTQKgqvAjSESefX7nAi/I1s8WzELs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723197254;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5VGo5f4pMIp1JLRInvDVVLVPUsolNCWMVVD4hIrh/XY=;
	b=W7TSfmcSvWu/LY6zWKtZyIanppRwV86HG2lKuZRBlCUOoCPVOpmitmn8RbPXJadB
	BCVRjZBBXXiSR5xm1/ingNZQMIJnfsPnjSY4A9ErrAkUVcJ6f/F+QcCgfoj/IMA83ms
	NBBRkXJ7EaE4ZpGRvWv5oj02biV0eDN7LKlPAAqQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1723197252928188.79104567471097; Fri, 9 Aug 2024 02:54:12 -0700 (PDT)
Date: Fri, 09 Aug 2024 06:54:12 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Nikolai Kondrashov" <nikolai.kondrashov@redhat.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
	"kernelci" <kernelci@lists.linux.dev>
Message-ID: <191368f6519.1255159db1531582.6052135423553525786@collabora.com>
In-Reply-To: <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>
References: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb> <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>
Subject: Re: Kcidb access request
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



---- On Thu, 08 Aug 2024 14:56:12 -0300 Nikolai Kondrashov  wrote ---

 > Hi Bjorn, 
 >  
 > On 8/7/24 6:49 PM, Bjorn Andersson wrote: 
 > > I'm using api.kernelci.org for reporting test results from my kernelci 
 > > lab, as well as scraping test reports for Qualcomm boards for local 
 > > aggregation and presentation. 
 > > 
 > > As part of the transition to the new KernelCI APIs, I would like access 
 > > to KCIDB. 
 > > 
 > > 
 > > My (custom) test reporting tool today uses the LAVA callback interface, 
 > > and thereby follows this schema for the report, groups and cases. I can 
 > > continue to follow this schema, or change the schema as you prefer. 
 > > Please let me know. 
 >  
 > Sorry for the delay with the answer! 
 >  
 > Sure, you can get the access to the KCIDB database. 
 >  
 > However, we don't have APIs, just the direct access to PostgreSQL, which keeps 
 > six months of data. See the attached (abbreviated) schema dump. It largely 
 > mirrors the JSON I/O schema, which you can see here: 
 >  
 > https://github.com/kernelci/kcidb-io/blob/main/kcidb_io/schema/v04_03.py 
 >  
 > Here's some more human-oriented introductory docs: 
 >  
 > https://kernelci.org/docs/kcidb/submitter_guide/ 

This link is from before our recent domain switch...so it gives a 404.

See this content at https://docs.kernelci.org/kcidb/submitter_guide/

 >  
 > Note, that at the moment we have no way to query for "Qualcomm boards", but we 
 > have a schema change proposal being discussed to address that. 
 >  
 > Also, when fetching your data you will need to be considerate of traffic and load. 
 >  
 > You can explore the data on the dashboard (to be improved soon): 
 > https://kcidb.kernelci.org/ 
 >  
 > If none of the above stops you, I can give you credentials and permissions for 
 > querying. 
 >  
 > Nick
