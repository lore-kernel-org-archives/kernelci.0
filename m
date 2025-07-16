Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479362AD0B
	for <kernelci@lists.linux.dev>; Wed, 16 Jul 2025 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752648562; cv=none; b=VsE/NWg7XSQy/mE+56grgbwQGFjuETwIhEvSPB+LmXkoPRFbgoaTR8AkJ/uQWAURtfzcU+24uNvzuzWHt9hgczYM97FxkNj54b48dYvJgtzcehOY6LT4/vnrc1IkjiBiO0cFQ06TRrDe3MIXu4UNv3BxoKkji0GjEdmg0prQnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752648562; c=relaxed/simple;
	bh=/Rh5zusur0JVOCSeFrAAYyou6YjOacb0/OSC47cDlgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHyZK+3LTMeLb9C9NXwo/tJS+1a8b3ywn6Xv7VFN4u/3jpSIA0n+zq4T9JhXGBmd54HQBzcDL6Eu1v5qgRJGJ1+qKj/z9ztdy84eZhxTvWErK3CxSANDZ9hRx+GZsjB285e3wVLJRo9eZufHE9AxNWNm5sorlL119lt6agnH6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkZbf6W+; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkZbf6W+"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7184015180fso370257b3.2
        for <kernelci@lists.linux.dev>; Tue, 15 Jul 2025 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648560; x=1753253360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6PZEAdEPm83IXI8nVHlyvDJ74v2uWzTBmfj41EHlyo=;
        b=WkZbf6W+OXhukYvlKVR41vDYEbtZX0QmaEke9DYCO6WpubMMOg8w4OLzVxHfot4rax
         MdjU4RvHICI2PODNDgctb1AICeS/jSbGPxrlGkpj5G9oDKAukiuBPk1ZOkXbpZzfkFSl
         hNcN2IGBm4hlKARSMyqQVpZVWQaf9+gCAslVYio8/oZVG8LK6KtSF7FCEnvR7+YflnHI
         Enc+W0nTg1X+ybgmhrhaRdoJAgXmpvQuB4s3EGdmmsjgEtDgn0DuXkCcZM/X40K/O808
         yZlHBGStwF+GzuLxnoQqE9SIkZjKxznsQuLnfqbueBO6UQSSLfPzh0DdZ5KlxWYAaMco
         xGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648560; x=1753253360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6PZEAdEPm83IXI8nVHlyvDJ74v2uWzTBmfj41EHlyo=;
        b=XnBEGO/N3mfPexxX7BD+UomEk7SRbJ97Wx5a0rRLPkPhYYjEsbJRVDla9++drZzGeG
         Hgtgsg0A0NFpcimcoDgbfCVYpevWJBRHQnpsEpIt5y1E8s5bk7ictQ+fiW3Cf3zDrq3H
         SDFPa99yHmxYzUpv42VMXP3nPCspsZ0RK10zfk2NtlkkhaDJAoLgaUjxnJ4uuVGijm6r
         s9r5y6KKDh0564hqbDfZhGYCONslZyLfHi/YcCjBHJ9GutE1dhS4dqHZIg8gBxFxyCh4
         rezvrMF+6UgpmTz3EVIS36oameuh6n/EoIGLQR1d5/MSbBDN6gwyLq2F2LnQVdkdmmae
         F9pg==
X-Gm-Message-State: AOJu0Yw2K7/Fkh4NyH8H6IypO8qZmK8MMBLEfpKJHdh0HVbjOodxo1sW
	B9QCqw21AeSHwsug9eiqatokcQLZ3aOj/8atS7bM05AsxHyy/lRm169sCpysAAjc7AVzeoPp1l9
	lFrk2iyFWvpB3nPOpA/OG5NPgh8sZuV8=
