Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09898316199
	for <kernelci@lists.linux.dev>; Sat,  6 Jun 2026 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750790; cv=pass; b=fFu6qof43bvMqjEHebUm3dYNi11zJi0N0rnZhtLuJAGyaFmQ1DpWi8JOmOtxeEWcG26zcGY4bHhvyIR17tZTLQQHhOr+7ZPHK95GuyNVsjQ/qoOQsSH0UJe34ij+mUV0oRcVwYAyc2aJ+6JPo92hNFmLYqodkfWYpxPLUL7CxDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750790; c=relaxed/simple;
	bh=4Jivd1YIsxmXU/pnX6EmdWcWh/dVSKf4BhfIZ5Py6Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBCH203DJJLerLK4ZjMY+24wt8yuP6bFZIlBT0S5qJnBXQPpcRBMp0Trv035gdhDbw8KGqz4tKi+5y83WQqMaNOMxWIik2wopR9KoXzJRpVr4qH2/wk4t8GHpRZQKzpnY3V/PPkFnsKyjnVi6wKAItGR1AZ9+z65x1R1sWZ/Tdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1MA/8iT; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1MA/8iT"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso40692746d6.1
        for <kernelci@lists.linux.dev>; Sat, 06 Jun 2026 05:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780750788; cv=none;
        d=google.com; s=arc-20240605;
        b=MfEjJwnWkRrKHxryn+XewrdVW1w/CdUeuX8oJV1lJQ5ssxQlDVxcmarvZ9yYb61u0p
         syn1xS986MsRh/WSE450nJnQc4s3DuhVM1R59RK+8pBvqg7aqMuMuxsoNG84MNwIfVkc
         ZsTILVzkFkYxw/kwv1Oqru6oq213kNuH+1wzFv5dYGktjb+7uoDqbVx587TNzuLaAP+l
         9YUK2z+5dPOFwUsgZFAluaYkLG193wViOoL+LV2JpS1UIAbbGiFJCI9c4P5uR6nXCIRB
         w6AGsODMHaKvCvuCPUxkeWDcDo6S9d0CXiGNA1CgV8JalEV4FRV5WHfd53MlNVi8JcHw
         8mZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Jivd1YIsxmXU/pnX6EmdWcWh/dVSKf4BhfIZ5Py6Ok=;
        fh=f/J1HJ65jraBmWEBR6U9wutciKARS+96uQ9tfG5xMPI=;
        b=KI+vaJxjOs4E1M+scMH457GBDe9DCPkaKkA2pZES75MtD70ucs3uvHPVAaV39c7R0p
         eg0XFZZ1dUzHNQbrLeArd93TB0qhfeGvz+Ok1Dcop/+CDTiSnio1BrDeYQRL5VpenvF2
         4V1aesvtoLdLCPiXzdOcZwE1sXTMuy1skP0gftl4XIv2KOmtXLj+8Laq25ANZsLAyhxs
         RlaLv9lTtioJjgRdtQ3hVah129B404izBOOFKLHdQLf5qrhNR9QzHJUdgtmQ62NW+zDz
         7t+PpMttXL7JuaLXhWPFkjY834J+VZa/Y5t+6540XZr55EYK5nCc645kopzGQvrsOr3s
         9dDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780750788; x=1781355588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jivd1YIsxmXU/pnX6EmdWcWh/dVSKf4BhfIZ5Py6Ok=;
        b=X1MA/8iThr9mfDiwnjvW3c7DtQ/F3zP78EKkiso1CDa4Y3AM2Z1ot9t5hW+9fnygVF
         nRwY0PsXi9GCKfOkuKFmVwM0fFJvcGgLnnJahrsvXJ1EeMTf7yBf60lT8ErVXa/8mguV
         mzohTDX7a2nMHy99vGZpD9l2Yxtu59njyeFzTmZ6QX5sAwNWlCxTZbzOuLxU83t9lvsy
         6ICvnqzvFSI5VUGw7SqHZZHNy4st6X00DPfVhyImCDY4pnoKxSAsduDJT5ntBEHvsiq+
         xiU3dce6foyh3hFD26OVSUO4rxXtrRoTktbrQbW6iZGt2NqJpeZiUW+ixVv8N5tWWZI0
         Sj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780750788; x=1781355588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Jivd1YIsxmXU/pnX6EmdWcWh/dVSKf4BhfIZ5Py6Ok=;
        b=SIewM2Rt5z8tCTENWXJQ/gA3LPL7H61YPq6LeLvSAo9pMZJoztR7L/pS2du31Haozj
         A0JGoMlNA74esVO5tYk+CtZTKRJPAfrJxMLVaAWRmGJGianpkQMOEJxlT/HqxVEgvniF
         OIXoroe+ILTI74hRT0cs2OjB88K6cW/N9oo7OnrfIK7YNQcgp4GS84k+qDGq5eTfchy2
         vBm3Z2oCjgAXcixtRO5YG5riV/NAeB711YN3deNJV5cpRKGaGpzn8h8HZiIHMIyKdQGG
         m9qw7uM9J/MF+gPuczUcsa2q0G3oFomw2qyoo4jn3OFOSO9qgThXHv2AobvGdv0OGpjc
         Fs0Q==
