Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B21A27A
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5cbcfdeaff3so78302577b3.0
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 02:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857254; x=1702462054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IhAaCIC+sv1cl9rAPh8wEgKbrg1+NsxhvGfL72SUfo=;
        b=WkV3kXsBIYNQLpMw1MF8HDWQvrR8diS+jZSGEs32GNA5xqKDqqej8NL+1pekKcJQpn
         +nqpQpuaX1NYGbeGZQqO2QuLpO4VXZA+zWsaB3T0uBqOyUL0z1R9bNR0NYEofSnEIHWK
         aCuuzK3JpdAVNzV3j6fS2UrPsu0OGfbAvUI5inlADMZ4EDI9vhNCfEgT4B344EHQ7ZH8
         bohQ/6MLDq/abNzcBbnHZZpgC0f3B+kI/0GEGFWBJKQWGzeMDMgJ8yYqtiHHRTTibyYv
         lkFamqaVollQqXa6girNki9U8iQNYsMrweDL7kTz+Nm4VPKOu64Zg0RWVX7oVgm5Funq
         dJOw==
X-Gm-Message-State: AOJu0YwqPAgyNssk3Dbdq8rU1+CNCZJQ09scurlEOGFNRqTyq/c3t+fC
	GHOToYZbNyL1QjGvKVHWcM4OoKTqJIvYPg==
X-Google-Smtp-Source: AGHT+IFZYng4QCBx934O+7uQ23MqjMOY3QnVr762i4562g0JvR/Z7jF+RBRoXsJQ1/rem3Ne+JZx6g==
X-Received: by 2002:a05:690c:b9a:b0:5d7:f8da:c190 with SMTP id ck26-20020a05690c0b9a00b005d7f8dac190mr482512ywb.92.1701857254562;
        Wed, 06 Dec 2023 02:07:34 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id n205-20020a0dcbd6000000b005d39efe78f4sm4644917ywd.50.2023.12.06.02.07.34
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:07:34 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d7a47d06eeso43968147b3.1
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 02:07:34 -0800 (PST)
X-Received: by 2002:a05:690c:c8a:b0:5d7:5dff:9e08 with SMTP id
 cm10-20020a05690c0c8a00b005d75dff9e08mr471487ywb.93.1701857254030; Wed, 06
 Dec 2023 02:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com> <20231205184503.79769-5-Nikolai.Kondrashov@redhat.com>
 <87zfyomq5k.fsf@meer.lwn.net> <fcc8a2d856dda4afbc85e70a36fc9ea903adc922.camel@perches.com>
In-Reply-To: <fcc8a2d856dda4afbc85e70a36fc9ea903adc922.camel@perches.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 11:07:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxE4TjHFotaf1-JgnSibikk-xk1_W1e6F0o217-vq3Mg@mail.gmail.com>
Message-ID: <CAMuHMdXxE4TjHFotaf1-JgnSibikk-xk1_W1e6F0o217-vq3Mg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/10] docs: submitting-patches: Introduce Tested-with:
To: Joe Perches <joe@perches.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, 
	workflows@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 8:07=E2=80=AFPM Joe Perches <joe@perches.com> wrote:
> On Tue, 2023-12-05 at 11:59 -0700, Jonathan Corbet wrote:
> > Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com> writes:
> >
> > > Introduce a new tag, 'Tested-with:', documented in the
> > > Documentation/process/submitting-patches.rst file.
> []
> > I have to ask whether we *really* need to introduce yet another tag for
> > this.  How are we going to use this information?  Are we going to try t=
o
> > make a tag for every way in which somebody might test a patch?
>
> In general, I think
>         Link: <to some url test result>
> would be good enough.

Exactly.  And if you put the test results (or a link) in your patch
below the "---", or in your cover letter, the "Link:" tag pointing to
lore (or something else, unfortunately) that most (but unfortunately
not all) maintainers already add when committing patches allows
anyone to find it.

> And remember that all this goes stale after awhile
> and that includes old test suites.

Yeah...

Isn't the purpose of a "Tested-with:" tag just for the maintainer to
know which patches have been tested with the test suite already, and
which haven't?  I expect reviewers/maintainers to scrutinize (extra)
patches that lack such a tag (or lack the same under the "---"),
and/or run the test suite theirselves.
I.e. does this serve any purpose _after_ the patch has been applied?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
