Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE82E3B11
	for <kernelci@lists.linux.dev>; Tue,  2 Sep 2025 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795202; cv=none; b=ox5L0baKc49WEJf2Et22Rn9+lq1OTZPSGSJU1dERepuh3phxuzI6Etj66zhOWlpPK2NhYd2O47kUj8azp8vC8Lv1ozCqvlYMR832al+yBz94VDO8vZ0Wm/YXs/l1WjTBLYNOU+amOpcdmC7RUIuZKMtgxRwaNO3GuTDmiXRR5EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795202; c=relaxed/simple;
	bh=+MMSzlC+yizvDqCRpnHE4SYBgfXa1mBy9vO3NsZ3bBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANpivIK23plqCDUT5z+sVvk3f6RuaqxGEYKIFoecFy6S1k2VkC8kZ5QyUKKOmDZ7zc/50FWWLwxbMyNDT5gqpwJ6nuW4WycMydCzRXpPNOjLNt3ktOO1nBUwbrnlMocwhZ9wIpGZZZQMC1bG4NUGmNPY8kiHM1kFGb9HcSXXoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pdmFTwxR; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pdmFTwxR"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70de042246eso39237016d6.1
        for <kernelci@lists.linux.dev>; Mon, 01 Sep 2025 23:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756795199; x=1757399999; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MMSzlC+yizvDqCRpnHE4SYBgfXa1mBy9vO3NsZ3bBc=;
        b=pdmFTwxRF4WLby8YaoyFDGbfKwffQDHY6f/JD13rranybi2EsxxR+6mZBo6sx6yXsT
         dJodbWS00yBpTtaS+TGelufamV9rO9vxQx8y66XoqaQlWkyNtE8lJpyBmy4cX9ErhibQ
         lrLEhaIRVbh2ZS9hswfxysoHebhep2v8dtuAVxcIAx5LO2CYVBipsQtb9L9aYvSPx5DT
         /sd+KLYkIF/Wt0Jy9cdTmE9UE4t/4mOB76LciJ1zVNn/MK7B2OLEvoNLkWsjO7WNXqE6
         wDhZ7+C4Fcw3hbUk13DYODqmuGQ5n4n0iu612hlh3ADIhH+nK7Vlfw6uLoMTfyw27888
         hcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756795199; x=1757399999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MMSzlC+yizvDqCRpnHE4SYBgfXa1mBy9vO3NsZ3bBc=;
        b=XGT7VSvMqmdBx2FJpC1PVN7LirYtp20BAwMEugYEKi5TDSPE2fqOL2e/XYQsTb8ftW
         Q0xZPbn+DT+qXQC910rTyvji9Cu8mpmNmQORzFylo2mIKgLU8bq0obb5ij+8+/jCnhov
         CSlV7hlEDTB/8HFRcE/ee+7f+7n5y7A78COhrmilnc7rQF2wMf1E0A4IyRtU5mQcQnX2
         0IJRbCwsQXAQ9YYd8nNAVEUXtkaVUHEW9rAqPD1mSZPqoYR3STokPZwyOv78BPRRRW98
         pKQdKBgUtykZ2BmUDZVgJrJ4Lx4qand3QHkUFNdTjcCpvSBBlPLKB1g4D5tXqNSe17a8
         v9Gw==
X-Gm-Message-State: AOJu0Ywods+PEewru5EYQ34LcCv56LRc4SlcVlmXsrFjh5tKY2elFJxF
	WBHIJOh5+9xy6ytREImtyJbSI1a9f9JXnEIKWxqeavc44wGS/IKiKTwLRvRcLhhfzadGc1Tfd5L
	kfqGKPQWysoqRYZtLBk20WwX5ZQV47Re8+JVRgJ2U
X-Gm-Gg: ASbGncts8Ybnhbt59IW25xOYruOvbYejRdIlOhKvQ2/PhYPpdcLV8fQnSxZzAVHscxn
	br1Y5BnIIs/6gbcDCGCKHhHdRGNSR0PDor5GVkeCvgUv+4eqDcab9LOgiOhNK9LmRaZnQBqZcM/
	yUtMhTqLSuK7a3HfjmTvTJ9KVrYMOpf4T/ifXI/+UXGT/1U8oKKhtSkYEgsG6xdazE2iSsmYMLL
	HHO2Q8wpIpmk5M=
