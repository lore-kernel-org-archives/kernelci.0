Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86501D63D9
	for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737751842; cv=none; b=czTi2AF97SrPz7hoyTjZBhMwr3lxxs2FVN/2SaPuuGv/TKKkIXtJt7pPzA4UIO4st4v6gwjV9zerU6qCxOFoYi1SuZX9+o3JVOtVJOyCJOf12op0EvEf1E91Vbul5XvmIKsera8ljMKhgVb1oUJMbyO/COcio6AuJwMaXp7+OpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737751842; c=relaxed/simple;
	bh=pdzsCT8xL6jHZ+tnR3Hwgg863MADe4016kWtdjp4rcw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qpY4ljxZhoBDgqKDzvXzJ+GE1N7zxqYgTsmXrXt03kNr7jqBlWHERHhPB2VgdOm/nesJ9CcrjdZRy3LEcatzYl6t9mVH8CURTXK+jiqag5FexBGq3WdGXQbMY02KPQcLPi1PtXEAnvc83sXqyHbfUkpRslw7Ma6ZvYB8ESE9ZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDBrSLEY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDBrSLEY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21680814d42so43164375ad.2
        for <kernelci@lists.linux.dev>; Fri, 24 Jan 2025 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737751840; x=1738356640; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pdzsCT8xL6jHZ+tnR3Hwgg863MADe4016kWtdjp4rcw=;
        b=ZDBrSLEYeVeGvwtQ8NmmAERJ1BlUaz0tfCtOlietYqN7UIDKx8yyZEn0rD1j0lFhys
         tEvkvA4nVF6AQ31ehftCwjsTH4413a665znfbCumdRfJ0db/8E5EjlicBlEJC00jo7R1
         cm3C6QL7dvwF7kuCm7gWLN+U1sdiMBsciGj6c92eMLUWT41m00yWpumr2uOBxHFnNPls
         pOp4xQ4GEC8OssmDPdJSKc3Ja/w5/duqDAzK8vNHcoiqXxuuQ/HhXzs5SuyNmik0l3U+
         XfJ49CQ2prukhy5MEP5BuMG08ofcqEkz2uzCDIQ2XIFwtL3KStgj6nwe4iW6E30Bd2rF
         xsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737751840; x=1738356640;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdzsCT8xL6jHZ+tnR3Hwgg863MADe4016kWtdjp4rcw=;
        b=GFz9HH+NfFo69awt9CgYHdSfcn+QiH0ev51FjRUh9oCmsLR5bDZrSkhUuVa7FOP2Mo
         +gVM3oJ4j4KvXKlxQEAA+D3KayycruE4BcMrXwxeGvZSyX6G/kCPxmX6hG4ETG//AHMA
         gXIgfnmcEH4/ZGe19KfSEnwE4XxkR/QCyOrvXl3lO6+Bctkvg+g9wwZ7DqblTfkQsZjw
         KIEx7avFFWIj1v47xVfYisUneQPBrCSiCqGNqv0JqyFaq4npi1A6WcY8YjYQy8+KqQ7+
         01yBUBC+oH1R5cr3XckZlUgUY/Exd9tvaSF1CFWPf27A1/Ubr40k5+u81EPdRsYCcXN1
         HcNg==
X-Forwarded-Encrypted: i=1; AJvYcCW3yuaxrz239pKLiKR1FlXAyIlueOPcj2h4F2r3fpk1NXHuSbhYGzgoxQSsXof9zO5SgeWLyv7Ujw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG6ntqUhVRdQT9nMJUys/LlEA/e2MahBfZIfMTTBUF5n0MTh9Q
	GEUqp1eMl7/oEo8z9KnCfj3N05ietX6ljFVr0ESKU1Qg6m7oI44v
X-Gm-Gg: ASbGncun+AXEaCncVGeKTDpxGUyoZWfG5gTrEz2NuTuJYoPb2mFGdOM6ToQEIWks3+2
	3+gIcfuCjUkCT3VVvyO5kSbjGTdQL7tJRrklEm09gLaj6FVVDjllfd7+hDAT0Qcit0L1WVmRHP6
	UC1rojWLEAvjcmGlCXSDFT7ak7FE9I7wH2KqdUY1jZhV58l9b27xNmPVFy8QzgY12HL88GTUHDl
	wfGXF4gg5UpyVaKYv3pKPMZnh+jY8l8OGWr2XdRBx1xlKp80O7D1WCR+vPqASe1M5mhwAP4+Zlv
	S6IO9uVgSlM8rDlgCnrmzN3+o/ZceYPj5Bc/Qqd9RDYul+XYmIM=
X-Google-Smtp-Source: AGHT+IGwvSer+unLlVc6WTlhBYxGObsMsLAI7zUMsLtcBkSVhBWiPYvxWe7dxKBqk+OHgzBCgn4BNg==
X-Received: by 2002:a17:903:2449:b0:211:7156:4283 with SMTP id d9443c01a7336-21c355fcb7emr524423085ad.43.1737751840090;
        Fri, 24 Jan 2025 12:50:40 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb? ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da555a428sm18349685ad.84.2025.01.24.12.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 12:50:39 -0800 (PST)
Message-ID: <5acfbe92315d93aceb467fec1d239d6a7a7ba499.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev, 
	linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
	pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com, 
	workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, 	nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, 	Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, 	torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com, 
	helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, 	nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, 	geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, 	jarkko@kernel.org
Date: Fri, 24 Jan 2025 17:50:29 -0300
In-Reply-To: <20250124135203.040d0852@foz.lan>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
		<f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
		<20250124081250.GA24731@pendragon.ideasonboard.com>
	 <20250124135203.040d0852@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-01-24 at 13:52 +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 24 Jan 2025 10:12:50 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>=20
> > > It's been a few years since I first thought on finding a good way of =
helping
> > > kernel developers testing their patches, while making use of the free=
 runner
> > > minutes Gitlab offers. It can greatly simplify the testing for people=
 who are
> > > new to kernel development, or students trying to understand it better=
.
> > >=20
> > > And this patchset allows that to happen :)
> > >=20
> > > Actually, I spoke to Helen last year, and to enable it to run on the =
free
> > > Gitlab-CI runners, there is a small extra patch which is needed:
> > >=20
> > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.co=
m/ =20
>=20
> Sounds interesting!

Thanks! :)

>=20
> > Gitlab as an open-source software project (the community edition) is on=
e
> > thing, but can we please avoid advertising specific proprietary service=
s
> > in the kernel documentation ?
>=20
> Every time Gitlab is mentioned, the brand of the company that
> developed it and has been providing proprietary services is also
> advertised. If you're not happy with that, you should move to use
> a git forge developed by some open source community.
>=20
> The way I see, the best would be if the CI integration could work
> with more than one type of forge and being able to use any
> free Git??b-CI runners that would be available for developers to
> use, as this would allow testing more subsystems with CI, thus
> increasing code quality.

Completely agree!
I think that this Gitlab contribution will set a base for implementing othe=
r
forges / CI systems as well, and allow us to make use of those resources fo=
r
better kernel testing.=20

Thanks!
Leo

>=20
> Thanks,
> Mauro

