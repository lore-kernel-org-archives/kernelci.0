Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD408F7C
	for <kernelci@lists.linux.dev>; Thu,  3 Aug 2023 12:24:01 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d29a5f7dc74so895336276.3
        for <kernelci@lists.linux.dev>; Thu, 03 Aug 2023 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691065440; x=1691670240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TnkODSa4qCNwghcPkD/w2/BY01K28Q2s8sSULRzzHs=;
        b=YGoujQpNktm+uTzcRd/VYtlSsVn4tzyuDXpSOhRyEYZZ2oGE/1x3MtREbmr52hd9ta
         5fhmNIgxiiMI5GyvCA93vCQpqKWCLQk/3e6EfMMUufOdLJIA0gH/VM/0fHCvAA5v6N70
         QHlFa8ug8moSHFlFW5YgsPE8g37kX6vWfTmNpdHf9z/i33qtoe/qnQnWORpKWgA9XqHo
         8YwDEAExiID/R8zHXJYuMMUfd1G6FLk/YbqxQo8o2OVnxjSk1VxrWzu5UHDd/q1mWJue
         MhnAdn5ihqMIMc96L8ueJ6MkuWY8r5lyCL5gydGcSpfWRNCs6j0rF3hPTEfbL+Qj2s1L
         xz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691065440; x=1691670240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TnkODSa4qCNwghcPkD/w2/BY01K28Q2s8sSULRzzHs=;
        b=eDXQvzg5vVog3tW3fAXqkOz3PPcBiFR0I9T0nL+i8hc+jX3a7xvU/AnFsoWCtblA3x
         go3hJsXlrRH+WVXRGMbSP+UevewS6u3uNBYGI7/b7HJ0IuUe9s/vohV2LEUd/zCkZu1Y
         oSvQ6tReYLROfwg7tpOGAMDqPsPYIrMWk7igOHNw34iOm20LXMBMMhhUgCEcwSzk7rDc
         UQphmEh2qguJAT2cRZrwfvn5+7ZnLvhBb006kQhwVc0lXvE72DOzP6jHtUy8p9b2vs3F
         msSm217jl7fxaFESJA32VTFnq5EnUQrH3m3U3w4OglAm17fs3+qxbfSJno+chizzcusc
         S07g==
X-Gm-Message-State: ABy/qLbCrgqMz4XSHbSHR0v1oweRjStUCSG6g3/6uYgQSZR9myAOkd4x
	Uxr2Svv3tJMcJHOy5FUOEdrRcilh/yomkNgRjCc/fvqP764=
X-Google-Smtp-Source: APBJJlHfMhrLAdYIv2vJ0tY6assk+XLE6KBUL8bvs4lsCi78pzX69NhftoASGGd7B9F+5+msNpAdphuOqQx9w8OUWA4=
X-Received: by 2002:a25:216:0:b0:d08:5632:6b78 with SMTP id
 22-20020a250216000000b00d0856326b78mr18048728ybc.47.1691065440610; Thu, 03
 Aug 2023 05:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m=3yVV73R4OCWBkt54MaBhb-P472pPMeN-xPb6uWpvgA@mail.gmail.com>
 <2f443a56-3a84-dead-2c79-a25781780357@collabora.com> <CANiq72mxfHOOKU2ZGWDUnZNRFvz49REmzkTKLMH2TVtkSyBOtw@mail.gmail.com>
In-Reply-To: <CANiq72mxfHOOKU2ZGWDUnZNRFvz49REmzkTKLMH2TVtkSyBOtw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Aug 2023 14:23:49 +0200
Message-ID: <CANiq72kO85_ekw7ycNTvrVPKN3rRDMWZKSFj+TWp0=Xnb5LLkg@mail.gmail.com>
Subject: Re: Missing Rust results
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@lists.linux.dev, adrian.ratiu@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 8:07=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> `kernelci/build.py`, from a very quick look, seems to enable `LLVM=3D1`
> in two places (when generating a config merging fragments, and when
> building the kernel), so shouldn't `LLVM=3D1` be already there? Of
> course, when calling `make` directly, we still need it, but the CI
> should still work since I assume it uses the Python code. So perhaps
> something changed and it is now not getting into that branch?
>
> If `kci_build` is indeed what is used by the CI too, I can try to
> reproduce it locally and see what is going on, since I guess it is not
> complex to setup in that case?

So I tried `kci_build` (without Docker), and if I am doing things
correctly, running:

    ./kci_build update_repo --build-config rust-for-linux_rust-next
    ./kci_build init_bmeta --build-config rust-for-linux_rust-next
    ./kci_build make_config --verbose --defconfig defconfig+rust
    ./kci_build make_kernel --verbose

with a config like:

    [kci_build]
    kdir =3D "linux"
    arch =3D "x86_64"
    build_env =3D "rustc-1.70"
    j =3D 16

Gives me output like:

    export LLVM=3D1
    ...
    make KBUILD_BUILD_USER=3DKernelCI ARCH=3Dx86_64 LLVM=3D1 ... defconfig
    make KBUILD_BUILD_USER=3DKernelCI ARCH=3Dx86_64 LLVM=3D1 ... bzImage

So it seems it is using `LLVM=3D1` for that build environment? If I use
`gcc-10`, it uses GCC as expected. So the build environment at least
it seems to work from that point of view. Does the Docker image change
how things work somehow?

Cheers,
Miguel
