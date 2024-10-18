Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8D20262E
	for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280916; cv=none; b=cIaTJwB3us1FHzQ1xo3uNZKnzi+Yg3iyicR/WV8F3MoyGtz95/WrZrUl3URowCqne19UtdJDxo14xrobgbU8mKGfNyvuHOnffnvAkAKZ/ArvkWEvYAl6NAplYOUM7QYvbSAu9cya6026XEWy0dUXv8muRtXD/OUbiTwzsBTA/n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280916; c=relaxed/simple;
	bh=pcy12WqWuB6tinOLKzsUt7w5FtnhMsne5vLmTGAtr34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyM0P1g88EKiIuAKuZQbNAy4r6ldv38CKHa5mGniseig3FgLkyAB+UVSImoWDmqx7YSDHztXu6UyoofkCIy9u3vbBzX9oVp1mPvoucZH5SNrEl6lVzwLLRxrzg7Dw5KkprHw+oaQsskMNyQb42gCO93U4hnISmB42tpl3EWGwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pN/ByRMy; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pN/ByRMy"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso2118071a91.1
        for <kernelci@lists.linux.dev>; Fri, 18 Oct 2024 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729280912; x=1729885712; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pcy12WqWuB6tinOLKzsUt7w5FtnhMsne5vLmTGAtr34=;
        b=pN/ByRMyj5E9E5SmlKdQYMaSGwhnXf+UUiCcXTGCbGx+hvSSflFhvQuF68EvRwegef
         7yzBVPFaHQsXyhn9R25BSi51Bq6iVUD6bo3LuiGCr1AWJTdv5HqEV8uovF15T3PVWPbt
         brmmpzecR9rX3T/K8HP7Gj1oXjYEE8cAX//s14UuzYVLKkCGboQH6u5ZXmdk5txZKYIL
         rgyLchg6VmzGb7EcJAgVSTRxy3qILJzZj8XdK0QF2YWxB2UBUqGTAAPyr9ecWC6JE3hc
         G/pVgQz0hxp0t3sWeB4zhYbuMYeYBC/Ax1v7s79+KH7uY7JKo2nmEHqhGZndn1vSpKwC
         JoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729280912; x=1729885712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcy12WqWuB6tinOLKzsUt7w5FtnhMsne5vLmTGAtr34=;
        b=QqEmWB//epGda9/2aCTt2YzLlekErsa1CL/yT73Ubtf5RYDDI15kyLnqcwODLJ6hxE
         qY7cB9armF420jUXvEHZjhQYezFpOsHLMl8Ggn5u9JaafBpPyFEmSEclHd+Q8gjeQH7p
         Cxt2IHdt/3KMBJPefr6ML1XIsgM6VWwxFi+vJoUrQFEQbUbO8hj9uCXOPfx471UiRsQw
         bAFeJDajAbnjY7bK9UC6VABpmO45u8EHadfcxeFiDL9Pkw/v8zGLD/Xv7We26ruMiJIb
         l+bv01ZkYIhsmBKKVZAz8nKprzecZs9Lv3NqO1N2cUv9B6CuyFSlvE4wgVHXOvdhOcsI
         rFVA==
X-Gm-Message-State: AOJu0Yzgytk4IpTJo7gmTEKN82OpjUInzPBRon/K37PiJSUQwYUYeAwD
	edsB1VOO09MLncJIYI9e7lW5RMjhBW8qzvXVqEOxXNpcHtB3cYBR5QbOrQNaIfGWCJ7Dm1HhgW1
	almOXrCfPf7P/DCyRRnZ07AXaXF42d8eeUsgP7+oGFcYzlSPYiA==
X-Google-Smtp-Source: AGHT+IE9Fnj3+tyy9vLUL5rYY3v/nQ1JiutaGnfBp5tyaG55R7tTT4Lp4mMz+pELnKXNy4RpmfOOJTx98b6Iq5FhOZg=
X-Received: by 2002:a17:90b:3c47:b0:2e2:bd68:b8d8 with SMTP id
 98e67ed59e1d1-2e5616dea4dmr3777507a91.8.1729280912056; Fri, 18 Oct 2024
 12:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com>
In-Reply-To: <CAHRSSEx3vyonQonF0cXOvnFS4=nZh_G4yRgpf1EsMNnXDrdTsQ@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 18 Oct 2024 12:48:19 -0700
Message-ID: <CAHRSSEzk6QcBkdA4UhOfQzFxzLy9njSvZ67zgGpw1HZir=42bg@mail.gmail.com>
Subject: please add android16-6.12
To: kernelci@lists.linux.dev
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"

Please add the new android16-6.12 branch to kernelci testing:

repo: https://android.googlesource.com/kernel/common
branch: android16-6.6
