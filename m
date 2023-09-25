Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0931CAA5
	for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 15:18:00 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-418157e979eso826631cf.1
        for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695655079; x=1696259879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrO6l8OBYTmWcm2ZmRwnuewnxrp4i2XW5gSO0aqig3w=;
        b=EhRtM6PkvwDDSMH0GwjePPkaYuSJJUBEdzxY149EGCMK97E0XNttJrDnDtrw3rXtzL
         9LT7JsnEoX2StvSIo/5BsnDIzbkinzByDlb1zI9JKXbimAuXHIQEf9nH18QWbBQO+TNb
         VLc16pK0/t2pgeupOq/UJlnCOWqcK2ljX/aaz0OE9wVwNnaxbo2kMJB3B64FOBRS7DW0
         2xvUITrlj7khkx91aKCJJFoMzGsoK3zmHMkqI5Z7k6yNo50Q5o2H5t82LCbninWqeMS4
         YuVK5HaJ9OvR0chivGq4li0+uaGFJqQ9xqz2V2owXcqIEnu/BxO7+Q2Y+5zCm1QFiu+u
         ufyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695655079; x=1696259879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrO6l8OBYTmWcm2ZmRwnuewnxrp4i2XW5gSO0aqig3w=;
        b=cX1Ml1+i01XCX65NRPvbwg9SiTS+M97L/IbmFSuRQvgTz63NK96YN3OCprroWFTZFX
         1WNrqK4vQp4GGnSfxPNPhfk6gm0Z18MKx94K25iL91LQr7E8UhDUASMeE8wwQvRcphVA
         tk7BZOQA5Sw66F578CKgyCeNG01loUm4pE5MeZI7zGW9Ytk+icANguRvmXAB7B5VyCcQ
         7s4DZwYD6JNEuQlXpVWmpCmPLqZIz1ZbmUr+bIUn8eSIBfIr7KeZaGLTp8p4JTByMVkG
         3ZQPc6iTesoca5SB2rxz0iSZqlAbEY/ida8oBJNhqh+lz71uhknySXbXR3SFnGVtLKcV
         DcFA==
X-Gm-Message-State: AOJu0YyJwN57pmzFsQDTVAdPSZ+SMW4JKeiNUvC8zaoTu1RXPIGQL2Ap
	DiSbDgO0l2VSdk0534makTk9l53NQ/MJejCW6fEyFfg1nPBQv67bICU=
X-Google-Smtp-Source: AGHT+IE/DwieIVSWkfYymcHg2d3ZC23mA0xsdvWjGPRJ51ULTLmFBugbN2eDxjrzR/ryx2f9VB8eaA4G+m0RW4CdEsE=
X-Received: by 2002:a05:622a:296:b0:403:eeb9:a76 with SMTP id
 z22-20020a05622a029600b00403eeb90a76mr309359qtw.17.1695655078883; Mon, 25 Sep
 2023 08:17:58 -0700 (PDT)
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
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com> <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
In-Reply-To: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 25 Sep 2023 08:17:47 -0700
Message-ID: <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 1:22=E2=80=AFAM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 20/09/2023 00:54, Todd Kjos wrote:
> > Guillaume,
> >
> > How about this for android trees:
> >
> > 1) same compilers as current config (gcc-10, clang-14)
> > 2) archs: arm, arm64, i386, x80_64, riscv
> > 3) same configs as current android tests
> > 4) plus configs used by corresponding stable kernel
> > (https://linux.kernelci.org/job/stable) not included in #3
>
> OK thanks, I think we can set this up easily.  We'll get back to
> you if there's any ambiguity.
>
> > We get a nice benefit from sync'ing with the stable kernels since it
> > allows us to tell which issues originate upstream and which are
> > introduced by android changes. It's also useful to build each with
> > both toolchains so we can expose the cases where gcc-10 is OK but
> > clang-14 has issues (and visa-versa).
> >
> > I don't think we need to build all of the combinations if there are
> > too many builds - we could trim out some of the configs from #4 (you
> > can recommend which).
>
> OK, we can look at past results or optimise incrementally over
> the weeks to streamline the overall build coverage.
>
> > We'd also like to start in an all-green state. So let's trim out the
> > error cases that aren't caused by android kernel code. I think there
> > are some 32-bit cases that fail with the clang-14 tools and some other
> > cases that fail in stable.
> >
> > Could we start with all of the builds for #1 - #4 and then tune it up
> > after a few runs to get rid of long-failing cases and/or to just
> > reduce the load on the build service?
>
> I believe this part of the discussion is still unresolved with
> Nick, and maybe it would make more sense to address this when the
> builds get moved to the new API where we'll have more flexibility
> and more accurate log parsing etc.
>
> Another aspect that wasn't too clear in the discussions, should
> it be clang-14 or a more recent version?  Right now, mainline
> builds already include clang-11 (oldest supported one) and
> clang-16 and linux-next builds use clang-17.  So there is
> upstream build coverage for them, and if clang-14 is the standard
> version for Android kernels then I guess it would make sense to
> stick to it - but that's up to you.  Doing both clang-14 and
> clang-17 for Android builds would seem overkill to me though.

