Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02C2586
	for <kernelci@lists.linux.dev>; Sat,  4 Feb 2023 15:18:54 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5254e8994e8so59925887b3.6
        for <kernelci@lists.linux.dev>; Sat, 04 Feb 2023 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HFJLgoi+tS77UonQPI72Lq3VMERqDs0LwQVfHpTSaC8=;
        b=Lc+ah9tSl3kTEScnQchIGDUxTYTo4GPkvSl19Db4TghEqMWIlo8y1Oc5wV0RWJ1esH
         7LKKxv8/fOQQRCynq7ticKpVXaEHBylviBEA/gf2A0BWDLqKQVnQL8KUKe6SCTXrrXGT
         JGcQ4FNd1BXLPdaNoay7txZyzIzuNUZF7d0vU69gIFego2hCgaFjhLJKFb9NKMxq7ana
         1s9444A8KybxrJrIcPDGJRYZAZbLlC8jGVcAEQvZknH0TM4S351fBBknu0HmTfDZQDas
         pWh4Q+yD+sJNG93/vZUBR5Nzp/cO4w2CkSEEYi1jHP4K+sHteu4gwXZCY2bhVpKe6Yxe
         PzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFJLgoi+tS77UonQPI72Lq3VMERqDs0LwQVfHpTSaC8=;
        b=ONhL5B6oOOog0+1qXxDn4lYMpz1rdh3/hwMG07v3VIlqPj4nIjUY4BpmCXctaaINch
         Zh3Oq8m03WZzV64mMZfjqkgeo64r68OP0KMqqxCcqa5Uz1oRJYsRmcX7Ha/McZunIk5i
         ubkAyBhifHcTaZoLnqMTzuojCmO9zEcTr+P9/cfndU7HimdooA/N+lsxtEDYVAwW4eDT
         4LyUMDti3EF6AKq10hJJxr0isMieLnSDYN66oXQhLRpnTXacx0QysgnJcngSUL8Vxe4u
         JZAn6konMmvWS4ix2GHJfcGzbX3hIOJ/FozBk116XCZphix0pN/iqrgFxIq3ZDuzU1yD
         hH3g==
X-Gm-Message-State: AO0yUKWNM3A99DgPe+DY0O2+bh6/0xF3qJjr/xIWdK0LfJNPuL6BrNJ8
	4mqjVoMQve/F8NfPvQ76hn3CJBPnIm2CcXo78HTdVw==
X-Google-Smtp-Source: AK7set9qkgZO+i3Vd2wQ0pqNOWhEnbhwhmYyBDVJ8lFw9SHjcAlhjlrxzO95LmyOPjLY7vWf1guULHUMWbxl1XBy1+8=
X-Received: by 2002:a81:8394:0:b0:526:5d5c:aa34 with SMTP id
 t142-20020a818394000000b005265d5caa34mr509202ywf.157.1675523933336; Sat, 04
 Feb 2023 07:18:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230204135652.336495-1-guillaume.tucker@collabora.com>
In-Reply-To: <20230204135652.336495-1-guillaume.tucker@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 4 Feb 2023 07:18:42 -0800
Message-ID: <CABXOdTfMwx7OW_oNkkJ_rKT+EqohTa-xg4kfsHFx-Ep4uug6Qw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: use printf instead of echo -ne
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Gautam <gautammenghani201@gmail.com>, 
	David Laight <David.Laight@aculab.com>, kernel@collabora.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023 at 5:56 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On some systems, the default echo command doesn't handle the -e option
> and the output looks like this (arm64 build):
>
> -ne Emit Tests for alsa
>
> -ne Emit Tests for amd-pstate
>
> -ne Emit Tests for arm64
>
> This is for example the case with the KernelCI Docker images
> e.g. kernelci/gcc-10:x86-kselftest-kernelci.  To avoid this issue, use
> printf which handles escape characters as a standard feature and is
> more widespread among modern shells.
>
> The output is now formatted as expected (x86 build this time):
>
> Emit Tests for alsa
> Emit Tests for amd-pstate
> Skipping non-existent dir: arm64
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Suggested-by: David Laight <David.Laight@ACULAB.COM>
> Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Notes:
>     v2: use printf insead of $(which echo)
>
>  tools/testing/selftests/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 41b649452560..06578963f4f1 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -236,8 +236,8 @@ ifdef INSTALL_PATH
>         @# included in the generated runlist.
>         for TARGET in $(TARGETS); do \
>                 BUILD_TARGET=$$BUILD/$$TARGET;  \
> -               [ ! -d $(INSTALL_PATH)/$$TARGET ] && echo "Skipping non-existent dir: $$TARGET" && continue; \
> -               echo -ne "Emit Tests for $$TARGET\n"; \
> +               [ ! -d $(INSTALL_PATH)/$$TARGET ] && printf "Skipping non-existent dir: $$TARGET\n" && continue; \
> +               printf "Emit Tests for $$TARGET\n"; \
>                 $(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
>                         -C $$TARGET emit_tests >> $(TEST_LIST); \
>         done;
> --
> 2.30.2
>
>
