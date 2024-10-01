Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F224B1C9DCD
	for <kernelci@lists.linux.dev>; Tue,  1 Oct 2024 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727800607; cv=none; b=hWDiBFK4y7XH6fa6T4xUBJW4cd0L+xNqZNu9EuMKtychp0cD5hgpaK/iULc6npKvYihzN71ukU4jpL5SWg4LEwsoHJTgXKPNE/d/A27ocQJh2nn5szNGWx+FkcFI0OHjdGkjsgtGj/W0S/v5IbAQFwzlkqo0sCcctIfL6oi7btE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727800607; c=relaxed/simple;
	bh=OUjhRE+pjFQCuzl79pYdApZXQrqCwgWS0jVzsFG5PBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GP2OG1C/AJ3yjxJF44UzNjKaPotOOzjZwPcyQARSM3fFGLegPfaoM4pKKxL2LRa0wk+jaP456S1L1x2wz7OS62jOku3LRzs2tBpq6RISTAFQsjVKbgxJqiYdyUFzq7/yTuUV6AzQ079jjaD5WtSofl/OzsH7XMkzKfU1WX/RPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=himxzGIV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="himxzGIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727800605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qChfFfhCEbj0UIjHeyX5+YBnDdJO2bfz/aq7uWDaAg=;
	b=himxzGIVqdJ1tkYqDIxnEi363Rw8EglE1lVUhS0IKEmIGLF1m91dAV98RlIz+BUzANTFFG
	tfT3v2kMba+U/2KtfVxB1N92U61DVwJEGqeg3L9CPX/vTnRA2EyYG2yrD8JJOyQb9TulAq
	rIMecm1TpR4DHNlvlDbmrzJuKgHwYDA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-xSGBwWWtM1qpWF2nXbfUHQ-1; Tue, 01 Oct 2024 12:36:43 -0400
X-MC-Unique: xSGBwWWtM1qpWF2nXbfUHQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6db791c42e3so89013817b3.1
        for <kernelci@lists.linux.dev>; Tue, 01 Oct 2024 09:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727800603; x=1728405403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qChfFfhCEbj0UIjHeyX5+YBnDdJO2bfz/aq7uWDaAg=;
        b=oJQTHNFZRGzVAg8mlmFUT7BoOWsCfDuQtcqO3seH+mE8U1bDqofhM4GvTq7Pn7CEJu
         wlOurTXRie4ewE+FyMk6HV5R+MiNgZM2XlpTxJM8abtJcfoBUKr5zgU46Hj97G4o2X2U
         erEc++mRCtJhXt0+hoCeeBkovi1BQQP9OJtXWv2YAKuPh9/1qEnArwdNG5Rl8KAxCxtI
         fd7cGhYq6F4g2SmEub3kH+XWQfMHGNerKcDbfHP7704UJ4+dfQPo+8yFSSoRZ7qICx97
         6scWI2gxC0Kpnsj9mUuO7DMgOIVwh3q7SbZX5XGV6pd25AewJfiOMD9CvC7OuKC8N6Wc
         Meqw==
X-Forwarded-Encrypted: i=1; AJvYcCViqNLQ7dFMnU0BNbsq/jn08mC71ll2zRZnxKcR+Etgq6Uc/yarl2E+U5q2VVfqikyoYP8lvTn1Ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWtOBO2u1Wve9vIpfy6vXLKWI+5MgSNavAr+ZszmyMDkN1GjnA
	8wPvY0RI643Qk8Q23CW+hsH1yU4S9CSSF2MmzXdZ8ZSRc3wBw0X3iUBrUAfFud8xcv+mRxE5CYs
	CG6nb9MaVx3WrUwksj3Ap/nXcS1xDyf0ljsYA1wsh6BudiFqmCWMY2ij1DJnSuHgbebEO3W5Zz/
	fmB/7FzX39sEccJp4Mpg0JeW995ybJ3Pw=
X-Received: by 2002:a05:690c:3146:b0:6db:e52f:69f4 with SMTP id 00721157ae682-6e2a2b132b6mr2598607b3.20.1727800603271;
        Tue, 01 Oct 2024 09:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlSRSFzePKR5AtmR2/edgBsKTUXLPAxyOENt0IzBpafq/CvKvcSXpSRRNx+YAwbas2RDl3cXLvD2FLEgcyb5o=
X-Received: by 2002:a05:690c:3146:b0:6db:e52f:69f4 with SMTP id
 00721157ae682-6e2a2b132b6mr2598467b3.20.1727800602941; Tue, 01 Oct 2024
 09:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <82421990-2826-4efc-adbe-8b256e7b4b12@ghiti.fr> <19248df3764.c59f50b81776107.1655937717841580625@collabora.com>
In-Reply-To: <19248df3764.c59f50b81776107.1655937717841580625@collabora.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Tue, 1 Oct 2024 12:36:32 -0400
Message-ID: <CAK18DXbgQcBhia8na9Nn8taTuXtJkJ1d2AvnXO_hELk9wMUSqw@mail.gmail.com>
Subject: Re: RISC-V
To: Gustavo Padovan <gus@collabora.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, kernelci <kernelci@lists.linux.dev>, 
	Rafael Sene <rafael@riscv.org>, Helen koike <helen.koike@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Tue, Oct 1, 2024 at 12:31=E2=80=AFPM Gustavo Padovan <gus@collabora.com>=
 wrote:
>
>
> Hi Alexandre,
>
> ---- On Tue, 01 Oct 2024 12:21:49 -0300 Alexandre Ghiti  wrote ---
>
>  > Hi everyone,
>  >
>  > We (the RISC-V community) are looking for improving our CIs that are
>  > currently spread over all the RISC-V companies, mostly private and ver=
y
>  > incomplete.
>
> That is great to hear!  We have other hardware vendors coming to KernelCI=
 with the same wishes of improving CI overall.
>
>  >
>  > I only found one RISC-V build in kernelci, can I do something to help
>  > adding a better RISC-V support?
>
> YES!
>
> First of all, we can enable more kernel trees and kernel configs in the m=
aestro system.
> That would give you wider build coverage. If you have a list of configs w=
e can work on adding these.
> - https://docs.kernelci.org/kernel-community/
>
> Then, we have to look at running these kernel on actual RISC-V devices. W=
e can get RISC-V devices in KernelCI through a maestro lab, either through =
some of the existing labs or setting up a dedicated lab. Cc'ing Rafael from=
 RISC-V as we discussed that already.
> - https://docs.kernelci.org/labs/
>
> Another way, that could be relatively easy if you have a CI setup already=
, is to get the results of the current CIs in the RISC-V ecosystem into KCI=
DB (as long as you area running fully Open Source software in those tests).
> - https://docs.kernelci.org/kcidb/
>
> Let us know how does that sound to you. We would happy to learn more abou=
t the ways we can make this work and chat more with you.

In addition to everything Gustavo mentioned above, Red Hat's Fedora
project can be another path as it uses CKI to do some CI testing and
submit results to the same KCIDB mentioned above.  I believe Red Hat
already has folks in the RISC-V community working on getting the
hardware enabled on Fedora and possibly RHEL.  Just another option.
Either way works or both!

Cheers,
Don

>
> Best,
>
> - Gus
>
>

