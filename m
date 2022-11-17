Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA95E611E
	for <kernelci@lists.linux.dev>; Thu, 17 Nov 2022 14:25:28 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id w9so1106928qtv.13
        for <kernelci@lists.linux.dev>; Thu, 17 Nov 2022 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MTfkpXGJ+vDajGIeYS3KRD3aftdoRHNNMmoblUByZQ=;
        b=KjYbBw8bY5b8wzTdPHHqfUohh8tpqkzQWhO5TXM+IpDVrRB7kmGzOy26ugFe3/SBTy
         3azdnACNEAaLzLRTBeVZoNg7JUvP+Z7Xp6+FOyt+oVYv7CjvrRx0E1iCWgRN4DTKMn+x
         INh/KXS3yxYxmCjZtDIXXjdQr3N5m/YtHGyZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MTfkpXGJ+vDajGIeYS3KRD3aftdoRHNNMmoblUByZQ=;
        b=V1gMPhU/nn8WdSSPb/hqS5hp6IgGe8UI2Yn0nNCHy5Qv6XA2qsdmq6Nooddd62KLAn
         4Bjo7njoDYVNjCzn6tDjtn8B68jR9dVIjINMeRLGyyKccpFhub9U/jDJeDFE5bVMr0va
         2wsEFdaj29KRotegEWbODnWy7HMK0PuAcIGcF2l7C2Zl0fJcYH46UN2DDXD74Abd/HMp
         KzIJR0Gi6Vfai61pNS8aNZCjGotJu0wsyND2T1nDNVJwyqe3etDuFXIZafzx5d0BEu6k
         sLipRXhw5HwgYUlCZq3GPh+HlTB8d+Np4m8f0qEllyURwbkbSaaG/O6DSpC0EHPgU6ji
         EyKQ==
X-Gm-Message-State: ANoB5pk6a3ix9H9dEeIHkBh7ugvkzLvpCyJ3MCFWxRqMXq72ipeqf6RV
	3INnnZ1Zn4BaRUjs7XATB7WyqX44S+6t1A==
X-Google-Smtp-Source: AA0mqf5SnXOGYkyjo2KRrFSN1L1ntzn6UouJnbwd4TzFYllpf4jw0jmr9Mfg0VXQNsXPANijneTIfQ==
X-Received: by 2002:ac8:5c4a:0:b0:3a4:f434:8215 with SMTP id j10-20020ac85c4a000000b003a4f4348215mr2384214qtj.114.1668695127600;
        Thu, 17 Nov 2022 06:25:27 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a424900b006ce2c3c48ebsm526118qko.77.2022.11.17.06.25.27
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:25:27 -0800 (PST)
Date: Thu, 17 Nov 2022 09:25:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: kernelci@lists.linux.dev
Subject: Welcome to kernelci@lists.linux.dev
Message-ID: <20221117142525.yoizovxg6hbqdjxm@meerkat.local>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a welcome message to notify you that you've been auto-subscribed to
the new KernelCI mailing list at kernelci@lists.linux.dev. If you haven't
received this message, then you haven't been subscribed (in which case I'm
assuming you are reading this message on https://lore.kernel.org/kernelci/
:)).

If you've changed your mind and don't want to be on this list any longer,
please send a message to kernelci+unsubscribe@lists.linux.dev to be removed.

Best regards,
Konstantin
