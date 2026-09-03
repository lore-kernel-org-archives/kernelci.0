Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611054A8A3E
	for <kernelci@lists.linux.dev>; Thu,  3 Sep 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440808; cv=pass; b=ln7Pe0HOUkR9Pi5lEl7I1H7HBLRaQ8mhcJg9HHMLH9SS7NyG/jVN1T9JcMJttU3B0nvAZP9NuBnRo/IE3WmdwhxJBWw3VFsDC6a8tPs54CAF50g1Hsz68i6GV+nmKWLDeKiIeCh/mZMnwYhXftiDAa+0SyNamn0nPvmOK29Zyog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440808; c=relaxed/simple;
	bh=11J7HV0c34cSY3p4jWMliNvy3JWe02dlvsHA53imXlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CxGY7oKPX1t5Yppcvarv0VTmsR2I+TE+JeecHcTYBTP5n/gQy+46MG1ps1p4KlkFikbmXaL6UKDk/tB13lH7oXtaw7Y1NTur4Yqq13tEzZCibXGoosIjPKioyCysb2oY9SWEJHfwMe3UPjnLpMjjVI4UWbnbxF1rDLONCE0qScU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=YKcSrsem; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="YKcSrsem"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2798893a91.0
        for <kernelci@lists.linux.dev>; Thu, 03 Sep 2026 06:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788440796; cv=none;
        d=google.com; s=arc-20260327;
        b=CXwD0apdjzei679HoFslPR8DYoxBOTYEKiH4vd3wGYjcgALUwQHXi95TXSJDG5HfSm
         bc7fY/y2ayx/cKjAW6ddiPFUFbEhheNwMaQHqei1rMKvR4kOXbXmIuNocax7C9mC9ELd
         2FMx5weLMs4c9xCzTYb4WWG3T2X7OERfo7FzeIkXpVvXHpTmGX5MJ33YvV4f8N2+1N64
         S3ICp5LHqiR5/onjBeeChsnFE9ef/7wJOwM7Ek8lctsrSKSPuj/biL5UlYdCxp4TQJ1/
         /bQM5jHySf8qpx1FB5nkalIFb6LaBQTQAYJ9pUDOHzyp7mjvYmp1EcVXjyjoTt/ebzTX
         LrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11J7HV0c34cSY3p4jWMliNvy3JWe02dlvsHA53imXlQ=;
        fh=woMNpk07x/dGV7VvtKm/Z7mhA1vVPSoXalZfQSEEcf4=;
        b=m+RN0qMKHlf3gDrKJpOw1rV+NRpDV7YdAmbld4rQIFtd32GjImvXo89kzrCO7A56tb
         w3xO14vGo1fEAgPUW8z40SFelff217zksOxGCIhDUjRyVN6OkH2Hpr6c1v6EsJNU2hml
         wCmrSFX6KT1OCs83okJ5V0e8llSOT9WK2fRu83pgagoGh6vlW3/ijFDcgLFVEdMjUa6G
         0iRishaJG1P5h2D8/OXEP1Aw94ApYNUZSeo919qbyuTmxymw5ozIouFLrakIDqqiNMtZ
         59aT+AMIEDID8Lgcq4QhQo3Csefg8X+gUvD/Nbszf9EIDU1dDVHCZe3aYMB7wpkO9DnT
         4jAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1788440796; x=1789045596; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11J7HV0c34cSY3p4jWMliNvy3JWe02dlvsHA53imXlQ=;
        b=YKcSrsemKdvdrwtuqEbRnwul2h1elg828T0U4YydFuoX1MAHDqvbQi6K5YCJpWfbaw
         XmSOTjv3hUyNPUz7LFzMheVRBOaMc40TAghJe3ZyzDJ2zzMQWILh8OxEflXG58YSiiMz
         azjDh8WgkVAey0z1sev9e9eCFWKiMb3Jj2E6bJSfLkK2bXyTx+CpG6FPKABwK+kVvtrP
         jX3xrDNTTwG+cDDQjNPKI2eFMsL1t89N+5Izz0qvI7Z8xNKVMnLiwMn4+0M+gX4T9wIx
         Ejwaic0ufBAfiQcM/dXnNsd59h64hO7fsVZd3wAvICjwSFEYyS29b1XXvbqc6SoAd0Fz
         Acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440796; x=1789045596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11J7HV0c34cSY3p4jWMliNvy3JWe02dlvsHA53imXlQ=;
        b=SYbKccK+ajByjwhkTppuAqx3niyZ3pGob7v2zkSOP7qLcqeLix67OHNp6ku/8J0zAy
         KCUVTJEMfJkcXl23jQnFWZGyBANOFfI2kKoaRJ0rPAf8dVOcgSA0l5pzJq+UiXpFcY98
         EO3BZimF3mZFDohFjMF9N656eQiW579he9k1yRBjoQJ0pUTp9Zqq4R6nYQ8L7zmVucUe
         OZOmT8odYxsEhp8QRkNRmwFdAxk37CzvMSdRA6rBq8tK1r0sGm5rJeWplsri61sut0AI
         WDuUqQ73qwoIU8837QSOsKGjKCpNCOELhQjnUnk8KEK0W1BNCIGrBH3SlIe6hCYtqxiM
         +ozQ==
