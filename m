Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B6191F7C
	for <kernelci@lists.linux.dev>; Tue, 29 Oct 2024 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216619; cv=none; b=OB2+FKPc4k/0K/DEna9mdALWSzYJIQPPcvxaqH+n2PFygBlbzUnqcHjTRB6MFRGh41Nhd4y8ucXGr4tVCmuAXV4VFFm+gSdtOscLXisinYl1ng451TQ1MbdqoCrOaBQPxgxyAxDpRQKDvepwiLryBZ2yDAyaOH++00Sr/M6HO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216619; c=relaxed/simple;
	bh=IsFiPocCx1av6OZes0vSAEa6BWLaThLtIBja/ha7aFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iycLwUeJZdIoSBqPo5HBfqxtWMm7nFoNuS2mwDV3c2jX+fDVTnJQ+7IRFwPOIiFsBULHP2o4dsVIU4AeKDUSIkw9MFDRLcN6R2myqCVjnNFhX7JpA98/RDt7UNUGCCthZTef3FqZtVWK5WAIa9jHPK8Abk4y12KXaoKC+xy4QlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TXnandeR; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TXnandeR"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso4118415b3a.3
        for <kernelci@lists.linux.dev>; Tue, 29 Oct 2024 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730216617; x=1730821417; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsFiPocCx1av6OZes0vSAEa6BWLaThLtIBja/ha7aFY=;
        b=TXnandeRCzqxkKMqMnfTTQOUFRFc2zOLcrKU1Gtzr+O5qcEz5fhmcLfu5PmJCTU4qB
         VWAyMASsrs6tyiFaEMrTyMCMSIP0Se6BbQdvytgD2cZz8/qb74Zvs+IBB7wTf5rPQNnT
         lNvAYWr98SqFNlCjKUas/9qiXhAuFEKuR/YYxQPvzB7lN09X8EWJf5sNl2z8StAbO2iL
         2ITgaMDY4bY77hOeloeV0RCZxzNCpEXbbgqnMBsPeQgYrslipuV6HJl7F47iaPjqH7Ni
         CiQ/z4e/893emtcX5uKj2l3ptfHOXUPsjYN3t02M1+w6/1cz4q9K2bBH+P6auXxgEFwq
         JSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216617; x=1730821417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsFiPocCx1av6OZes0vSAEa6BWLaThLtIBja/ha7aFY=;
        b=Yke3NUGOaSaMb68RqqCKoB1bI8XmZiWN9FM6TjIRvf4/14DXcOwWTqkkZlqr59+oke
         2ke3VZNqrVU5gLFFeQ/3fDSA4HzOeZiTgDKOw06nCVNXE+3M5rBIjc0JAY+Yi/wDgDin
         REIeweNEpdhiol63QveyvgZw5ZKD111cu8X+tHx3vK7ThITrtt5di8qjWJUJsQvO+e/w
         USrOGhIrnZXD87SXtJrVR/7OPMc/et1hJyH288xiQkegkQrkz2Ud5T8WSl9NUgR+ni0e
         eWKbSuO+NxvyjeOZYwN0oeDMGXj41KmOMbwhKXEd2WyCAAFUaQM4r5KI9E7K+b1yvxZU
         s41g==
X-Gm-Message-State: AOJu0YxJe+EmKhiVfL0nyFbqvDzjSDvZ/SUR3BSPhBsDMHSUIQ0rfBze
	NGjicJAzN/TRW9F3UEiXpSTdH9XVVutj3exzQh1zDRQkn2FGUr5SoWWFlxLd78n9n9YwMcHIHVn
	x+rYAI1xhvBlo/9dN9YKNDQM7CaRMpiabiWz2
X-Google-Smtp-Source: AGHT+IEmX2Jc7p+KRhqSAAZ+yx+POS7Ks609L79Omok34sY6fbUb0bGJkKoUSiVYMitnW0nCv2yqewpH7xXe4c7fVM0=
X-Received: by 2002:a05:6a20:9f97:b0:1d8:b81c:4e1a with SMTP id
 adf61e73a8af0-1d9a85053bbmr16275671637.44.1730216616354; Tue, 29 Oct 2024
 08:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEyCAMtXogOHOUY=zVipGOrYSGcbe59OpGxr-1_RnK9+UA@mail.gmail.com>
 <44-67206080-b-17df13@5111824>
In-Reply-To: <44-67206080-b-17df13@5111824>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 29 Oct 2024 08:43:19 -0700
Message-ID: <CAHRSSEwBQ0hGO8rw5BptC-9s2jOYxV_=Knq3HuHiLFNEqdzFUg@mail.gmail.com>
Subject: Re: fix for kernelci errors?
To: Denys Fedoryshchenko <nuclearcat@nuclearcat.com>
Cc: kernelci@lists.linux.dev, Viktor Martensson <vmartensson@google.com>, 
	Betty Zhou <bettyzhou@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 9:10=E2=80=AFPM Denys Fedoryshchenko
<nuclearcat@nuclearcat.com> wrote:
>
> On Tuesday, October 29, 2024 00:23 EET, Todd Kjos <tkjos@google.com> wrot=
e:
>
> > I'm looking through the android kernel build failures using the new UI
> > (still a little painful since it is missing some features compared to
> > the old UI, but getting better). I have questions on 3 of our error
> > cases:
> >
> > 1. android16-6.12 (gcc tools building *+allmodconfig):
> > /bin/sh: 1: gawk: not found
> > make[2]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Erro=
r 127
> > make[2]: *** Deleting file 'modules.builtin.ranges'
> > make[1]: *** [/tmp/kci/linux/Makefile:1227: vmlinux] Error 2
> > make: *** [Makefile:242: __sub-make] Error 2
> >
> > Is gawk missing on your build machines? How do we fix this?
> PR with fix is already in the testing, likely will be merged today and pu=
shed into production
> https://github.com/kernelci/kernelci-core/pull/2723
>
> >
> > 2. android15-6.6 (clang tools building *+allmodconfig):
> > drivers/i3c/master/svc-i3c-master.c:1100:29: error: variable 'reg' is
> > uninitialized when used here [-Werror,-Wuninitialized]
> >
> > It looks like the stable kernels only have 1 clang build configured
> > (x86_64_defconfig). Would it be possible to add an allmodconfig build
> > using clang so we can compare our allmodconfig failures with the
> > stable kernel?
> Do you mean stable-rc kernels?

Yes, like "linux-6.6-y".
https://dashboard.kernelci.org/tree?origin=3Dmaestro&treeSearch=3Dstable-rc=
&intervalInDays=3D14

>
> >
> > 3. android-mainline
> >
> > Is there a reason that there are no allmodconfig builds of
> > mainline.master? It would help us to know if we introduced an issue if
> > we could see the equivalent upstream build. It seems like it would
> > also benefit upstream to see those issues early.
> >
> allmodconfig is quite heavy build, and as legacy is still running, we are=
 unable to use build capacity allocated for it, and Maestro-own build capac=
ity is limited. If it is just mainline master - we can try to run it.

IMHO, allmodconfig is the best test to find build issues. Understood
that it is heavy. Yes, mainline master would be fine - and I think it
would be helpful for upstream rc validation too.
