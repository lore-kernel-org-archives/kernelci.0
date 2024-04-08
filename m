Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A39713E41D
	for <kernelci@lists.linux.dev>; Mon,  8 Apr 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712587106; cv=none; b=AwLKWOJ0tISCAqlTUPl8rOpHpD7Np6Jz5UnFOlSiXkOWhEvNMkUquTnh1Sw4Q/Rg4abBlo+Wrtu+AvqIZohSIYYd9gr+AIMp4aVi13KluX067+4G3sC+CPMiXlO/en5/wLdAytvttJ6fDZU6wFgj5AbShs7OlmgzEHwv9Xq+Iis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712587106; c=relaxed/simple;
	bh=3J8FKeevsu5cXmgcrDLbA6aJb0xCxt49VTYxcTHeN+g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Sz+kI1leWhB7186mPF5OMl08NpDaD3TDWfrmYKW7nz54TNs8559COqfoQFtJ9IN378wByaxnuzAiCTAVdvCZNXgx0govEE00dNYKdh8LbdFf6BPP8pq0UiTDP4hdlioZCo3DRurX3+p5kMjat30SROhG5jUyjWpVfDCRwzx6rkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcyD9RhO; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcyD9RhO"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78d5f0440d3so130439285a.2
        for <kernelci@lists.linux.dev>; Mon, 08 Apr 2024 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712587104; x=1713191904; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J8FKeevsu5cXmgcrDLbA6aJb0xCxt49VTYxcTHeN+g=;
        b=fcyD9RhOZyIAwy4oa3Od72nCKBq2o4Lwtq/8v/4Q+QUDi7Xuyd4Tp/9dlEuSumPj0z
         4mA4z1M0zo4NVfdstQDuHn/lTDIkmsFjdzhYSK12mlrtxsKlWFPDZtIHwd65LlUDcOCY
         zDKqKkcrPb/QZBZcjXk6C02/GK/OUeqNy+3CElDiWQ6D1DkYT8LGLgNax6qSu8RHy8bc
         QvEd3ZrlyJ+eQq3EWJ/7Nw8JbEhD1IykwjTuy+WR/A/Ji5sgo8Y1r+i5hzfDU82drLNj
         tiveEo7a4voSWPPMfkLCxSNEUslA2rkvEh51q8zjy84Ugvp1a0dr+myZd4/ckMp8/cay
         vHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712587104; x=1713191904;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3J8FKeevsu5cXmgcrDLbA6aJb0xCxt49VTYxcTHeN+g=;
        b=tXSYgd1AiJc/W7E9tSq+e277qThyP/vD8JKOunJnucIHFBMS8E+5fCVyu+oESAuind
         rT5JGHXgQqWychNC7WijIRFdCP9XuSoAgQ6gMIqioAdtdcjJ+U3HkfasJVfcAXpRT14r
         bjpUtOPeGN+SqQPDBNG+jDJoNmo9BGnwl556VAl+TQ+jJOOgLEqD9EjP4l9EpLrDj9eh
         Y43ywxQIfSdRo7jdgpm8JMs+fF0L+yPP5aJoiCa1kILCv9aql0+d8s6ILBDmtItSAF9f
         H2NOXwFkVW/YmiwxJ4KaKtlZyStOzWhOJLathyI5uXTVdR3TMvkXy7GDhobqBEVWpgMY
         LowQ==
X-Gm-Message-State: AOJu0Ywmy+Oypld2ubAdyMnr5xzgY9lJBbZGf58hqzdRENZMGfqojYTi
	AEvNGDUALziUdmihtibt79CW5WLUUlDvUcJKkwSJ/rVTRm7gb5A9609Xom+1
X-Google-Smtp-Source: AGHT+IGRH+b4+dNEFwoZpAGmR3V8P/brC9atQlDwSETojouuNDUnddmf/gtJSjgbLieuMLUm37/m/g==
X-Received: by 2002:a05:620a:91d:b0:78b:e922:c38 with SMTP id v29-20020a05620a091d00b0078be9220c38mr9006748qkv.64.1712587103261;
        Mon, 08 Apr 2024 07:38:23 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id i4-20020a05620a0a0400b0078bdbba4993sm3261912qka.47.2024.04.08.07.38.22
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 07:38:22 -0700 (PDT)
Message-ID: <bf81be70-61ec-4169-b66a-5c3136869107@gmail.com>
Date: Mon, 8 Apr 2024 17:38:20 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Announcing Community Engagement Working Group
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

The KernelCI project is happy to announce the creation of a Community
Engagement Working Group (WG). The purpose of the WG is to connect with kernel
maintainers, discuss and improve test quality for their subsystems, help
onboard new users to the project's systems and services, address their
requirements, and act on feedback from existing users, fixing bugs, and
implementing new features. As well as following up on regressions detected by
KernelCI systems, to deliver clear, high quality reports to maintainers.

The Working Group will be led by Shuah Khan, a Kernel Maintainer & Linux
Fellow at The Linux Foundation, a maintainer of Kselftest, KUnit, USBIP, vimc
drivers, and cpupower tool, and an administrative co-maintainer for nolibc.

Collabora has already been working on this for a while, and so the first
members will be several of Collabora's engineers: Helen Koike, Shreeya
Patel, Nícolas F. R. A. Prado, Laura Nao, and Muhammad Usama Anjum.

They will potentially be joined by LXF Mentorships interns, and of course, we
would welcome any kind of contribution from everyone.

The WG communication will be looped into this maillist.

Nick
KernelCI TSC chair
