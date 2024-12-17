Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D0C1F4712
	for <kernelci@lists.linux.dev>; Tue, 17 Dec 2024 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447703; cv=pass; b=AynSBHRh+7eyOBds1y6DNZ9czsQCOPQLuWa20kOyo4A04d2cXCDYjbi0oXTDvpMHRU7MquEueaLIEcdkhAM7x+nn1Eawhf18nlmBAjomAKzPb3r1A5FRDp+ok9+Z/6kN3MRUsnjgCKL46S6Rj7Dlh24GMSGpQrahH894XZZSM3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447703; c=relaxed/simple;
	bh=owL6Jb2ucV79lWXE+yGx3Qqe0SfG9BpFiGhd7x9aCAI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EbJXjJ04AlfkhIKUdwj/f5LdjW4ChBUwQ8nYEiu0zuhrLwukxkeFkBkA/3n+n3/KqueoEoMyS+HmpF10Yta4j+6acp3TkQMzhGXCfavoRDdCfbnWk73hrZwnKWcAjcCWlNViMJa8ZTqpvOweZL4T+LPQmn0Arv1GL48RUMwC0s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=BYJ5d6eW; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="BYJ5d6eW"
ARC-Seal: i=1; a=rsa-sha256; t=1734447694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gfhRSx/3rGofvHnQWh3KBkQT4+nFxeTqlvsqAB4Xw+9E+4ABUyda9bq18pyV/0qjfWS5sVDmef+iE/Hkpi/bHem76HwYqt9Pc/zlnIWAd8RT24BkjTcXaZPtOiAZ6NLAnwyl4xuv4UGwdOcx75cNyJcS9JkKnlARNEr8+Rr74lE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734447694; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=natGVYadNY1uO4Ycg79DCI9gFnr2nyFb4qa/JABKF1A=; 
	b=gY3PGvsd3j243FqsLxo40kUUlpDsotbOmgoor7UshnCumd4X1JsRR3DqOCfj+SePt11yhExsgKJf6B60v+9zWNOkxtXJ2LW/iOdQW9W3Nb97k+g0pjVKLJtqSLJeXkDEW508VwJhlstB8aLv1DLSUropuKPKJHaxfVKjq1Z4/7Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734447694;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=natGVYadNY1uO4Ycg79DCI9gFnr2nyFb4qa/JABKF1A=;
	b=BYJ5d6eW0PZnnaWezodI5edZO6o7IoHARbFRwcuYXALqn4TJMTTqqltOupvTpxzv
	ielBiYkwOhapX4B6EB0uVW/xmWuizUQdz2xgJ5JMJNhCbM3diCnreYei2eveOc7TrB0
	mVYg7g6Ndy0CMai/bnohP5za58pjO4u4XaIc5g2g=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1734447692416375.198128358649; Tue, 17 Dec 2024 07:01:32 -0800 (PST)
Date: Tue, 17 Dec 2024 12:01:32 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "sashal" <sashal@kernel.org>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"stable" <stable@vger.kernel.org>,
	"Engineering - Kernel" <kernel@collabora.com>,
	"Muhammad Usama Anjum" <usama.anjum@collabora.com>
Message-ID: <193d5237a65.c96d8ccf1557906.2641695653454944180@collabora.com>
In-Reply-To: <2024121700-spotless-alike-5455@gregkh>
References: <193d4f2b9cc.10a73fabb1534367.6460832658918619961@collabora.com>
 <2024121731-famine-vacate-c548@gregkh>
 <193d506e75f.b285743e1543989.3693511477622845098@collabora.com> <2024121700-spotless-alike-5455@gregkh>
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



---- On Tue, 17 Dec 2024 11:49:53 -0300 Greg KH  wrote ---

 > On Tue, Dec 17, 2024 at 11:30:19AM -0300, Gustavo Padovan wrote: 
 > > 
 > > 
 > > ---- On Tue, 17 Dec 2024 11:15:58 -0300 Greg KH  wrote --- 
 > > 
 > >  > On Tue, Dec 17, 2024 at 11:08:17AM -0300, Gustavo Padovan wrote: 
 > >  > > Hey Greg, Sasha, 
 > >  > > 
 > >  > > 
 > >  > > We are doing some work to further automate stable-rc testing, triage, validation and reporting of stable-rc branches in the new KernelCI system. As part of that, we want to start relying on the X-KernelTest-* mail header parameters, however there is no parameter with the git commit hash of the brach head. 
 > >  > > 
 > >  > > Today, there is only information about the tree and branch, but no tags or commits. Essentially, we want to parse the email headers and immediately be able to request results from the KernelCI Dashboard API passing the head commit being tested. 
 > >  > > 
 > >  > > Is it possible to add 'X-KernelTest-Commit'? 
 > >  > 
 > >  > Not really, no.  When I create the -rc branches, I apply them from 
 > >  > quilt, push out the -rc branch, and then delete the branch locally, 
 > >  > never to be seen again. 
 > >  > 
 > >  > That branch is ONLY for systems that can not handle a quilt series, as 
 > >  > it gets rebased constantly and nothing there should ever be treated as 
 > >  > stable at all. 
 > >  > 
 > >  > So my systems don't even have that git id around in order to reference 
 > >  > it in an email, sorry.  Can't you all handle a quilt series? 
 > > 
 > > We have no support at all for quilt in KernelCI. The system pulls kernel 
 > > branches frequently from all the configured trees and build and test them, 
 > > so it does the same for stable-rc. 
 > > 
 > > Let me understand how quilt works before adding a more elaborated 
 > > answer here as I never used it before. 
 >  
 > Ok, in digging, I think I can save off the git id, as I do have it right 
 > _before_ I create the email.  If you don't do anything with quilt, I 
 > can try to add it, but for some reason I thought kernelci was handling 
 > quilt trees in the past.  Did this change? 

If you can save the git id that would help us tremoundously right now!
We understand it is ephemeral, but it helps during the rc test window.

I don't believe our legacy KernelCI supported quilt either, unless this 
happened in a remote past. We basically pull git trees and are now
opening the path to receive patchsets from Patchwork et al.


