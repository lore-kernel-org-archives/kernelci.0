Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E718EC0
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709317858; cv=none; b=udiDnCtQ6X+WdDwsnwZCqMtTo0JbxCZpPJkoFOZkJkhex7At8JRlC1th+ALdsqY6inLvZ6qlbDfTU3w03YRFzLUCnxiKr/sWM9Xh3ZoagKVQD1uaQ7Ni9RgFhe0FVaL4vxzxMbJcUzUGoJJWc91rJlAsZGfjKEvU87ZQwbBrrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709317858; c=relaxed/simple;
	bh=19cV+Owps2tnKODTEXAZBrF82UVEnrdWY1L+i13PJfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leXkvMgT2uhwo5lUqWjlCsS53zrOIZoeNCphA2qfbbzEJArnyTnSnsyGSffhx03yQo90Jv5VDTrwNJLiOoIIaoAgzhXFIiP49ltoJrn2Fbp9GUEyp64DS1naMeFA2YHWfDYaSvUdxxAsCbXD3noDRTU3MD+FeomcrppK6xSTg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IePsz2rv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IePsz2rv"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42e6939d34fso428041cf.0
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 10:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709317855; x=1709922655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdRpB0n8NFdfFwYKqNSu6d6SI+w35XhBQivcS8YUh7Y=;
        b=IePsz2rvd1B6Txh4H1+9SDgNK6JCPazWuj0zDjgBmzYJ7XTRRPBoQioHTzsVHzyRk+
         nniw9b8Irb5sbru9oXA6g23JH/uBJBA7FAR8uXJXUu+rhb/OGim7mqrXqxNkwZnTpqTe
         BjWgYZuGQ4ANttc2RW3si0ritcPEtxZTIURmCekpljCQ3Na57nni37+r/ydOyvS2OmTb
         1ZhquOWb2IIm12e26uf8tW+xRCHveLG9IqNPbDT3HksYV4Vvi1mapjMDOcNAk0RcDfLm
         TEDGKyoG302y8dy93oW03DYHOB1YgQEHMql2HlWo12cPEhVy5iZG59rWXkveKSMpCqTm
         yatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709317855; x=1709922655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdRpB0n8NFdfFwYKqNSu6d6SI+w35XhBQivcS8YUh7Y=;
        b=vfeeVetSybCJZ5MwFBAAOVHYqvv/qt3GwpH25C0IvdSinJ7Oln+rbseLbfm15mXJ/4
         ZvwIEQc5s0Gi+RX9cWJfq+JdFPMpSzbUFLp57Ws8aTSsXl0witRQ6J2FkSdi3DbIyMG1
         RN7jawdy37K4ExlEC8zLi8t6oCf9lSWs9z6WnqFL/NDLp39dOQMilLjeQdwwIZyWhRJB
         a9St0MyszyuWHJ0de3xXDW2L8AAndB5alswERTie06aJp9XjlU65kHjpNjAhs3q6p6w8
         VotG2KirLqgupnhkSyp0bO85TEWfYsPX0Anv2PYJTU3x6wHM47/VdDVUrKMKvZIF2FUz
         jTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHWmnd4bQkukVxU3tRtCWSysX5cB6JaoF9M/SA6uZugpJJ7uE0faTytSeO6s//yhpvo7mpzQubehPFlOmJnZ9vFje9pvut49U=
X-Gm-Message-State: AOJu0YzPpSpkHIObHMlfGc2wbCdynqh+OCkvxy06MbnBHsZnUdcixbbY
	u5bK5GV0v5Uyu8VFR2G4dWC/UsrpKUfGL+J1ld7u0bdtGwDwS9hZ4bw5SlK4+4E6ZcoADljwK8D
	V4GM7ZCar6b6nd2YT8PPd4UBLZeGI9lBSWGvj