X-Gm-Message-State: AFuF++mJxMW9HlPlPyeJavLUsWtDPxtUw2uFYuiTMAcnWrbBbs6IVHe/
	uAKzE0zeTvFnCwUQqOyyO7UkpsW6+vacfp84voRdrKCicGoX5IqRzAZzkH8GA1gp2kTtwukscl8
	7Lta/KYAhG+ahmKnfhcWLICoL0OHT9ke8ogjQEbbBpA==
X-Gm-Gg: AYBFou1UdXj+w7pIOA4cFZ5ZNEHK9MxmWyVz1QivWXMnpY0p/ytSuEaxLK9jvXsHEen
	qlGIP0L5skRB1VKT1sex3q5QE/lxnoNDI9bVFm1Ex5l5D6o7TVfay57kPGmhaCn1isVVkabb4w4
	iWPEznBJBsQAIKW1X5EsXj9pYPlLG3mX06SUjmJlNDrDg/QdSfb9UwBwwEO26cE1XYQHgqjifVQ
	/OvbJL8zKZLl1alIjhUICopLcQAIpY75iEuB/ZoY1L10PcvI9g9GsawbRRFTmGv7pNICwIGOsqt
	Dke6DVYLvOz6QTgthmM6S/T4f6RDMJ6ogIh+zi+QWdOVuNm96pQ3fSlO2b1Sv/PIiNxPgwe7D7f
	aDeSSpoZWzFzR
X-Received: by 2002:a17:90a:d00f:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-39aedee7737mr20131370a91.9.1788440795568; Thu, 03 Sep 2026
 06:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKKBm2tcCasKYq72u=dBxzKxPUhK7tJWtxThEht2Hpd+bG9FrA@mail.gmail.com>
 <CAPo4OxT0kiCP5uFSDXN-96a71iVao5A-iGvzzOT3sKdgYe9WNg@mail.gmail.com>
In-Reply-To: <CAPo4OxT0kiCP5uFSDXN-96a71iVao5A-iGvzzOT3sKdgYe9WNg@mail.gmail.com>
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Thu, 3 Sep 2026 10:06:23 -0300
X-Gm-Features: AcwNN1X6i8nnLU8RoPRMCb_Q2XBgXb_b0tcFVtjMsV2qNG5xKZ4wsOQxh9pNmkM
Message-ID: <CAKKBm2vOdkvFAW70CxJ4iH1yCgxPnzM5xz5hzg53Wv3x_H7zzw@mail.gmail.com>
Subject: Re: Dashboard Updates: UX / CI improvements and Lab consistency.
To: Tales da Aparecida <tales.aparecida@redhat.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Absolutely.
The best place to discuss A/B comparison is the RFC on GitHub:
https://github.com/kernelci/dashboard/issues/1951. That is where we
are collecting feedback on scope, UX, and implementation.
But if you have something that doesn=E2=80=99t fit that thread (a bug, a
distinct follow-up), feel free to create a new issue.

Att
Alan Peixinho
