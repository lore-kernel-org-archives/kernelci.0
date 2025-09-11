Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFC1FBE83
	for <kernelci@lists.linux.dev>; Thu, 11 Sep 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600280; cv=none; b=aFkWA8FQjI4ittsMBPyADCU37yASotsRuqVM7r/59hhc8YAvB0skmQgEvQbG9Zh09nxNJvllNxEs2/0pyACgKYuuLWH69FwPbTpkHl+8opoobRfJ0Al31rqnjhDEg5bOobLMVaF/wXw+rmUPUCIkmIbN+pytWv1re8wTHs22/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600280; c=relaxed/simple;
	bh=7E3vyr4c8jf+7InUqdEWLdotMNLm0a2q5VlauPlEoLo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dc+yqu9jANTXNLRtgy7eDlXJaYgjptxjEq6K3uFBClzyEdGQgBVIU6iHR9plTd+LYbeuvdVgs9N6Oop3uCuG/OGJWZtCrBDnmf9dtu7RSL0TrG2gWbKixrl5Y0uoygG9OgbkHGSywpaIyLeVS2qOSViOQGaJ1PS1/Q7I9Ws+WgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4Jcu67B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4Jcu67B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757600277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7E3vyr4c8jf+7InUqdEWLdotMNLm0a2q5VlauPlEoLo=;
	b=S4Jcu67Ba2FRTtBN8z3X7LalqxVi+UMCUNaep1v8otpsxppaHb0p8Cqc+L9RrrHFMjMIo1
	MvmDNT11GYHKmFJ1fMBLKKrUKDI8tuYhROfrqbPNx3zFOPq1NFAvhUwYYcH3s3CA2FQ6zZ
	FuD25doRtfmIImYgRplTCX5CvtdLcfg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-UZY9SEZ_NoG5o4i9Iu3oqw-1; Thu, 11 Sep 2025 10:17:56 -0400
X-MC-Unique: UZY9SEZ_NoG5o4i9Iu3oqw-1
X-Mimecast-MFC-AGG-ID: UZY9SEZ_NoG5o4i9Iu3oqw_1757600276
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-72f7e04f805so5190977b3.1
        for <kernelci@lists.linux.dev>; Thu, 11 Sep 2025 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600276; x=1758205076;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7E3vyr4c8jf+7InUqdEWLdotMNLm0a2q5VlauPlEoLo=;
        b=jbiRB4k8JXIdnUDjSjx3GnakQhDH22Fs5S7vVFM7klgaOVv7/j2d4J+NY2A2IzL69E
         0sQknlmtzmWNOJoZOdoqK7XvOiH1hr0oUl7N+Q8zXbTZtMdtsnhmDFEOWWhTjKyqQp2A
         ZH11xl5XdHwriBPTrO4rboYUz1JeunF4h0b7WLAME58NM90U2k3htiQQJk8wy1Tda4Sf
         uEP3ilvY2iZoG8YrruBfuXP98+i/KSjDKqFtNZNEZBTBdEnKrM8p0nKqag9XwJYCZw4H
         O2IJKlhrrxSJyKvYZqLle3F2VJqCA3lKhB1bzWCqSTNZHgVjpyZb3FJqa8LhYCT3nBGg
         Q/8A==
X-Gm-Message-State: AOJu0YzrHV1vYoDuB7b/9UjgUh9pgswEXGicvFiTTHUabRXycO0hDCLH
	30BPTaPxY+0eK7iJaylkP7ZKfpAOFxTw+UJA0EW0+avaOZ4oHMhsqwUqIwbZWpGOps3hf4VPYFC
	iMeo470YoZi5MJudoETYFPByHrSFh/V41d5SD4aDwZY6gRg8LtCWdlFSDZVrbDhUZcZDl0UgR4V
	nOCTO/AnlMTfh1zCWNdqPu9yiA10GJYc7peFfjR9E1m/sDHw==
X-Gm-Gg: ASbGncsEIUaXWbT9ke++UrnHi8X7UyYU8xWFcdkb8cdenTVjcjV3KAjd8OsSlnsWfu/
	pZxhqBEJgvJEBX5kKaV4FNQpCfqsl+NfknOfZKl5SL2puGsHAfYkmHEtoZioH3r1PYvkUkVbWJt
	RuD9G//zF3vHdWoCh2eb9RhJozOSKuRNNJdoGLx27IN6gNZxXh/sBZSa4=
X-Received: by 2002:a05:690c:4c0b:b0:727:4967:3866 with SMTP id 00721157ae682-727f2eb95b8mr185265907b3.14.1757600275714;
        Thu, 11 Sep 2025 07:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOqqW/wGNrbQfA8MTdYoxAE3k26md8sO8nXd3ONfmqQECrpa7W7USODurCDNlnVxHHs9UPCdmZEjBUlWg4U1U=
X-Received: by 2002:a05:690c:4c0b:b0:727:4967:3866 with SMTP id
 00721157ae682-727f2eb95b8mr185265387b3.14.1757600275038; Thu, 11 Sep 2025
 07:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Donald Zickus <dzickus@redhat.com>
Date: Thu, 11 Sep 2025 10:17:44 -0400
X-Gm-Features: Ac12FXz1oGtQA1iNMuo-JG8kljWDvotfusay8VO9CFUaYJ4CTRAQoA2WR4b_UvU
Message-ID: <CAK18DXaA4ZpkQTSeYQnOFOSvZEugaRuRJ8yaaW+bJ12sCNOf-g@mail.gmail.com>
Subject: KernelCI TSC nomination request (last call)
To: kernelci <kernelci@lists.linux.dev>
Cc: mwaqar <mwaqar@linuxfoundation.org>, 
	Gustavo Padovan <gustavo.padovan@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bAqjpd6lj2TZBAoudNoO4xpaopuXlNa9yevKFESFYjE_1757600276
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

(resending for last call)

Hello KernelCI community!

We have recently revised the KernelCI TSC charter to establish a
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

Deadline is Friday September 12th.

Cheers,
Don Zickus - Chair KernelCI Board

-------------
Current nominees (7)
Minas Hambardzumyan
Greg KH
Mark Brown
Arisu Tachibana
Gustavo Padovan
Guillaume Tucker
Yogesh Lal

