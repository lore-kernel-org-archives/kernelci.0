Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934281AB52D
	for <kernelci@lists.linux.dev>; Mon,  7 Jul 2025 20:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751919227; cv=pass; b=nuny+3aAtkUiUR1d+zYay5HXnxp1nu9SDvK5JSo4ayxaL4PKcDZtWgbLqa037BANPXrR+9edVR/g5P4ZWWxY87vKMYnTpvu332xyUUVXtE7tWI/OgWKqPxE3rK+h9064QjxfakAL62VKpKKGQ2b1iOz09WXeQVP6Xw8mAKJrKHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751919227; c=relaxed/simple;
	bh=Rx8x+UBi4w2Hy4E10Hqoc25FefH/hNg5KSnA0M6sxpk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=by0dhuQde490UbC7UbeAG+ITVQRK+cakRzXxQzdsbLPiCzh3GIsm2p+TLc268brYhv9+KRnI0QxXtAiCl5PUyOibra2W2ouTZX511t2YfHgHLrQDQqLmkPVVUzDstu7gS9mFTMRqMRLAFwuGi6cuz/93Fu0zwyiYBTWtDRvgEnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=ZnAONZ7y; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="ZnAONZ7y"
ARC-Seal: i=1; a=rsa-sha256; t=1751919223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lyy1WFtGjZbNu7UJkNt9NwlrHOfIfEXtWkMMCXRvvbmOovEhdjClsd/5BS+fHXIKZq04Fmsaq2EOYRa4Cp1cFTxx6VKUSbVnemBv/gS8KTh5F2aBBliFMNY6er0OkJKbW74lkZb8xcfoSYxz+jt6u7v85E2vYYOW8WZtdgJnWas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751919223; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ypEKcNnYzvKXYGzYGKAndaAtx3umsxfWwU4DtOX8Uo0=; 
	b=kpAf8ygC9MOlKsfDyaSosIEzXkTwUZgdh3eLKncwiCTxv1XdZPTV6z2N9LyugCe9tct1wMFEhpST/UJWFX1iUl2i8JBagfmhijWLj1sGaezsZmod72XC5BQiu29PGOwBrFbTMf+Z/Pt5XAhUagtFtXP5123saDVvKvBm+XtAluU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751919223;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ypEKcNnYzvKXYGzYGKAndaAtx3umsxfWwU4DtOX8Uo0=;
	b=ZnAONZ7ysszH57EJzN2+Cs20Rwgu1OAWTEgbthztppD8v9nuW293pLoZvdlKWX/r
	/cfNAqyoghEzAKFouCrSYMT8M46pHZqs9b0dl34tAOmVQUe8URdNqbqAD3OBtgy0xEL
	4te0mCGZV52Dn5ncAqufjotRhFPFjaQn6NjdkDms=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751919222511267.07592660932244; Mon, 7 Jul 2025 13:13:42 -0700 (PDT)
Date: Mon, 07 Jul 2025 17:13:42 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Gustavo Padovan" <gus@collabora.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
	"kernelci" <kernelci@lists.linux.dev>
Message-ID: <197e685ded3.e673ce7447423.785163730221310361@collabora.com>
In-Reply-To: <197d671eb9e.126ad1ffd778607.8492163273409295826@collabora.com>
References: <20250704225909.52d1555d@canb.auug.org.au> <197d671eb9e.126ad1ffd778607.8492163273409295826@collabora.com>
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



---- On Fri, 04 Jul 2025 14:17:59 -0300 Gustavo Padovan <gus@collabora.com> wrote ---

 > Hi Stephen, 
 >  
 > Thanks a lot for your email. We appreciate the feedback! 
 >  
 >  
 > ---- On Fri, 04 Jul 2025 09:59:09 -0300 Stephen Rothwell <sfr@canb.auug.org.au> wrote --- 
 >  
 >  > Hi, 
 >  > 
 >  > Firstly, thanks for your testing and reporting. 
 >  > 
 >  > Just a couple of simple thing: 
 >  > 
 >  > It could be worth while reporting any tag on the HEAD commit.  This is 
 >  > especially true for linux-next which comes out every day (with a tag) 
 >  > - it would give people an upfront idea of which linux-next tree has a 
 >  > problem. 
 >  
 >  
 > For sure. I can fix that quickly for you next week. Adding the tags 
 > is definitelly possible. 


I pushed a PR into the dashboard for adding tags. It should be in prod in a week or two.

https://github.com/kernelci/dashboard/pull/1337

 >  
 >  > Also, something is line wrapping your Log excerpt (and the reported 
 >  > error/warning) which makes it harder to read. 
 >  
 > I am aware of that and tried a few things to solve this. It is something 
 > in the Gmail API handling for the KernelCI bot. We'll look into it again. 

I also investigated this, but it seems to a deeper limitation into how Gmail API
handles plain text emails.  I tried a few things but nothing worked, even though
when I use that API fetch the e-mail that was just sent the content is not wrapped, 
but when a client shows it, there is a line wrap.

Maybe we need to a different approach or different mail server.

Best,

- Gus
