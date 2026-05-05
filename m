Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436B18BC3B
	for <kernelci@lists.linux.dev>; Tue,  5 May 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942611; cv=pass; b=AOAtDlCq5HsW0Ui0B9shdnEojFjJpP18Z9MTCP15K8Xvnt4baR9z44M+aw8ztJOoOI3rFOm6Q067N/2PKEOLcVo337O2bmx6mq5WLl+5UJ0tpl/o9hSTFaWNGWZKo9r3tFKu6Rq7bKAnrM3SWUY83YuKUDcxHwcqz+Ru0i1oMow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942611; c=relaxed/simple;
	bh=IeCugNOF/0VrIrRyZUIejh0Dfm8yCouMQlcG/pruqFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grZTKh51gkNr2YS/YvQm5yv5PKrKmHfCravnMbpKQXf6UoAIWgS3cqxjTd5OJ6v6QiZb/3zFrSjStAOv1kpHdATOZw4YK4JWFbb6yCulFBfIqOMAhGyzu2ZSbaZruCGP3qEQhGVvN+FpHCYuDBLxAsR11vGgDL2qmKb9hiRMteo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZGDz3cw; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZGDz3cw"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso7067505a12.2
        for <kernelci@lists.linux.dev>; Mon, 04 May 2026 17:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777942608; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf4eWxCFD9jpnwFWtUwjChbzzAfrcOZSjZdq2MWDNQGyvWWkMbw/+TGksO/Ogd22B+
         DuAOvsW0dr3GxChEWH52jPiT2uEcb/Cznb8USH+VlJJl30nzs7uGZ3B0vAyS7F/N2QCy
         QdbNCUNAAQ+CoudScP4zcPtoFrW8Sc5VwEiCg2+xVeXy5AMWBV+/QNklHaAMjVFOQ/4i
         KDKjo4adYIcBYEwaTKvRiKLco97NU8BzIIkqfCj0VARW+tPXbqa3FtoFqU4rOYldIFOg
         WpR2nvgKRxc9XiWs6vd+P8YojVKkrQtq+30orhJGatpXHx6r65Ce3a3aWM/kt74h1NVZ
         NI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        fh=dxR83uyQWXcoA8YdWY6xjcNTQ9PGetgncOMERRxbfCA=;
        b=a6/JISHAK5glQrjePB7j6UnRUk6hERkD+XXFCv00S/udjL6qyVGtaYetPujjHqgSfJ
         pt9bAFIOzcrCA1P6jGq14Rdi66M8/buwn3CyiiubtWudl+MsN+gC40I6vXe37NnKF34M
         c1Py8CG6FPPnzxu5OaLEowcdLSUgs/NfjFFaknJN9pAF9x6raFrnjnWKZ1V57eoBP2de
         frSzKSY1ex3KSMzCeJtF2Ptq9k075+vnKRg3Ol0IpnT/ECDyPQRQxIGw2en5XwgXgvrO
         W03PJXbMM5zq39dxYlAuzj9Nd5NfugvsIwjnctQd20d9XH8EpIw8Wqq2lkWXC9umIXTN
         L1Yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777942608; x=1778547408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=YZGDz3cw4YTk101P//Vjg8D+aHVPM+FWiPEew5hw+rcfSiMDu8D7DJaJ2O+hU2ER5v
         8VynfqIsuuXuo4D2WSKQZxkQE5GrqCihOx+/CpPK7oFjYyf60Y61Jew+Cw4dNHGRCOjQ
         I+IUdTSzZS4628cN5h+9HjLeqXD6RwXTzo1TUn9ptmcajo3rwGP0mH6NqC4eU5u/m3Le
         wILHT80wzSLMqLbe1lncnx/evcRtrBO1BH5zqzk+U/ZMG+gv8oGAkZ9IBYHYUCxDZ22g
         y6UKE5dSj3ICdVlDiFUFG7WCQvzY0uplDDFP79WJ+JXZ2S0A2y+duE6mJyAa1A70+snr
         Y6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942608; x=1778547408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=Ua6s7w8VbIfXNRuakMtggKjGdk5Oa+GUQoGa19lqhGMBXw9Ko02TdoaxfJeDY0YcDG
         zDxKQcZ/bBzHbQIehyFCyKIGv1qwXNi7mgqgvcANnjTSNfYaxdNsVMdS5yJlKV2JKLoN
         SdLB1orQAZo6kgjEhP4ahqfZ42NgKeRFrCjMf7AnC4d9DPJaKn/T36D+dFgkv3W8BiuA
         LeDAimY2qUfnWWU7YialrJlVWfbh6jvVGRHr+4ySdYs86tTWkKZMo5SkrBoyiPbPjmyQ
         whJpKvmetPX9hKeDv5I5J2hth8lDefx9fxMttxOKGsCm/him6ntbOTyylb61fakcswZj
         E6uw==
