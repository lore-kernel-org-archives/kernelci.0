Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5031A77
	for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a82f176860so9485657b3.1
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 06:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700144506; x=1700749306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTx8TpUCHZnFxSy50UzWEJ/5KYXYD5wT5yrFARu50ps=;
        b=qp45bE9r45Q4uJxC1XygzFMLKAcmgnTh9gi7Ugx2AMZRqAA7dDbqOLg8p5AT2vQcPX
         s2heMJYceDo24tMa0LxYpsL1BZU0C/gCU0ZE7M+itTdWqhuRc6kmT3mAy3ySkWtjwaf6
         1J/JmaDeq2W1pCFz+vXHvZul8I3xks30ahfg/gDeaZJszKRu1+/3rjbq9LemPk8ywJQu
         w+2/nU9ylQpnc6zyT0r2gq7/I65zcUxqjLWxKQu+v/rkGSgwRjTjpgixMftIL+U+ThJt
         4AntW9cffTUMm6EOvtMYW7yUpU3Nptd4YqI+KHyGnv1kNSUFHmsDi30UMo7du8He7uyS
         2x1A==
X-Gm-Message-State: AOJu0YyRY6Sp0PaN/kovuTn2nVqWKrOn+JfKFzd64WW3jBzNV+tY6fJK
	j+rxgwLnsKEQPG1DCW5JfU5zfWDOSvKVBg==
X-Google-Smtp-Source: AGHT+IFcA24S9pkksu+O0HgGYkoHdjuzmDbfpvxdrdvNDnk6pJyR3RBNgfOn279EjuD4jw7qbVp6yw==
X-Received: by 2002:a0d:f6c5:0:b0:5be:9c6f:d6bc with SMTP id g188-20020a0df6c5000000b005be9c6fd6bcmr16654632ywf.12.1700144506527;
        Thu, 16 Nov 2023 06:21:46 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id w82-20020a817b55000000b005925765aa30sm1019900ywc.135.2023.11.16.06.21.46
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:21:46 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-daf4f0e3a0fso818364276.1
        for <kernelci@lists.linux.dev>; Thu, 16 Nov 2023 06:21:46 -0800 (PST)
X-Received: by 2002:a25:d88a:0:b0:da0:3b47:bf0c with SMTP id
 p132-20020a25d88a000000b00da03b47bf0cmr17271398ybg.20.1700144505875; Thu, 16
 Nov 2023 06:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com> <ZVYXEry40HTCis00@archie.me>
In-Reply-To: <ZVYXEry40HTCis00@archie.me>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 15:21:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXza+PUrDfo+=Dzy6dr=C8vjsPQHN=8EDwXNjxdorNskQ@mail.gmail.com>
Message-ID: <CAMuHMdXza+PUrDfo+=Dzy6dr=C8vjsPQHN=8EDwXNjxdorNskQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, workflows@vger.kernel.org, 
	Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	David Gow <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Charles Han <hanchunchao@inspur.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Unit Tests <kunit-dev@googlegroups.com>, 
	Linux Kernel Self Tests <linux-kselftest@vger.kernel.org>, Veronika Kabatova <vkabatov@redhat.com>, 
	CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

On Thu, Nov 16, 2023 at 2:20=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> On Wed, Nov 15, 2023 at 07:43:49PM +0200, Nikolai Kondrashov wrote:
> > Make scripts/checkpatch.pl ensure any added V: fields reference
> > documented test suites only, and output a warning if a change to a
> > subsystem doesn't certify the required test suites were executed,
> > if any.
> >
> > If the test suite description includes a "Command", then checkpatch.pl
> > will output it as the one executing the suite. The command should run
> > with only the kernel tree and the regular developer environment set up.
> > But, at the same time, could simply output instructions for installing
> > any extra dependencies (or pull some automatically). The idea is to
> > get the developer into feedback loop quicker and easier, so they have
> > something to run and iterate on, even if it involves installing some
> > more stuff first. Therefore it's a good idea to add such wrappers to th=
e
> > kernel tree proper and refer to them from the tests.rst.
>
> Does it also apply to trivial patches (e.g. spelling or checkpatch fixes
> as seen on drivers/staging/)?

After having seen the introduction of too many build failures, I'm
inclined to ask for an even stronger proof of testing for "trivial"
fixes for drivers/staging...

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
