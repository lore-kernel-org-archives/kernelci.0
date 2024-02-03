Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D25F862
	for <kernelci@lists.linux.dev>; Sat,  3 Feb 2024 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706985814; cv=none; b=uzRjbpCHfadaF8NF88d4xX0UYpvEt9pVFBN8W8NoCZJZ+iG5+onbIvzkkTl+Zjk7sP/IPV0AUbDsNMaxC4X+zKs56eaHLvkh0gMuQ/8TshPd+sGsEx9OJJoZgO8rnc8BpzWkwmr5J9mSBsrrCi7Kq7Fwexw5s3jvQtVXgZJDG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706985814; c=relaxed/simple;
	bh=85eCxnQGygtDsBKWNKOY5wUCDnbCES+NLIF+/MvX6GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pfvRW6sPQI0FeX1S0o1Kmb+EPGniRBSSqRykBTzddtB32nC4Hhqe2cRyVazobgyBEjkTDgz/WyP3j8v1NWJcjpEE+xmiVMO41LK32cwesbsuHRta/cTP5kqC5W24iXOExTWwva7eTZJnpKxnJXGtRfwlEocoq/G7wP4qg3D/+rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uWobC+Gg; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uWobC+Gg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-428405a0205so179231cf.1
        for <kernelci@lists.linux.dev>; Sat, 03 Feb 2024 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706985812; x=1707590612; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85eCxnQGygtDsBKWNKOY5wUCDnbCES+NLIF+/MvX6GM=;
        b=uWobC+Gg9Ms2adsxbI9D+1ElHjXYcEuESpyPGOBQX6KmIgIlUcostN1ATELxqSbLtb
         F4XHSDAzjgZGXwbRxYwEuAoXeTGusaXb4JyJ4AKvhrdK3n7cui13iW8tpPDV2ca2j+0E
         mvynTy1wukb5kGBPonWOpBNSXa8xyxzUC20exd3sd+CKssRfzA/y6jjyYLQdk7derCQG
         DGfZyB7FCEXnG820MNjG37bgbcgi0cHQ7MhnzkNrj60hA7m7qNTK55LJx+Ds+vCHoXQD
         suyEioSfeWDvXE9JdPZDbFlVUS1IpKp4hNAehz2AiBXU48xbLFEsgs9YrmY7TtY/+NLS
         LmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706985812; x=1707590612;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85eCxnQGygtDsBKWNKOY5wUCDnbCES+NLIF+/MvX6GM=;
        b=inqaTEh71TOeRANLmD7/yB9yHLphXntyEt+OF8mhZWW+1lKdmHzc4nmxPXCL0ZK9PY
         qMFw/2GeOi2blW6FVqEO9JzARX+u0ScikPDQLYfIFoMWbOjJC4/btqOje6OJ/cB+Huz7
         n+64w3rSo7FH/uKdCCI+ynRtwf44cCgc9V2xtZ5XZ5f8asEBgMKBiZBLpavnRSvKATXU
         FCNL9FtS0mauZOdq3WsmmcycSeyvQ6NEqL/5GL9OMOweCucFQX6O3Sk+KnbJ1/x6at04
         gyOrsBm29MzOR/65p+3MuArp4wy0wR/2J8Uf1H8gKOsqy3geP/7Wf+pB8oPwRZOjYnkf
         Yjkw==
X-Gm-Message-State: AOJu0YzhPYfSdISaiA12rJXToIEG8ShDe03YV8f6TjU+/ligNwlfaxqn
	QvyTL2XU4GQ2fFfKbKewwa+omoL7cf59Gex00nCyWbNuJeVkx5vM51tVUuiLjNGi0SE8Q3dRG8D
	QZrMRl60BN4T5eyEqgV9kxP0GD1DL8WoVhf1M121M/6mpbN4+YtHt
X-Google-Smtp-Source: AGHT+IF7mZl9IAWVymuEfi7BFJs9MMLan50uLm4gXRz/C9Ra01v/8MKcqcJiCX1eSArzfpSJYxsQV26Q2ilI9PU8KTc=
X-Received: by 2002:ac8:5cca:0:b0:42c:1874:7d42 with SMTP id
 s10-20020ac85cca000000b0042c18747d42mr36496qta.15.1706985811722; Sat, 03 Feb
 2024 10:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
In-Reply-To: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Sat, 3 Feb 2024 10:43:17 -0800
Message-ID: <CAHRSSEyev9rcYpbe2VtALc9-4zR_Bz6=24yitFTa4U5X8N+S0A@mail.gmail.com>
Subject: Re: Please add new Android branches
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please add the following new Android branch to kernelci testing.

repo: https://android.googlesource.com/kernel/common
branch:
- android15-6.6

Thanks,

-Todd

On Mon, Jul 10, 2023 at 3:41=E2=80=AFPM Todd Kjos <tkjos@google.com> wrote:
>
> Please add the following new Android branches to kernelci testing.
>
> repo: https://android.googlesource.com/kernel/common
> branches:
> - android15-6.1
> - android14-6.1-lts
> - android14-5.15-lts
>
> Thanks,
>
> -Todd
