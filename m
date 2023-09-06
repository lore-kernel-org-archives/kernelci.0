Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F36AB1
	for <kernelci@lists.linux.dev>; Wed,  6 Sep 2023 19:50:38 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-414ba610766so74491cf.0
        for <kernelci@lists.linux.dev>; Wed, 06 Sep 2023 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694029837; x=1694634637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FKUwpNIUXYx7QlhKDwtnnhzuuB6bVtaYvWdoc+MGFE=;
        b=B9Zbs5UZmpOPdTNUl5ILRe3YKl71xI6l43kpJ8W4qvsLagmmnSk/hDwtzi05azNvZO
         SWxmhPTTPaBWmTUTRfYasjoCJcWDaQ4fc761QWO0ZCUVmRZLBD8NdR/JPi98UY7g6z/D
         jEqS+gbfArIbp9v+xJHqyT0FoM2oHBdr8ciLXFIMhQZoc9x70hhc7zdtCZJ8wpp53Fa0
         43PQ8faGikLH7oDhUUTrc7AgxwEZmJUQFBICjkalEEr3K652n+qNICTUk21Rse9INX7V
         EkK3cu+JJM8RjI8hBaLF7Gj+yfBuTYW/o9ywAX9ShivOP+UMoIvvIW5jfsxVySyvRXaj
         ienA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029837; x=1694634637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FKUwpNIUXYx7QlhKDwtnnhzuuB6bVtaYvWdoc+MGFE=;
        b=E50OVbHBfR7xozvask+RISLEENJ/ToHACKx/CAWtTMEGyEPILtYIh0UubWdpahcjRy
         EZ/VjDe5FGu9Kj6faSZ49fYsATmCHkjpbhcLlwOML6PLsemn80XayX+aTP9J3JKaBpZh
         n+1aWPtmnxGy0sxVukXiRTVGohLSHCLbe/D/AwkaiT2Q5oFyDQtwOh/l0WAvHZTybMPO
         QXRkYJQgsBuaDHQ7Yp4A6/ymELYhvptKhAjbJ4T4TA1rGGeg6lNfv1BCDj4vVrBCItdJ
         RBmNQCAXsPDWpWTkzI/DJ/cm2IjqQcRq95wzS0KdNWFZNbUg/D8nuMprOPTRUb4TdFEj
         dktQ==
X-Gm-Message-State: AOJu0YyNICkJ7Q0DrqwFLly0/dM0F5yLNRjdjENzT34xYAVJCKapU0O7
	si6LB6U0DVgB+107P2uQquMyx4pbi7pC0yQojtHucg==
X-Google-Smtp-Source: AGHT+IFya7SvbAr/IpndK4R84OGXwA1/WGUVMFcY8l80JKnht811ulI5F8h3n74BO5kfh0h8YpLtK9x+A43/XpU+NuA=
X-Received: by 2002:ac8:5b4d:0:b0:3f6:97b4:1a4d with SMTP id
 n13-20020ac85b4d000000b003f697b41a4dmr42777qtw.23.1694029837279; Wed, 06 Sep
 2023 12:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com> <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
In-Reply-To: <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 6 Sep 2023 12:50:25 -0700
Message-ID: <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Viktor Martensson +Betty Zhou

Guillaume,

I think that's a great idea. I'll get back to you with the set of
configs, arch, compilers we'd like to have coverage for.

-Todd


On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hi Todd,
>
> On 05/09/2023 19:18, Todd Kjos wrote:
> > On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google.com> wr=
ote:
> >>
> >>
> >>
> >> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guillaume.tu=
cker@collabora.com> wrote:
> >>>
> >>> Hi Todd,
> >>>
> >>> On 11/07/2023 00:41, Todd Kjos wrote:
> >>>> Please add the following new Android branches to kernelci testing.
> >>>>
> >>>> repo: https://android.googlesource.com/kernel/common
> >>>> branches:
> >>>> - android15-6.1
> >>>> - android14-6.1-lts
> >>>> - android14-5.15-lts
> >>>
> >>> I've created this PR accordingly:
> >>>
> >>>   https://github.com/kernelci/kernelci-core/pull/2002
> >>>
> >>> Please note that we're now operating with reduced build coverage
> >>> due to some temporary limitations with our Azure subscription.  I
> >>> know the Android kernel builds should be covered by the GCP
> >>> clusters but right now the system is designed to distribute
> >>> kernel builds randomly across all clusters so we can't easily tie
> >>> Android builds to the Android clusters.  Hopefully we'll find a
> >>> solution to go back to normal coverage within a week or two.
> >>
> >>
> >> Hi Guillaume, Any ETA for when the full set of builds is restored? We =
still have greatly reduced build coverage and it's been a month.
> >
> > Ping. We are getting a lot less value out of kernelci with the greatly
> > reduced set of builds for the Android kernels. When will the full
> > build coverage be resumed?
> >
> > If it needs to stay reduced, can we decide precisely which builds are
> > done for Android kernels?
>
> Sorry for the slow reply.
>
> I think it's fine now to re-enable the Android builds and maybe
> we should also take this opportunity to confirm which ones are
> the most relevant to you guys.  As part of the process of
> adjusting the build coverage, I also fixed the GKI builds which I
> thought were the main ones.  Even if there is enough build
> capacity to build "everything", keeping it streamlined to what is
> really useful makes the overall system more effective.
>
> Are there any particular combinations of arch, config, compilers
> you care about more than others?
>
> Thanks,
> Guillaume
>
