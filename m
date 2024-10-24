Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074722B641
	for <kernelci@lists.linux.dev>; Thu, 24 Oct 2024 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729812548; cv=none; b=hbgNvmXgagmIuOgnIXl3X+GhrN4YYUSTr/SZcOzskTa2JU1LdzPt4VfzzgbuX7WsdUjsBcn4QQtK/4Auv4+2cxLkK9PTxpNTTErdDIqxdhchInqFTQlR+1TgcET2I3VfAdSCVnBnYDPuDxGiJFInQMcLqsUVZH6DrecE6K69vS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729812548; c=relaxed/simple;
	bh=zAeYqFRoTzxtXr9JdTuII7KSpWnb9PIppUbKeAOfBvE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nqyBK4NLw+Y56KnM3RWfcN7UYydvKFN+Sv+ruFE6V1fMBgslT8ahEg1IL59S5bJy4e+Zfbpmv3XkEHZSjd4zZE7JqU5ujtTvfIAl4WgbKVjnWUXfzE2UU0H+Ba2sqKL/t2TwJdM7pbAOBuVUxjAJEsR6UfNF22jHSMfBSRC5G4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MxsPWrt; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MxsPWrt"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71ec12160f6so1023648b3a.3
        for <kernelci@lists.linux.dev>; Thu, 24 Oct 2024 16:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729812546; x=1730417346; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zAeYqFRoTzxtXr9JdTuII7KSpWnb9PIppUbKeAOfBvE=;
        b=1MxsPWrtEdIFG3ntxMwLJFcEeNLtZSN3dKdyIAOt1abV+XDFnV9fW/79I9rtVfZET4
         0cKPJNi0bb3V5DLcFyoUZxiNrEv8HemS800LpyglhDg/n+kuaGElhCuAsv4lXPjJMTLm
         nmKIHEtWXS++68vVDuYEwHn6v/k/q6EDz9jifqpuJ7JN2KwiFVecarVh7I01OS3eXigh
         oO7E6ZUDFvFIBbKFGJDcc749G9m5zb8PPsHHqIW33NfSB5aEMkeSutqDV28883lWTGt1
         PiWrrqAW1G3Kut6QCdSTEu84MBgJjDDCUVP10yJ/wiNubcibvKKxEqZibF/upvRP7wik
         ZRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729812546; x=1730417346;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAeYqFRoTzxtXr9JdTuII7KSpWnb9PIppUbKeAOfBvE=;
        b=Vk1Ik49k7U7r37Qm+g6qZGEFG9LtoIpNByw3x5KAasHjzLp3rttAP0pSnxED6bmdjZ
         BnlR2UQUIKKOFlCqYdD0RZy2BkGIX7CkvyNIjDqdu2UvYYJWLmCIwbKdIR5Mk7HrCDoL
         wk4QUWXAYNLl3sqAJDVGXcfp8ZwGwjaP5YYf8KhxL6KhjlG6ixNXR8Yul44Qb9q/TOTL
         ZIrj7i7De57B/BC7K3xi7vR97pk8p1cb8sOx3PMup5k6IKzndsDgmUh7/FxN78MQWD+d
         LN8ls5ppungZYkcwuvdPlBfgGcBLhjQB2z2ig98tHNjo38Vgyef/tGjlFE1J2OR7dHdO
         PiTg==
X-Forwarded-Encrypted: i=1; AJvYcCWEPTtXfqd0Yu+R+3OAfbdNI1px+zCjeZip/oFemuZMd4Puy0oneqViE/LSz30qU67d9cGU7WtoTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB1KR/3Xj4JesZJXVd5hBF676rVPOpCQDP6SfzJ4xZ3JIdwAwm
	T2+HMz9QlNQ7KuC8MNl+2i0Q1bQ/L1WLiXZsGh+Wr7ncKEWxF7PcelRCVcLW5ByewZHLJlKyMDK
	D4c0EldYRIt/Vsho5TVo0DePYiKd64PQQta9v
X-Google-Smtp-Source: AGHT+IFJeoZHWXyQp/+eYqpLkPtgktpeck+ylobh2RtNotMHpoWOUgDb8sxk3frJsME6l8tk6dC8cqwP7idvQ74lshs=
X-Received: by 2002:a05:6a00:b54:b0:71e:79a8:1d84 with SMTP id
 d2e1a72fcca58-72045e25843mr4537638b3a.3.1729812545494; Thu, 24 Oct 2024
 16:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Thu, 24 Oct 2024 16:28:49 -0700
Message-ID: <CAHRSSExUboorgLqnrRoAX_w8BNRpN6hh21Z8vscx+G=VPVirig@mail.gmail.com>
Subject: kick kernelci tests?
To: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

the old kernelci seems stuck again. No runs since 2 days ago:
https://linux.kernelci.org/job/android/

Can you give it a kick?
