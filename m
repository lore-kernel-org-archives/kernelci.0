Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356D18DF63
	for <kernelci@lists.linux.dev>; Thu, 19 Sep 2024 06:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726728128; cv=none; b=udeAUXyXeO8e982K9VitONEPKvLxspbhqY5ds6ZZQJqN2nWhsqlpFwCpbSMJfxKEjO6H378rqbt394hBM3yPlXwPwLbGovShlvRO4x89/0T7LbU4GH+PKsVN4BetNaPfbER6VMDTyzN95Jr14kIEIOEHxlAeXfJyxZ6DJguTZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726728128; c=relaxed/simple;
	bh=RhnPk4OoDWxEQ3VKgZ4uEMkKwLH0LGFBbz1/oRy6rXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbB0uGcB3sQT+nEBksdPfNztFQ7VfnU7IrkyxXV6vhpOvJYKbColC1+gB55qGQy3jjtSEGcWqIaSqENUh2aWjUKDLn02I2nexBqTk45C3/mgI4rF4uamkYhjT61RDhmU4iVesmbeTK4MpStoAXk+rljclprCRYDhBSwdkZ/48dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NFOiOB5y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NFOiOB5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726728125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgyI4pFsITbBukwZEAaIY7/J+OmSaUKL6QfLrOA1igE=;
	b=NFOiOB5yAAw+tm0BfxoY4yyZBOienmwI3jPBW6ls1bDSqXj5kMcLzj3cbrFvo4DzF9G1ny
	i/7/dbHexGa9JMsZKemnGEO4qczSDwNisAp1TmURX2k6rU/hIM+IjD5Cj6eCqZCNlvp2nN
	l6rWb3nWgqpiLar4Wu2xe9du+d8Q/88=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-oOzus0RcNu69LaslonxC7A-1; Thu, 19 Sep 2024 02:42:02 -0400
X-MC-Unique: oOzus0RcNu69LaslonxC7A-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6d7124938d1so14659407b3.0
        for <kernelci@lists.linux.dev>; Wed, 18 Sep 2024 23:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726728122; x=1727332922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgyI4pFsITbBukwZEAaIY7/J+OmSaUKL6QfLrOA1igE=;
        b=sI2jqWYc6fD/PhnA1oeluLaIJUHNFU5K1s51188xxXTZ7Zgrm4MEFBmIupnwEWltey
         S0R0k+wP5h5JqxgQOHAvmwnjf7w9bfuJwnEvn4Q3OV4HvFjvk4+Lt3X7k4HHKElBF4Ui
         0T/Z52Y9vvjf5jXK8W3SMKYJXR4ri4d/hrKCBA3i0SovZOdva2K3XpSps3miU6P3PEPd
         7+ekfBaRyz+zTI0UDTRfWeXXnWELqepHryM3ks1SWTfs989qKBLZXSBmTtGW5hBZwMIx
         tzU02YEW5Y6/XpnFOEUhv0FCK5VUPyd3z+F1XYvM1et+E5UnhoA7IJdVs3OFp1YZIc6m
         Dd3w==
X-Gm-Message-State: AOJu0YyseLh5Cu27YBG9QNcODDwdtKWZm3oJP/cGkUpCdYViY6aoyYpb
	NMysU58nJ9cEvAjU/I2Uczg1I1U6pNW0Aal0RekYjdIvpZroQUjWNljvaZ2fl2ht+5VtfZq2Sgj
	axy5xbtQ3PoqATLx42apmor6lmKxMCLgltrgLYFM++SSFzA7tfQFNymMlWacD34NjSaGuRl2SDX
	ZWuZGu16C2QuRHwJ3ahqaekNuTN+51Ea8=
X-Received: by 2002:a05:690c:660c:b0:6ad:deb1:c8e0 with SMTP id 00721157ae682-6dbb6b35bf6mr227933357b3.18.1726728121794;
        Wed, 18 Sep 2024 23:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaFzXYXeZjWPshcFc1gaOqmboQMTtft8syS5kFi6V1xosYKOW+zxPkC0zKmX/YKfNq7DbslPFVnMd4GyuXPgo=
X-Received: by 2002:a05:690c:660c:b0:6ad:deb1:c8e0 with SMTP id
 00721157ae682-6dbb6b35bf6mr227933277b3.18.1726728121449; Wed, 18 Sep 2024
 23:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZ9610pCm42m-D-gAKTrGQuh5TmEwaPyA6QHiB_80pK4Q@mail.gmail.com>
 <CAK18DXYVgOhjxQA5qTLOJwks0AFWCc2UCcCQjJurYyi08rOH2g@mail.gmail.com>
In-Reply-To: <CAK18DXYVgOhjxQA5qTLOJwks0AFWCc2UCcCQjJurYyi08rOH2g@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Thu, 19 Sep 2024 02:41:50 -0400
Message-ID: <CAK18DXZH4TQCfeBJap4jh9mC6CZF=4-60D0xdXQZ5fQ8fhhpqQ@mail.gmail.com>
Subject: Re: Test catalog
To: laura.nao@collabora.com, Nikolai Kondrashov <nkondras@redhat.com>
Cc: kernelci@lists.linux.dev, Gustavo Padovan <gustavo.padovan@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Resending as last night mimecast rejected the email to the mailing list.

Cheers,
Don


On Wed, Sep 18, 2024 at 6:19=E2=80=AFPM Donald Zickus <dzickus@redhat.com> =
wrote:
>
> Hi Folks,
>
>
>
> On Mon, Sep 16, 2024 at 11:47=E2=80=AFAM Donald Zickus <dzickus@redhat.co=
m> wrote:
>>
>> Hi Laura,
>>
>> I was talking with Gustavo and Nikolai about the test catalog idea that =
has been floating around.  I think having a way for maintainers to accurate=
ly describe their test and hardware needs to define what does 'testing done=
' look like from a maintainers perspective, allows the community to come to=
gether and work on filling the gaps.  I don't believe a single CI system no=
r lab has enough resources to provide everything a maintainer wants.  But a=
s a community we can.
>>
>> I would like to sit down with folks from Collabora, Red Hat and others a=
t LPC to discuss this more.  I see this as a 2025 roadmap.  Gustavo thinks =
that Thursday morning somewhere might be an open time where folks don't hav=
e talks.  I was hoping to chat for an hour.  This could help us drive conve=
rsations with community members on how they could contribute (mostly focuse=
d on hardware vendors).
>>
>> All are welcome to chat.  Let me know if there is interest and I can fin=
d a room and timeslot.
>
>
> Thanks for the replies and interest.  Sorry for the late reply, I wasn't =
sure if I had to reserve something.
>
> Let's meet at 10am by the BoF rooms where they served lunch.  Then we can=
 walk over and grab an empty room.  I think there were 4 available.
> I don't plan on more than an hour.
>
> Cheers,
> Don
>
>>
>> Cheers,
>> Don

