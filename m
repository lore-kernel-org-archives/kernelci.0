Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6B32F760
	for <kernelci@lists.linux.dev>; Thu, 11 Sep 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600753; cv=none; b=IStTXx4uz3ZBrxsDe6Yp90XN53YjX1Pq49hIr+Y9dM4aC9WyDXEiZgfptVlBY+yQrulRZbT21iN8//WA5ewV8S/XHSoh/hrMnAK2OfGvEEITU3VYCDAQ0RcPz4s2qSUXkx6atfDwzMOAdbLiWgBzy62baXas4q9HLq6sYbLDoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600753; c=relaxed/simple;
	bh=rM5Tobnao1eZPl3yI6eAzXh6XMIYQW/FinIy65bQqrg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NuiCFX0/NnBssMGK4YOn0l6ht9YL72fkCy/v5Zwgoc0QkEDTxFbqRoPl5vx2j2tAXv+9Y1qsrH/3Dij6Sqqh7LvVJtVU/vDo2wH8yFYmuEN0J3pnad620S7NvPcmj0+h0u9vpNQ2FnM0/PLkdzp1B55v1LCAknzHDbb9iSr2Qcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=UpHSH1sg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="UpHSH1sg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so1362985a12.3
        for <kernelci@lists.linux.dev>; Thu, 11 Sep 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1757600749; x=1758205549; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rM5Tobnao1eZPl3yI6eAzXh6XMIYQW/FinIy65bQqrg=;
        b=UpHSH1sg+LRwP1eqXbc4P0qq6MgRMC7pC0tL1LXudP8c3MHJGiGK2MRmT8ao7hRuAJ
         ESPTWT3tiyCSNdwzy5A4oZ3ElvIim7aPYuvGFUyOgdTJb0VZ2yM0te/MzI23zBGBU7W4
         pVIlfvwETFlLfvMM/7wiLrcuOKHvlJ2MGp9Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600749; x=1758205549;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rM5Tobnao1eZPl3yI6eAzXh6XMIYQW/FinIy65bQqrg=;
        b=eC4vEN6tQJNKumis4KjGQfJaeyohcXsw97FMbm9PwRoVwfMAg5yn/UYOEVvJn4MCd2
         Mg3Of1iP7ARVES4beaRzELliBizHu8SntOYxyqg7jlkGN0kNVaMZ1/c6f58HLGXKhdj0
         5uDHLqMhKuC2gbMUt83b82QymPhA5zQPCBuAVWgLPVygK4FIHDWAJHiaSSX/3cGjPZ3S
         KJVGAhrp8OBClEr43pbFPeE3D0I/AchnPq+nIEuKjYFuTpd3Pa6DBgTnjNMMN0ZIwkjx
         Mqu5FymWdULEhVDjNvuIT3hIZVxW54ugurxx83mHTZN3jkT9vdR8ZgVsvbZIIzk+jUj5
         v3HA==
X-Gm-Message-State: AOJu0YyCSxiw2zBHK6iLNUH2YeKvll6eevb9UEFweePECLJKGkH7Qydr
	aKmGfKXfNEKDzvTYfd/ULF9NJHs3ECmJJR6WUmU2Xe+xGPrgEBCWiotmvoutD4oDJ0wKc7B8CF4
	qDDHJEobZWNSofYCVZck1VWbX//vaDLdhPeBmnB2bQohXmAZpuCm1txI0PA==
X-Gm-Gg: ASbGncuhCXG7Yx+e8TmoUQFLZJfC8/3+0tmvkt+LjZNYQsOSxGgeIuKW6mLdL8ZNL1/
	c6DaaevUyxznpfq5aX/Mm+HVlaNkT0se4lgEXXSJjPgi/VIapNzWKoAtWz2VBhyhlC+VZdD2iQA
	EI1DZ7y3TPOwVmpn6d/Hm9dWJnERis2xMLe5AW/ay+G9aMOQoGRA1/vZtejbktCQuW76gXucm+2
	5CD34q5ZJn8jdS8xw==
X-Google-Smtp-Source: AGHT+IGIWjIPlHObg4Vclyu50+fEyCDJ78x6sOzHdkOadbI9GA4knk1JOIlE1j26+1m7C1ZPFevIqpI4793x1QRrBsM=
X-Received: by 2002:a05:6402:2794:b0:62b:2f0:974f with SMTP id
 4fb4d7f45d1cf-62b02f09bebmr11388934a12.15.1757600749401; Thu, 11 Sep 2025
 07:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 11 Sep 2025 07:25:38 -0700
X-Gm-Features: AS18NWCQR0lNCz03pNX1cd-odZHzXRg03YWrUm9Rfs4rFSb52MyP5iYQT6qCq3A
Message-ID: <CAOyo-84xe66DWDMEiUSM2b0J+8J_-iBN3NJE9QNW5_PMzkXMQA@mail.gmail.com>
Subject: Adding a BeaglePlay DUT
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello all.

[This is a resend using plain text mode in gmail client.]

I intend to get started with staging and a BeaglePlay as the target
(just start with standard kernelci build artifacts and run the tests
in my lab and contribute the results).

For now I only request an access token for staging.

Once that is all working, I will then work more on interfacing labgrid
with kernelci and start using my Debian/Isar, Yocto or Buildroot
builds for more advanced integration. We can continue to discuss the
proper ways to communicate the build information and come to agreement
on what test cases are run and how the results are submitted.

Eventually, more boards of other types will also be added to this project.

--Tim "moto-timo" Orling
