Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FA19BA5
	for <kernelci@lists.linux.dev>; Mon, 31 Jul 2023 18:07:36 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bff89873d34so3847315276.2
        for <kernelci@lists.linux.dev>; Mon, 31 Jul 2023 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690826855; x=1691431655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmX6G/YqEJmRL0+As/pQBiGwoVdPc36MX+CeWWmykE8=;
        b=JH7rlv8mE7jMa1dppH0iRqa2yK2Kq6lP9Y1Dic0OmQB6i9LU8tOkS9Fy0hQt49l8d2
         FwdfpZ9ztcdgYbCP+4BE8n5lCtNUz6R2nmZ81wer6NaWS1QSY/O/yOwNzduGcXCScAcp
         vmI0KZhTMuLyn0HI94JmK6a2Maf7L1a/rPz0b/FedwrKYaLgqfZgs1MZas8M1wp9Wqpd
         DmjcS+MrhFn2FrcOqe/4m2KJmLPZSDgViZ+CFSL+awMvEvhfesIcjchHg8GBJnGn3tsQ
         2RHFcPNtRmsVbP+142syys/c/hSXL/JrBphg98wJUTEg5JTwq/3ShYlU8dikKMDGFzu+
         wrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690826855; x=1691431655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmX6G/YqEJmRL0+As/pQBiGwoVdPc36MX+CeWWmykE8=;
        b=k9BddGIn1V6Mw5nmLz51fywNf2l1UDlk84H95r7hSMP8dWEwmIr56RwsUx4IzOn6EO
         JXt6HK/PU21tFekvAHbDEHtkR98fbmLO3u2OqAhnfLbyCUTQ6j9dllyyjIvkcS+s6w2r
         6+Q9QWa3Jh1mx3Ln+fUPhAOzx3cOhU9azFtDSWwWH3JcK1YD3iDZps50OcYmCrXHjAZx
         xZPjmnmaHzEGznY/8OyEzLi7G0oiX9uabrpVCDB7Kbz5u3ybp7zhC3wl7uOQ+cDeDt+x
         Je1ZyWoMFtB3L8HDcZAySd0F8q1IXe8JXipww0iNURkoJOV2gBa3Ee3xs+yDdQLNuTX6
         O6+g==
X-Gm-Message-State: ABy/qLa9CmopwJzRBsrgLdotlKQGjbsOUbE+hVNGDFWFBEW2ONK7keUL
	9dTvD69HI8Nh3lllJv9FWFO0TZbI8WpXVluCxfA=
X-Google-Smtp-Source: APBJJlHuludvI8anpx7a43Ulpv/g9K9QpAbjBrk2vJzXj09BjKTW21dLhYsB42pyn1fKPLUV0P0zB3BHai3vyrPzBkE=
X-Received: by 2002:a25:d394:0:b0:d00:7d6d:4767 with SMTP id
 e142-20020a25d394000000b00d007d6d4767mr8129263ybf.44.1690826855368; Mon, 31
 Jul 2023 11:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m=3yVV73R4OCWBkt54MaBhb-P472pPMeN-xPb6uWpvgA@mail.gmail.com>
 <2f443a56-3a84-dead-2c79-a25781780357@collabora.com>
In-Reply-To: <2f443a56-3a84-dead-2c79-a25781780357@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Jul 2023 20:07:24 +0200
Message-ID: <CANiq72mxfHOOKU2ZGWDUnZNRFvz49REmzkTKLMH2TVtkSyBOtw@mail.gmail.com>
Subject: Re: Missing Rust results
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@lists.linux.dev, adrian.ratiu@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guillaume,

On Mon, Jul 24, 2023 at 2:38=E2=80=AFPM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Sorry about that and for the delay in replying, I think it's been
> overlooked for a little while now.  We've also been distracted by
> some infrastructure issues but that's getting resolved now.

No apologies needed, and thanks for taking a look!

> Then one issue is that gcc is not installed since rustc-1.70 is
> based on the clang toolchain Docker image.  So LLVM=3D1 needs to be
> used, e.g.:

Yeah, `LLVM=3D1` is what we should definitely use. While some GCC builds
work and boot in QEMU, they are just intended as a proof of concept,
and we will probably want to use, eventually, `gccrs` for GCC builds
with Rust enabled.

So even if GCC builds happen to work, we would prefer that CIs focus
on `LLVM=3D1`, at least for the moment.

> Then we can start building a kernel.  I don't think KernelCI is
> currently using LLVM=3D1 with Rust builds, but I can't be
> completely sure of that either since I still haven't found a job
> log showing the error.  I'll keep looking this week and maybe
> schedule jobs by hand if needed.
>
> It shouldn't be very hard to add the bits needed to pass LLVM=3D1
> for Rust.  The main potential issue is if we want to build with
> Rust enabled and another toolchain than clang in the future, but
> I think we'll have a better way of configurting compiler flags by
> then anyway.  So if that's the issue we should be able to fix it

Yeah, I agree.

> this week too.  I wonder how it worked in the past though.

Good question, especially since Adrian had to deal with GCC not being
installed (the linker story), so I assume GCC was never installed (as
intended).

`kernelci/build.py`, from a very quick look, seems to enable `LLVM=3D1`
in two places (when generating a config merging fragments, and when
building the kernel), so shouldn't `LLVM=3D1` be already there? Of
course, when calling `make` directly, we still need it, but the CI
should still work since I assume it uses the Python code. So perhaps
something changed and it is now not getting into that branch?

If `kci_build` is indeed what is used by the CI too, I can try to
reproduce it locally and see what is going on, since I guess it is not
complex to setup in that case?

> Then the build fails but that's another issue.  In principle we
> should get these errors in KernelCI:

Yeah, those look as expected.

> Hope this helps :)

It does, thanks again!

Cheers,
Miguel
