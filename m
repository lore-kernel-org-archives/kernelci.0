Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B57017BA0
	for <kernelci@lists.linux.dev>; Thu,  4 Apr 2024 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712248478; cv=none; b=IHP4PqAMehoCgX2qlsg152dZ1UkUCatHQb75wHa2YbuQyBkuhkZTvjqBtCEonwYBngdCb8hYpkyMOBa23FAAWXWob19GKzoSajADclUoCR9uKN8kirFmFjvyHJ1W8Hfss6bv9agYuWtyUFUrfsePRpbv1AXhwexDMT+hLhT7Kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712248478; c=relaxed/simple;
	bh=IxZOemwIBDjGfb04Lkg6+NbqNiNba59ltvQmSjxuciU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=giodIDGd4H2nD15AIGsiz/T0cx4iI5XmQNQxoybbw5vM7SPZriUyvP2I5PYIq3GK5QX7nIo2MPEYNovkMWmhkWqmixkxJVcpDmARdE6ll8m79AqnqTSWvD7gvOIxUrtWtDNtnQqbbWLLmmGdDcRb/QkLUFEccuE/J+l/JsUN+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geM6Gl4j; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geM6Gl4j"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33edbc5932bso882453f8f.3
        for <kernelci@lists.linux.dev>; Thu, 04 Apr 2024 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712248475; x=1712853275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BCQK2GpcjyvGUKe27rxi+yOrz8/xQNkqCCTTXVYKDI=;
        b=geM6Gl4ja/KGqaRnLK7vqck4VIQXktzoioea2TF3t+vN98hSgPK1YVvJKjGilAso5l
         PSzENEPxktL9T3DJKd3WN5q9tpH3Idn0Hfrg1cKZBktF7J2+Oh+q2Q3ZTWd36ktH3svp
         HTnNAmXlR3MBGHXYii31b7Z6hq/w2NYHKMI3HjEpqTLHXrPZ6/TKSNutgcy0PY1HW54N
         1N2C/zZ79g/TPQm2bvx27e92yEvjDlo+a2Bm8kCu4ssRYjEOaZiUbfAapzqjBdgytoqU
         hTyj6UdHiqq3ZRdBi7UnWDeaY/hpI9zUlIwHR5a0y1gdrwQIuuZ8wDqGz0eBEKqUHxwc
         XgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712248475; x=1712853275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BCQK2GpcjyvGUKe27rxi+yOrz8/xQNkqCCTTXVYKDI=;
        b=crHjCL8ZvMZbxX6Mtjgh21TUNwS+U3Gk/rfAlsLqTps0LINrbRoeP9Pu87bkgtjMk1
         AmrmJ+MqBrqlJHFhOiXXgfam5nt8nkPWSmC0VYxLld0wxoyQGXYrwAgFyN1yrNSOI8+K
         SYXpos9fXFR7Gq1fE9uTucYsHXhQDwxgeMA8L1ZAjCtxw+xAx9FEqQ8V4CiL/Z8h7+ds
         gVdnkEDH7dm7vmlhnMsjbL/bJaUBR+X7TiZhV5LLMdvt01HjF1dQCaxpla/DnwUGmtai
         YauDa54N19JoQYeXcvZT8fkHnhWl1kP7ilBsWHGGg7lubMZQg/3o8gIRCIIUDerZ3MNV
         kUjw==
X-Forwarded-Encrypted: i=1; AJvYcCXyBGgn0h2BHmA1hY11d9ESypMjBpBjcnzlkEttawLsiWXwYqnwxEz6ErmFl5X59iaB56/m15EFjCX0jCmauyBO3IaO/jaPou4=
X-Gm-Message-State: AOJu0YwVzQVLDn6D4KzSADMbLG37W7i4A6qWAUoEFdZzH5GzPB6W8jbI
	QNSF7Ry+sahtpTC9PXjofoSnW4CvXXRswVpAriar3gFxeBVxNQ2pZ2zZKG+lYn9o/8QXW4JJf62
	eXYTzAjRF7RTy4+LzzvcYUVu4Qg/zR6Hrz4wo
X-Google-Smtp-Source: AGHT+IH1HZji000oYGtwTRIYZZmon6pxkGZKF7LVCOK3aZpyYUspDitssTu1QfsYUQ8hLLd+O52wvFiM2I4yiwmS2gM=
X-Received: by 2002:adf:fa50:0:b0:33e:cb03:2471 with SMTP id
 y16-20020adffa50000000b0033ecb032471mr2309020wrr.30.1712248474890; Thu, 04
 Apr 2024 09:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0c6d4f0d-2064-4444-986b-1d1ed782135f@collabora.com>
In-Reply-To: <0c6d4f0d-2064-4444-986b-1d1ed782135f@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Apr 2024 09:34:20 -0700
Message-ID: <CAKwvOd=ueTmUThCOkBGUjhMGr6mKDtbTt-d7tHKe7A2nrchWMw@mail.gmail.com>
Subject: Re: [Bug Report] selftests: Clang: kselftests build errors in KernelCI
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Gustavo Padovan <gus@collabora.com>, llvm@lists.linux.dev, 
	kernelci@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Mark Brown <broonie@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report.  We've been tracking getting this working for a
while: https://github.com/ClangBuiltLinux/linux/issues/1698.  Other
fires have continued to take priority.

On Thu, Apr 4, 2024 at 9:30=E2=80=AFAM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> Hi,
>
> We have caught bugs in kselftest suites on linux-next and on stable-RCs e=
tc
> when using clang. There are two types of bugs (logs with clang-17 are
> attached.):
> As usually people use GCC, there are GCC-specific flags added to the
> Makefiles that clang doesn't recognize. For example:
> * clang: error: argument unused during compilation: '-pie'
> [-Werror,-Wunused-command-line-argument]
> * clang: error: unknown argument '-static-libasan'; did you mean
> '-static-libsan'?
> * clang: error: cannot specify -o when generating multiple output files
>
> Clang has best static analysis tools. It is reporting static errors. For
> example:
> * test_execve.c:121:13: warning: variable 'have_outer_privilege' is used
> uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized=
]
> * test_execve.c:121:9: note: remove the 'if' if its condition is always t=
rue
> * test_memcontrol.c:727:6: warning: variable 'fd' is used uninitialized
> whenever 'if' condition is true [-Wsometimes-uninitialized]
>
> We have found these issues through our new KernelCI system when enabling
> kselftest and clang there. The new system dashboard is a WIP, so It is no=
t
> the web dashboard you are used-to with in KernelCI. We can show you ways =
of
> pulling the data if you are interest into.
>
> Unless the above is some sort of false-positive or misconfiguration, it
> would be great to support clang for kselftests. What we can do from our
> side is that clang kselftests builds should be enabled on KernelCI to fin=
d
> and fix the errors. What is your stance about this?

As with anything kernel related; help send patches for obvious fixes.
Or provide steps to reproduce in
https://github.com/ClangBuiltLinux/linux/issues/1698.

--=20
Thanks,
~Nick Desaulniers