I'd be fine with tracking the latest stable clang version (clang-17
now) and dropping clang-14 so we can help the clang team find
regressions.

>
> Cheers,
> Guillaume
>
> > On Wed, Sep 6, 2023 at 12:50=E2=80=AFPM Todd Kjos <tkjos@google.com> wr=
ote:
> >>
> >> +Viktor Martensson +Betty Zhou
> >>
> >> Guillaume,
> >>
> >> I think that's a great idea. I'll get back to you with the set of
> >> configs, arch, compilers we'd like to have coverage for.
> >>
> >> -Todd
> >>
> >>
> >> On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
> >> <guillaume.tucker@collabora.com> wrote:
> >>>
> >>> Hi Todd,
> >>>
> >>> On 05/09/2023 19:18, Todd Kjos wrote:
> >>>> On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google.com>=
 wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guillaume=
.tucker@collabora.com> wrote:
> >>>>>>
> >>>>>> Hi Todd,
> >>>>>>
> >>>>>> On 11/07/2023 00:41, Todd Kjos wrote:
> >>>>>>> Please add the following new Android branches to kernelci testing=
.
> >>>>>>>
> >>>>>>> repo: https://android.googlesource.com/kernel/common
> >>>>>>> branches:
> >>>>>>> - android15-6.1
> >>>>>>> - android14-6.1-lts
> >>>>>>> - android14-5.15-lts
> >>>>>>
> >>>>>> I've created this PR accordingly:
> >>>>>>
> >>>>>>   https://github.com/kernelci/kernelci-core/pull/2002
> >>>>>>
> >>>>>> Please note that we're now operating with reduced build coverage
> >>>>>> due to some temporary limitations with our Azure subscription.  I
> >>>>>> know the Android kernel builds should be covered by the GCP
> >>>>>> clusters but right now the system is designed to distribute
> >>>>>> kernel builds randomly across all clusters so we can't easily tie
> >>>>>> Android builds to the Android clusters.  Hopefully we'll find a
> >>>>>> solution to go back to normal coverage within a week or two.
> >>>>>
> >>>>>
> >>>>> Hi Guillaume, Any ETA for when the full set of builds is restored? =
We still have greatly reduced build coverage and it's been a month.
> >>>>
> >>>> Ping. We are getting a lot less value out of kernelci with the great=
ly
> >>>> reduced set of builds for the Android kernels. When will the full
> >>>> build coverage be resumed?
> >>>>
> >>>> If it needs to stay reduced, can we decide precisely which builds ar=
e
> >>>> done for Android kernels?
> >>>
> >>> Sorry for the slow reply.
> >>>
> >>> I think it's fine now to re-enable the Android builds and maybe
> >>> we should also take this opportunity to confirm which ones are
> >>> the most relevant to you guys.  As part of the process of
> >>> adjusting the build coverage, I also fixed the GKI builds which I
> >>> thought were the main ones.  Even if there is enough build
> >>> capacity to build "everything", keeping it streamlined to what is
> >>> really useful makes the overall system more effective.
> >>>
> >>> Are there any particular combinations of arch, config, compilers
> >>> you care about more than others?
> >>>
> >>> Thanks,
> >>> Guillaume
> >>>
>
