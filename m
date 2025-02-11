Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD5A2505B3
	for <kernelci@lists.linux.dev>; Tue, 11 Feb 2025 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288053; cv=none; b=pJ577leZI/L7Yf8xWC6VjErCLD0QVGYu2Dor9ul41lfT2PKNAzDPCzSkXgvKG4Dkf0gcBzjcQLzdp3ADnmODZqr765MHR248kuEhMM+u2BCGPv9SdPAJKMli3ALM42FwdsbfET7qmbUxJcUdwF8tUq3/m1HZEJV0Zko8Tqd1hCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288053; c=relaxed/simple;
	bh=c4U0BQoGEDqvwQiEJG/iNEafKJ/9ljNNGuWV+PcZbfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OusLOBrhRXYKm5mbLO16qCmtfS6msUM7vXMxyfmNx4WrNM3IXx7OQgHZS0aqRzB5h+K/ULOxXqs5ot7lpCtUr8kCUcLPEiV+xzYGlwGZoCcfM96E7/OhewZOHIoqMLRAou12fOfxuWHudtjUAtpdg4YWqjyQ80FdUSioK3Zgy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVg7/1C5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVg7/1C5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de6d412ee9so8048a12.1
        for <kernelci@lists.linux.dev>; Tue, 11 Feb 2025 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739288050; x=1739892850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbL9eQa2NHquqUeuZMpqgcfigc8NbXhYu6ZhdCUgNRA=;
        b=kVg7/1C5wVCKPL0c+lU+2FABhJktznvqJHacq/7ZNDGjz7qLKBdSlG4ZSqDn8L2nUb
         tKqxAkNnSZitrkEdmqmme2o6/kasEp5bFcRbO8hCPpYzDd5lrF1owLHATgKPwFuDw8sg
         bzw0bz5hdaLGZwdaupy0Ol3v+8SqZzTfCTnuXYIWxlX3fEURSeyRH0DinvEVdbE3Uwu9
         7RwUcwzxiqDaQgKBduraILM0Lz4iwCabz3Unn9s1+4A7FPeLUVsftMCkGw1VO39oQ5Hd
         JjPIzd0eMziaIEQ/95m9RHPyRyC9iR9ArQ2HEkTGEzTmzblEhHba+6in3DhyrcUAkJWh
         Rrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288050; x=1739892850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbL9eQa2NHquqUeuZMpqgcfigc8NbXhYu6ZhdCUgNRA=;
        b=U6PCDitrklzGBnUb+xz4G5aR0Ytp4sPMCbr5rkMJ/dN29bAoaaVSJUUhYXbGdsQCrb
         uXsLtvrdMBWfxAzp3Gu5S4LxugHsiE+ZrpsBR3yxhp8W0Xhdna5p58HkFyJSWxyZYiRH
         3cftTA0lWRfQ6/Fl6A3kha4/wDebhcO2B++sDh6uhptUPKWrqsmp6OWjVCEYHXq4I9KC
         u8tez9ifZ3vqiSjzFmk5OfSit3KLLWSnEUJocYNUpxuu9eGCGiZRv12rh1pM7g+wtjhG
         PgzuF8SDilJntYy4ePSROorhLyQVJLGEq/KJKcvI+8NO8mySuT1Rz+TprzX/zEdU661k
         WQPg==
X-Gm-Message-State: AOJu0Yx5c6lzA8KrEa/Wl725Azu6PlRMI4ajfo+aQAkgzEdCh/ldkdWu
	DGO7FyCaQhUg5sF+PPFSdNrsCw/1RPzAePhkIovq7qPVebzAlwNSaGHIQZMnUg0S5Av9IBqVS56
	OLduGjng8n4RvFsXhg7VVx+CzqUosH7A3ey3j
X-Gm-Gg: ASbGncuZaDmJd8PEExYZchOGtk7py5mF/Mj4L1pCPf/jVeWU8pC75gnlxbRXoslri9S
	N/gsQbe8ppcPoQHY/NINI7lGb787zVP9JccrLAJU+lRZ2TPuLEcRu4v7ODQ64aHEEagDUD+mgwM
	iXjHJwwpQxsUwq00X+3EYgkdiC1XYTqeE=
X-Google-Smtp-Source: AGHT+IHqGDGz0wfrcp45JtErtpRAYfNh1EE57PPR06fLJQNwhTHl/SAaKNWTZ8LVn4rijthtDnq+ZrEwVKQjctxaREg=
X-Received: by 2002:a50:aa93:0:b0:5dc:d08e:e128 with SMTP id
 4fb4d7f45d1cf-5dea05e7838mr88792a12.5.1739288049612; Tue, 11 Feb 2025
 07:34:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de>
In-Reply-To: <20250211090511.xeFJVnH_@linutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Feb 2025 07:33:57 -0800
X-Gm-Features: AWEUYZlq96aEBCvQeCZ-nHsg7o-TOaHeFPxTcHp9j8eLA7B3lgOzEs9a9524BPo
Message-ID: <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernelci@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	stable-rt@vger.kernel.org, Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:05=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> Hi,
>
> I remember Daniel Wagner has been asking to include PREEMPT_RT within
> kernelci. I don't really know what the status here is. Thank you for the
> work.
>
> Since PREEMPT_RT is now available upstream, would it work to compile and
> enable some of its tests for the supported architectures on Linus' tree
> and maybe the -next tree? I don't think that happens at the moment, I
> saw only a few stable-rt trees.
>
> If so, should I just open an issue at
>         https://github.com/kernelci/kernelci-core/issues/new
>
> Is there be anything in particular you need help with?
>

Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
for asking is that I enabled it for x86_64 together with lock
debugging and got an almost immediate "sleeping function called"
backtrace.

Thanks,
Guenter