X-Gm-Gg: ASbGnctGA9qQvCsdznF0gmUbpEaMAlzdULqNjIUnBTWzcvAD1gZQjOLyOR1pb461zeP
	PS17jaE1oQlzWK03wDxkvnjMasTO2VDCn1Mgy2KJC42SDWt6V39Yn24gRskzBLRPciWYPyYyQa1
	NKWwqgvDbhrAE/E1DUzP3laOGWknY4+p9hznT5a1x3RnwompfKse+zpqBUd2q8uNk1eZ8akZPpy
	nCeX2Zy
X-Google-Smtp-Source: AGHT+IHv2hvhfiY1gLh4tb1wZGImRyp0/sjOTjvolQIUDocH7xySVFhwZviIY8hunJ20vi0XE0VZuqstZq0Qj7hNfcY=
X-Received: by 2002:a05:690c:5503:10b0:717:ecc4:7818 with SMTP id
 00721157ae682-718374f0e98mr12803817b3.21.1752648560040; Tue, 15 Jul 2025
 23:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACH1CvPX8G6J=HyPV_jOYBFNba+TCT+8+YjyZ-OB53NX0OOieA@mail.gmail.com>
 <04A59142-67EB-4FE4-A432-6494C19F0175@gentoo.org>
In-Reply-To: <04A59142-67EB-4FE4-A432-6494C19F0175@gentoo.org>
From: Jesse Simpson <jesse.simpson36@gmail.com>
Date: Wed, 16 Jul 2025 02:49:07 -0400
X-Gm-Features: Ac12FXzG6z1jiQmae40d1GwCWh1MiU0NSt112YcHmMkFpLYiW18K6RZr-0HaYoI
Message-ID: <CACH1CvNLwGpPunsdiY3O76JO45pJACpvBnBq2b5a2Kho3hvp=Q@mail.gmail.com>
Subject: Re: Hello from the Gentoo Kernel CI (and requesting test credentials)
To: Arisut_gentoo <alicef@gentoo.org>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, my mistake. I thought of this as just the next thing to fix. :D

Thanks,

Jesse Simpson
jesse.simpson36@gmail.com


On Wed, Jul 16, 2025 at 2:42=E2=80=AFAM Arisut_gentoo <alicef@gentoo.org> w=
rote:
>
>
> 2025/07/13 17:25=E3=80=81Jesse Simpson <jesse.simpson36@gmail.com>=E3=81=
=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>
> =EF=BB=BFHey everyone,
>
> I am working with Arisu on the Gentoo Kernel CI project hosted here:
> https://gkernelci.gentoo.org/#/ . For a little while, this project was
> getting persistent test failures and even longer still, this project
> wasn't even able to post to KCIDB. (I see records from 2022 where it
> failed to post).   I started working on this project earlier this
> year, and have gotten tests to pass, and now I want to fix the
> connection to KCIDB. (https://github.com/kernelci/kcidb/issues/330)
>
> The Gentoo Kernel CI project takes the linux kernel of various
> supported versions, applies the gentoo linux-patches, and then runs
> basic tests.
>
> Arisu is still the admin of this infrastructure, but I am taking the
> role as contributor, submitting patches based on how they work in my
> testing environment but without access to the live environment. I
> suspect that Arisu will need a new credentials file, but as a
> contributor,  I would like a set of test credentials to test
> kcidb-validate and kcidb-submit so that I can make sure that our
> scripts that calls these functions in
> https://github.com/GKernelCI/Ghelper/tree/651090a3082ec684a315a808874a909=
1e819db3b/kcidb
> folder works.
>
> Do you all offer test credentials or a staging environment that I
> could post to?
>
> Thanks,
>
> Jesse Simpson
> jesse.simpson36@gmail.com
>
>
> HI Jesse,
>
> Thanks for contributing to GKernelCI.
> Recently KCIDB is in the process to move to KCIDB-ng and the previous cre=
dentials that we used on KCIDB for getting results from GKernelCI are unfor=
tunately no longer valid.
> After a discussion with members of KernelCI we decided that is better to =
wait for getting KCIDB-ng credentials as KCIDB will be soon deprecated.
> https://github.com/kernelci/kcidb-ng
>
> I will keep you informed.
>
> Thanks,
> Arisut
>
