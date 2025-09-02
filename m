Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C334AAFA
	for <kernelci@lists.linux.dev>; Tue,  2 Sep 2025 19:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756841070; cv=none; b=a6r/Y3IB6aMxDbv8DGVWF/fMdFupfsogghM1FYX0q4JPZSaSq46bkV3t8UGmpnhHZ7np/TBRfqqTK4OTeDYDPY1VEKyBZiDeTAam/fHhejiZTZWpW9ue4N+2P1xmU0M7+ePHx23F6n8E6USIIv9Rr1CGdGfiJZaiB1RoCa0BKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756841070; c=relaxed/simple;
	bh=hpN9C7oIFonaaCSsRKZ3eqFbXxfgvB7sK0llgq6t+kE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fJ1T8YkOY4g4Bixou3ySj30pLa4KUh2dRQWWX7w5j5GNNAbwOD6gUQYqZYuYt/80ciYSwnCp0704TrnUlkMxKL+tUcp/8qvXk0MRV4oppZwLQycNjM8osz9lodBR69AZK7owm+BFX6PyIUzbe2Al6sva0eMEfJwGKzPTiTxarLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hggSsVDG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hggSsVDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756841067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hpN9C7oIFonaaCSsRKZ3eqFbXxfgvB7sK0llgq6t+kE=;
	b=hggSsVDGtpHypEwjV8klvkr95vCWEaGvuKqyIQmAUMR5XMmOMRUIYdKO6c9rGMszSWpLh1
	Vg4dX95suWSyxr+Ub17XtltA7ALLPIVD0j8AZewV6fL202ftJdRz0rLMKLgMh77o8ZIdN6
	xAVzBoV2HBWCn6jE5WILutsl9FlA0KY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-PuPDvJ3nOmSX02yW-XBhYA-1; Tue, 02 Sep 2025 15:24:25 -0400
X-MC-Unique: PuPDvJ3nOmSX02yW-XBhYA-1
X-Mimecast-MFC-AGG-ID: PuPDvJ3nOmSX02yW-XBhYA_1756841065
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-722866d8e9fso32522677b3.2
        for <kernelci@lists.linux.dev>; Tue, 02 Sep 2025 12:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756841064; x=1757445864;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpN9C7oIFonaaCSsRKZ3eqFbXxfgvB7sK0llgq6t+kE=;
        b=beQ26NjPMMyg4xQdorHR+Ac7OwuPbfA1VkDjTxER/W+V6n5L1BQQvLgkxqazQ22+B3
         8mXXlO60hq3SHQfVkpUxHRWEmxlyIkIuPaWkQwd/oAHo74OTmK3v6guADv1lyluR4HYn
         E5r5v8UkRqEdabPywa8fo4IeXoB5Rb5K5vP66Le5VU4ds7qIhfL6aRAWR8izVYWhzx7s
         PH0++WiL2F9+EoWXkqx6CD54En0ORyNYUohgWFutfZfsIBDkYyCp8RvGqmPiBcCxYxcm
         CBfwyfseqcqXZOGF6Xh3Ru+fPAKh+mCbub1DFqjM8iTPF66ZESYNjxeLP/K0P9+pX//V
         C66A==
X-Gm-Message-State: AOJu0YzA5wvmdY+INmf2kz3KCIYiFFOXdRAm1sqUqp2cQU+cbIMLOrec
	BcmfXEuPo5T3fPGszRpLt6BQj7PRSv5WA8ASJo76cWN5GXYnPuHFkrJn5hrFHpxLaNH20Hbj8bN
	xBu+ttcUpq1tNEA2u6MEXDPUIWGoTRLvxkqK9R2GJEIECkenOdiTJb/X0hNwHAVU0Puh6aTJQ8z
	OcfVDBe8ULb2yrkddQjVuE2/X1GZZvkY/Fg6rQ8cB2bwvZAQ==
X-Gm-Gg: ASbGncvn9kjFAzw1VDLwC5mJhnJ1y2MHQZiRe0/0zyV3pB7lUn6UJuKufLYFWBS5Jw7
	NKKMSmWMLaHOzppn2dJn2ekFBS9L+OPFdX16IQ6Kwx8dNoMx2v/qx1Hd7y0MvyYj0cOZ9oXyhFW
	9bwHbfTSIfklEGZuWo0AlCR1KNAtQQaHnEGTjuZ3D4bBenpE0oicfemvw=
X-Received: by 2002:a05:690c:9202:b0:722:875e:a32 with SMTP id 00721157ae682-722875e0b3bmr115334227b3.36.1756841064540;
        Tue, 02 Sep 2025 12:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX+V7OKMJSNbu+UBhCeAEjpZmV0mfsSOpTPLbv8Is1xXzny7T4aA9o91qmOMGJ9psEPxrbst8x6pSJZxBcqDI=
X-Received: by 2002:a05:690c:9202:b0:722:875e:a32 with SMTP id
 00721157ae682-722875e0b3bmr115333967b3.36.1756841064071; Tue, 02 Sep 2025
 12:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Donald Zickus <dzickus@redhat.com>
Date: Tue, 2 Sep 2025 15:24:13 -0400
X-Gm-Features: Ac12FXy7P8UAif--uI5GvzMUDV5H9p6QuQE9PWYvYJ9bk_AC8wFE0grX8kHDIhA
Message-ID: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Subject: KernelCI TSC nomination request
To: kernelci <kernelci@lists.linux.dev>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>, mwaqar <mwaqar@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pTsIW6rC-462p0ZAnkXqyoPp5vvqvgVybawz7W54t9A_1756841065
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

(resending text/plain)

Hello KernelCI community!

We have recently revised the KernelCI TSC charter[0] to establish a
more effective approach for our future work. The TSC will continue to
monitor and provide technical direction for all activities and
services related to KernelCI. Additionally, with the inception of the
Infrastructure Working Group, the TSC will serve as the primary
interface between the KernelCI community and our key users (kernel
maintainers and developers, hardware/cloud vendors, etc.), translating
user needs to the Infrastructure WG.

The updated charter requires a new committee to be elected, consisting
of no more than four members, each serving a one-year term, with only
one member per company.

If you would like to nominate yourself for a committee position on the
TSC, please reply to this email with your nomination request.

Cheers,
Don Zickus - Chair KernelCI Board

