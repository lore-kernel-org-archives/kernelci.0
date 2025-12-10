Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E63164B5
	for <kernelci@lists.linux.dev>; Wed, 10 Dec 2025 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385449; cv=none; b=ms8Yr+Kr29OpJOH0aMS5lOGRDVoks4O3JSBmk3c51SWMWg404uX9Jt5xCszxE8EONv6bHwA8R72rDDkkbLPYrvdmkAwTzs3GkEbRK/7Mgt8HK1+A0Wf+4PXloDQgR9fe/4uRtDsldGE18T7imyT2Yn6gO339zNDj/9FPBn9GSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385449; c=relaxed/simple;
	bh=NaDt23Ukl91/F40RAIYGqVqzKPDaGDX8qyw3Ui6EPNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNcyD6YwBXx/e7VXUuG0H0g55yY0LfZmdqzBE+It+siwba92Oei4JVqEUBgbMQqwe6Lu6wRfPbHyTNe0EX26itHR0FkRIld/pAp+nK6RLboOPPqJZyjBZTL3UJzohMOi8ELFsSKJCL/GL42A0g/nQRqxMq1Bjrj7wiuWpbSAb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=ZBAT0Dnj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="ZBAT0Dnj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so8515729b3a.0
        for <kernelci@lists.linux.dev>; Wed, 10 Dec 2025 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1765385445; x=1765990245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Il+LSnejb2zoKNKtmn4km8qN8DJt6MEE3ZHwaYHHnJM=;
        b=ZBAT0DnjaYa5CBIMb50+F0pLYKvqGht8HT09ce1rxzaMgcmms8L+ZrxsXrKg+YOjlK
         S8vOZ1yVYGdkvO57ZlFRqh4wAFKY97818O+oWuNRQFBaBYYrnEYaPA+QuidOyOTU+Sxi
         +5aoKTGVnZY5esN9fu1VZihcrrD+Mjt1GN71TxVEhoad5LPmQFUFk9AczZLhvt8EIXLW
         O1/2xb0+6UoUjfxSLqEbd2+RQvAVVKjFS9yE7l1BsEXFNzVpFa7OzfOOHgDZ4aRKgAYJ
         NcnniGVl9I3J66iY7uphl39Y9dUejbxLPFXsK+04pq7A6oSjxMjoEhbaw1l83JYuj8a8
         6rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765385445; x=1765990245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Il+LSnejb2zoKNKtmn4km8qN8DJt6MEE3ZHwaYHHnJM=;
        b=EtotI04qDhR3qmSZPof+ZVteuwM6duGwxJj/ahmOT5UaojhZlVwIAjkEqhYOD0vv+C
         bpxrPYVMDx6GA3oCDOVF+e4CxfCZGFSXmOn9PIR0Hrjn8+ocITldHCy5v2+OCLFuvXis
         9xTOsogW/6W5BBKRz+kjSEVxWdVE6Mv4a2i/IUNkuqyOZIE6LPAconeah6wBqNVMoBij
         3EgYV+ZAMqxQlEUlWCd+FzRAyMjWSTAekftHEFRVLskQ9VsjOaMMmoPtnt7ejaK4+MHJ
         LCQwxPZ4whjvxk+yMlbdBYrjLGi7PpRk4MfY/11HN/6cRuu348ch02SpRo5Z3hDSnzRR
         abYg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1sbWuHPKUAMcUVA3MmEA8/LJcK+i1MvwiU4RYM4U85Na6VnfSgrc5RJ/iOunmxDM2AbiiDS//g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGLNdWm1e8diJ9/dvchaZe/NVkVDUJTcsggESITYtd8TvyiMp
	XxxfPmrMBMfKvZaoubyOQll3E0YwrMr/0sbZ3qRBB1RA3r0TidmNkWIuozp6St3si6qSCWDbk7I
	PHgZAFeX6qqLeZUle1j8FDrW3T6grGokmj2/CVTXF
X-Gm-Gg: ASbGncvrQsFOiZRAbrDQIRHGW5aQalfU2UcoeBKYvUrO027Hgg23BUj9vjryVIVoq4F
	MXVEu+oeZ3dBFZmknOA5Pm/9KEk5pF0jhYQ6nzlbgiVGdMAg3vo72no3/j2PIH++FNnZH9f3Jae
	LCWoazb70+QtUMRkjEsKG7QYMUQ1mC9UNig2hQhkSWTLE4kRbKmM0/9IRcO9FAuHlSDriU7Kf++
	wDZnwNIi0lU5VAQXubxfe2CjB2PTtUtyVjB6EbvyOV7mEZ+RRDohXLeui8qRKO/lJRjPrw=
X-Google-Smtp-Source: AGHT+IGzHxlpYBgJeARMIqF3hrLN+RU2slpVMDSbg14NArQeqPTk+uM/TfDMIyikxJ+IhMCXD+Nqxy5ij/ZALWgcc74=
X-Received: by 2002:a05:701a:c963:b0:11a:37a7:3d2f with SMTP id
 a92af1059eb24-11f2969f05cmr1728192c88.37.1765385444678; Wed, 10 Dec 2025
 08:50:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aTj6C69JzDUJUVP4@sirena.co.uk>
In-Reply-To: <aTj6C69JzDUJUVP4@sirena.co.uk>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Thu, 11 Dec 2025 01:50:07 +0900
X-Gm-Features: AQt7F2pZJv9uDItPsuNKepIWhUIu5JbM5pL-ButzctEptaVqAWUwRO2V_lw9Q7s
Message-ID: <CANgtXuMHo2heKG4zRSM_qeP6NpQGEPE+DNUexenTrN1eV0-LFQ@mail.gmail.com>
Subject: Re: b4 pr checks for KernelCI results
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 1:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi Konstantin,
>
> It'd be really handy to have integration in b4 for querying the KernelCI
> APIs for test results when both sending and pulling in PRs to see what
> the testing state for the head commit for the PR is.  There's some docs
> for the API here:
>
>    https://docs.kernelci.org/
>
> Possibly this could just be pointing at the dashboard if there's result
> there, that'd be a start - there's a bunch of UI issues with starting to
> get more complex.
>

Hello everyone,

would be nice to have b4 integrated/using kci-dev (the official
KernelCI client tool)
the documentation is at https://kci.dev
https://github.com/kernelci/kci-dev

--=20
thanks,
arisut
