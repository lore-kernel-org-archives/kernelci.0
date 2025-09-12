Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63082CCC5
	for <kernelci@lists.linux.dev>; Fri, 12 Sep 2025 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757645915; cv=none; b=l2abWYc57SVSENCcGER9l5cFUZak/uFUq2qLnvrNQ79nAxLm03KnS8/Fg+Gi6wpqxTnPzzZ2ndhUZMNcXOq+z+CbPWsS/ayKm/BfkwyhhZscgUfr6QyOl7lTV2TK99Urk2cz/4UFVR2F3lLmZPJWZIXYfzRAIicDX1qoKZaCw3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757645915; c=relaxed/simple;
	bh=XFD75J/PlmeBuwemCIpYESzg0dYRMDt21udWBGEtLNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRST7/wm7YvAaOM2CaRl8FVLeRrNHVl+R74om5Vr2pcqEXkyZz4+9kePst+z1PizFA29HJwvbz7h6JodLlT/y2idyg1HbLQFUsdDQkZ1u//i2QH9/MF4SQJ3sJnC6N9sOjwmxUHDA+kcvaTAvJmtFLKd0oFgILGaK9oD96CMtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=nCWwLEFg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="nCWwLEFg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32d9086276eso1425213a91.0
        for <kernelci@lists.linux.dev>; Thu, 11 Sep 2025 19:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1757645912; x=1758250712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlflIALf0P7ujb6rBNW7XNiorjyszU6RorG2PI0S4KY=;
        b=nCWwLEFg9/7JM0QyrfMC50afycWpLkmYAn/iJKU2vvUCrhmJgAFtNAmuWaIohsAfC5
         pLfEA3AM+wNJkqdnJ8+RRo6yf4ihuhVFobAQcx+bjVZghQELqEZmmVH6rDIn/NJGq4IQ
         tvkFEBrIspHL1I3Ae+JCBlCPht4Zt4Onvsj4TMdUSBh2zY4T2lsEpJMa2hX/+2HCCE1c
         VmQP7+JnjhRE3qQ+guMECrvL8kCagvLbtDzH4cUwnZxw85BDYnHeROiIqIBUUHF6aQdw
         J4pe7A55EERIQGNkizLpHLExSlUU2hiEqUW//osl/rGbdF1ljs2LclFlKACr2oLkL99n
         /MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757645912; x=1758250712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlflIALf0P7ujb6rBNW7XNiorjyszU6RorG2PI0S4KY=;
        b=e2B8FEZ20tDn2v+t1X5x8/fPUw6AdpsooiJwP8MHO4LJSBIqy3m0uis2RbFXZBOEoE
         5XzsDfr6Ke2WtIwneFCyE2iJ35IAJkustd8LHaeIjkJmdeSM1acaMn5w1SQ062vKh6o5
         cnpPLE4KqDNQ2tqw57lfrGtRJP5tANros/y4XpuvCA3QsYyOf5xIaUwO4gdy+3tZTYiz
         5D10PWuN2bSsc37l01O2gJHZaKEMa8m+yOD42DRro5ddUFM9cpXMaTbfI0xuSsm8Jgeg
         Jhc4dNfpNtMF1LhCyqAv9Bn/9My43vClOy44c1kaIeXrID8dCQ5UAAjRb/R9ThGYGE9t
         Weew==
X-Gm-Message-State: AOJu0YzjSxapXE86rW/ehnFQSQU92fEcCB309p0KliLakkXJdqnXkW9E
	9hBDLnvD4vQiuzP3NvmH/MUhE1HQtgUs8AfBqnxPEbjJljSOOTesqfv3hYyOh2MUJTdu+0PUyD/
	d7eBOQjCzL49uN6rdjNWDwX/Zu1Qa8kGxwTzSGLxM
