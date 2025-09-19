Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F4313D71
	for <kernelci@lists.linux.dev>; Fri, 19 Sep 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293614; cv=none; b=Du1gPxCETGc6lUjDR5fiLiXBgQudbjr9sbLKqmLK+8exNkn1fqhPfZTWrL/hDklg1JNUNIV7kmkEsj/ME8Rpe+flPQwoPHs0080rjxN0S5gio+zgMd6Q3VrrVKeZULQnjIswJIMgu1DZfz02LiAW+/5kIGMxzLD544rXAb9B794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293614; c=relaxed/simple;
	bh=n0qTiSm6kNJQyMXoheKYcuDuZV4FCAGWL0Qgi8XVMzI=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject; b=hUMQ0YtyIsDeD6W68V2Vq2raidXXql/GBubELHu+Mq0ycg7T21EGunsfhMC2J9YxvIefuvs2ezPdbpXLqawhDcti92RGixRFwGJZsrLx9aRJumjRFUKUITnj9RQKT7IFQ+bijnEQGwcGiIeMEIoAqgZXZz1JWzNLTRUEqLFoMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoYMzfN2; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoYMzfN2"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2294564b3a.3
        for <kernelci@lists.linux.dev>; Fri, 19 Sep 2025 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758293612; x=1758898412; darn=lists.linux.dev;
        h=subject:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n0qTiSm6kNJQyMXoheKYcuDuZV4FCAGWL0Qgi8XVMzI=;
        b=RoYMzfN26NRhCsmtYOD12ORyoWo+ynNF6kFMKZIOd303c+tc3r/fJrg4o2iyBBYkHa
         EU+uveGharNAwjZ0tUihWZ9gO/yHbd+6SJz+1Og9MyM5ebnRu+Pmz/BoIR5ufweYi9F3
         qNuOtLPugf4fKIkik0d/fiPnV7Sa4RxM3Ra99gBRXyzQGCiMrflmZAprBDzmISrVpQhe
         MF8R6gje6DdDaWtVA7LfMnl003t0W0d8FJyEpUEzRB/p4EnwA3xtRDmhy49FbOTZjdcL
         tnW2QPvjgEHm5CiAfj+6V6gXtMRPH0wxEg6pEJN3EPbAhfKN9Qo/zpuywnzsHUTqGVXv
         kKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758293612; x=1758898412;
        h=subject:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0qTiSm6kNJQyMXoheKYcuDuZV4FCAGWL0Qgi8XVMzI=;
        b=CTBnYCNMBVsi04zNUCXLW8pVPQSg+YSDHIs0T0ng8wXlBHFvWLd3xeiDDjgYboRglX
         6f5A52BzBI3yOOE9cV6gJbQqh/cfT5M+qlVH9A7yRwSEtbfEdiR+sBx1hKQHP9rZXXzi
         EF9GWM5m8YPFD/Cvs31hS8UMk+9mTAFlVXBQ3elhBKBi4gTjkB1uoV26zxZAGkhR5u03
         rckE7IeSyLl+IZalTtnPBmyZMOT1s0Vf25ugWsLu49EvZLwH6D1jFju/UA7Tzo7+9F76
         lzfoauFzPbPwBjrdstNzR125myYlCzFyIJa9YRmTWvPlCEl2SVI4cJ45CSaiLeLGqKrv
         CGxg==
X-Gm-Message-State: AOJu0Yw8QaHdffW8UCPs41GHCriu03RtbWsXrN9QT/3jq6Hmt+8RKIOB
	1BVdjKEfVS53JYFOX75F/dnWdkRKER3D8gjWk6xkJrGrydZiOF7qQdlIE9rlzWNpLQ2QPpUS
X-Gm-Gg: ASbGncvWwNEArABTT6Vu2VYLxwTjfh0zH8ilh1GepAlZoTeje0w0TUdRzMhGbKwQPj5
	LoRmH8wpux8lYIlUdKX7sO0GY49lC2MuO8WsU6tNDUoYiOdDB6XHThs2WI0F5dOgyta/T8tsK8j
	TH17PoMcL/bljl7aOX+Z13B4sePzYYMWrKMwhnqdaq+MlQfBpNtlPTqAAzP/PTcAFyUmaHW2jPV
	eij9F+XBU2aFCbCCNJuTTJmNecheteNEfWps0tPM4EEqYyK7ZQFsBxZcAsKoM3WPGrJVF2vCzD+
	GKmWBiwBDHh9gZM/mkEWaa7gxQP/NqaFSkJoBdRbYuBTk+kY60GG8V9lhPFJc3ROKg5CloqtVtV
	yfUaw9/RBD1f3bQUub4SibVtu3Jld2rsmTK/hjhkmEeoY0IVzkTT7RT1qiazwpRzWNUezPSeBKs
	iR64JD9iMvcMuK7flBhUkZyW/tyDnAW1Cu6b0ChfkzBE9ct8fVFhe0Ag==
X-Google-Smtp-Source: AGHT+IEZdZ6m/6pb/uRdmNEl7+94mzR7cw4pqLvAjNjkoYHrcU/SkLsNH933tq4PHUxd1npZ9dAnAQ==
X-Received: by 2002:a05:6a20:394b:b0:246:354:e100 with SMTP id adf61e73a8af0-29257ff9b28mr6030821637.6.1758293612242;
        Fri, 19 Sep 2025 07:53:32 -0700 (PDT)
Received: from [192.168.29.44] ([2405:201:c00c:f0a5:cc06:c1bd:24ab:6d8d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55268e73f6sm1256286a12.21.2025.09.19.07.53.31
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:53:31 -0700 (PDT)
Message-ID: <68cd6e6b.630a0220.419fa.4f15@mx.google.com>
Date: Fri, 19 Sep 2025 07:53:31 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3282503060743809066=="
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: dhruvg1529@gmail.com
To: kernelci@lists.linux.dev
Subject: Security Concern

--===============3282503060743809066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

I'm Dhruv, a cybersecurity researcher and bug hunter. I've discovered a significant bug on your website. Could you confirm if you have a bug bounty program?
I'd like to responsibly disclose the details in exchange for a bounty to prevent any potential misuse.

Thanks & Regards,
Dhruv

--===============3282503060743809066==--
