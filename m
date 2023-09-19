Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F059BE4C
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 22:54:47 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so6884a12.0
        for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 15:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695164085; x=1695768885; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rfg9fJmh9yBLGwTx4ZdHa7V9s4CLunWIrS3gYKC6R8c=;
        b=rzQt5LiCDSFXMDBCBNEnLNupZPkoD9ukY1/FRAQkZn4pvKIZyB4F6816SQjM6qEuIN
         uch4x8Ikji6IPNDQpkcG1rWrYJZ3/wDfVSxh6YBEBq8EVBB9e9P/lkGqbscF+geS1gRP
         6Zf9uzp2sru1/k+AKoN88HFrR/EFL+IlVY5Ibba53QXw7T31M/+4UXb6L9S+0lEIWmlH
         huQJh+X28K0rIo7G7hlP44smoUl2yXAIn8LqeWyHZ9n2SxPlo9foYot1yyzJ7Lttnczo
         8L+gisWZKKaK4qfzC/JUWm1rBys+xgI3AW7pIkWoB1VoXnou5DIS6rchAk5EoWnI/SUO
         Q9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695164085; x=1695768885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfg9fJmh9yBLGwTx4ZdHa7V9s4CLunWIrS3gYKC6R8c=;
        b=faZBGdT3WP9LdK9ro1oL6vEz9KSgds6h+8ytceAG3S+gNwab3WZhf02Ze1sLkPI3w0
         iTIGeCKiQpkRfYRsUazgsUhOH7ptorkpaj8jGviM1A/DHGuVJgKRBi7KBznX3dadeMnc
         09yTKNhRUxEoSYj+FdGjJwwZH6JKzf5qJ9apx5tcyUYLcNFA08igL5wXFxZuEMkiU2Mm
         2R+HsxQFYyUVNXwYDZskhXY8meGPMJyzHydxIm71c4xwQEyiM8jeexoU46tZkkVFC4VC
         jXZCz+C+PZg1TWf4g2RCbCYhCDHE3lDNEIzhxaUrUil1TfSI19Nznp8uThCzHkoax47T
         rmPA==
X-Gm-Message-State: AOJu0YzdCvZRWzdu+NcYacZ5rddDcKim+xe2Ujar/7aXYPYn0foQRBIQ
	zBKCRENp8srO7y+bsNILn35g7fhFCxMM3epu3COQlw==
X-Google-Smtp-Source: AGHT+IFR4Ji1++xiM5nnsZNloYPqfOYzCLuhSXrbvwTYujaKxI9m6zy49gHogjmRAahtrkGXhi8bsC+Cb677PAG5w+w=
X-Received: by 2002:a50:bac4:0:b0:530:4f4b:d9ee with SMTP id
 x62-20020a50bac4000000b005304f4bd9eemr13776ede.5.1695164085442; Tue, 19 Sep
 2023 15:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
In-Reply-To: <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 19 Sep 2023 15:54:29 -0700
Message-ID: <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guillaume,

How about this for android trees:

1) same compilers as current config (gcc-10, clang-14)
2) archs: arm, arm64, i386, x80_64, riscv
3) same configs as current android tests
4) plus configs used by corresponding stable kernel
(https://linux.kernelci.org/job/stable) not included in #3

We get a nice benefit from sync'ing with the stable kernels since it
allows us to tell which issues originate upstream and which are
introduced by android changes. It's also useful to build each with
both toolchains so we can expose the cases where gcc-10 is OK but
clang-14 has issues (and visa-versa).

I don't think we need to build all of the combinations if there are
too many builds - we could trim out some of the configs from #4 (you
can recommend which).

We'd also like to start in an all-green state. So let's trim out the
error cases that aren't caused by android kernel code. I think there
are some 32-bit cases that fail with the clang-14 tools and some other
cases that fail in stable.

Could we start with all of the builds for #1 - #4 and then tune it up
after a few runs to get rid of long-failing cases and/or to just
reduce the load on the build service?

-Todd



On Wed, Sep 6, 2023 at 12:50=E2=80=AFPM Todd Kjos <tkjos@google.com> wrote:
>
> +Viktor Martensson +Betty Zhou
>
> Guillaume,
>
> I think that's a great idea. I'll get back to you with the set of
> configs, arch, compilers we'd like to have coverage for.
>
> -Todd
>
>
> On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> >
> > Hi Todd,
> >
> > On 05/09/2023 19:18, Todd Kjos wrote:
> > > On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google.com> =
wrote:
> > >>
> > >>
> > >>
> > >> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guillaume.=
tucker@collabora.com> wrote:
> > >>>
> > >>> Hi Todd,
> > >>>
> > >>> On 11/07/2023 00:41, Todd Kjos wrote:
> > >>>> Please add the following new Android branches to kernelci testing.
> > >>>>
> > >>>> repo: https://android.googlesource.com/kernel/common
> > >>>> branches:
> > >>>> - android15-6.1
> > >>>> - android14-6.1-lts
> > >>>> - android14-5.15-lts
> > >>>
> > >>> I've created this PR accordingly:
> > >>>
> > >>>   https://github.com/kernelci/kernelci-core/pull/2002
> > >>>
> > >>> Please note that we're now operating with reduced build coverage
> > >>> due to some temporary limitations with our Azure subscription.  I
> > >>> know the Android kernel builds should be covered by the GCP
> > >>> clusters but right now the system is designed to distribute
> > >>> kernel builds randomly across all clusters so we can't easily tie
> > >>> Android builds to the Android clusters.  Hopefully we'll find a
> > >>> solution to go back to normal coverage within a week or two.
> > >>
> > >>
> > >> Hi Guillaume, Any ETA for when the full set of builds is restored? W=
e still have greatly reduced build coverage and it's been a month.
> > >
> > > Ping. We are getting a lot less value out of kernelci with the greatl=
y
> > > reduced set of builds for the Android kernels. When will the full
> > > build coverage be resumed?
> > >
> > > If it needs to stay reduced, can we decide precisely which builds are
> > > done for Android kernels?
> >
> > Sorry for the slow reply.
> >
> > I think it's fine now to re-enable the Android builds and maybe
> > we should also take this opportunity to confirm which ones are
> > the most relevant to you guys.  As part of the process of
> > adjusting the build coverage, I also fixed the GKI builds which I
> > thought were the main ones.  Even if there is enough build
> > capacity to build "everything", keeping it streamlined to what is
> > really useful makes the overall system more effective.
> >
> > Are there any particular combinations of arch, config, compilers
> > you care about more than others?
> >
> > Thanks,
> > Guillaume
> >
