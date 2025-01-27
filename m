Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BAD191F74
	for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005155; cv=none; b=iAhutM80YFNlUZzh7stFhS7wOoJEYkfsWFyzcY2ox0YNRMhnfZ4p2wH96vIrGDLK56btgR+sGdaq740ucrRYJuUfsaZzsBoPDwqqjJKBMr5t7Xm5r0wlMgEcNKb2yfNKWg7S8Hnq/MDxTRjqRUsm2d51Y8x15+3CcJQ+6RAMLdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005155; c=relaxed/simple;
	bh=UcNITMy5DVWrZbbR/azPBFt9W9DY/yhAk/aJXSOMVAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhxM7/4OXpYhY81XESR1VFCmpzk7RxC02t/iXBPSgdx0EHx3eCxBG8RxwzEbTIqvmFb2GWIXwBTGOw+bTVYB5rzZroo3CAho503KgFqJ4oHcsl4xk7nS2bWg7407+dexL7fUOFB6o2qE92yuH41zcpB6deLSLDwjrL3Bna7UASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VfFaXqLx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VfFaXqLx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso6833123a12.3
        for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 11:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738005152; x=1738609952; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oRWc0yc4UzREqFCikMBtMstVl9pz1QdSpT6OJeveUwc=;
        b=VfFaXqLx+k+XhE80hBVDx0pMJi3pml5KSUmIGMbbSND+ZKVLumky15ZGupT939Am3D
         Uw40K7aMEmSdbqjKKbrOZXAvN8UtsEpQPMW84xLAJDl8vq4Hj90OYrg6d3LyTCbf9AKV
         m0yIKYtjZFgHcpJiZjnZ1MZvA0YgbdoL0h+co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738005152; x=1738609952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRWc0yc4UzREqFCikMBtMstVl9pz1QdSpT6OJeveUwc=;
        b=PcGCDCJCkadjc5py1XrAvKs8VyQA3BVIV96uXLLeaW3osXzcsuKqaiVeXYf723Az9q
         PUBvV7MPOLZpfir9ZAqxfA2Tjn0fMJ8Q+nqncGU/bfuvHikf9YkoqgwgPvFxX2y6sUo8
         +H8V01/tEWpYPQ6Py8JTA46kcQGblVK3/konbTraj8HybXGuRPglHFA5qFCTJsPhrRj+
         s8yzxrLVT7ssXMzMeJD+CYsmhJKE9xnXFjWJoLiHcgUsvWT23BOXcWINjbzoupgpxMrN
         tsaomoO5cx7M7LFiKrNPAzf5y8XS9mFaTqMz8cAKgeY2iZk5PlRRGNdawT7XcAsw7Ch3
         1ODA==
X-Forwarded-Encrypted: i=1; AJvYcCUgz79jiS0tUWOt9CTqdjyYu9Tz9kwuBC4/J0/+SYsyMYlunmoumVCvxHGu4Jmu+EUhndzciviozQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6QlQDDxCnme9+EBMp7q+cHMQSLRdcji1ZCjwIEop5D1ZgYWBO
	wbrL0ePLdCd8UgkqgBRCn8TJPV8J6py5BIAVkI+gllajd2gncF7W9t8qbS0SzXYOUkvNFp5lV/R
	n2Tk=
X-Gm-Gg: ASbGncsFXAmm2CTbmqyUp3csyh1kpv6qTCgFtLpmV0gGJMhuh6mcQlhC0YWnwc80FAQ
	5lZxi+nTntY/3sKvVGk13I/YLIJRCNxWKsO+abF/bxyGCag/c52p9L71aayOYPLbZuIl+TziVP1
	Tmw5Fgx6Vxsqr62H7DOkOp8PJIsBdS0+6XoUVIhppH8+p+nWGRaa8gYiPogCYNOT/+mSRUahhAj
	UT6qY9pnQ/UVBM743YPrm4QE7H6oOtYcnsz/pcASqdsepT8k6s4+m8MVu3Itj9sUeK2R/o3pUqA
	o906Ua1GOmDPAPBDPcDP+yI/N89tAy58ulVU+8Wk7v80WAb9fZgJ57w=
X-Google-Smtp-Source: AGHT+IGr+bdDOEyqBhbR1LvF/51nWXZ4xkELdz+XETn8n1GET4ZK9t5Z2EyqCAIkJw4003fBjacs2Q==
X-Received: by 2002:a05:6402:40c9:b0:5d0:214b:96b0 with SMTP id 4fb4d7f45d1cf-5db7d2e2f66mr37871321a12.1.1738005150036;
        Mon, 27 Jan 2025 11:12:30 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186183eesm5823161a12.10.2025.01.27.11.12.28
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 11:12:29 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9e44654ae3so791305266b.1
        for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 11:12:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtZ7O8Qny/VxOZYsmobnoRF/arnnAL+9D1X1Ci8OQzS2niqtsNmS06eFWnyHYpnNdTE1Xraj32mg==@lists.linux.dev
X-Received: by 2002:a17:907:783:b0:ab3:64dd:bc89 with SMTP id
 a640c23a62f3a-ab38b1100d9mr3171825266b.20.1738005147960; Mon, 27 Jan 2025
 11:12:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250127044721.GD1977892@ZenIV> <Z5fAOpnFoXMgpCWb@lappy>
In-Reply-To: <Z5fAOpnFoXMgpCWb@lappy>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Jan 2025 11:12:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=PVSpnca89fb+G6ZDBefbzbwFs+CG23+WGFpMyOHkiw@mail.gmail.com>
X-Gm-Features: AWEUYZnfYCSPESiHiidOrlrhf_2gR4sjvZbtI4_GCzVar-LNOMBy-6juZGoYcwQ
Message-ID: <CAHk-=wh=PVSpnca89fb+G6ZDBefbzbwFs+CG23+WGFpMyOHkiw@mail.gmail.com>
Subject: Re: [git pull] d_revalidate pile
To: Sasha Levin <sashal@kernel.org>, kernelci@lists.linux.dev
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 09:19, Sasha Levin <sashal@kernel.org> wrote:
>
> With this pulled on top of Linus's tree, LKFT is managing to trigger
> kfence warnings:
>
> <3>[   62.180289] BUG: KFENCE: out-of-bounds read in d_same_name+0x4c/0xd0
> <3>[   62.180289]
> <3>[   62.182647] Out-of-bounds read at 0x00000000eedd4b55 (64B right of kfence-#174):
> <4>[   62.184178]  d_same_name+0x4c/0xd0

Bah. I've said this before, but I really wish LKFT would use debug
builds and run the warnings through scripts/decode_stacktrace.sh.

Getting filenames and line numbers (and inlining information!) for
stack traces can be really really useful.

I think you are using KernelCI builds (at least that was the case last
time), and apparently they are non-debug builds. And that's possibly
due to just resource issues (the debug info does take a lot more disk
space and makes link times much longer too). So it might not be easily
fixable.

But let's see if it might be an option to get this capability. So I'm
adding the kernelci list to see if somebody goes "Oh, that was just an
oversight" and might easily be made to happen. Fingers crossed.

              Linus
