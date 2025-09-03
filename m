Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DDE1EE7C6
	for <kernelci@lists.linux.dev>; Wed,  3 Sep 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911526; cv=none; b=a0mEj5lL8XsxTqaGWk/3HLmCqBVoPYerIymcwVU/IV6a6W9E4gSYso4BPIllKevbcMZz+VGg01QuOIl0W6OniLI3jJAHUikxJF6OU4J8w63gV9+vDUX5VtGORAe+7uj2XJZZAQyDadz2pK4fk+2ATnn5162/oAqASCpO7hgVR8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911526; c=relaxed/simple;
	bh=QDDAqwz3F4o4hb/ynBlmDlUS2yURGBNPT2irwubLC8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slr5JpYNCrl/htQJSxlBXRH9cavKbUqgATgFdLuVmd32dU4inoJLODIBuVGhXTSsoi1c4j/1CY8QQ1CJjqcQxnEZRqG7Rz8txQL+RKJZAeAVYRjE5ebyxIT7gzCLC/CeDJIStL1GpnItu/iqfZ9SdISkT/wWkUpPr2FxSFMVZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRmSSNoa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRmSSNoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756911523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDDAqwz3F4o4hb/ynBlmDlUS2yURGBNPT2irwubLC8c=;
	b=jRmSSNoaTkIGEff+DVBFhSNqf4RMl7Y0MTRSUiXigpD4IvCkt8K7U6MgD9GvAmxqCWNOBm
	hhnDGiYc8l7nixYR/HVcWdbr+RcAqIiIdDY0G9peRbgnCPLy5ecWHKccggNf5guYQO56z9
	bWtpGzI09qOnMLN7pQwIVaAT0oOmC2k=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-56c1xFNnPzmf2t43yBj7_w-1; Wed, 03 Sep 2025 10:58:41 -0400
X-MC-Unique: 56c1xFNnPzmf2t43yBj7_w-1
X-Mimecast-MFC-AGG-ID: 56c1xFNnPzmf2t43yBj7_w_1756911521
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-722693e327eso64557067b3.3
        for <kernelci@lists.linux.dev>; Wed, 03 Sep 2025 07:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911521; x=1757516321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDDAqwz3F4o4hb/ynBlmDlUS2yURGBNPT2irwubLC8c=;
        b=uHpc3R9YAkrBgNDpQvM2OoowVtmupPWplJMBcTrocHAvXesVfHpywl7fuWTn1YbPcg
         GKmfSiY4nnRjFqmHX9okP2jIdSKBLT8LJ0NWtbQzi3a/KYX3RwxbecYlZqIqFwVIBWn2
         1JM7EGVLcQCdX45Ay/LHX+7P9DTKlqeIgcHV9eUEuZgRCdJUp78UciInMa2H3fTVBiTl
         rXGMPwzNUkTSgV62gCO/w282sTYuFvPGmFe8RNlMI0Y09yTeBmjBDbzLO8fuUUDMMmAf
         EOFasifRh4L2LSbmVakUqy/xSJaf8R09S4wrudz0d8pe5RY4sf16wBqcv4ArnQqR2eOh
         u/Cw==
X-Gm-Message-State: AOJu0Yz5Da6jXqqhGgizRJ6UE7Lw/gNwV+lhty+xUe2IVDku00go/ZFI
	udcLfvw+Yx9e9maMCGDz2VkOKDR6tlnzFpnVeUErtFqIrd3y5A0xqAMGtVFChbDW/pMZHqStx2H
	ptA7EE1llqfZCSFquSH8tgPlqzUzCfEfey7W8smUgUJjscyB6ACz4S0xpj/PFvilGeJ23pvXXzc
	5gGsVw7KrIvd0uamPbztVlR6+uPsL7HmQ9GHrmPunfgls=
X-Gm-Gg: ASbGncsfPJgYM10tUSTEAVBrYL1M2utWJO2sRN84jIo5ddkWUuh6kpTbF0BZLitv3q8
	TLWgYEM+i2N4jR8ailiSnVCy28pMK5aE8HzvK7RNz2kzjlQ/+ELNUox0yhtSDLcnn+nsg5VouVJ
	sghkNCOWzr44IG6L4Q6uZqrQ==
X-Received: by 2002:a05:690e:4258:b0:5fb:cfab:55a5 with SMTP id 956f58d0204a3-60175b9182fmr136254d50.11.1756911520617;
        Wed, 03 Sep 2025 07:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJKAUn6ZxEIhi6F7orLwhy0cTWDMfGbXfizY8O/gBM9+zyqSnvlnLU1RtAST1e2NEuGNgZEFkgUBw2sPWrUGI=
X-Received: by 2002:a05:690e:4258:b0:5fb:cfab:55a5 with SMTP id
 956f58d0204a3-60175b9182fmr136232d50.11.1756911520095; Wed, 03 Sep 2025
 07:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 3 Sep 2025 10:58:26 -0400
X-Gm-Features: Ac12FXypvEags55g0xjqdgTeFexudYGBXZvO9nrRL0artXFv8s6VD1x9fU2bRmE
Message-ID: <CAK18DXYv-eEirpb07c3LB7mr_VUXA+BHnwF=G_KA+rybaMQPCg@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
To: kernelci <kernelci@lists.linux.dev>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>, mwaqar <mwaqar@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DXdxHw1AlP--lm6BbIqvTngAydlqglRR_e5b8WGwImU_1756911521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 2, 2025 at 3:24=E2=80=AFPM Donald Zickus <dzickus@redhat.com> w=
rote:
>
> (resending text/plain)
>
> Hello KernelCI community!
>
> We have recently revised the KernelCI TSC charter[0] to establish a
> more effective approach for our future work. The TSC will continue to
> monitor and provide technical direction for all activities and
> services related to KernelCI. Additionally, with the inception of the
> Infrastructure Working Group, the TSC will serve as the primary
> interface between the KernelCI community and our key users (kernel
> maintainers and developers, hardware/cloud vendors, etc.), translating
> user needs to the Infrastructure WG.
>
> The updated charter requires a new committee to be elected, consisting
> of no more than four members, each serving a one-year term, with only
> one member per company.
>
> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.

I forgot to add, we would like to finalize the nominations by Friday
September 12th.

Cheers,
Don

>
> Cheers,
> Don Zickus - Chair KernelCI Board

