Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF679239E97
	for <kernelci@lists.linux.dev>; Thu, 22 Jan 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078756; cv=pass; b=KmNTAhTRn5IhBgthS2NwV/MYKui0UZzCq4l54qZ5stxEnHVv8m/eGJEsfJ/OoEYtcln7tlriPZohG0hM6uX8ZyRb8QzF9G0QcEnLxsVYRlX1oYoBur7GiMGjgVQpJVbRWvXrEfbXhAaZGdSWKhWZDzpNS7s6sUnzWBGyzUu5KH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078756; c=relaxed/simple;
	bh=k3pf0RHXPse7nxyoOvKzgejsEhlXCy0CLoBjH7EPzV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssP+6gNQ7jDKw50wmO9taxXvm8TeramtgnWyfAV+hnTpqtGI8l3fyIhaaiTTWE9V8BjuSoUtdtunjM3Ml2KIRPp4NFcYBqdFjAmWhNslASGIyKntok2I9DTKvj/EhEhrvd3praQ03Sxd943t/8QkkHqb4sRAhxdNbKJOYzX5t1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DLcaB2D5; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DLcaB2D5"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-894676e6863so9310316d6.2
        for <kernelci@lists.linux.dev>; Thu, 22 Jan 2026 02:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769078753; cv=none;
        d=google.com; s=arc-20240605;
        b=HRoGWpZBlvA3N/mFVTMrWlz5kphCn5b4zJ7XNOeFhS0tNZFBs/rs7huJuZf5EnJSXy
         6AzgrvObOTo/ktHcWTv4dFLulJh1IsvGlBe2pkHRDTXRTFl1XfewwKHF9UL1pZ7GOfaq
         v+J003drAN/1UNVWjk/dwdbEaKNQ+QydTO+exjIyx50G8oOgHC+pYl/KIb38uGUcnkpd
         U3ukwJ7EbcW0rZ+IYRzq16w1H7At7N/Rg51KmaImTy+Cbovh7AWu9LL+B4F5ENM4FJNm
         XyaIACTNMDA/0U4M1iEWiC+X18mK2Sh00FGy5BKQY9SjJRRN2mCA/84Zmk4iQ3z9KVWT
         +Oyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k3pf0RHXPse7nxyoOvKzgejsEhlXCy0CLoBjH7EPzV0=;
        fh=L+drGk3oSCVHuU9cfnSHe2e/pNY0M+tMoN2fmgpH+wk=;
        b=BfeQLgvE16+TSQUmIqD9gt6qDWxpCyBj11jiT9FFz+56BETk3ekhQjWwdMD0fBiqce
         RYWtbnxJ7WDlLt5xsGGm7P/uCGu2pGOBxORj2Op+cqlXyHHI4+phqL889uXyA4Ud+OUZ
         EzZSAZmmvIGK+9acY5RSoWjFeecAkwWTj1eiN0nAaL/k++MSdO/56c9HxBegzYaj4D2/
         a9lKcE2JdlyyYGi3WwaeXMdta+swDufNYJQJZ6bAnhZZ94HQKAuePjnDqBYegfbCTQHy
         X6684Vg5ForhnumEtUc3+Yc3f25NsQAt3xqtf20wwN8Z/CBv4BOzISoef++nPrgeebp3
         5VZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769078753; x=1769683553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3pf0RHXPse7nxyoOvKzgejsEhlXCy0CLoBjH7EPzV0=;
        b=DLcaB2D5m2od1rM4oKkCxFX7r2lV7U+1RafzLhvDqCEh7MauIX6VJa2fTD1MkNCm0A
         4VKMtUwMkORzrHvfadYRPH6he31+RUzgM7a24nGk1dyo50atgX8mkB0KcAHKWEo0dCvS
         8OnOZTSnIUR44s1825aG2nAcqtZLQKLXOsKtPghftLkaSOTfdnVwgeqdDN9r6Xerp0iT
         7NkwCCqtyoOehhrhroqYZEhJIqMUYF33WKNedTOovwozXGhuQpJfahtGera1g7pf4Q0s
         jiIOkgyqVjDQlfn6F2bEUYHh9BwwkWpiTGlnaG7nY7fc+CsopBSa6Z19XwwzQZGMQWqS
         +qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078753; x=1769683553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3pf0RHXPse7nxyoOvKzgejsEhlXCy0CLoBjH7EPzV0=;
        b=ECi8Qq6eWTRN7pHksf1D6M4nHYkUED8kxD9knFC2MmXVgmpk+1dgywjT3MruP8fQI8
         v9RKiNzmvkgn2m2JDcsHDPDWyewDaCW3vysY8uzp2FbwgW4+beZX4cJMIQibRvlKt844
         ySWHnf4LERT8HqS21Mt4IUvzFsbBKkmhJRtDcdl7jJrlamz25mA2FFb1IFyXLPYBDkTq
         2bPY3Rmn8ufeqnZ2PbZ+bDPvPlOtd5fvWuwHjjIGX3+svZnt0qWpmFvJfbyldz4N606r
         xg64MrIhyw0LQPAWPjqJ0EwUwI2F+yJ9VPtyXlst1ZpYKTibBt8gYrF/xmFKgmY2Hq5m
         oxAQ==
