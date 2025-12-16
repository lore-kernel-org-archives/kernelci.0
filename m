Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876423EABF
	for <kernelci@lists.linux.dev>; Tue, 16 Dec 2025 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765849381; cv=none; b=WeaTba7HPMYiMsQ+UXNgz3K3/ozFTQOOi3cYwu40adQfFbTHGYF9aD/yvpSuRJuNp4j4XBsYORYyXf60OgJZ+98/Raw0XnXt05cW+OA0u20hGD+hfemCF6zySt8DR2bbg1GpBrqBpCrn8Kytoy5R6DGc/90GrCPAUGuVmgXcw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765849381; c=relaxed/simple;
	bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCdColczH7ASep25P4ceqB3H/SRCzGcZGmWJT5aph3x0WEjr6XwMryTWoBuNEM0dntWuwDLk9LIBnBAL+3N3k4N4H7TwphLRddpfCla+oax2TjvUa5vE/UIFlmzI7aWNySAHy5xwmcaADCCHd+U43YrihcMj14rkfggHZU7AMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcuRE69F; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcuRE69F"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso14026345e9.1
        for <kernelci@lists.linux.dev>; Mon, 15 Dec 2025 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765849377; x=1766454177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=BcuRE69FuqWH6If/F9W3FW6XyhpPpWhanIqHtvP3jZdEi8GRoS7cBSK/qGw4nJiaaM
         EC7pUj7YC8btFpjlriAMqg03f2nl2ZZKASfwoaFTApCPurjSN4Mor0MAQNjWd5cTDABW
         d3ZUjqgGIxaRN1ItgkwZioBB+nVjQk2Hv+sohhyWB2EQvsQZf+hp2i4vwxZrX/TsWb/I
         cjGmrnCW2o8P5afuc7olfQNjIOxeXpWqZ/qlbHXtsGL0PyAsttOO/HgNdE/VXIiOVEev
         aGnWGjwdVEPFbCkyee5CDp1E/g8wryeQp2HyuwpxuMjPci1/jwzF9HDjddg+gFUjJuzk
         zNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849377; x=1766454177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyiAfBS1SHi1ogYvB6RKd2TbkiFPHcyLTNoNsrXdb6o=;
        b=CqNxxkwgUziNa6WcwVM/s9q/9/SCTU+LzKVSw6Spnrm0yyADWE8kg+/D2Zljc8QuAh
         j8l8eRulhH8Vt4fgQ48GxOsWbFZhpKGWOjB7TMp3dY+tdv1dYdMB95acRoTe6cSlfmKY
         HJWiOxnO3wgLqBJj8otLBG1T8etlormzMmuI+NYnx+KRo6HmUdmj5sPmh3NcXRg+iV1d
         vyCrUQc5kXL2sfIjZH+UyP2wTR58VJNyJ7ssmdONS7WKP1rj/jKGx7RRt/Hj90NE6bZ/
         YXS42RxGokVBNbmxv/8tte7+918XXrOEVf2LfgRXd1eAw0162TnGGFAlKFE/A2fAfrVb
         XmWA==
X-Forwarded-Encrypted: i=1; AJvYcCVB4TuQlglAH5JQJ6p4NFN7uZIVxoml2YGCWHFv4nOsq5qJHhp9NfwwbKUOt45AyXynh60ne1hlFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUHuuTRtviw8maLNvfhDhVis6Nv9oA7FsXJoXFYJQXOO/FLXYr
	LPvAAmd3B1HLBDrmWZo6Y871IxawFxitZsaQHPBdXnaC87eQ6nwrFTUXpaLi0iz693e8buNYuBq
	MXP8+ozwObedQDM026GrDH5xBeI1Aqtk=
X-Gm-Gg: AY/fxX667T2qXb7Jo+BOjWcytcDulfhE1bkFQ5EbSvf66EoO/ol6pqFWGKVcH3JE1p2
	3h2AUkig33UQovjB8Qmf1m9pkHkAc+2IRuGYkB/pZrFynnsgNmSVh9BOxIrexRq/0RicCcN7M1y
	kwUTb2pa6U5ANNmwlTcxR1ONMZGkioZJsyA4bSKWGe4OHCeU60/ppQt8/2r/V4l52Ff3SV/0Q0K
	AUjAFPgG6mpzJqlynmGwHHbnqUY1WhGC68a4wtzX7VYIWBggML7SgKol93oHkCpxpuluglAodO1
	ZIinEmiwbBaDLl+WsPoH2LodZnhV
X-Google-Smtp-Source: AGHT+IHXZEfg1p3HRgI0++xedDQyyt6TVJAX8tLf80JYu34CJbWOG8x06pVXb0fDbpBBSUhZfKL0ivJQkRM5N2F1zdU=
X-Received: by 2002:a05:6000:381:b0:430:f3bd:720a with SMTP id
 ffacd0b85a97d-430f3bd763amr10307348f8f.27.1765849377540; Mon, 15 Dec 2025
 17:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176584314280.2550.10885082269394184097@77bfb67944a2>
 <20251216122514.7ee70d5f@canb.auug.org.au> <3cd2c37e-458f-409c-86e9-cd3c636fb071@linux.dev>
 <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
In-Reply-To: <CAADnVQKB1Ubr8ntTAb0Q6D1ek+2tLk1yJucLOXouaF_vMqP3GA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 17:42:45 -0800
X-Gm-Features: AQt7F2qZ64Mmn0-BWatGXdXbAgAM-TAJMN_WlLu09kQhu9Y_Np5ib-yXqYgCTp8
Message-ID: <CAADnVQLE1R=DDjj88u+xuws8+JLKo6J2HiLj=jpO8MLpbp98SA@mail.gmail.com>
Subject: Re: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option '-Wno-suggest-attribute=format'; did...
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, KernelCI bot <bot@kernelci.org>, 
	kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Linux Regressions <regressions@lists.linux.dev>, gus@collabora.com, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Networking <netdev@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 5:37=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
>
> I removed the offending patch from bpf tree.

All,

heads up. gmail doesn't like me :(
I see Steven's and Ihor's replies in lore, but nothing in my mailbox.

And Steven's reply was a couple hours ago.
Nothing in my spam either, and I was cc-ed directly!
So it's not mailing list delivery throttling.
Ouch.

If it looks like I'm ignoring your emails, it's not me. It's gmail fault.
