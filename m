Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470C168B8
	for <kernelci@lists.linux.dev>; Tue, 20 Feb 2024 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708404603; cv=none; b=YeCQ4Mc1nz7SnmmDOEPBmrL8KkfRWJChA/ggHMcb1oDxPIq0LBQd/ZO3PejqjTus8waQvEHql4KYKn/ptMRrtcCDYfh73Xf1kyzcyIJbWWTzxJMkFwxLKf1jPs25hMo5V55weYtt9n9paCOzOhKVucd45hUreYf43a447BhEAJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708404603; c=relaxed/simple;
	bh=X0vyNfdIXTx8dvVgPTyc8LakjpXMJ9vt8gbVN6PR0Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sr7yOGQaIjxADK+ryTB9IeP3HnU3vfcptlm+D2X+879QSK2kLUWF8ur/mnslFwcVr6vq7NqUZzaUAJjUUx5LdSBJUB7lOSUBtINxapFMMFGbXpk43uhzSthy1tNHvkNsdVWh4FZzCOS8ukoiNAaw/ToJUkHYN1yq2CbkWOkY8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=hL1LQM2j; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="hL1LQM2j"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-511570b2f49so4987034e87.1
        for <kernelci@lists.linux.dev>; Mon, 19 Feb 2024 20:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1708404571; x=1709009371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfn1NQVtbaE/WNocOw76gxhubWtJWiWcVo822IktCTE=;
        b=hL1LQM2jrfZxLFuzj5JuW289roISz8xJnA07ux2UG+IvYu0XJV6XdyY/jl0bXuL8kU
         v/wRgDDabn9diSQQ2iR1xeqxt2mWUPjPjkDe+VEkvWbnIILsH954XbyMSuOSifyVTRqU
         dNlvoEmRRU8ipIhuGrqamNJGXcRtsaAfMBkI2sRyRQo+AP4UwW30OYit3MVur0w1OBfO
         DE/MmUADN4i6gLTQnUT1lWqXPlZh5+EzFoFqUWfp1rWfAThmDwzgjl9lw9mm/8uwfyKz
         ANY9hYnsZfM0uKNa18A2eI2JwQ1DamkE+Itw8KPlfSgANSIrsCYXSKzLRUWqnqXixhbG
         /3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708404571; x=1709009371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfn1NQVtbaE/WNocOw76gxhubWtJWiWcVo822IktCTE=;
        b=CPaCH9BybdYSihQpj1XRMpkzkN6UkAxosXK3j4kJSNiZMvH2+32BgtLyHfwHI/g5Gx
         6eodCSvTzJGakb33ZRQ4sWd8v76yMRlkJNhdkw3dmSDcBb19UkWSwQ0sSpJ8U+A5Czco
         7xlYiAOTSRyOJixIq6A1g90bco3o7SSGBJ3H/iS3J1PX18h/kEds8cT3Rrp0ZB6BYSjJ
         oAaMZuSZvBSYaPsuaNQGidyfKi24SGASUCILxCjn7TzZ3p1F2g90NWI2JrLrjnolVXs3
         m7nymytB7hbsUCLje8bIkRbPN+F79d2v3btqMDOQOlSQWXOXiAxsKXjDEsBdGQbj/UCI
         azzA==
X-Forwarded-Encrypted: i=1; AJvYcCX6X+UdlY3KMKragwi98N2ZMoelPdfBgGZVNpcNC1ExvqT5l8jAovZLhXF6G8S+TmLLYGpoHUlm2z4/tymPkaRfzOjbn3sU80E=
X-Gm-Message-State: AOJu0Yw7gM3+Z4KBiguTaUyxtX/3fhZeSzm0pRmdddIxPtTBVRLxBYod
	oDU1XnL+VBk86RLhJlrad4iVoHqUvmwIiWWct97vMKDNrtEUge7sZ5J1SWuxxWhWvfihjgEYSYH
	2NWGa6aCcD7OcbuJzG/v/4FEBq1flXBBXdour
X-Google-Smtp-Source: AGHT+IF9Mqg6iR68KyCsCopvPRohUpizazLvA95aT/Ki4lCZBxKq+hNLPBA7jTBnVFh4dZtTbiUNBGGxOHkvDoUD7Gc=
X-Received: by 2002:a05:6512:3b1e:b0:512:bccf:eb03 with SMTP id
 f30-20020a0565123b1e00b00512bccfeb03mr1205299lfv.26.1708404571169; Mon, 19
 Feb 2024 20:49:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
In-Reply-To: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Tue, 20 Feb 2024 13:48:26 +0900
Message-ID: <CANgtXuNJhFYKkgMAN9TOGXdWu4bks4JPJe6Ps_yH-kUpT7DaAA@mail.gmail.com>
Subject: Re: Shuah Khan - Self nomination for KernelCI TSC Chair
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, kernelci-members@groups.io, 
	kernelci-tsc@groups.io, shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 9:04=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> Hi,

Hi Shuah,

>
> I would like to submit my nomination for KernelCI TSC Chair.
>
> https://lore.kernel.org/kernelci/260bfac4-0d48-2a10-e15d-75695ae12544@gtu=
cker.io/
>
> I am a Kernel Maintainer & Linux Fellow at The Linux Foundation.
> I maintain Kselftest, KUnit, USBIP, vimc drivers, and cpupower
> tool. I am an administrative co-maintainer for nolibc.
>
> As a developer, maintainer, and contributor, I consider kernel
> testing and validation are two very important aspects of the
> development process. I am interested in seeing automated testing
> and test rings succeed and thrive.
>
> If elected, I would like to work towards continued success of
> KernelCI.
>
> Other hats I wear:
> - Serve on the Linux kernel Code of Conduct committee.
> - Authored A Beginner=E2=80=99s Guide to Linux Kernel Development (LFD103=
).
> - Lead the Linux Foundation Mentorship program aimed at increasing
>    diversity in open source and providing equitable access to learning
>    resources.
> - Served as the ELISA project TSC Chair and continue to contribute
>    acting as a bridge between ELISA Safety and Linux kernel communities.
>

Thanks for volunteering, I'm a member of the TSC and we meet before
for talking about LF mentorship program and Kselftest

Thanks,
Arisu