X-Gm-Message-State: AOJu0YwVuAFcgbggjNU5bH4agLPc9L3pfLlYZYfo4os/rd/UCS6V7Clq
	/sgXANfcnjRjmeWTCWnWVfnhsg+ZTUpweMuS48JuiryxQWeZx/WtQlqb4NBvmAGN2QVYarBvF7B
	7GWzrnxsUnBRwsCSt4NNINn9VvY5VtE5VqrUsy6tZhtXc4Qbzi77zpw==
X-Gm-Gg: AZuq6aJy5zko/JKMvDwLoJ5BepvQULPSgBokmjjvJmJlAmtmnBLTTDJu/fxB68dOmx3
	lX5a9dBnr6sqE3MDEsdBkto3v/H5BTm3FgLoSpvTqJJ3aAVBKKqQd1loVP5tn589Lcg26GEjLOp
	O79jXPCbi5lF2pmw13f7TpNuD2zjBwexGCZkAm76BlYdAZEs62fe4Xt7zAJNOdVSUiG+1usiK3/
	8/8lyfFCbUWB3NKGFBl/kCjyzr7ELRac7ZySC7lMGNMdJ1BioLXpG4HNTrY0iRRp//yxiBlfKu6
	I2ZCcMv6ztjJYaWzGwlQbFr5u4NJt4CyIoCA3PIgsMjQtuoA
X-Received: by 2002:a05:6214:624:b0:890:33cf:c37b with SMTP id
 6a1803df08f44-8942ddc6027mr284667136d6.52.1769078753353; Thu, 22 Jan 2026
 02:45:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
In-Reply-To: <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 22 Jan 2026 10:45:42 +0000
X-Gm-Features: AZwV_QiWibv9R03rOgYcSGZGwIBqq9FtmCQFwlg6kI1KBACfd1gYAmutZ8KGiV4
Message-ID: <CAL0q8a5s0krCxSNjiCxQ=4piWFYX0at1iMCtCBwiwxQZ0NKXdQ@mail.gmail.com>
Subject: Re: KernelCI Dashboard - Hardware Listing Behavior
To: Gustavo Flores <gustavo.flores@profusion.mobi>
Cc: kernelci@lists.linux.dev, kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jan 2026 at 20:54, Gustavo Flores
<gustavo.flores@profusion.mobi> wrote:
>
> Hi everyone,
>
> We are working on some improvements on the dashboard and would like to
> hear your opinion.
>
> Currently, the hardware listing and details pages on the dashboard
> only show hardware that has tests in the latest checkout of each tree.
> As a result, some hardware ends up being effectively "hidden" from the
> views.

How much hardware is being hidden? And do we know why?

>
> We discussed this internally and see two possible approaches:
>
> 1. Show all tests within the selected time frame (e.g. last 5/15/30
> days), regardless of checkout.
> 2. Show tests from the most recent checkout in which each specific
> hardware was tested, even if it's not the latest checkout of a tree.

2. to me makes sense, but it might confuse the user if they click down
and don't see the checkout that caused the failure. I am wondering why
some hardware is not running on some boards for so long that it goes
missing.

Is this down to board issues, or is it by design that they are running
these checkouts? Seems odd behaviour nevertheless!

Ben

>
> With the first approach, the number of displayed tests would likely
> increase for larger time windows, since we would no longer be
> filtering by checkout, but this shouldn't be a problem.
>
> Since this would change the current behavior of these pages, we=E2=80=99d=
 like
> your feedback: which approach do you think better fits your needs?
>
> Best,
> Gustavo Flores
>
