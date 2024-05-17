Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA518479
	for <kernelci@lists.linux.dev>; Fri, 17 May 2024 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715959785; cv=none; b=dKhpuyByAx3ZLvIe64x/o2UNQ1sTWdQL6+T1+/fgfDDxI4z/oO1fNKe+dTzlGdtsQ+VR+8jiWLcRqkpC159Sx6IUn3BflwLtqjzNRsCOD/ZWzVVyeOzqZUJQ8XEPtUocgxb4Q0P5c+KUcF4dNbRk4cx2qt1GQFGAWl6Jsl0jZoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715959785; c=relaxed/simple;
	bh=OFstqyCteL+0Cj+mhp5wY6MWUuNYdBQFBSWAdlSKDwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSbMh0/JsE7OoFbNMglt/p069spQne/rU0E+7OI87pevO5/RsVXCEb7oVNUN2Qh0ih3xEbY5/sG7iD4l178cmrcc/ndjiars5MLx7QL5Nxz07WQIoprNUDt9zked42XcBW5OWsH9oaI6LAvQ4jbnqQd3D+0bo20Ew8bDWOWbrEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUJ07dFF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUJ07dFF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso19019a12.0
        for <kernelci@lists.linux.dev>; Fri, 17 May 2024 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715959782; x=1716564582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFstqyCteL+0Cj+mhp5wY6MWUuNYdBQFBSWAdlSKDwk=;
        b=qUJ07dFF9yeZ2o0MpjfXT66R6MkKMWzxZkFMWojleNbVeQdAXrzQPf0I5fspx/NGXW
         CMmdmP6KoP5djaqB15skMoJsF3MaQwgbAwzrZY3FoYAEYAAS3kDFTakQ9Jr5dB6zaDyg
         NodgKaPsJFkBBc6bPMSEXJgt20ALfiN4odyBI/XVp6cawt0bFksmUDGD3pwRptEAEdnJ
         wZsY5SviP6vRDol6v7w6o3sc/d9/nuuQ8fytfWpQtwCWJJKvaym2u5DJ4KOCuCxzujIH
         9Da/gUIuwqeIlFc+9KFFucVj+HMNCB4F2Fuv6bQ06kUGIToBNFkhqm8T89mrqbcoOpIG
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959782; x=1716564582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFstqyCteL+0Cj+mhp5wY6MWUuNYdBQFBSWAdlSKDwk=;
        b=m7EgUZ+OvYJLSHC9AgEh0HmVP0QgHIB+S1bBamsSYYe+1d1cZUngrRrsp5HcIT/4Fu
         NY/lrEYAjEU0wWCmiHFJEecRwMLOLL4iCQMpDQ4+7CEUZQxJohvIxGAjEwJMg1dBQA/O
         aNKkSQCS8VwCB6oQ5bh+EuDFKkQqidlMA/H6S0egmt34hl79q+z4DJDw4Kf6/IbGCrF0
         y2WMWWYcxpdtiOhiSuCMs7z60nncNLmJqUuOVUgxtqWel1V/eczVYFXj5Im4CXPtoWjE
         8zSx/FnFL0kveIvehbAcf+CdFXY3PcEGkIGuQW19/P3m0THuSUoB1NbGonApXIyCqSo/
         x5WA==
X-Forwarded-Encrypted: i=1; AJvYcCWVxazrAi7Rt+ejpmSvaAoGQ12GKwJHLIpn/MGAJS9gI5dzwK6gkdE/2n1JVEwAqRtugyo7Pl56WKQDH+Z9tIqhNFc2nm82d3s=
X-Gm-Message-State: AOJu0YyiHLmhVOqwXB99cM/rracPLey7twV+gLwWRz/eWo+5LDMdYlQj
	uxJwA8KZsxgdmH1vof7onKwVFzzNBzUxaoG3YrdchgfenpG9Dgkt0rDftubX8YJq+t5WnJuYv/r
	Ca0nKUDMuALsQlmXFGMHiu0B/tF8ik6uKRZfBfBZXctKcqbg+IZ8o
X-Google-Smtp-Source: AGHT+IHeF/SO/OjeGNWAm7OvFiD+XRWIiz/+cFyYxUKkT9FCBpS2QVdTugAqh3AQIclaL+eIYn1RuOL7ovMKKzw01WE=
X-Received: by 2002:aa7:d495:0:b0:572:57d8:4516 with SMTP id
 4fb4d7f45d1cf-575186ecd47mr208250a12.2.1715959782214; Fri, 17 May 2024
 08:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
In-Reply-To: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 17 May 2024 08:29:28 -0700
Message-ID: <CABXOdTdhkEADZO2YXM_RPdLooo7Lo9=WqsWS1euXxKqFLE6g9A@mail.gmail.com>
Subject: Re: linux-media checkout failing for KernelCI
To: Gustavo Padovan <gus@collabora.com>
Cc: linuxtv-ci@linuxtv.org, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, Denys Fedoryshchenko <denys.f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 6:41=E2=80=AFAM Gustavo Padovan <gus@collabora.com>=
 wrote:
>
>
> Hi Media maintainers,
>
> We are struggling to use the media tree, in the same way we usually
> virtually all other trees in KernelCI. The following commands gives
> KernelCI a fatal error.
>
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> cd linux
> git remote add media https://git.linuxtv.org/media_tree.git
> git remote update media
> git fetch --tags https://git.linuxtv.org/media_tree.git

Why not "git fetch --tags media" instead of the last two commands ?
That is working for me, and it is what I always use when fetching
remote repositories.

Thanks,
Guenter

> fatal: Couldn't find remote ref HEAD
>
> We are in the process of enabling a lot of testing for media using
> fluster/gst and the ChromeOS Tast PlatformDecoder tests. I am not a git
> behavior expert, so we want to start this thread to discuss possible
> solutions as the media tree is for some reason deviating from some tacit
> standard.
>
> Thoughts?
>
> Best,
>
> - Gus
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
