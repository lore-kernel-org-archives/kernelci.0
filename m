Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B22772D
	for <kernelci@lists.linux.dev>; Tue, 28 Mar 2023 21:08:51 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-545e907790fso139132247b3.3
        for <kernelci@lists.linux.dev>; Tue, 28 Mar 2023 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680037730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjM/ZqYn/T7unhyITZnKsFzK8c16l02nzfEEL176xOU=;
        b=ocoA87DNTSkmHztT5vnke6BiFUYBXc6/lZxINhcigUkk0S1CcjEXgStw7e9Zp88jv+
         i89diJ/hJM1JqzrRRVhBca1mfW48YWKNSscl5VxNxl/D8BuvFLHWAN4JwAYSOtJsAnvU
         /hLRstVR0H2yntq3lWpDGRwmwcMZGwMsqstB4dAb+RrozEc4vmQ5viXaNAHQbq7tKKtp
         bsDDdWbOfanraXHIIKTb/3e2+ED5o30OM1egoRKfHSontwTNP2Ocq5mm+XuTmXg9cwR+
         7CfkIF9F9SFfzSbUPIN0ev0xFztzmGXuEfR7BLx+g6u52KVj0QwddYgJTyOOUy8WqtJ7
         MRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680037730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjM/ZqYn/T7unhyITZnKsFzK8c16l02nzfEEL176xOU=;
        b=CrEbxBlLM/L7oXIc5O3/KNvbGh22ke3EqfrCBG84IJwroErJbvgzP0X4q0+Bu+R8FZ
         5/ALw2hS282UA4juq5uhJpSFvT/776BWIv9CgK+dZjYU/yxKSl0n92sitFVOag2F13S7
         wsPS/s7HUf/YEcUc9nwHYoZg7Vdnj9uvmBJhv7jXzp21i+WNGXFQfqBDLVmbvdo27kYu
         v5Qnt4ek5FlytPPxrlAE1RA5QDTyb3a8IQm/9dtxJOPt1kfyqmmOHviEipzqwEvL53kl
         jye+AFrVz4Yp5R3Nvnm5aP8SBS9fDx2DUA4CVLFQEn9r7kF+7Cw4VRHXnkQt4+MM7R3G
         v9tw==
X-Gm-Message-State: AAQBX9dUrRvIaifH/naU7aUxkj3yR4WlKe9wgeI80Bij05/C8LQJe5+z
	rU1fFCoT1LjMdfGqJvDecym/+wvYcnfcxNwMV0eFzw==
X-Google-Smtp-Source: AKy350ZLcUn0YW0dPW8RrTZpH1OlJLUgV7pk23eKHtHIEBdLUfe+SXlC99rlPRcKPdL9i7z5gyFajqvtscRGyxF3v54=
X-Received: by 2002:a81:a908:0:b0:545:7164:49ac with SMTP id
 g8-20020a81a908000000b00545716449acmr7922856ywh.5.1680037730422; Tue, 28 Mar
 2023 14:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230316225915.494688-1-rmoar@google.com> <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
In-Reply-To: <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 28 Mar 2023 17:08:38 -0400
Message-ID: <CA+GJov4F+Vjw2gFj=YTYEoZ5wmy774xE5+aDQv55BKQE3VZo1g@mail.gmail.com>
Subject: Re: [KTAP V2 PATCH] ktap_v2: add recognized test name line
To: Daniel Latypov <dlatypov@google.com>
Cc: frowand.list@gmail.com, davidgow@google.com, skhan@linuxfoundation.org, 
	keescook@chromium.org, Tim.Bird@sony.com, brendanhiggins@google.com, 
	corbet@lwn.net, guillaume.tucker@collabora.com, kernelci@lists.linux.dev, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 3:21=E2=80=AFPM 'Daniel Latypov' via KUnit Developm=
ent
<kunit-dev@googlegroups.com> wrote:
>
> On Thu, Mar 16, 2023 at 3:59=E2=80=AFPM Rae Moar <rmoar@google.com> wrote=
:
> >
> > Add recognition of the test name line ("# Subtest: <name>") to the KTAP=
 v2
> > spec.
> >
> > The purpose of this line is to declare the name of a test before its
> > results. This functionality is especially useful when trying to parse t=
est
> > results incrementally and when interpretting results after a crash.
> >
> > This line is already compliant with KTAP v1 as it is interpretted as a
>
> minor nit for if there's a v2, s/interprett/interpret (here and above)
>

Oops. Thanks for catching this. I will change this for a v2. Unsure
why I repeated the typo twice.

> Also, I want to elaborate on the previous paragraph a bit more, in
> case the motivation isn't clear.
> The problem with TAP and KTAP as-is is that the name of a test case is
> only known *after* it completes.
>
> So the scenario being referred to is
>
> KTAP version 1
> 1..1
> <lots of output>
> <kernel crash, no more output>
>
> It would be nice if parsers could report "test FOO caused a crash" as
> opposed to "the first test case caused a crash, good luck figuring out
> which one that was"
>

Yes, this is exactly what I think is the largest benefit of a line to
define the test name pre-results. Thanks for expanding. I will likely
add in some of this explanation into the commit message for v2.

Thanks,

Rae

> Daniel
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/CAGS_qxp2u3F4abmYgN%2BXwCG8CJN37NSqWSC%3D%3D%3DSWLCjZG8HYBw%40m=
ail.gmail.com.
