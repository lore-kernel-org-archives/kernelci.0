Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE031FA8DC
	for <kernelci@lists.linux.dev>; Wed, 18 Dec 2024 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734542438; cv=pass; b=DQiEfTZdJnimUaTavDuDm55C4DRfdLwKg0iI0bN7oFQDRfIJ0JLOlwCpOnG6A2x7oo8g01npQR66ij3fKCN1K3y2p4GUx70dIQccU/4pAJyGY6Jp1dUlCn6MafBdhbljWkgqhk2tzKYs/L8cXc5T1QpkWMQX2i2i2CF6vckSK3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734542438; c=relaxed/simple;
	bh=SPE8jIddQj17389fpan4Nw9u/C3PsTO0Q68sLwlaw1U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=cz+hZZNMLwECdv8mfs9RACinPF5pXauTv15+lOk4WBKlCFWDeAzxnd4+jbjKsQN7jqv7PNS3Xzm3Xgnt58AdGxqayp9Ha+o09L17OQ5TQgsHJxfWSL1NeKiRnszGkMxHZZqOgJv042OUMfD3cIgcuM0UwPcVubPI5Fywbc6Q/Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=VQ9+bZR1; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="VQ9+bZR1"
ARC-Seal: i=1; a=rsa-sha256; t=1734542429; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jOQNlyghNXRUGwjIuWZZdto2N8sdKb8Q30hV/cfATeG4Q7hlfvvPyPrYVxey2oLpkofUig/r28UEnqTLngBXt6Iz48TOF/e5Qrdmlc0ypEMSNyP5cXgwP4oG/nCwBtGe2DwNko3eccKnshpMujpl2KkZdeFCVOjtKV6Ua7p2njw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734542429; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VjDFPEwEhN6J4PfPqdTiVLuUpQAbHXV2mLHR8NNuWz8=; 
	b=HfGRb7dF3wHaRXj9n5cBGigq0ObfgmS4UT6lW5H5LDeikbfpshL7D2/60/fvW9JGWtCPFjJO+gH/nW5wdpdj7eGx8VlWXCw6LUZXX9UPxpnzGy0AgwjyXWXGnG5l2XVeanAY1dEHGPHQkIbzOhxzSBVE92GNMuE35gAV3a82+JA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734542429;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VjDFPEwEhN6J4PfPqdTiVLuUpQAbHXV2mLHR8NNuWz8=;
	b=VQ9+bZR1JGvMOyJHIC1HO0R1JP4VyN8+Vcw9BFW1QTwMo51fdBR06CBFGG77XYpg
	GvclmNRFfrcIdx7t7qrQHUZuzeRi8o6MfJZYoPI0FVBEuthGmousYwGCpFqknPRwncH
	drJCHImO/ioiLuTXJhJ+3WYYJOe8axyoyOCCEYT4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1734542427426775.2300171264964; Wed, 18 Dec 2024 09:20:27 -0800 (PST)
Date: Wed, 18 Dec 2024 14:20:27 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Sasha Levin" <sashal@kernel.org>
Cc: "Greg KH" <gregkh@linuxfoundation.org>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"stable" <stable@vger.kernel.org>,
	"Engineering - Kernel" <kernel@collabora.com>,
	"Muhammad Usama Anjum" <usama.anjum@collabora.com>
Message-ID: <193dac90503.b68e06472045980.8166399130362883257@collabora.com>
In-Reply-To: <Z2LtivhNCqY3WiJU@lappy>
References: <193d4f2b9cc.10a73fabb1534367.6460832658918619961@collabora.com>
 <2024121731-famine-vacate-c548@gregkh>
 <193d506e75f.b285743e1543989.3693511477622845098@collabora.com>
 <2024121700-spotless-alike-5455@gregkh>
 <Z2GWCli0JpaRyTsp@lappy>
 <193d562463b.1195519191587461.735892529383555996@collabora.com> <Z2LtivhNCqY3WiJU@lappy>
Subject: Re: add 'X-KernelTest-Commit' in the stable-rc mail header
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



