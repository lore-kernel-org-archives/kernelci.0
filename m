Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC320B1E5
	for <kernelci@lists.linux.dev>; Wed, 12 Feb 2025 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380692; cv=none; b=L/5SQYt1DoCL0fi3rWVYtaMH/K9Eajl1ZPBCCt0NVyMmBweLx8lrN/yz2Z8AIxGy6iM9Msx+ZIhCEhYwDeVSaGTxVdy5X/9vfYqrO0E3G/kFiAmfPZK92MvQef+RCDXs6Rn1MrRpwyUNeFzZbwr/dHLAQEW3U7z3ZlcqfXBc2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380692; c=relaxed/simple;
	bh=E6V3ktEebwSlI2OpSCn820nCr2t0SYwR+etcpticThE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJQk6sTNrPrp8TdZV/pSGMR81kyFUN6LbwDE0pFuzxJyWPoLWsuy5YxmZqt6jMglQsAZPsN7axm9Lkc7LQv2ZgmO5AcUye1aC5XUN2C6g8RyH6A8xOKJ4hvG/3BRxfi8cPLvlA0PpNZz+YWycBbxomECPYyCE8rXuzXMIXzYJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLqMOAuX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLqMOAuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739380689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTfc47a39PqxjnScnMsX8C0/EadmIM8SFWHp+lTEE0Y=;
	b=PLqMOAuX245CGSfFal6fzMw8+QRxDhokTLQwiVPwCvXJZJsHKLKQGboRCjxqJ+rYJvLEGE
	R02dI0AmezEww/BHPdzTUt7wOHVAmlMtl+L5PyRRlM6ntnCBTOEGzOoRyCzhQZCQyxzZCY
	e4QAqTOPVcZ00gMzs9G9fYkKkX3admY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-M7XFM3T1Mq-Wb_WaWEXxEg-1; Wed, 12 Feb 2025 12:18:07 -0500
X-MC-Unique: M7XFM3T1Mq-Wb_WaWEXxEg-1
X-Mimecast-MFC-AGG-ID: M7XFM3T1Mq-Wb_WaWEXxEg
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-6f97ec73df7so43894257b3.1
        for <kernelci@lists.linux.dev>; Wed, 12 Feb 2025 09:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380687; x=1739985487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTfc47a39PqxjnScnMsX8C0/EadmIM8SFWHp+lTEE0Y=;
        b=vhzJHbXiP4GL9g+7mCafd52F2eonmzs2QsWLPBxCRXHD/N3cp6oVN7sjqV+cmt/3fL
         oQH4lwx/GabKvgYnR2zEgEEBnB1tGKQqnY+MpzOoJwqymT5w6kAEendHwqIpJHMJzyPs
         n9lRInOu8vX0AZ1ImmYC79W/cTT5Ku4+oKb/Rok6xd2q2Ub9IFsYQaX9MNOMosSl4R/e
         3KeKX38gjI4idQwxot6MA39SDO8aKxz3B3ihKf0PCcyRsm+A03nV55CPvw5v3+Qv17jt
         ssizFcgb8EvnfXCfawS5lLekJ3qHHSpkdbWNCv62YJxXAaAyhxBU0BZDoQEr9JEf8ajC
         9LMA==
X-Forwarded-Encrypted: i=1; AJvYcCU35WtVRw2NITfGDZA0LGQw8fc31xKfxXFojN37Muh8KXg3lwf9aRFkckqP03DnAoHdoloS2Y+JRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxloZuTQRWUot9ueYKIjRY4eBb50MNwcxstzw+vxD//JejssqTO
	w8dGojxNoXjI0Rp25w2bBvquijNipKm/0Vwdwg9Zl84Mzi1jnciZkAyohfsyKja7Bn0taEl6IvA
	xPZdeP5k5ROBDZuaaC9Lst86+kYOa7q/pFA2N10XofzavooWv0ymuuidtWg5TYtvKkCcFwXncPT
	ftSNglIuARa1fi0/g4yCz0kvhgy6pR2ig=
X-Gm-Gg: ASbGnctYH0s/WNC7wFfxyK1KfczPXBC46ct1WonrMOyYWknYcVaujdGT+buz2CmjIQq
	YuAs/FI2St1dZuzZ0TeL3I/mqA8pNoZe0m4O/Kwzr1I2JLDfw8yPp47izWXMUhvI=
X-Received: by 2002:a05:6902:154f:b0:e58:835:a7b0 with SMTP id 3f1490d57ef6-e5da02a4f6bmr3247570276.37.1739380687210;
        Wed, 12 Feb 2025 09:18:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbcERdLFsmV+t17LaOEBVplV+A8dPg7iawzUSS4hQ8DXBwoLV8Iidd0fJd8KWBkejyYFVdkPWSIEhX+wMQzw4=
X-Received: by 2002:a05:6902:154f:b0:e58:835:a7b0 with SMTP id
 3f1490d57ef6-e5da02a4f6bmr3247531276.37.1739380686797; Wed, 12 Feb 2025
 09:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de> <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
In-Reply-To: <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 12 Feb 2025 12:17:55 -0500
X-Gm-Features: AWEUYZlcXv-LP2ufUcwWauxbM15m0TCVbCYsswBmEDrEIUobFHZOQuZFboYNhn8
Message-ID: <CAK18DXYjsLNS+Hm2qW3COF4_gChPNLwtP1yViY32b+xPkmOapA@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Guenter Roeck <groeck@google.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernelci@lists.linux.dev, 
	linux-rt-devel@lists.linux.dev, stable-rt@vger.kernel.org, 
	Daniel Wagner <wagi@monom.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7dP4JvaVRcmBbqeMtG1SB8rgEF_xV8eeZRRHg2Hg08_1739380687
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:43=E2=80=AFAM Guenter Roeck <groeck@google.com> =
wrote:
>
> On Tue, Feb 11, 2025 at 1:05=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > Hi,
> >
> > I remember Daniel Wagner has been asking to include PREEMPT_RT within
> > kernelci. I don't really know what the status here is. Thank you for th=
e
> > work.
> >
> > Since PREEMPT_RT is now available upstream, would it work to compile an=
d
> > enable some of its tests for the supported architectures on Linus' tree
> > and maybe the -next tree? I don't think that happens at the moment, I
> > saw only a few stable-rt trees.
> >
> > If so, should I just open an issue at
> >         https://github.com/kernelci/kernelci-core/issues/new
> >
> > Is there be anything in particular you need help with?
> >
>
> Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
> for asking is that I enabled it for x86_64 together with lock
> debugging and got an almost immediate "sleeping function called"
> backtrace.

Red Hat has been selling a kernel-rt product for almost a decade now.
It should be fairly stable.  We also enable lock debugging on our
debug version of kernel-rt and I don't recall anyone seeing anything
(though those debug kernels are slow).  We may not have the same
config options set and haven't seen it yet.  Stacktrace?

Cheers,
Don

>
> Thanks,
> Guenter
>

