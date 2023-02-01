Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC438483
	for <kernelci@lists.linux.dev>; Wed,  1 Feb 2023 18:18:51 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bp15so30516834lfb.13
        for <kernelci@lists.linux.dev>; Wed, 01 Feb 2023 10:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJAq7tBoWKh2Q3dQAEpPs/XDgFAl02Uxs1z+RjamLUQ=;
        b=S5cxsqwl1aAKryJ4KVobQDJIVhEKaUwsImYdlNl7g31LXUWFYMLDtHqsJKjZhd7yTN
         04scoKnCwhmMn6B9JZ1GmP+K4nLcFD86UQRniIP6le5XTqRPoRPm4GTALrwh3FNdlBgL
         BRYAJuN0FkQShCpWmp35EdDawwNuMiv78H6bP6J/8Zf6V9/IM0bdBN/NjW3AZYFl6geF
         jU9OEg/zJgjjrL+A+hD8hZdODpCJcVKTypwpdPuXbM8GGvT6u2EsK2wHWQu2SDyJm4qN
         a4EGrvFVkPHUdlbMFekBFIbGHX51x6pAmfurWqAgTEUbJQOOthKpK3cbAmFAZvNg9bVP
         zQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJAq7tBoWKh2Q3dQAEpPs/XDgFAl02Uxs1z+RjamLUQ=;
        b=6URuGDFAFwOfHbLAq9Sf4/z1uasVk/33AzU87uX3OQ1hj5ZNMzs4cLavbZQYUhhj8z
         71YdrqqWZ4iNzJbK15XaMoKhYPzrp0a4AIkwo4QHGi9C4IPzLOvu4oRTW8TcJNljH4xd
         szmGAHTHDKeK/xrq2H9xi5cA+uHEa/QF6Xq+muE0K8iezLrRKPVo9DZfjr6u5Wxfex7P
         FiHtMQe+FOsks17igkCGyQDTooq6GeZbDu4DLTSs/0ik8rmu8KyUeC7y0Y+L6Qrj8DcH
         XX5/tFi+W7yK5zwthPjnOUdNuwE4XnCsOQ+dBnynZugO6vecL1XurEYDguAolPFtI5Kj
         Iw6Q==
X-Gm-Message-State: AO0yUKWAka5IMyHA7b2C4ILd/kFykSuDOI74ffTvAbRdenC5Qal8pQzD
	1fL+6KizmOt4Xh1r2hOniGX2bPX7xPjI81kREBhmGg==
X-Google-Smtp-Source: AK7set/isBf/NzHkltR0EG2RuL/euTw2oLb9jn50aR+Tmeh//E2GaSPGcTPLmzPIDzPSukzuG62h3nMETijqwaY9fD0=
X-Received: by 2002:a19:ca41:0:b0:4b5:2830:8998 with SMTP id
 h1-20020a19ca41000000b004b528308998mr609097lfj.267.1675275529228; Wed, 01 Feb
 2023 10:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
 <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
 <CAHRSSExO0ZvPHj3z6SedhCpmZxYWpBR0nDgCPUNFkY4bqodgtg@mail.gmail.com> <9f49d95262ba1a092f91e2e21cc65f9fcc8ab18a.camel@collabora.com>
In-Reply-To: <9f49d95262ba1a092f91e2e21cc65f9fcc8ab18a.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 1 Feb 2023 10:18:35 -0800
Message-ID: <CAHRSSEw0D9nYg2jHLNtWXMZHqR29gtk8qnNr181NuBt=_MTQAg@mail.gmail.com>
Subject: Re: Please add android14-6.1
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@groups.io, kernelci@lists.linux.dev, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

[non-HTML version this time. Sigh.]

According to the bug, this is blocked by build capacity issues... you
can delete android-4.9-q, android-4.14-q, and android-4.19-q. Does
that help with capacity? We'd really like to get our 6.1 kernel into
the tests...


On Thu, Jan 19, 2023 at 6:14 AM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Hi,
>
> i will take care about that, will post progress in:
> https://github.com/kernelci/kernelci-core/issues/1659
>
> On Wed, 2023-01-18 at 16:08 -0800, Todd Kjos wrote:
> > Any progress on this?
> >
> > (sorry if you got this twice - 1st one was sent with rich text and
> > rejected by lists.linux.dev)
> >
> >
> > On Fri, Dec 16, 2022 at 12:17 PM Todd Kjos <tkjos@google.com> wrote:
> > >
> > > +kernelci@lists.linux.dev
> > >
> > >
> > > On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com>
> > > wrote:
> > > >
> > > > Please add android14-6.1 branch to kernelci testing.
> > > >
> > > > repo: https://android.googlesource.com/kernel/common
> > > > branches: android14-6.1
> > > >
> > > > Thanks,
> > > >
> > > > -Todd
> >
>
>