X-Google-Smtp-Source: AGHT+IHegETrPXLJAar1S7B4DwdUsII19fSCD2Wk8iEyuWPFzMyFXOWlgRq2cs195SfWYLT3Oxol28XF9+hnXav/VAc=
X-Received: by 2002:a05:6214:21c7:b0:71a:a3be:a8fd with SMTP id
 6a1803df08f44-71aa3beac09mr49456576d6.46.1756795199318; Mon, 01 Sep 2025
 23:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 2 Sep 2025 07:39:47 +0100
X-Gm-Features: Ac12FXxHVAFCNEwspoboIZJ608YSdbGpMsWhIIZrveUQNdTT1M5wLYJXzT2o4UY
Message-ID: <CAL0q8a5zHU5qMDA5qHz2tFyZhSXOvj6TB9ZDkBUx01E-td1pHA@mail.gmail.com>
Subject: Re: KernelCI Labs Working Group
To: Gustavo Padovan <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>, 
	"chris.paterson2" <chris.paterson2@renesas.com>, cfi <cfi@pengutronix.de>, 
	broonie <broonie@kernel.org>, sjoerd <sjoerd@collabora.com>, 
	khilman <khilman@baylibre.com>, "f.pflug" <f.pflug@pengutronix.de>, 
	=?UTF-8?Q?Pawe=C5=82_Wieczorek?= <pawiecz@collabora.com>, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Gus,

On Mon, 1 Sept 2025 at 23:55, Gustavo Padovan <gus@collabora.com> wrote:
>
> Following discussions at the KernelCI Workshop 2025 in Amsterdam, we're e=
stablishing
> a Labs Working Group to address the challenges of executing testing throu=
gh hardware
> labs in KernelCI.
>
> ## Working Group Scope
>
> The Labs WG will focus on improving how KernelCI integrates with and mana=
ges
> hardware testing laboratories. Currently, we support only LAVA, but there=
's growing
> interest in expanding backend support and addressing various infrastructu=
re challenges.
>
>
> ## Key Areas of Focus
>
> - Labgrid Integration: Design and implement labgrid backend support along=
side existing
> LAVA integration
> - CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.) =
through improved
> events API and shared rootfs images.
> - Alternative Backends: Explore integration with other lab management sys=
tems like Tuxtest
> for virtualized testing
> - Lab Health Dashboard: Develop tools to monitor lab status and infrastru=
cture issues
> - Failure Classification: Improve detection and reporting of infrastructu=
re failures vs. actual
> test failures
> - Lab Admin Guidelines: Create standards for lab administrators on device=
 type differentiation
> and configuration facilitating accessing the same hardware across multipl=
e labs.
> - Job Prioritization: Implement smarter job scheduling
> - Dependency Management: Avoid running dependent tests when prerequisites=
 fail (e.g.,
> skip NFS-dependent tests if NFS boot fails)
>
> The Labs WG will work closely with the Infrastructure Working Group and T=
echnical
> Steering Committee to ensure our efforts align with KernelCI's overall ar=
chitecture and goals.
>
> Based on the interest during the workshop, we=E2=80=99d need to cover the=
 West Coast timezone
> as well. So an initial proposal for these meetings is starting next week =
on Thursday,
> September 11 at 7:30am PDT/4:30pm CEST.


Great, thanks for putting this together. I cannot make 11th as I will
be on vacation for 2 weeks; however, I will be there on the 25th (if
it's running that week).

Regards,

Ben

>
>
> We invite all interested community members, especially those running or m=
anaging
> hardware labs, to participate in this working group. Please reply to this=
 thread if
> you're interested in contributing or have specific use cases and requirem=
ents to discuss.
>
> Best,
>
> - Gus
>
> --
> Gustavo Padovan
>
> Collabora Ltd.
>
>
