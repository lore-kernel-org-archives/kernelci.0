Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F12ECEAB
	for <kernelci@lists.linux.dev>; Tue, 14 Oct 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453035; cv=none; b=Qh1dilDkPA77v9uvLaRdrZaQhwUktAqloC9+eNa8Rmtv9C8C8SVmG77Oiwviuuht0Hda0c3gb1TpTDvBAfOFuG0vhBCpHIXe297BeBmtlQFNr23vHXrkyTKL4TMoPQ6GBVO+rgWiFNjbw44o7hJo2JMHD/fuFZ5+D6RtHmTR/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453035; c=relaxed/simple;
	bh=3HQnhaut91Lg3DY1RuIN9i0inl0S5dhob6+3u5sO84A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JHJ25e4X+EroaSGupKuc3zSKmTHsHUlpsxD5Jr5nCcAAFgLnTKiK3AXfWUwG7Gvkr0nnaJBgTy07AQCC0hkSu5AgUVHFpPEfsIYSYXUJ2502pcUuFCtWenNjQxjmOeWcV4Y5N7szmFpRkdB8RG/adajVdN4qzyGnhS1iJho4DRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OlsYnzZq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OlsYnzZq"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36527ac0750so45248721fa.3
        for <kernelci@lists.linux.dev>; Tue, 14 Oct 2025 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760453031; x=1761057831; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3HQnhaut91Lg3DY1RuIN9i0inl0S5dhob6+3u5sO84A=;
        b=OlsYnzZqCmk+KQyaHYqeHSwCrDpOlQGEt1vInAjxsUH5lR0SozqEknNwfwYVTyeCPU
         2sRyCQtw9LRGlKLGwIWzn9immLvCerC50S8PgM8QTWhI8fQJo1SL2mYANTbh5yngfcCV
         JhFDwsey2LuhqtvOcW3J6/xTIxmJmombZ0bAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453031; x=1761057831;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HQnhaut91Lg3DY1RuIN9i0inl0S5dhob6+3u5sO84A=;
        b=I1aggq1/CYjUz6Pv3NV2ySvmG2ynjtqG4iLGLCPCi3RqtX993gk3TsThrtYSbqyYjw
         KWU2jKofJp7TM2ZXBf2/JZxpbuUyWV2tChb9JkyJn+3iX9s8yrHnsfgMm6lXVZvhOENq
         biTpZGEP4qKDXam7b140o3Vq38Ln1rfZUgcoHXyVMljmW9Frz42VF4qXnSYtjqU7zujv
         wM9I7Ov/a+WoLdajqViz1fK9DrYdGkPAWqZGwnNNQAsqSmPn1C4hhbUZhLUHA2Hz2Abc
         d1pNwwYw6c5LPpL2eiyH+8a1xlk9ZMmKRL/WNobJQjVm+DUx+bUGysk1fl9Ll0Np+Cad
         MrnA==
X-Gm-Message-State: AOJu0Yyl45dYMo8Au1qJxT38JBq3l2s7dUeiIadxYhEgA/Q36+QUpElO
	X14kIq+xoakgmIudKJmBZct3r52qqrTP4rnuKitfEVM5xq59P1PKrtHwJrXr4PuzWX1L169suOp
	i1UJneHQ/t9SpT9TDMp4JjRmHU8oAfs/I/OISvd01ZzJgYkxzW+uNC00=
X-Gm-Gg: ASbGncsI1dPUR7Jd8M1vp/L88PA/ReMMjl/23J7YOj6XB+VWvvckCZOg6MLputNF6Ih
	iVZJChRl/XXbtF18y/N/zcUqfikKREWQFPN5QQkDEtyY7zfvjWPPhSotqnKFSDn8RZlvMcuKJp6
	8immDLf3ludMJsxijkRgtXWjtpuoZmqb0c1psLSv8yaW8ycs6CQUzJgWlb0S/sEodiPQdlkwMSY
	E1MEqzUVVvKTivbJbW15AvH74hSVttvaOdyhzrJyz7FbCbyUOt4GRzksAM=
X-Google-Smtp-Source: AGHT+IHpIS1BiX0OG6lqhybekENw4kDdDnRJ/ampfQXhn+RPMkCerQSXVtw8cRH5Zd2Z8ExkEck4TIYsXz7f/g+dJSw=
X-Received: by 2002:a05:651c:1ca:b0:36b:8361:15c7 with SMTP id
 38308e7fff4ca-37609ee797dmr64631361fa.42.1760453030835; Tue, 14 Oct 2025
 07:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: mwaqar@linuxfoundation.org
From: Yasmeen Waqar <mwaqar@linuxfoundation.org>
Date: Tue, 14 Oct 2025 10:43:39 -0400
X-Gm-Features: AS18NWDdX5SIZeNCgfhSBP5XxLWFh8qBp9EYjZ6BF5W8UetTiIDU4-bVaGvSxhM
Message-ID: <CA+bPUKbS8gBdvvDzX-SzMgQ6Yg8XWjKpbE+vF+PAFnTyHJYqfA@mail.gmail.com>
Subject: KernelCI TSC Election 2025 Results
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear KernelCI Community,

Thank you to everyone who participated in the KernelCI Technical
Steering Committee (TSC) Election 2025. We appreciate your engagement
and contributions to this important community process.

After reviewing the voting, the following candidates have been elected
to serve on the TSC:

Greg KH
Yogesh Lal
Mark Brown
Gustavo Padovan

We thank all candidates for their willingness to contribute and
everyone who voted for helping shape the direction of KernelCI.

Best regards,
Yasmeen Waqar
Program Manager =E2=80=93 The Linux Foundation
On behalf of the KernelCI Team