---- On Wed, 18 Dec 2024 12:43:06 -0300 Sasha Levin  wrote ---

 > On Tue, Dec 17, 2024 at 01:10:07PM -0300, Gustavo Padovan wrote: 
 > > 
 > > 
 > >---- On Tue, 17 Dec 2024 12:17:30 -0300 Sasha Levin  wrote --- 
 > > 
 > > > On Tue, Dec 17, 2024 at 03:49:53PM +0100, Greg KH wrote: 
 > > > >On Tue, Dec 17, 2024 at 11:30:19AM -0300, Gustavo Padovan wrote: 
 > > > >> 
 > > > >> 
 > > > >> ---- On Tue, 17 Dec 2024 11:15:58 -0300 Greg KH  wrote --- 
 > > > >> 
 > > > >>  > On Tue, Dec 17, 2024 at 11:08:17AM -0300, Gustavo Padovan wrote: 
 > > > >>  > > Hey Greg, Sasha, 
 > > > >>  > > 
 > > > >>  > > 
 > > > >>  > > We are doing some work to further automate stable-rc testing, triage, validation and reporting of stable-rc branches in the new KernelCI system. As part of that, we want to start relying on the X-KernelTest-* mail header parameters, however there is no parameter with the git commit hash of the brach head. 
 > > > >>  > > 
 > > > >>  > > Today, there is only information about the tree and branch, but no tags or commits. Essentially, we want to parse the email headers and immediately be able to request results from the KernelCI Dashboard API passing the head commit being tested. 
 > > > >>  > > 
 > > > >>  > > Is it possible to add 'X-KernelTest-Commit'? 
 > > > >>  > 
 > > > >>  > Not really, no.  When I create the -rc branches, I apply them from 
 > > > >>  > quilt, push out the -rc branch, and then delete the branch locally, 
 > > > >>  > never to be seen again. 
 > > > >>  > 
 > > > >>  > That branch is ONLY for systems that can not handle a quilt series, as 
 > > > >>  > it gets rebased constantly and nothing there should ever be treated as 
 > > > >>  > stable at all. 
 > > > >>  > 
 > > > >>  > So my systems don't even have that git id around in order to reference 
 > > > >>  > it in an email, sorry.  Can't you all handle a quilt series? 
 > > > >> 
 > > > >> We have no support at all for quilt in KernelCI. The system pulls kernel 
 > > > >> branches frequently from all the configured trees and build and test them, 
 > > > >> so it does the same for stable-rc. 
 > > > >> 
 > > > >> Let me understand how quilt works before adding a more elaborated 
 > > > >> answer here as I never used it before. 
 > > > > 
 > > > >Ok, in digging, I think I can save off the git id, as I do have it right 
 > > > >_before_ I create the email.  If you don't do anything with quilt, I 
 > > > >can try to add it, but for some reason I thought kernelci was handling 
 > > > >quilt trees in the past.  Did this change? 
 > > > 
 > > > What if we provide the SHA1 of the stable-queue commit instead? This 
 > > > will allow us to rebuild the exact tree in question at any point in the 
 > > > future. 
 > > 
 > >Yeah, future-compatibility sounds better. As long as we have a git tree, a SHA1 
 > >and can match that to the test execution in KernelCI it works. 
 > > 
 > >Is that SHA1 different from the one in the stable-rc release? 
 >  
 > Yeah - it's a different repo that hosts the quilt series. 
 >  
 > We won't find that SHA1 in any of the kernel/stable repos we use, but we 
 > know how to recreate the exact kernel tree with the stable-queue SHA1. 

I just looked into the stable-queue repo. I was clueless about the fact that it is
not a kernel tree. So passing that SHA1 to pull results from KernelCI won't work
obviously.

I think we have to go back to Greg's suggestion of sticking the head SHA1 of
the generated tree into 'X-KernelTest-Commit' just before you send the email
and delete the local copy.

That will get us going and then later we can revisit the approach if needed.

Thanks,

- Gus