X-Gm-Message-State: AOJu0Yw4eYzwg6ulDj+/MlzUnaOh2TVaXKCp2/t50zSd05ibm0AgBtnh
	Q+UEG7R4MIFP8BkjhicNEPdRZYyg+9AmfepVWD6qrZvX8xm73VVpQjPqXonJ7XE67jYZEs2np9e
	oZHHMabo+aqIBBySE0tDYTX9dlpW2F3s=
X-Gm-Gg: AeBDiesqEytaM3gACd3vwgJOgKdHrQz5+mue53HP4yaeRB+FqdiprAhI3iaxCFY4WQr
	HxDhseHnHnSdLT5i0Qcs930Y9xLA1EDChkThJrz+KgGvetp0G02mDbka17EERLQ309kkQD/dWOR
	NzhrPkimpbpL9WDhVRPM2YD+vO9nM/gvOlPr02MRRbVufNkvXmdUGJD4QD+5Ax1kwX/dPb+eLSU
	NB57u4tuwxylRyHJewh0EgReTJHcca6ZVj5x2C8UMs7TIHw/tqNawQwxwYO3MOgdqX9TsjGUK/i
	OjeQzLglOuYNYk/IBpQn8LRO+SIQ7iWLH4t5VaUZrnoghp/SJs1sFAB/5SShKr64/Dn6mWHPefx
	fCV8vPTvqXLs9FO83GijDN61kuT2/L5Mxvc3DiEvYordhxLcIK+BzCHPtoRm3Z2+ZRlQu
X-Received: by 2002:a05:6402:796:b0:678:a507:e837 with SMTP id
 4fb4d7f45d1cf-67c17e27044mr3972403a12.1.1777942608385; Mon, 04 May 2026
 17:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177793914437.2560.9287713196857718000@997d03828cfd> <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
In-Reply-To: <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 4 May 2026 17:56:35 -0700
X-Gm-Features: AVHnY4IKrnDSsi15lQasC7pxxX_wLSKZMiIfF54CrEwOmOtvnCw9EXINHRwtjj0
Message-ID: <CAKxU2N9WxA9tg0EqDQ0bzxpB79Sa+zh7HgGs_u-witFcuCsQew@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when used here [-Werror,-Wun...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, regressions@lists.linux.dev, 
	gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 5:18=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> [add more people/list]
>
> commit 8bdb0b3830ea
> Author: Rosen Penev <rosenp@gmail.com>
> Date:   Fri Apr 24 18:42:01 2026 -0700
>     usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
>
>
> On 5/4/26 4:59 PM, KernelCI bot wrote:
> >
> >
> >
> >
> > Hello,
> >
> > New build issue found on next/master:
> >
> > ---
> >  variable 'num_ports' is uninitialized when used here [-Werror,-Wuninit=
ialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/in=
tel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b=
83a5256431b57cb
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> > - commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> > - tags: next-20260504
> >
> > Please include the KernelCI tag when submitting a fix:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: vari=
able 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
> >   740 |                 num_ports++;
> >       |                 ^~~~~~~~~
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: init=
ialize the variable 'num_ports' to silence this warning
> >   735 |         u8 num_ports;
> >       |                     ^
> >       |                      =3D '\0'
That =3D 0 is correct and was an oversight on my part. The original code
initialized to 0 because of kzalloc.
> > 1 error generated.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> >
> > # Builds where the incident occurred:
> >
> > ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a=
001
> >
> >
> > #kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>
> --
> ~Randy
>
