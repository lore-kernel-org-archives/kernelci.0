Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89716D31E
	for <kernelci@lists.linux.dev>; Mon,  1 Jul 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853550; cv=none; b=U82C4gT0VnL2JroOZeCVykwhOO4zWgnT3CcxUYEDibgpKIISV0VzrS2MhngHrXeysDQzeFOqo3a/56sS1AS5qfxPMB8T1bH5qIuIKLhrrV1N+tvQxmdwNP447zIu5VyfnjqgjrNYNR0oYwqDUGQ/bztqaqxxsYFyoOrSwf7zAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853550; c=relaxed/simple;
	bh=3wqzKXsDm9Ttqtarz3E2VkL442CyAEPUEouP+CYa50g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNfaBoLpi0OMSuZa83vBWtjVottPUDHSK6foNKLKVaG/1p/+3MrKbgpGeqafvV/8t6NOoCDOb8KkV7k1Ba/Er9whVgxxCfJ85Ownrbd0m/3h/sCl9FI7XRJHQ9Hxrq76tNlaXzu+4SsDm3It8lJJini9rslz0s9n+JuaJ8G68Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cagmamuy; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cagmamuy"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d16251a07so7734a12.1
        for <kernelci@lists.linux.dev>; Mon, 01 Jul 2024 10:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719853547; x=1720458347; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wqzKXsDm9Ttqtarz3E2VkL442CyAEPUEouP+CYa50g=;
        b=Cagmamuy/e/XDh1fkVpch0HgNSW0dcOLUSlq/OF43CSJve6sCH8nApEWkj1uQjr5Mj
         2mwbBDqos8TnmiAsXwJt3fVO3JIbK1JnSp3JmODDs8vcToQ3ytJjJLzRQ72Jqv3EeTVp
         +mwstiO8+E9Rml2ufaSYs/zB+HBv3JSPcN9OQKuRz6gvTu8f6ihWbyk8q3T74jcG63yg
         QxdtGT4lsHQue0lVNsqTTGURkzp3VbzVsG6HG4SM7julIC2jl4T6oHLXoW/TdNh0QaII
         u9jSZrckg158r9xSQMSR2P6Ei1CuPXhz7Xx3CBNCTB4CaOCkwDHb6Huh/X77dnXsV/AN
         p57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853547; x=1720458347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wqzKXsDm9Ttqtarz3E2VkL442CyAEPUEouP+CYa50g=;
        b=nC8RX0bF525R8A3A03aZWZeH6+Dl2lBDoykyp8wkf9ZWECH8cSp8AJbn1GNnvM1IIv
         wSV+7ZA9NcE3Qv9rsiVqzJo+68582ZjzdniKRKEECgUf7I+QpAITe3crn4p57QAm6VwE
         DyRAh9Y2vwMdfwjQlTmt9JSV37GLupHTUlQ+crGWAPMTeCEEKOSqVBLbiDIVv+Z8hYIX
         8/GV1ZnLDDEMxDc3nFG4R+/jMWjwQ70XjNHnm7o9vuNwOHlkrsOfS5q8+5vCwSWWHeFa
         wyze9x7zwXXpwuJ4p1T1aLgt2YZCy7uB7viTXQ2UgumqSZXGgGxAVHZWyz3JkAL0oY1U
         SAMw==
X-Gm-Message-State: AOJu0YwPYNHDNy55NZpyyINAQw7ktP1yTAylv4gQJuzVF/OZrfprqjAB
	ILxlaoZfI6hwhFa4ZGaXPFxM8WHB/IeNYkszNjz1FxdB4W9ztpqIF/RKfmDB2DOBY47TCN4hAE7
	3XfKdnFLT5CCMUPBbAlZwRHRpR9VlqLR7Yd9v7ChUdE1pcZ6V3lcx
X-Google-Smtp-Source: AGHT+IHMbFy+Bk2sHlE2w+4S1lQMHR4C1ODT+y53dxsEGrJw4v4k8WbmxqY5W1GhS9PL/7yFcrN2TVQ8MLYHuCEREgU=
X-Received: by 2002:a50:9308:0:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-5872f77f784mr382242a12.4.1719853546507; Mon, 01 Jul 2024
 10:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com> <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com> <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
In-Reply-To: <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 1 Jul 2024 10:05:35 -0700
Message-ID: <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
Subject: Re: new branch + more recent gcc?
To: kernelci@lists.linux.dev
Cc: Denys Fedoryshchenko <denys.f@collabora.com>, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 10:03=E2=80=AFAM Todd Kjos <tkjos@google.com> wrote:
>
> Our kernelci builds are currently use gcc-10 and clang-17. We have 1
> allmodconfig failure [1] that appears to be caused by the old gcc-10
> compiler and doesn't reproduce with gcc-11 or later. Can we switch the
> android builds to gcc-13 instead?
>
> [1] https://linux.kernelci.org/build/android/branch/android14-6.1/kernel/=
android14-6.1.84_r00-129-g87fb1f2f1e795/
>
> Also, we have a new kernel branch that we'd like to add to the testing:
>
> repo: https://android.googlesource.com/kernel/common
> branch: android15-6.1

I specified the wrong branch. Please do not add android15-6.1. The
branch to add is android15-6.6-lts

>
> Thanks.
>
> -Todd
