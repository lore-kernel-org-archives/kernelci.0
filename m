Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A886D1B
	for <kernelci@lists.linux.dev>; Thu,  9 Feb 2023 16:19:48 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4c24993965eso31490987b3.12
        for <kernelci@lists.linux.dev>; Thu, 09 Feb 2023 08:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GlZRd41K0U+KP9r4brauY7yZjWAhAwpFA59RBThBcPw=;
        b=eYSaPjytR6e1YtVWU78vCni4OsGr+H50oE8zveFDkE72S3iysIkbXHTC29ydnKhB6N
         yzp2dvxWGTmrzP08y7IFyUI1wh1Qr3o5lSzxFdwhWxnHRl/ehjqXFLf8nFMhwOZ3Nrm6
         YHxzrdzH6e5i+pshM0zBQ8okF7Y3yisMErIxhwGKvYXpfIBuWCy/j9RVPQt+B723ShIr
         +/Y/5DPghqgzxgcDTTRq+9gnUQOk0otYh5o0w7fobXbQ6ChZ/vk2xMcn9GfapdZFK2S9
         WjHZMRp2eBMg2QFhiCZ09O5P+8V88640tiOxHIVTNx6G2Bnw7keMa+tBDtR85LQ2iiW6
         tDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlZRd41K0U+KP9r4brauY7yZjWAhAwpFA59RBThBcPw=;
        b=SdtIT0z6WL6/P+tBR9xtiBunXTVWdn67CMo6Pskd/0Zvp6z8tyAwF44x99ZPzaX/tA
         5ZgN3Ex5/JoqGf44X9kB2qPyhT0fSSorO/VbAgVt6k09y7v9rHwu1qR9d4AGkAEhGwZk
         sN+ayPuaQmZmqCSKUGd7w1GNaDPumYCXJfFOt1ZPko+K9EItkRirB0XM9ZE6E6/QVj39
         5FpLayZbiMJ6UGGj6L21wRyoB1zkovHp/bDTFJVqkzsvkh/HGBxiVlnHGGmJUpaBRU0i
         kCkyvi9E8JyCtE3LuDQFXmPGTA/K8vhGzdINfj89etsjSkkB7kHt+KuN2nkecXi2v/HP
         rlng==
X-Gm-Message-State: AO0yUKUnP3+ISuI2p9e+TWmGMIDd1DScP/uFuXLZ7ghjyWlw0kSNkd/T
	y+7hon7kPHsO8auKPeuNN0RRYbIpAkPKi5MZB7DO+g==
X-Google-Smtp-Source: AK7set8OqEMq5GVQpATraghSz4T7y8K22eJbquY9L4FPI3bDQymX3ttwp3VTYr/LsrqmNZTNfL9Hby4JVEz8JTeXrSo=
X-Received: by 2002:a81:69d5:0:b0:506:8253:3444 with SMTP id
 e204-20020a8169d5000000b0050682533444mr1180650ywc.436.1675959587431; Thu, 09
 Feb 2023 08:19:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230209085536.1076662-1-guillaume.tucker@collabora.com>
In-Reply-To: <20230209085536.1076662-1-guillaume.tucker@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 9 Feb 2023 08:19:36 -0800
Message-ID: <CABXOdTdnntA=oU4==suO-DP-8S9zb0AhqtwekCRCbpOpku7MQg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: use printf instead of echo -ne
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Gautam <gautammenghani201@gmail.com>, 
	David Laight <David.Laight@aculab.com>, kernel@collabora.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 12:55 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Rather than trying to guess which implementation of "echo" to run with
> support for "-ne" options, use "printf" instead of "echo -ne".  It
> handles escape characters as a standard feature and it is widespread
> among modern shells.
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Suggested-by: David Laight <David.Laight@ACULAB.COM>
> Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
> Fixes: 79c16b1120fe ("selftests: find echo binary to use -ne options")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Notes:
>     v2: use printf insead of $(which echo)
>     v3: rebase on top of fix with $(which echo)
>
>  tools/testing/selftests/Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 9619d0f3b2ff..06578963f4f1 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -234,11 +234,10 @@ ifdef INSTALL_PATH
>         @# While building kselftest-list.text skip also non-existent TARGET dirs:
>         @# they could be the result of a build failure and should NOT be
>         @# included in the generated runlist.
> -       ECHO=`which echo`; \
>         for TARGET in $(TARGETS); do \
>                 BUILD_TARGET=$$BUILD/$$TARGET;  \
> -               [ ! -d $(INSTALL_PATH)/$$TARGET ] && $$ECHO "Skipping non-existent dir: $$TARGET" && continue; \
> -               $$ECHO -ne "Emit Tests for $$TARGET\n"; \
> +               [ ! -d $(INSTALL_PATH)/$$TARGET ] && printf "Skipping non-existent dir: $$TARGET\n" && continue; \
> +               printf "Emit Tests for $$TARGET\n"; \
>                 $(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
>                         -C $$TARGET emit_tests >> $(TEST_LIST); \
>         done;
> --
> 2.30.2
>
>
