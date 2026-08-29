Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5E31D39A
	for <kernelci@lists.linux.dev>; Sat, 29 Aug 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001321; cv=pass; b=OdGF48pUHQ3cCk8gnDvSbDzh32M0AdkFpzg48pCaL/InoHR2ppZI/Tw2h6UMoHCzi+rJFg4iEkmdC01HAZQrpbwZfsAByKNVal9t/Ste1hb7Bc8hQBREpp/HT7cbulNHEJs77yRuk9yRXUu211OPjKryMIxqTuNRl0sK7AfRzoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001321; c=relaxed/simple;
	bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMX2SPxYanrjGXDsonUOzuakh1j4rCYPMr6FyrMkpDUuJMq2BZ4HscLAJohqsWd4JttKHXbTYcxVQMe9gxcIoY12vhyIqzrsA4bqg6rHdtPQZwWCVDWwDoBJBVlCAmGVDu9eUsUNNYHwKmwhOVbWl94bJdc68B4oXUzrnkJmZnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTT6O8e1; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTT6O8e1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d8f2ed7bdcso466325ad.2
        for <kernelci@lists.linux.dev>; Sat, 29 Aug 2026 04:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001319; cv=none;
        d=google.com; s=arc-20260327;
        b=GZHvaxVugq9aZ0eEOOg2frdiS4F7WEOzMt1avB8WsGg8hpdzRjnaIs2+CMrpoW2p2N
         6R5ODPktTJr8z8r3PSm56f/8OslhGEIJAgM3BF5ht7BDWQ6LRKve8uK0MWzKmtTYdu85
         jeEFyihwJLEe6Ojn289nBALrfxb9/cX8LlOJ8WI1l6FmLS0Cn/GpZBbkz77/bkJv9apU
         vGNwmskjquxhwL8nNsfLbBK/zcATLZ+tmsDNZ5c1gc2qC1Tni7LW2w4R+3EKLvNr5oqN
         8pQUvpri/b5GPOWrX5mcx8la9vJ7kiHpGWsIDY6trVQ8pXMcWqPzOWdN2kB5Hz5HA71b
         ekuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        fh=f7zfVYeOGSkTmYV62Estwt9E8zlD+SNJg4QUIQKULkY=;
        b=Tup7ALeqmZIpJwIcwk0/IF0nGQivviFlbk62g4JRJPNrCnUu/zwmUl9asatZXYlvfC
         gDiIUzWaXcdqjJ3NLm9n6ixEkltxsKP+VSkqoPUcTtgLY5DWnZYlfQkVqWq3Hei0b84A
         W6RqrsH5peZPPi5XefK+272aVA6Ii3OmqUI/LHotWP0T8Nr+Y+CkrAJ2pH7hvM1jPbaf
         c4qmWSRgy6lSMBOHBN6rdonpo9i6kcGS+oCUQX4Ok3RAy+ln5qn7mruW+S1f6/xCu/kH
         cWVpUe8nYisuZ41+oidNBlcG1TSU40JJXnMGj8sYDorxgsTSCcDp33HmjruEfEVwGAW5
         7ybA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001319; x=1788606119; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=YTT6O8e1DbZ7bFKDJB7XILp+GF30CnevaetN3L/Z3KQPHrXj9H6J5s/s1Nm3S7sW0I
         HKejJUdj78y6cUL3juJdJrGs4+vanvckwOTVWAQMb7E5NCfOMoKvqEXj35T9ndA6iHm7
         HPClmMCthohTbZ3OgJ5dfvtZyIHDUDWK1f1ohPqeyhgazvC6yjyVLx34n0Lk9C+QIPsC
         DYkPdWGJynb5mcP5BsNPufvP+x8aBoxeZ1wkrc2AQT5js7OJf3dEqL5AZD+6G2piGaIj
         0NSQ2huQQ7aTaU4llMhwYraB7Ce/1An1lSIMXZi5/FxOkY4EaBRNFmSjut6SqBwGDcMc
         nVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001319; x=1788606119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGN0umUN7ZwJT7rzn/2t7QWwI4c5VBIve6Ja7MU/aek=;
        b=NzIMMCt7vfWX/JCbrbR6v1Awil0s86DyN0rlAQnbjipu7Yx5VCNQYoDVO8NEmxvkSn
         m/GVU98zzU1MgJuwrF9IvYWrpRjtFFBOvA1+qBAilVWMBCsMSwW/CajYe6skn2AWPJJF
         NjN9wpD5ncN/xFsodhy1UyaAK/WIaTS5+Mi56TS5V1KyWBWAd3Fet1z8OGUOxDlo/qJm
         8Mr/8SZ/6UcVF9LGN1C0nCvoy0kqmyaah+tgXpSHrg/vefSEgDYj71FCLQfKLD4t1khm
         AP8iyA7uMtEjzd6dvHEFeGWKYb4smyyN5baiFsdkfQU8dIaFqKkSxRhI4P1++fsfvzHf
         RWcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKlSaGyDwKU/gOP8OJmtLQWS/oHpjXo3QchqEV10WHRKBTdJ0ZCAyLL0TmGps7j3hp1t+vmyTuuQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mVQ+Q2yvrEyJjv4/BhZ0IZkgxdV2kjWa3L1dtaZfpfsjCZ8VRi
	P1CmCgfAXzVbO+eM/2U/cp57VvZIxK+nDVKlEUPJeaSoB8vaSLMtaHm9v8+6OLwAqipXX4YTDcx
	tJn2MlCTBb2qvyk/mt/tOGiorHOZ/YFY=
