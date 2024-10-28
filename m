Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C42E414
	for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730154249; cv=none; b=blmYNihbBMpO3WjjxoS/3sY9uMORYOCScTjgcMwuy0SnNIndn9ANv8fLzlrejxhi/8KDmCTw3Zu18E5J24k4B2XsTH+E+a9qo+OzxVEUksx6Og7975kvjvjp+Apzd4z1PY7bjBp1pwLDd8Fo2wANbI+ykaNsTHOSIQBEZPbcrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730154249; c=relaxed/simple;
	bh=S12iColk/b3a7n3NtIXEcWEg43rTtG6MRytEnEG7sUg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HhDNON+Val7xI9YjXXKO7pBsAgGqS9fZX6say8rPnh6c5H6keSMNpLIpf8MEgytIuH1wVdw9/LK6Ivzp04L+nXks1w9vBRAaaGizAs7xVVwd7QAhgLM4nwnaz6cFySYrk5XPAKtRm06p04ASbJVYu75bO4cBAKZTYdEiLrusAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=li1cYlbl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="li1cYlbl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so3329392b3a.1
        for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730154246; x=1730759046; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S12iColk/b3a7n3NtIXEcWEg43rTtG6MRytEnEG7sUg=;
        b=li1cYlbl/YQdYfvZjobht2gWnn2gg1R14vrlMHUYi35YbQZ4pNICk6JqAnhMGoVVGF
         11zYncOIb3TprPFYygQ7NWtAV8QUps0Xc8rdmvm1qcDP8/LhdAuCsDo5tdF6zeMkLrRC
         TW2iPI2yPxN/P9jlPIV6U7uq7yJnrrkG2tyOdhZM03G23rG934MO4vkbcMUdfVzqOXC3
         K2eUI+IeEpJCBAHw1AoSFt377EbXJyFZn8uH9xvRoBXYskqxjsIdZjwzO4gwMDYAphrd
         tm31cxqAa3oPfhFT7I0thMdF+8QmgKxz+1lUG8MqJ8TzlBDZITIbbiisZOakloq9CRjV
         8Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730154246; x=1730759046;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S12iColk/b3a7n3NtIXEcWEg43rTtG6MRytEnEG7sUg=;
        b=A/Jkk1EK4TP7YJ6YQnWYUMKVIiQWPu74/2Qd6Rf8VDYOGrtcrc4Xku//DSz6ZpmcJ+
         M/n2iTjJ7dwgN1wDVGsdvv3Hx2yBKIONuNXee6Lw84a/e2JR1/ARwrFiIqVGB85dNb7j
         suMrcRAlHZljtfOX+4K876HyOwihkIiqxBvZB5xrvrvj9+mDfjXIPxuD2VVaEIxVeMuO
         hdCNm98SfXlIxeU8nr+auNY3GlRntdudr92hgWSzAJ+EARM44QZXAXU9YnEJsscPNdU0
         Q+WMmxEbs6Nxw+HPU11ra0uLqlMe3HpIOJZN8cZke5D05FM/e01WhtFSGP35KwYtj6gP
         WrgA==
X-Gm-Message-State: AOJu0YyexhCbd1OnZACN4T4x8D04tm9HW8/dwOWEqzxwdEvQjosoVeJM
	TCswtDd+DQ0LBo9/W44Fs8MxlCdl0VS7N3mHcttfYYbTzaJnNKwopji3PmV3Ji9mjL6tXbgd8+N
	u8OcXz/ml/SqjbrMlKxu3fm/v6xDGQiUoVD9CeN2BI0aSVAyRvnV9
X-Google-Smtp-Source: AGHT+IGxgaWi/GE2QDYz9DKuLlvR2ZdoaiGr/6aAFa436vIQ+wHP7PIAOdOKbyJZQ5GCzC/gCw1idsn4J8JiOjodi9A=
X-Received: by 2002:a05:6a00:2184:b0:71e:4dc5:259a with SMTP id
 d2e1a72fcca58-7209672fe92mr84214b3a.7.1730154245483; Mon, 28 Oct 2024
 15:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Mon, 28 Oct 2024 15:23:49 -0700
Message-ID: <CAHRSSEyCAMtXogOHOUY=zVipGOrYSGcbe59OpGxr-1_RnK9+UA@mail.gmail.com>
Subject: fix for kernelci errors?
To: kernelci@lists.linux.dev
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"

I'm looking through the android kernel build failures using the new UI
(still a little painful since it is missing some features compared to
the old UI, but getting better). I have questions on 3 of our error
cases:

1. android16-6.12 (gcc tools building *+allmodconfig):
/bin/sh: 1: gawk: not found
make[2]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Error 127
make[2]: *** Deleting file 'modules.builtin.ranges'
make[1]: *** [/tmp/kci/linux/Makefile:1227: vmlinux] Error 2
make: *** [Makefile:242: __sub-make] Error 2

Is gawk missing on your build machines? How do we fix this?

2. android15-6.6 (clang tools building *+allmodconfig):
drivers/i3c/master/svc-i3c-master.c:1100:29: error: variable 'reg' is
uninitialized when used here [-Werror,-Wuninitialized]

It looks like the stable kernels only have 1 clang build configured
(x86_64_defconfig). Would it be possible to add an allmodconfig build
using clang so we can compare our allmodconfig failures with the
stable kernel?

3. android-mainline

Is there a reason that there are no allmodconfig builds of
mainline.master? It would help us to know if we introduced an issue if
we could see the equivalent upstream build. It seems like it would
also benefit upstream to see those issues early.