X-Gm-Message-State: AOJu0YxZmoHE3mkUvZ3m8AnnDUkGJM4+I5A+1O8hMQ8jvtBW8ET1Btf6
	X0Y6uEF5MKN9o57cDAe048X2x2oB01D0enzHE1v6GnyvQzQRnhng+8RPN91KfsNquQoLg20a08+
	qTyDCxBN+qiw2F+i7pb1ZFu7zUy6YqWmYIg8e8lg0
X-Gm-Gg: Acq92OHszRf3g/pq+rBipukMluEoVu2SLhGeW7L+59EOw+48U2kSHkl/vWO6litzLaO
	qp95YUDzw3FpgTMDPqOm/u7AhOnTyqX+xr0RObRBHJJype/7fUf+MzcpBPFkycloIdSHbmG3mjg
	irLAJl+UfQJeplsBmj1vyvwJWr8S5eoQoOe+C+p0vUTE1ZigJzNhPzaAAVgsFh8EWStM6kTDb2Y
	dKip0M5zYlfjE+yqr+8T3YzLH5Oi7xoKHanL3v3mJA5qIYwJt3cJp1p+f1AJv2ExZVV5TzfDbOP
	/Ey2V1xYHmgdNI7RdDxpd4DK1qRQQJgLx+Bt1LuVnjtoHw3BtIPeO9Ya1ZyTuGZwC+tVuUsrGYI
	WW+8wuKJg3N6YYxDTp0DzcAX8gMRimSUphoQ8PCmBlT4KPi4urIf/+W8k
X-Received: by 2002:a05:6214:4708:b0:8cc:ebbb:8bda with SMTP id
 6a1803df08f44-8cee62902b8mr118320966d6.39.1780750787977; Sat, 06 Jun 2026
 05:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEev2e-Rc=hhieAWmM59jAyNLc-o_ZVA27UQG=YkcbZAEnXYFg@mail.gmail.com>
 <CAL0q8a7BAV7KgM2K4ii21qFXrhKieyJsM2wG7_Y=p459ec10jQ@mail.gmail.com> <CAEev2e_bLhfSAjq3Jwwfqy2bXhgNQ6Dygu=zSHqw39U1taTUEg@mail.gmail.com>
In-Reply-To: <CAEev2e_bLhfSAjq3Jwwfqy2bXhgNQ6Dygu=zSHqw39U1taTUEg@mail.gmail.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Sat, 6 Jun 2026 13:59:37 +0100
X-Gm-Features: AVVi8Cc3y7bL4ZLh0lteQp0QdogyV-BvlCYmOe77LNvY6xWTw0Uu2ksvKkK5cg4
Message-ID: <CAL0q8a5cbhV_q5jgVdUDTCZ8z6_8VqX34s=Fp+fhXxzaWczPhQ@mail.gmail.com>
Subject: Re: trixie riscv64 rootfs builds for kselftest
To: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anirudh,

On Sat, 23 May 2026 at 15:48, Anirudh Srinivasan
<asrinivasan@tenstorrent.com> wrote:
>
> Hi Ben,
>
> On Sat, May 23, 2026 at 2:22=E2=80=AFAM Ben Copeland <ben.copeland@linaro=
.org> wrote:
> >
> > Hello Anirudh,
> >
> > Thanks for the email. I have opened a PR at
> > https://github.com/kernelci/kernelci-core/pull/3102 to add it here.
> >
> > I tested it locally. If you want to give it a try beforehand, I can
> > send it over; it'll appear in the next production release.
>
> Looks good. If you have the built assets somewhere, please share them.
> I will try it out.

Apologies for the late response to you, but you can test the rootfs out her=
e:

You can test it out here:
https://storage.kernelci.org/images/rootfs/debian/trixie-kselftest/20260606=
.0/riscv64/

Whilst there I also built LTP:
https://storage.kernelci.org/images/rootfs/debian/trixie-ltp/20260606.0/ris=
cv64/

Regards

Ben




>
> >
> > Regards
> >
> > Ben
