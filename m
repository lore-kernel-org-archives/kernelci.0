Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CCE2D660E
	for <kernelci@lists.linux.dev>; Tue,  9 Sep 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411910; cv=none; b=lqjf3oDmdjUpY+S3AdtkoKXFj3cbF7bUB+5Z1yk7oUKKYcVDqTkUa6im1GEDG6K7l1TYMWNJXR/Hg5PLYzOUFAjWj06jPvcj8HwLyEOgv/2j5yQKRe90o2Un8Mp8Lf/eyIp1lJmhGgDCo42wx9mHE8/F5g3uLzE2reVanmE/Y1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411910; c=relaxed/simple;
	bh=BcPTgT4DaoNK+sqLNjn9V4T8XzfeAlyDj3xfj5ssbQ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ulc40o8p7sWk56IdTFAlnR4vCl+hX1Huv/dWuKiouavIqhAwLgx+VDS/hfdlKs+KmmLETwRdN9QL+aU+PAWgN0XLRjiihJqS+1ahUJHuGyeTDVijTN3ibkQF2Mj4+tNIp15tz+RShjg+UNrCa31RrUmKq/prS+kf9hns6XoFVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=mbxwQN+M; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="mbxwQN+M"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32b92d75eaeso3668920a91.0
        for <kernelci@lists.linux.dev>; Tue, 09 Sep 2025 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1757411908; x=1758016708; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BcPTgT4DaoNK+sqLNjn9V4T8XzfeAlyDj3xfj5ssbQ8=;
        b=mbxwQN+MK8kU77GpdbtpD5MdWdifFuzTFQSru2ae3ZcwLA1pAVUaKKDkfF3IXCbJjM
         eVCf5tZD8fNKhew8enSoTclHm136npI6gUaIZVbfiF1tWnF/pQfw49jLR9xr8eWM0VvB
         jDlizZR8iPfcSMvX+qtE8EBTWQ9NxSyAwV23s+ORWC9qVoC6418QdFAIh9QrRo3A6P8W
         E00LQ+ATYZ+VhDk/Z/S1mzXR2Q5+KEZuBtn4EuXD58VigUISFs3Yn1VufNKxFrAIxC2d
         oCi/y4H7tnMNwUyzq9L59dKLBSdRw+wIEq3PsE1WeyWlDhYwgE159WcigP8qZQBqZ7us
         /vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411908; x=1758016708;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcPTgT4DaoNK+sqLNjn9V4T8XzfeAlyDj3xfj5ssbQ8=;
        b=iMXWpapbl49LEzqq3m1tKNDWiScYJKajiJ7NSfoQYxVGlUfsCzi5HtoWrvEk+HVuSa
         uPKGQpfDEqaHN+2qCqYwC/yGoC4p6pqMPzwoeWF98eXbQxdPP4bSvQBFKqWwI4lNCKPW
         wksO4uHs7Jwkbqo0vJcnozHL/aKuXUxfZ+Eqf/SHgy9z6AwoPJVabAAahnSZw7ilSW8t
         SwpKNfRqhj1ezIp8Q+DNJwqsl8R6D3XAcShefN8GDLdQf5Bjl6J3HyA48QLXEJxfHmgb
         tIhEqiHBM1Zazz130wrNr7W6t/dSfnLQjk9mrwS63lJHLynNWLqKxHnWkwQpnbHxxJQA
         IJow==
X-Forwarded-Encrypted: i=1; AJvYcCX01v8Qe7ufBz/m1NxksmDtGAuitqa/tDmtyVV/JJI1Y0UtsMGL31oc//NWLDwYjkNyYB6P9YeQFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmV1m+8DFc89oKXgJ9S8WcEzdbnpPAI63lPPyiWXvXvuKhEAso
	dvue3Gqs2Rcb23OLItL5qmP3h1ZrZaS3uTeUK1cTA4Q7wQwjhIabqZz9wFoYC05ojop1onHr3Ch
	5XgZFA9mscUwhbQVVeBdvutYxkgMTjVF5aEzhBdKO
X-Gm-Gg: ASbGncvDw/erBJplEojxwh9KUIt7e3qhDaYfqHf8G7F1+PjmJKsXnmGAHni2RP77pLw
	kAw54XyjIKMfczfyLYztqIzZkrZWXsBnvnPBR+Ri7dnt8Cm/MKsG9/qHZPXcyumEGW6O5KgKVXl
	L6UEkUFdlZKmW+Jmsrdx19biVzO2TVjn7j9vZ2joWmZKUzhdjRYRyMpVSbSnE4yIvWah3/EQMs9
	dPGduA=
X-Google-Smtp-Source: AGHT+IF1m2rO1lq8YsNb1JZtLnx7YFPnA47qj42l6x17TNVIDAy2/K7vf752ZAqr693wrJ0dJTpLhqHDZ0QSSmGW6t8=
X-Received: by 2002:a17:90b:2c8f:b0:327:53f0:6368 with SMTP id
 98e67ed59e1d1-32d45037a0emr11618836a91.2.1757411907905; Tue, 09 Sep 2025
 02:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Tue, 9 Sep 2025 18:57:51 +0900
X-Gm-Features: Ac12FXxcZ5tawe6vldEzR473P71-6XB_eXqZ2l7lI71wYP_rV2SpmrFPdLf5NAs
Message-ID: <CANgtXuMNY0KfdSJuHZh2khaGtNr8ic3hNGPkEG4mKw3p7YOhZg@mail.gmail.com>
Subject: [ANNOUNCE/CFP] Kernel Testing & Dependability Micro-conference at LPC
 Japan 2025 CFP postponed until 30th September
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, gtucker@gtucker.io, sashal@kernel.org, 
	kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

The Call For Proposal (CFP) for the Kernel Testing & Dependability
Micro-Conference at Linux Plumbers 2025 has been updated.
https://lpc.events/event/19/contributions/2001/

You still have time until the 30th September for sending your CFP:
https://lpc.events/event/19/abstracts/

Thanks,
Arisu & Guillaume & Shuah & Sasha
