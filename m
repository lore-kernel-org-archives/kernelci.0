Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBD21A4D1
	for <kernelci@lists.linux.dev>; Fri, 25 Oct 2024 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870735; cv=none; b=gR3pPlkkO8hSs3wop+xrorYws7ur20OJDIVqEVopobNP03K1LDKfQSm6IbJEgPW0u2BJU/2yP0l5eiMXBtGaPoOBCebBkXTq21ysh1bO0e2ZX5E37jK5fIuOdsTz7Szrbz3F1T8vMGcRB5/Rzpip1W3zVjBLf0XIVBX8WvIlBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870735; c=relaxed/simple;
	bh=AYlvKJ9EqD1PhK1YapKDCGpCk1AhVC/q21onaug8yD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI+gEMy6V7e8KApc4zNAiWbJgXKT3fkike7cxgIgN82cZcdKSwTWe/qEIe11Ajf+gUOiIh2yIQbe4jGPUblCdvmSkFmqtkeRlOn9xHwkg8WfOlusMGz6rz7JydK6/GJx2Oh1DbmZVMulkQkYXk8szEJ6Tlsxp4NRCyIFMJOfAI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xRhen8qV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xRhen8qV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso1553848b3a.2
        for <kernelci@lists.linux.dev>; Fri, 25 Oct 2024 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729870733; x=1730475533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYlvKJ9EqD1PhK1YapKDCGpCk1AhVC/q21onaug8yD8=;
        b=xRhen8qVYDIXdeMk2mwSMXdwjyYSA/gnCygLsRWwAKLIzPkSsxqptDS3mGzxHCJZaP
         VLvp3ecIOQkO/VN/at9VHhd+o/GfMSPflRQxoD6x3Mz0EQLZX3FwwOUFdG3rk4pKYr64
         T9xU37dJidd2CWoa7++wx2udrF83C6U374nsoZnc/aLwA0A3/o7d7CthJiGjhrr69pVV
         M07EgY0h2jY1iEs4Oft42Y0ofCL32GTpr5B97YLpJOuA1+DS75CloAiqJd15Nof9GZTY
         a47+haHZMGxQY7PnA7Fq+jyLiTdT5LkbZbYSEN/ghJz/xcV7+/xcs/bvNjQ6w2AcQUMe
         WHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870733; x=1730475533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYlvKJ9EqD1PhK1YapKDCGpCk1AhVC/q21onaug8yD8=;
        b=PR96uDlnJS1CGCc8Fox1nouzWXIV1enIuhO2M06YeuzsNS1hc3A0sRykEgwhV2p/W3
         q25FhJrHfix0kK2cj0ov8OW1Jn4DeEKgNzVIjrDRz+PfZizzobi9TBXwr6DsqhMYdGtk
         O+U2Cjm8VfRgIH75ttgSEvEDJoFF3/fjq+MUMIlXF1ZqwVt3kV43Qqvgl66CuOyVGwnk
         uVa5tstSRYHUHrF9poEwBwMRAIbU2Vqz8GDpZV7kUCK1paSxxtGN/E1lVUrANltLUcb4
         5XjlnLQmY1wXU7HnFLnW10IzpLEb91p5UOvgrua6nwGno/Txns9xK4O3BlQ/tGIawZhC
         eiJw==
X-Forwarded-Encrypted: i=1; AJvYcCUSN3IXk/Wo5YndmS2zYuHi5LI6PA1vD/1IN/tBMeBPfM+p2anQY7DS/ZFNIyJkcre3DsMPi/dAgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJU2kAgcUNTEj9sv/QAjj8N61ehFpYcr1K4+njYjukjBmSXmKM
	rY0xuCwiZY6U8yQll644FNiCGuk+aphs+pBCmpZbJX8Gkwwo/6NKwe0SRzZbKJ3LpfYho8D3C95
	+SXfEIYDVo1bKusHD7yduCcXS7K1YpdoCUJ0W
X-Google-Smtp-Source: AGHT+IGNhZJX9sTDlSDWk095wzZnsl9V4eRskDf73XxmmH0nh8iydx6Nd3G+ozElc0BvbLm+/6RPrhbMsPnBuib1aEk=
X-Received: by 2002:a05:6a00:1acb:b0:71e:4ee1:6d78 with SMTP id
 d2e1a72fcca58-72030a073bdmr12816825b3a.1.1729870732879; Fri, 25 Oct 2024
 08:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSExUboorgLqnrRoAX_w8BNRpN6hh21Z8vscx+G=VPVirig@mail.gmail.com>
 <e8212dc96afd1fc6531ee4d2388233bdf3fb650b.camel@collabora.com>
In-Reply-To: <e8212dc96afd1fc6531ee4d2388233bdf3fb650b.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 25 Oct 2024 08:38:37 -0700
Message-ID: <CAHRSSEz7VdAvKWLKH19Wg+97vbhgq0m=SbexqEjeBcew7n=buw@mail.gmail.com>
Subject: Re: kick kernelci tests?
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 11:57=E2=80=AFPM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> On Thu, 2024-10-24 at 16:28 -0700, Todd Kjos wrote:
> > the old kernelci seems stuck again. No runs since 2 days ago:
> > https://linux.kernelci.org/job/android/
> >
> > Can you give it a kick?
> >
> Yes, i will do manual kick now.

That did the trick. Thanks Denys.
