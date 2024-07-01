Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D014AD25
	for <kernelci@lists.linux.dev>; Mon,  1 Jul 2024 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853439; cv=none; b=NAI6W30eoEL8qp3NjgkkLTPrL3FTf37SQcMDDd8tul9FBxVELGf1rmo8UDW2VNLUL5tW2FWy/n1VxgjxOttJvccNeLrzJmCGe7YSrpGvoF0vev/52MnhaAliH2JeWPlx/Iw0KozNNolSSlgZfIo6WXRtvjHNQRLNGkz+lYleisA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853439; c=relaxed/simple;
	bh=fSvr1epRNiYp0omMjG4fEBPNvj7H7x69we1VNuPje9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eg9vHWFmETSkAfGioFc84mFbPgPjqRADPc+qA7RuPnu2s04Ofm9O5gBR7/br9/c/rY+LErIbhH6Jx61Ks/orSAmAn99arQKIXJsDSuFjoC05Vx//S6+cx63dEHcAZOMN15qhSr0aswx9m/G5ZMsLexjW50oqgYnz4YAwzJlJwgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXsE3w6b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXsE3w6b"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso8890a12.0
        for <kernelci@lists.linux.dev>; Mon, 01 Jul 2024 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719853436; x=1720458236; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fSvr1epRNiYp0omMjG4fEBPNvj7H7x69we1VNuPje9Y=;
        b=qXsE3w6bRL9dOnUTFouCIWT5F0059BnQZgdnxVNb/7A8JWbsIIVudZCWBVMM9sxrx3
         AlkXuc8/HbO0UXdFBVl+cCflkR2/ChwakpLB+DKinwEzfyMpRbcNtd4bDVSWM05Rlns6
         zYeAPlH4/qJMNSGA007iP3OxXW3aEB4LaXCpPGKjUnMYpigqoy8E4Rdg+YsmMXBOV3HJ
         ov6JG7ei3BpzLmAHfRRcIPXOiMK5dfu4RoNEmmFbCPMgV4tqmAhBkTUYVuD11mzsipQA
         0x1gexkQajpUD/GapNnrt1zZ7IqK7MMl5ee+n/Gs0njZyA80WhK+jG/7aHnsE0/oHjH8
         35jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853436; x=1720458236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSvr1epRNiYp0omMjG4fEBPNvj7H7x69we1VNuPje9Y=;
        b=tYoWgHUmieH4nY2LwKCRXp9Jd+7PW/0nQmvFEQKKXwUeScvTa047ZqpA52JpX5eKpa
         Z445XjUHhN9B6P137HYZVuK4prKtynYbBLqjB9PCX3vyS/wXpNh7CmDxL0ON9TEij026
         NhgWtUEiv5++FPl7d8wpIy6i0cD3moYF3TqT5isSQcgwQ9jjB9snV7fadm1fPTK1VqWJ
         YNR9f1E7WPF+ymvR1jR2s9kYwguVap2bCDbujYxFbQ4Q1dVZNpe/nP+52rhdIj7ijxSa
         8IZqHkAFnchlVmJ67y7vsRgnjY3FufhccI+iOmMN8iTbUJGjJbG+EH5+9sa1AJoOSMvF
         kjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsvOlit3I9XfGLCDOUVTahZXhfZo1BST42yaFjp1t+27Y4nvnv6GxN5AnM4zQ5kOqqQ5Dl9OxQBdKc7QwHaXsY8UJmOyF/m1w=
X-Gm-Message-State: AOJu0YyOJYPUPNGquX4P7yp+7EJUsl0xRPFhLfT5kKARhmQcF0ZLO1fo
	Wy0x1X9CMVsysFqWDAiqBwhAy1AEFo4gdwJVin0/CdqxV1WaoKDMim3WOzpROr4fe2vGIDnPf5S
	2LPkXaMpXIooD4nI/QRQlg/BjlEcListojOtU
X-Google-Smtp-Source: AGHT+IGeoF+mckRdFAiNy+W4C7ocIaiXEJirQGwvGTT7ppxTr8cZCUunsgmvbvYvv8IPXborhiyOx2hl30Tv38mCQ1g=
X-Received: by 2002:a50:f68d:0:b0:57c:bb0d:5e48 with SMTP id
 4fb4d7f45d1cf-5872f673e4bmr410822a12.2.1719853435710; Mon, 01 Jul 2024
 10:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com> <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com> <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
In-Reply-To: <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 1 Jul 2024 10:03:40 -0700
Message-ID: <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
Subject: new branch + more recent gcc?
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Denys Fedoryshchenko <denys.f@collabora.com>, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Our kernelci builds are currently use gcc-10 and clang-17. We have 1
allmodconfig failure [1] that appears to be caused by the old gcc-10
compiler and doesn't reproduce with gcc-11 or later. Can we switch the
android builds to gcc-13 instead?

[1] https://linux.kernelci.org/build/android/branch/android14-6.1/kernel/android14-6.1.84_r00-129-g87fb1f2f1e795/

Also, we have a new kernel branch that we'd like to add to the testing:

repo: https://android.googlesource.com/kernel/common
branch: android15-6.1

Thanks.

-Todd
