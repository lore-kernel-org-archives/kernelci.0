Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690D43150
	for <kernelci@lists.linux.dev>; Tue, 17 Sep 2024 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571922; cv=none; b=WQOjy9ADnBiOS9bTeVlatbdCQ99gvHicTGh3XKV9439RyhSYhhz66EncNq3C1zym5X65Y9R25CMgBzY0j6wlGtdrgv5pnnxle0P1DdJgfX07otXxxPnbsfmG9dPDh6+Wl/h2X+LLY6ZgYktbAvwk41ytjmEsRF9zLVLqy4fytsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571922; c=relaxed/simple;
	bh=NH0rlaEIx8Sp+fZT2oZjXeaHOlZfpx7EsxzdxOS/N/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJQdSq0qCuZ0pDWW5d2SpwlQM8LYuRYZIGjuivNHO5fPkcPmsoZ4r84XDvLPy62kmSK92nOd1zOk7HXFCpi/qq6YXAKwGSkrkCjv+iAHoC5C+u82MVcZono1x8RylWbSP31R5nKO/d1FUVWC5UPLKaIlfeAC/YoGKWdWbW9koTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VxBBdvxc; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxBBdvxc"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277cfd3f07aso2794753fac.3
        for <kernelci@lists.linux.dev>; Tue, 17 Sep 2024 04:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726571920; x=1727176720; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AvfBV1vY5mi4vx07NIp0EyL/3aaj8hcwAl9v3b5AxX4=;
        b=VxBBdvxcCJxVTUbDSQ5ZIZbMmeGso3lANtZGlNcjuUsj32jq4tbvaOojTTyIQClxZ2
         EQl+LLQloa2v861+L8LjlCKlT6FpjfYv1Bl0jLFkIlriwI0SC9buNuDoPtbHJYFP1X3W
         y/DJL8Hnt+RRs3kZkuoMap/25znlmkcGVzCZ7352OIVlD0OECGwlQbutq4A+aaqu2Vo6
         xDaacchpHqbMXPK0xRbcqYV5IcG4xhY0TTSQE8LtTx9+TMtkckYxHRn13q0g1TdkH5t7
         EO0O30gevIqn5MwEV8R/+qD8I63dvvkMNFtMf2DuwT6TsujPzHZRxn0O9sySbrQeHT6k
         zpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571920; x=1727176720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvfBV1vY5mi4vx07NIp0EyL/3aaj8hcwAl9v3b5AxX4=;
        b=FM0vuFNEjkfSUMHzLG/rsf+ufzNaXtAQzhDnRgfcS1+cTLm/+PyxHCjaX8emKdRUP7
         SAhTnNjnfMWAyoXjKro5AbAw5D9jMSMWQ0p4pFsLFxCT5wXf16ai6hCMHpWmOjEq8VZS
         cTEbw+qG4/2+3jWOQk6ybc9asDUFo8ZjkqD60roEN8R5ocP9x9PYS73Aqo2dheCs4rdZ
         bgZCKhcrxbh5orUxe1EzGNtnK0kUOnRWkie+PdVB7fcE1Ttktb8SeDpWfQol2Sy4yh1h
         24s1Fl2NYpoXrVuh9ONK7UNK5tN01lkmNCaKfQmJTkM2OeePYUPtGLSzwLZYZMYLQhOx
         6bjg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/htldpH+LKYD2GI/iUPVk4HILueQG/p3sGaz647Q/Tdf1TfBBosdzppgNEQymrW10i8K5SUpZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2I/obTY5vtBmHgOsjz/J8TPAjBMimiLSLcLIslvbCXpLOGgnK
	QFq0tlC2sSncS7Y96gJgpkhUPm2aWzemJhWuCZVlcHK2CndMM45C4sL62QqJYui2ZoJ8kN3rNOo
	SVqA/FTo0z2Sd0JauxpHajV2cVN7ZfcjYdS79
X-Google-Smtp-Source: AGHT+IGM1+7w+Z5ca21U/aKUkYCfSJRbWzydr6KQkTUxSwXcUA/SRcNqslgNQrRotZjCa/k2RX5BK0ycoQnomzsjCWY=
X-Received: by 2002:a05:6870:d682:b0:27c:35c8:bf63 with SMTP id
 586e51a60fabf-27c3f673852mr9636543fac.41.1726571919567; Tue, 17 Sep 2024
 04:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZ9610pCm42m-D-gAKTrGQuh5TmEwaPyA6QHiB_80pK4Q@mail.gmail.com>
 <6edcd2a2-4e09-4f41-a4f5-5595fefecf75@collabora.com>
In-Reply-To: <6edcd2a2-4e09-4f41-a4f5-5595fefecf75@collabora.com>
From: Benjamin Copeland <benjamin.copeland@linaro.org>
Date: Tue, 17 Sep 2024 12:18:22 +0100
Message-ID: <CAL0q8a4cm-W9TFdmnxPd6exXeb-x71vPdKYSQJDM2LsiAp69Xg@mail.gmail.com>
Subject: Re: Test catalog
To: Laura Nao <laura.nao@collabora.com>
Cc: Donald Zickus <dzickus@redhat.com>, Nikolai Kondrashov <nkondras@redhat.com>, kernelci@lists.linux.dev, 
	Gustavo Padovan <gustavo.padovan@collabora.com>
Content-Type: text/plain; charset="UTF-8"

HI all,

This sounds like a great subject area that I know some folks including
me from Linaro would like to be in.

There are a few of us folks here this week, so we'd be interested to
sit in this chat and talk about some of the challenges and areas of
engagement from our side.

Regards

Ben

On Tue, 17 Sept 2024 at 11:14, Laura Nao <laura.nao@collabora.com> wrote:
>
> Hi Don,
>
> Sure, count me in! Thursday morning works for me. Looking forward to the
> discussion. I agree it's important to centralize info on available test
> suites and how to pick the right subset for each platform, focusing on
> maintainers' needs.
>
> Best,
>
> Laura
>
> On 9/16/24 17:47, Donald Zickus wrote:
> > Hi Laura,
> >
> > I was talking with Gustavo and Nikolai about the test catalog idea that
> > has been floating around.  I think having a way for maintainers to
> > accurately describe their test and hardware needs to define what does
> > 'testing done' look like from a maintainers perspective, allows the
> > community to come together and work on filling the gaps.  I don't
> > believe a single CI system nor lab has enough resources to provide
> > everything a maintainer wants.  But as a community we can.
> >
> > I would like to sit down with folks from Collabora, Red Hat and others
> > at LPC to discuss this more.  I see this as a 2025 roadmap.  Gustavo
> > thinks that Thursday morning somewhere might be an open time where folks
> > don't have talks.  I was hoping to chat for an hour.  This could help us
> > drive conversations with community members on how they could contribute
> > (mostly focused on hardware vendors).
> >
> > All are welcome to chat.  Let me know if there is interest and I can
> > find a room and timeslot.
> >
> > Cheers,
> > Don
>
>
