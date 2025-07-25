Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512E1DE3A7
	for <kernelci@lists.linux.dev>; Fri, 25 Jul 2025 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432703; cv=none; b=otF5Pq4ZFsMmw8Sf8OqXwyXErkEQEHJxiPhzN/CyswS2lLA04uFeoppqMejFXhmSv2MQW7qaYSJ/9L3vuKRRuR+pSh+zqCfwOigny9QNqsleK1JeUxeyXbvRAekNqwrPPw329FEdSoUhkcsPppwNJz+PPnr66B8nS11YsLoSIso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432703; c=relaxed/simple;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VeqNHPEEIG1Ivmnjxts2yRgRqJzxnkOSGmaoXVC6Y2Kd3fKz1vEMpvJZocNvW5ci9U3YdZyk1gsmOJj03CtlBCuN9+HdPE8bQodiXHmMNcgyvwRY3AmGDBG8SNCz3PpJUjNlE0U/4TuIVLSd7CncUbMcOROVWVzM15mOLLH/T74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y52B5BOl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y52B5BOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753432700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	b=Y52B5BOl7HUKtcU7tk2EIzdHQHFkUhIGDXouhCuU39CULhFExPioU1WYCHfsQFcTAnk3eW
	0hJmNBkgS0RZVqueWjOxljiuMV0qnei1GrozI9igOAXB6AST7/TV4wb0X4b+YYHjrjUL3T
	c6e6NDG2BLvIwzg4Vw2dHHMCgoK1Iws=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-T4LeSXX8OaKhglOe6lmXBQ-1; Fri, 25 Jul 2025 04:38:18 -0400
X-MC-Unique: T4LeSXX8OaKhglOe6lmXBQ-1
X-Mimecast-MFC-AGG-ID: T4LeSXX8OaKhglOe6lmXBQ_1753432698
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so19818515ad.1
        for <kernelci@lists.linux.dev>; Fri, 25 Jul 2025 01:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432698; x=1754037498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
        b=qT83tCrNgOxgi3eXsXMgle4qvYaNRIgreAlHy4Q5B0o0wrkRSofNk0f0REsyw6QHo2
         ruYAqkY2gWbgd8GILvp7h3pMuOohP5FVDTqZAiQsZWQQUBeGyYJGeNfiZdpYZI3IY/7U
         8oTKZaK9sgUeZoP1S2dVOBP09fv+6TkEBI3v5l1iWuhDGhLhd5vxX5h4YZjndjK6aap4
         GKjhEGVBLqyg4j7vxEI+YUrJuOTySLdXMKX+oQ8eWxvi3T0/AdHejzEH04clyoQb3/JO
         J6dn5tTs2TOTCpDwfL9eRGGufWzw47oj7mCjKM45bPDwg+bJSXYUxVuP17MYUa6GpsSk
         /E/g==
X-Gm-Message-State: AOJu0YxE94n/VbPfJcBb5O9QBh3EdmIjVXtn27CEr8PFJTmi36JeYySB
	75A3TtqxW49elY9icdRMjrrjJLp/M2URKASk6LsWoWAB0jEm5zeZTeUb90/1AMZD5v9CdsDD/RL
	NucSoxWQo/q1CzIBQANfmfK3myn7FUE8xalCJLZIC1pgZR86U7YImKP/fmRvv7ZEKKmuJh48iV3
	+MKzbR7ThzZBB7OJ8ky2GaqCkmUD+O8VkHqlA=
X-Gm-Gg: ASbGnctVfrFkwHloJ+gfTsuwwtmtLR77o+BG9l5Y39Lq5BEKmxIqrulX2E666X5Zk4n
	5cpQPXzuHgXIIX5HKp3LUfnCBfeOjaUd555Z4OS4bYUTrK2shtFN7RfBxz7khegsTAiLWQ5FS57
	QDQPdu7JELNROwBKwU5mIX
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id d9443c01a7336-23fb319041emr15224895ad.42.1753432697787;
        Fri, 25 Jul 2025 01:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHxiXGFsVJ6VCDQe69iuWZ8IkeaAljBvCSgmtMhHsWEWWFbjBiBJy5Wl237ze4kjSg2FPfsWB5YeRg80cn+io=
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id
 d9443c01a7336-23fb319041emr15224615ad.42.1753432697398; Fri, 25 Jul 2025
 01:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <175341594422.117.11494999566960779174@508e4dbc6f9f> <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
In-Reply-To: <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Jul 2025 16:38:06 +0800
X-Gm-Features: Ac12FXwJd96XrGIsW0Jv49edVkL7BCbWfeMwc-34kp0AVdNMEzvYogs4x3NChbM
Message-ID: <CACGkMEuFbNMiFUY-aYHgZTvLcypFJWatgAuGB_M25f7QyzqTEw@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'id' is uninitialized
 when used here [-Werror,-Wuninitial...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T3sJIk3yYPlh6VhHZg1jlqkEOp_0h1BJaBbX-nWBgIE_1753432698
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 1:03=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> due to commit 60c060930f481:
>
> +cc Jason Wang

I've posted a fix:

https://lore.kernel.org/virtualization/20250725083635.73355-1-jasowang@redh=
at.com/T/#u

Thanks