X-Google-Smtp-Source: AGHT+IEm2OIGv1J4LE7R2zFzoXbvlRR9H0DSF850zuo93ASom8bf9GHCxMEa/KCFq+cVzDo6ehX9vK+FOOzGRRp8kjs=
X-Received: by 2002:ac8:4d5d:0:b0:42e:7ea1:30c4 with SMTP id
 x29-20020ac84d5d000000b0042e7ea130c4mr225205qtv.14.1709317855189; Fri, 01 Mar
 2024 10:30:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
 <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
 <CAHRSSEy20Zc80XufjYN4XjXbba6BTMHd_9kFaNOnhiuj9yEDsQ@mail.gmail.com>
 <YxCtqsY55Lwaj34H@sirena.org.uk> <CAHRSSEw9KqQFKZND1fmMa67btkozg0yA_0NjF8C=UiLnvfwHGA@mail.gmail.com>
 <YxXkuTdnt4IbPMDC@sirena.org.uk> <CAHRSSEzgEyPDxZ64SUdJNZRU3YAxS+mJcfVgG4-cSjjuTsH0Xg@mail.gmail.com>
 <9b4773cc-f68c-4e34-4688-92c968bfb66c@collabora.com> <CAHRSSEyrJeru4YKoAFUo2Ai1dmxQAxRTJ1gnAuY1OmxohF=5Gw@mail.gmail.com>
 <CAHRSSEztTzwRThMc1OfpP33r-V8=bNNP3fc_LD9_6eY9Ztj6sA@mail.gmail.com>
 <ff846cc6-f5f6-c886-4309-cd1b815bbeb8@collabora.com> <CAHRSSEyEqyedEGsOfpPHso=ytHFTYHLbVGn601wDgb2LWGS7Gw@mail.gmail.com>
 <16a0b25c-c550-351d-8f76-4a31c9f509ec@collabora.com>
In-Reply-To: <16a0b25c-c550-351d-8f76-4a31c9f509ec@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 1 Mar 2024 10:30:43 -0800
Message-ID: <CAHRSSEzqZjeRc7N-r=htAVogP9-rfO_CbzmoANE+MCfGxeyitA@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:22=E2=80=AFAM Gustavo Padovan
<gustavo.padovan@collabora.com> wrote:
>
> Hi Todd,
>
> On 3/1/24 15:15, Todd Kjos wrote:
>
> On Thu, Jul 13, 2023 at 12:08=E2=80=AFAM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>
> On 06/07/2023 19:00, Todd Kjos wrote:
>
> Any progress on this? (at least doing the um builds?)
>
> On Thu, Mar 16, 2023 at 3:46=E2=80=AFPM Todd Kjos <tkjos@google.com <mail=
to:tkjos@google.com>> wrote:
>
>     On Thu, Sep 15, 2022 at 9:23=E2=80=AFAM Guillaume Tucker
>     <guillaume.tucker@collabora.com <mailto:guillaume.tucker@collabora.co=
m>> wrote:
>     >
>     > Hi Todd,
>     >
>     > On 14/09/2022 22:36, Todd Kjos via groups.io <http://groups.io> wro=
te:
>     > > Is there an ETA for at least doing the builds?
>     >
>     > I don't think anyone else is asking for user-mode builds, and
>     > adding this new architecture with a new sub-architecture
>     > parameter is not as trivial as adding a few lines of YAML config.
>     > So unless someone on this list is interested, or someone wants to
>     > run an internship topic around that, I think you'll have to go
>     > and find someone to do the work.
>     >
>     > KernelCI is starting to run KUnit which does involve UM-Linux
>     > builds but that's all done "under the hood" by the KUnit
>     > framework.  Still, I guess it would catch some build errors as a
>     > side-effect.  So an alternative is to wait for that to be fully
>     > in production (first half 2023) and we can consider enabling it
>     > on some Android kernel trees.
>
>     Is this in production now?
>
> No, the timeline for making the new API & Pipeline as the new
> production system is basically bumped to 2024.  However, KUnit
> jobs are now being run every day on our staging instance and
> we're planning to have an "early access" stable instance online
> in the next couple of months.  I think we'll get back to you at
> that point.
>
> Any update on the schedule for the new API/Pipeline or the "early access"=
?
>
>
> We are enabling the new system as we speak, but slowly with a handful of =
trees we are building and a handful of tests as a first step. We are also s=
orting out ways for to share the results, since the new system won't have a=
 web dashboard for the time being.
>
> I am getting to this thread just now, but it seems that for your need, in=
 a first step, would be adding user-mode builds. Is that correct? What woul=
d be in your scope after that?

Currently no expectations beyond UM builds. Right now the point is to
catch cases where we might inadvertently break UM since it isn't part
of our workflow, but might be part of the workflow for downstream
users of ACK kernels. We'll make a separate request if we need more
than builds.

>
> Best regards,
>
> Gustavo
>
> --
> Gustavo Padovan
> Kernel Lead
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park
> Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