X-Gm-Gg: ASbGncs5m0Y9iaRfxpnBJ+C3rkZtwGCJ0f5XdWGr4doc6t+edqut7mGoj6zI7qATaHB
	KHOEPbhVLXie3HJ8BxWkMToZ0HowHhiZ7lJ/hPNYrgouvzIG8AhkdUy7vaAG91f1rrzEif7av91
	ihQoCmRibLwnJbYhJMqE0hwVWCjRelZ69hiHJ5TdsFya8RDUbyHthub6PjipnIM3aXviLxH94Gx
	m+wRfQ3HTVDiR9hJw==
X-Google-Smtp-Source: AGHT+IF9EYiZhiwV4aREYfMtuuXw5ZKIdIFl5n3oZz4hDgud4tzBl0b+WY1uLi1SlUAvmA5fnMMmiP6LDdOKLKdB6B4=
X-Received: by 2002:a17:90b:4d07:b0:32c:38b0:593e with SMTP id
 98e67ed59e1d1-32de4e7e396mr1391395a91.5.1757645911926; Thu, 11 Sep 2025
 19:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <CAK18DXbDiXqiP_A+89h0D-1tFWOo0ezua2Np2VytbZ9DK5p=8w@mail.gmail.com>
In-Reply-To: <CAK18DXbDiXqiP_A+89h0D-1tFWOo0ezua2Np2VytbZ9DK5p=8w@mail.gmail.com>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Fri, 12 Sep 2025 11:57:55 +0900
X-Gm-Features: Ac12FXzuk9AJ2kRtyaKMyoT0n7kDWJdW8EnN_dqD77pGmEY_2gbRKJjTvVPrwGg
Message-ID: <CANgtXuNM5FSpgnjt-qTgQySCHyZU2e+=+71e_bZ=JfZLH9tkxg@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>, 
	Gustavo Padovan <gustavo.padovan@collabora.com>, mwaqar <mwaqar@linuxfoundation.org>, 
	"Hambardzumyan, Minas" <minas@ti.com>, Greg KH <gregkh@linuxfoundation.org>, broonie@kernel.org, 
	Guillaume Tucker <gtucker@gtucker.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 2:50=E2=80=AFAM Donald Zickus <dzickus@redhat.com> w=
rote:
>
> Hi,


>
> Additional request, can folks add a small paragraph (2-3 sentences)
> about their involvement in kernelci that will be provided during
> voting.  I will poke current nominees next week if they haven't
> provided something by then.
> I will use the ones provided by Gustavo and Yogesh for theirs.
>

Hello everyone,

most of you already probably know me.
I'm Arisu Tachibana.
Current Gentoo Kernel project leader, GKernelCI creator, kci-dev
creator, CIP Kernel testing WG member and previous KernelCI TSC
member.
My view for KernelCI TSC as always been about improving collaboration
from Kernel developers/maintainers to KernelCI,
improving KernelCI workflow reflecting both personal necessity as
Gentoo Kernel sources maintainer but also about getting feedback from
Kernel and CIP SLTS kernel maintainers.
With the CIP kernel testing WG, I'm working adding and maintaining CIP
Kernel testing on KernelCI.
I first started creating OSS CI framework with GKernelCI (the CI that
is testing Gentoo Kernel Sources) and with GKernelCI starting to
collaborate with KernelCI.
GKernelCI was one of the first frameworks that got connected with
KCIDB to KernelCI.
With the previous KernelCI team we had a similar purpose but different
approach from how GKernelCI is working.
This different approach was one of the reason for creating kci-dev,
the command line tool for trigger checkout from KernelCI and check
results in formations.
kci-dev idea mostly come out from the possibility to add KernelCI
commands on my kernel development environment in a similar fashion of
what I'm doing with GkernelCI and gentoo-sources.

With my experience across multiple kernel testing initiatives and deep
understanding of maintainer workflows,
I'm committed to helping KernelCI evolve to meet the real-world needs
of our diverse kernel community.
I would be honored to serve on the TSC and contribute to KernelCI's
continued success.

Thanks,
Arisut
