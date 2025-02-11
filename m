Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF3253B6A
	for <kernelci@lists.linux.dev>; Tue, 11 Feb 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288996; cv=none; b=DcyA3YJB/uXs6GtXV8ogYO5/oKo0zR/zqz8RpLxD/UymZmrucQauWw7J8McjMB/PzgP13mg2+wm0+/p68SMHTPUCcehTulqafx+RjDHS/xKuFYNw+9A/8tJpNUfH15DRPsnRAqTcQ1STPH+eIs0bvaC+ETk5iPLOHMqJp6+gj5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288996; c=relaxed/simple;
	bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2Cp7zrSRtWu6wy4ajMlBVvgVtyysyumyTMVLN115ObVYfpz7essWwdVU/VVm+1yE+UweoVTkcH05L7P8ATBqC0i1fE55SqUFKYxFTlNY+cFvjgMrxc1NfvUHTOWgqYLnNZohsMWD1snaIR0hlS3zaGH3SWeh6N/TKX6dN+MHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RE7BAAlA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RE7BAAlA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so10882a12.0
        for <kernelci@lists.linux.dev>; Tue, 11 Feb 2025 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739288991; x=1739893791; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
        b=RE7BAAlAQmC9fJAflSDAv2QzLgxxAZZXGBLCQPhXdRBxRTQx6WwC0qj0/DY3bm26Bn
         Pk58pX33OMYmSe+Lg4ZODcKf88ZhkvJr6g+GebePzZfWyUeFBxo5ypZBE+QvPn8reJtw
         fD9vhJmU2jWd6VemjC9gcd1y/oZSBO09jypp49MPtrspH23CAyJS5p+YdE2sLy+qs+1S
         R+oVYL8hAtYPKAdsmVnZqZeWrKFIxAF2UKtaZOSs2MNmTUqzB7f9gkyR06yAlOX3X/yN
         0q8WYM4M3AWmRKzHNgxESFq6HMf3JS+cOwQFTtuvYtZLp4nRlIYumP5WXYucoqJBabqD
         aA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288991; x=1739893791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kgt4DsYnmqFCPg4peB6p4/cEoV7Wc11pP7aFn7Ru+s=;
        b=oMhDKvKlK1I76oQuBIjUtaKt7AINNCJ50VVI4xk6EpfpIyj63JZ9s3Z9hbbDeyBZjn
         Um0/cRNVWwdD1aUVaIW89LYfVlBMyvJi8RmQau7ZeJT5GFYXBD1KveNxsm7vHx9u2uSC
         S3BI69vFTaSPnSwqaKH8ZwNCeIaKzzB2n8Tm2i2kK04zLJ8L7uxVsKnCTpRMNVi5UzbT
         tSv7J+RaMwV51iMgpzk87HW9m+nal6wYVlBB0XR+Q4uzVmCMUHGLlq22y6l/2MpFaP3y
         HrAmit84S7Ir6JYyxxgTnk0WOIpFeWqnCq8O2dsXOjm8it/igcsoSr4HRXQGxliRoA6+
         QvMQ==
X-Gm-Message-State: AOJu0Yy0Ktkrxl1HI8Saij3whSd+WoCF/rL6Fd5mXB88EPwxH5OyDcT3
	Z85qOR50gomw97S8IBjDIh8CmvGJ+489przxIzr79fWOOLxRFtQPhGXz0OuVupNzDLGlFaJs7VB
	6c+aFWgdyZkcn9FEqCp8l14gL7B3bGZb1eJbF
X-Gm-Gg: ASbGncvFYElOvxhMaGUZMiRH0J7NJn1fLkitkhmRE8Bd+QGogPh3y+pFe/u8JEOEEz3
	isVkrMub1HiLJqWxjSV3D+hneQb06Tluw7KVSAUmp+6ltCTpl0t7VfjvZSv+/6l6PeSjnSTD/Vn
	Wm0QDCJHtXBoQI+xcgsNQyCKYvjdT52TY=
X-Google-Smtp-Source: AGHT+IE4Fxxf+5z69pFOeL1vlS+GzV7UVLD5EIil0y2c6civPDnAyqFQUMiM+rBmwqzz2VihxIer5GQ59MHN5QmVrIQ=
X-Received: by 2002:a50:9314:0:b0:5db:e72d:b084 with SMTP id
 4fb4d7f45d1cf-5de9cce8feemr101816a12.0.1739288991143; Tue, 11 Feb 2025
 07:49:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211090511.xeFJVnH_@linutronix.de> <CABXOdTeLUi8mKkV38SegM_n8=Uyykd-X+n7RysjpgAZfxxb5BQ@mail.gmail.com>
 <20250211153759.5sSPp1PI@linutronix.de>
In-Reply-To: <20250211153759.5sSPp1PI@linutronix.de>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Feb 2025 07:49:40 -0800
X-Gm-Features: AWEUYZlEqu__1t_B87cyFxYGHoCRQ18AdYIcVNJRtnSUfqO1snO9huHuOzykOU4
Message-ID: <CABXOdTdgKPZEOWRE11V7XRpRwgAL5bav_X+ibGbYyJwj1EnLsQ@mail.gmail.com>
Subject: Re: PREEMPT_RT testing on kernelci
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernelci@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	stable-rt@vger.kernel.org, Daniel Wagner <wagi@monom.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:38=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2025-02-11 07:33:57 [-0800], Guenter Roeck wrote:
> > Unrelated to KernelCI - how stable is PREEMPT_RT in practice ? Reason
> > for asking is that I enabled it for x86_64 together with lock
> > debugging and got an almost immediate "sleeping function called"
> > backtrace.
>
> If I would have seen it I would have acted. My guess is that this is
> something not a lot of people observed.
>

I suspect that not many run the code with lock debugging enabled. I'll
send you the backtrace separately.

Guenter

> > Thanks,
> > Guenter
>
> Sebastian
