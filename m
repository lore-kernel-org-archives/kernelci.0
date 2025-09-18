Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A8306484
	for <kernelci@lists.linux.dev>; Thu, 18 Sep 2025 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758201664; cv=none; b=idTxMD6824chfKFSnsSlTNz/A2ghcuBJU5AjjfsTSZi6/4VOE5qtHiayS5zJPCB5HwXl3NBbBKY+dyKVMdU6hfr6JJ8MBIRxCt6NKaIUmA7TLWzSK4Qf/JRQ1Zv8dm38uXPvbCWBho1InegXRul83dZosL2wGEdDF/e446EkLb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758201664; c=relaxed/simple;
	bh=V9KEbQAWxMD2tpjvtc7BnXJbLasTFbPihZHyfNoNFJI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WYJxY3AcfmYnDrkRM6C4y6jkrmV7/Ommq6wqr0/lDeotKXRngeD0Z4FPYLfTrLQVbjWYoj4L+J8mkv4M+/5rlQ1ecyftIeKAEBgGb9Gg+Y0No9T0Z3JagdwdSNkugBzZDYd344nYNsx1H0qdr2IWn9JL7lMuULnc6JfZExmB5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ws/Y2771; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ws/Y2771"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-353dece5805so8061731fa.1
        for <kernelci@lists.linux.dev>; Thu, 18 Sep 2025 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758201660; x=1758806460; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9KEbQAWxMD2tpjvtc7BnXJbLasTFbPihZHyfNoNFJI=;
        b=Ws/Y2771TpSArb1tfR3kuYaLBB7kgi1jLhuCSpD5xAlPNYnrWFnHFy/KmmVRWnv+4i
         fRelFC9Km0yBChiXFiX1U6WN+wuE0mBmMlggyW2T43+i9sUtbktxkOysRfmVJM43CNcf
         MQjsRnXu3CK8ml0uc9hxHUZmf1S1SjoBSje9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758201660; x=1758806460;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9KEbQAWxMD2tpjvtc7BnXJbLasTFbPihZHyfNoNFJI=;
        b=ti/0gm4m3qTCEVNhQ4cGQSAF6dvZIPYLXUPx7bFep3JpzJ8orIteETOeVpHvlNr+8i
         v8aNRjswG+Z+vMee+R/ZHhZh3J2MOBuH3GFr2AYpV5RwZIXpaUAIjsiBVJFKAnhT0Lsi
         Nm8jU+QoApo1M2yOPPM7fR2ucfh8Ww6qq67xcvk4PBvgkYtH2YsDvT8RT1U3INftw/aB
         NWtcLyB0kZ3MhYh7c9BKvnCAbhDghtypuaDPVT+Yp/SD7Nah7ygsDPMJVKUa129DhUnu
         LU+7Id7yRjQa70oB7cA/qUjcpBa1uqIJbpFsKipIAaeyivhCSCLN2iKfWEQUZIjev6GP
         iqNA==
X-Gm-Message-State: AOJu0Yzwuin1x8CAZLcS25xygo92vp1vtSoj0YF98WApdn+jhmygfRoK
	yeNpOE+WW36bOHf9w17ot23+xGB6lfGLLedSQ6rWYaMpNWRnXqtbLVrD56Xv1LEg0HIDmNQrHR3
	ZG8zm9Z7h0iRmkXQmAyHtVsbGpO9MaDa3cBduwHiWJa2rj6MIB/tygxQ=
X-Gm-Gg: ASbGnctJf5IGBE8xWOvcgyWRITjiEaOCtXoBFJqsyrWNsNKA2i9lWXZI/sagNaZvMlC
	iyJNeyCh8lMCE6O0vomTlgTvg/3EdGjLUpHQ4/fJC4hxG3xc1skegq0RPSbz6AmxrY9hS/ZoeiH
	uBDn4eAHWdzs9EFjMzFEdzFzvt9APbzy+F2n501Ckd50PZ4h99glu+3jZF+QOdVfjpjdypor5fR
	ivFkrKv+PYmQrY+kUZvXn34xZLECk8OOFszsnft5i0RFvYlcyPb64wafQ==
X-Google-Smtp-Source: AGHT+IGSqMaj5+gohEsuLJ8mI+bgSsr5lCU/AXrTfoK3EZdB7unRTXjc4cDpBWvKpYfoz0S+HShLc2H0Y9ZQtGeUdss=
X-Received: by 2002:a05:651c:2125:b0:363:a56b:7079 with SMTP id
 38308e7fff4ca-363a57ab57dmr1146791fa.2.1758201659932; Thu, 18 Sep 2025
 06:20:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: mwaqar@linuxfoundation.org
From: Yasmeen Waqar <mwaqar@linuxfoundation.org>
Date: Thu, 18 Sep 2025 09:20:48 -0400
X-Gm-Features: AS18NWA8TsXUPTc4SPmEkhH1W4wXfIuGkBuutnz0uKV0actsqah4l5crDtPFh54
Message-ID: <CA+bPUKbqS8wTjWA3+f3Ohs8YihZAYrCew9aLv21ZohBR_-B9zw@mail.gmail.com>
Subject: =?UTF-8?Q?KernelCI_TSC_Election_2025_=E2=80=93_Voting_Open_Until_Oct?=
	=?UTF-8?Q?_1?=
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

The KernelCI Technical Steering Committee (TSC) Election 2025 is now open.

Candidate profiles are included in the election form. Please review
them and cast your vote here:

https://docs.google.com/forms/d/e/1FAIpQLSevS5UDnTmqfb41QQTE1ubzlM3jJ4LXnxvgzQ2mXA6OZtNTqw/viewform

You may vote for up to 4 candidates. Voting will close on October 1, 2025.

Thank you for participating in this important community decision.

Best regards,
Yasmeen Waqar
