Received: from mailgw.nuclearcat.com (mailgw.nuclearcat.com [78.47.178.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BD11A2C20
	for <kernelci@lists.linux.dev>; Fri, 17 May 2024 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.178.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715982517; cv=none; b=SqqQq0mu+DNnuyQxTe1HfDgpIYNW6mx8bwzeqnqlvypf0hsZGZ/g262GmFl2MvHS1OwmEYdMhUrKi0YWW5VbMB2IL/nwdV0aSRzu3hhDVh5kRlmu9Cz5ih+ilYe7OXZC00vrJIhZMtBgpoflxskQXk2RkZTU3EhNnoNqbC1hTGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715982517; c=relaxed/simple;
	bh=icF4a1LikVZbtIkqcGc6l1s5cfrO4tXyVIilJT8tBGc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HDjBqU8Udc5Jmuf645deDfUF/qw7t2AACldjqQruL2KJ6WQx3wMXdTpKTVv//4pXmyB7wGNgRftqnbd8pb7T6uIZ9XWP5TC6VoJa7+j6d0n7HOwkjtz0xiGT3GpNWQIFOjrPstuapihmCOnKqGCFLvp+ZM+Tgyw81IP4/JuQjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com; spf=pass smtp.mailfrom=nuclearcat.com; dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b=vNB0Elad; arc=none smtp.client-ip=78.47.178.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b="vNB0Elad"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3E58607EB;
	Sat, 18 May 2024 00:40:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuclearcat.com;
	s=dkim; t=1715982011;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references:autocrypt;
	bh=icF4a1LikVZbtIkqcGc6l1s5cfrO4tXyVIilJT8tBGc=;
	b=vNB0EladQQ2dVkZHYG7FJPnUyOxosgdds2TJOkPbQyRkExa9uQ7Qpxi4Ewk2Cp4fL07LlF
	xQo7Aul312yuQrMV1htG9+JUAYNrQjAllyUALcSSudk3NevwwAbhr+dOL6LRoNZuAtPnKn
	hYpxy+Aas59NhUpif00moo4CSmYQMQkGrBmq3NMBHUr1BTPhUg2IvupJ50GvOvAcZLhu9C
	fsW0Om4gkCxWCPbuOXEIKSl+vI8v2PX+2k9yS8DyXwgoA7ng3kSq+KUh++xyOWzen63CAw
	87jMnHE12bM4XQQlcQ9d689a9RNHaUhke9BXn9RTrxDf9Sb00CONMvUYQPExdw==
Message-ID: <78fd3f63760c0670cee4a8a4ac99a91a2b62706f.camel@nuclearcat.com>
Subject: Re: linux-media checkout failing for KernelCI
From: Denys Fedoryshchenko <nuclearcat@nuclearcat.com>
To: Gustavo Padovan <gus@collabora.com>
Cc: linuxtv-ci@linuxtv.org, "kernelci@lists.linux.dev"
	 <kernelci@lists.linux.dev>, Denys Fedoryshchenko <denys.f@collabora.com>
Date: Sat, 18 May 2024 00:40:03 +0300
In-Reply-To: <8edccc0b-d71a-b6ec-392f-3946f768db05@collabora.com>
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
	 <CABXOdTdhkEADZO2YXM_RPdLooo7Lo9=WqsWS1euXxKqFLE6g9A@mail.gmail.com>
	 <8edccc0b-d71a-b6ec-392f-3946f768db05@collabora.com>
Autocrypt: addr=nuclearcat@nuclearcat.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 2024-05-17 at 12:57 -0400, Gustavo Padovan wrote:
>=20
>=20
> On 5/17/24 11:29, Guenter Roeck wrote:
> > On Fri, May 17, 2024 at 6:41=E2=80=AFAM Gustavo Padovan <gus@collabora.=
com>
> > wrote:
> > >=20
> > > Hi Media maintainers,
> > >=20
> > > We are struggling to use the media tree, in the same way we
> > > usually
> > > virtually all other trees in KernelCI. The following commands
> > > gives
> > > KernelCI a fatal error.
> > >=20
> > > git clone
> > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > cd linux
> > > git remote add media https://git.linuxtv.org/media_tree.git
> > > git remote update media
> > > git fetch --tags https://git.linuxtv.org/media_tree.git
> > Why not "git fetch --tags media" instead of the last two commands ?
> > That is working for me, and it is what I always use when fetching
> > remote repositories.
>=20
> Hmm. Maybe we were just being newbies with the way KernelCI does it.
> :)
Actually, the problem is that this "magical sequence" in the legacy
code was written years ago, and git blame gives incorrect results, so i
can't ask author "why?".=C2=A0
It=E2=80=99s a sort of "Chesterton's Fence" in the legacy library.


