Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587925632
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709318285; cv=none; b=KmPypnAmhxJ1K328sDKJwpoFzY77AOMIvXXHbeRXeT6fQa7YqhuPjLrQ7YrwQ3XkmohmbIni5ekJ5wMAr14IoBtYb9dZE7XFkxdL0HUm3AIvqdjzHhy0ol5H7oA98g6Apq/LD71mbYA6MBEIK5oIx9VVkq0LYVBaLbCQtvAF2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709318285; c=relaxed/simple;
	bh=jfs0m8RXx1GstJu8SymCTC0WqJj1vB6ZBUhtzcL2hp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgfODFuFn0qXvhNaUSXovKRqOQg4+iMsf+egCLYRZ8Gto/7k5jE7YlLhJyB4KjKHRBWwxU4ogo15pu3TCfsbyyVb7XZWhBuHyCwJDjcbm3q1HN1ak2503n+JOcO3ZmHujp3ZNuCdWCeJwt8a3uOSapjcl7Mp1F2ff0XjkDmU6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HuzjSmfz; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HuzjSmfz"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42ecb40dc07so135521cf.1
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709318282; x=1709923082; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chsHsf/001dfP7w1ucZ9E5LxTPZwcEzE1WAej2v8Yyw=;
        b=HuzjSmfz0DoDnCKvg6SW39H+yZfmuZfgPVucGowtyyPE/OFnM5yoUUktdXr2iuXOCK
         kWQCUwEEYXIK8GCUgz92NtjNUBAd4gWWg1rWjsvUb9Q1Xha/Qo3WccEhQptyXzSLM+5P
         0sO0FITSccg6zoyeklj6YoBRP0nzFl1nYE8ZHqS/9zTlktNYG6dHIoHimt2xJLAu3RhH
         2RnwMERafB3PIZZRo2Oo6Fovy3VGRuBIFcvQV516ATtTe2iTy2zgTzU0K2L0dEu10G/I
         pXFqgyHVfOuzxvAY6TS3cm7W42j9sc6A5QmmGYT9TKHCRl9Fl2jUb2D0zEjVDwmmkB0N
         T0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709318282; x=1709923082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chsHsf/001dfP7w1ucZ9E5LxTPZwcEzE1WAej2v8Yyw=;
        b=BKeWIkVtNr6xIAVVj2/xUrLGaIs579kVnktHMZa7xwuDqLdQDJkiU2x7MJSFO6af7q
         XMLwBmSm07ngBFZWFrn+I7Ua/d6Gp9o9d8H2DcJi5XQl2eqXcmrUWXwfYfR6dMhZQTj8
         4HEFMfYrN4ON58PDeKuxLkDEAjzRuQTHMxUDl+swJM/ENpE7kWO2w/3yuW611PPVhx5J
         Md+mT8l+gOXXTVkC5jl+nGmPXPSqmG6wBJVLX5XPgevdxjRUrr+HjPimTxkKD01qmx14
         SBdvwrxCgyJCPfD2uyndO95LgRS56JXeB//dYU6Mqd44J7h9RWj4gVYqx45DFBIXlYcI
         9mrA==
X-Forwarded-Encrypted: i=1; AJvYcCVkYBs0vZLalMZMN6diqRpUBlxb01mrMCyod49PmvpOVbKTMCHNOPm31N9SjgSViRjCtXcYZDFpAMnX1bKY9rN36jNl9ADwJWc=
X-Gm-Message-State: AOJu0YzJxdrSbjI6l1TRgqkxXeUMUIdTRCt2m3s2SBBaprqqpOvYsfD5
	pr8Rv1+PCsX26i2D3sfXoFLOovo9T+rp5+XMXPj7Y0tvY02s8wMSUHi789vXH84okRaZlDKlY7q
	xz2VHmcpeuIP9gWYYEP7P2mfMpGo7JWNP5kLa
X-Google-Smtp-Source: AGHT+IFxAh+xFvG1uSJUl4GSIAKFbfcv2cbSHk9Z9g2Afx9twae1gika3Lqishbdz/6GCPpKXBu88AZid71zUW1D/W4=
X-Received: by 2002:ac8:5ecb:0:b0:42e:3233:4924 with SMTP id
 s11-20020ac85ecb000000b0042e32334924mr197297qtx.26.1709318282250; Fri, 01 Mar
 2024 10:38:02 -0800 (PST)
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
 <16a0b25c-c550-351d-8f76-4a31c9f509ec@collabora.com> <CAHRSSEzqZjeRc7N-r=htAVogP9-rfO_CbzmoANE+MCfGxeyitA@mail.gmail.com>
 <4c840d3a-65d4-8df3-9ef7-a9bb24dccabf@collabora.com>
In-Reply-To: <4c840d3a-65d4-8df3-9ef7-a9bb24dccabf@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 1 Mar 2024 10:37:46 -0800
Message-ID: <CAHRSSEwe1z7pajTmLNJRHbBv1Ghnz-siAyw4CU5kraN3_hLqpg@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:34=E2=80=AFAM Gustavo Padovan
<gustavo.padovan@collabora.com> wrote:
>
>
>
> On 3/1/24 15:30, Todd Kjos wrote:
>
> On Fri, Mar 1, 2024 at 10:22=E2=80=AFAM Gustavo Padovan
> <gustavo.padovan@collabora.com> wrote:
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
>
> Currently no expectations beyond UM builds. Right now the point is to
> catch cases where we might inadvertently break UM since it isn't part
> of our workflow, but might be part of the workflow for downstream
> users of ACK kernels. We'll make a separate request if we need more
> than builds.
>
>
> Okay. Let me see if we add yours soon in the new system. (it is really pa=
inful to add new things to the legacy system).
>
> Would you be a recipient of the build breakages? I also want to figure ou=
t the regression reporting structure.

Yes, several of us on the Android kernel team are closely monitoring
kernelci breakages. These can be reported to us in the same way as
other breakages (visible as build breaks at
https://linux.kernelci.org/job/android/)

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
>
>
> --
> Gustavo Padovan
> Kernel Lead
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park
> Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