X-Gm-Gg: AYBFou2au0BA5mQBuskRCTS5+oJb+cnnz3KkrA5hR+FyS8FY4D3r61/OXjIqqc2VFFV
	iUBAUSri3t1uDqPnOviafGd5nRduYu1KGyuNXSxwznMOPL9P3ToKT+rA8McoaknEDVUMdSxu//Z
	q1Tf+x5IjoEuueQwLcJgXZWok4yYdK7jg2AnX3ivMiC4+kIuG1CD/yTzoTnhJQWOmb745fTt+uA
	P40EsPdi/PYJLyzYa41eavUeh6Fx2/Ix+LZiNevlBzyz4Ck3azsQAdtrwtjQEzUb3dokQh8aACM
	BGhmfUnZs0MdtWsGUvLslnYuZW3juZ67/3gvZ5jLyXdZBHmOpBuF2u+ZNb6lE06hNf7eXrTJCss
	Y7SGerARElp/fE4TVxD30mrbIEK0htF5pIkkNU2SJkpgplQWslTcftbII0tBj
X-Received: by 2002:a17:90b:5546:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-398bacc54eemr1390032a91.4.1788001318956; Sat, 29 Aug 2026
 04:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
In-Reply-To: <faa022bc-bda5-47ee-9984-4e8ff067c6e1@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 13:01:45 +0200
X-Gm-Features: AcwNN1XslLuUNYYS77elbKGG8v398s8YpVlpDc2SDM6GYH7rCRkfYicjHiuXC00
Message-ID: <CANiq72mmxxrm3-a-sN7G=t6CEqHkG3MVvkfRMqe7NyNR+C7C7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:56=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> In
> principle newer, version should be backwards compatible so if we just
> bumped the minimum to v3.13 older scripts that were written for v3.9
> should still work - but it'd be nice to have a way to test that.

If they don't work today with e.g. v3.13, then that is something we
would need to fix regardless of the minimum.

Since some distributions offer the latest versions all the time, then
it is likely things generally work (or they are niche enough that
nobody notices).

But, yeah, it would be very nice to have tests on most scripts and
thus be able to run those with every version etc.

Cheers,
Miguel
