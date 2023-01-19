Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160E179
	for <kernelci@lists.linux.dev>; Thu, 19 Jan 2023 00:08:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id c3so488389ljh.1
        for <kernelci@lists.linux.dev>; Wed, 18 Jan 2023 16:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4SygOQLQWkscppQKt3jB9P99J7nX+9Lykf4ZuG0hH0=;
        b=rHbJhrCk2jb6mLe6Yqs5Y+kT2/rjCoVxmNgaNl4wOY9OI5P81aPauZZYPeL6ZZ7W1w
         q+wJbVcFyuhTMLk8cB8//GX8t9qdkSUEF/VDB8Ft+cTo+OPDl/sIvs2F623B8iEgjVDa
         I8wTiUaHEsjk+t+T66SpOB//WN1Hkwe9qPrzkbNAwJBo6Ldc9MZFo577tmZ9QSbaZPeK
         nevp/WTYbgCFUYrZ06FjHEd//qycBZnxKg8RMfe+axzLL0uIj6yLrbs6whv03Ykis7Fl
         gj/chHQ39/4Qt4GUNmO+O53zI0PN2nEqgOvTUpc9HLVEkZOhzzU8lIwUgX8uVVQCABUi
         y4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4SygOQLQWkscppQKt3jB9P99J7nX+9Lykf4ZuG0hH0=;
        b=d6uzvCiVsCAr0Tc6m5SuldNzHUHNEkDwjTr3prUiUD6NQnFkas4Hd1yjp5ACbJ/CKk
         9RQbZQmpAlS+HfATRnGxwwTtdJvGOylx4OM5hys/d0/ruE+sqZHBJf+DAnRGcymNJevG
         uqP1YfR4hlkySZll0NcpsSCspI7W5rJebCpIvOW17lr468ypveGqBY2ohAelYqGv1Cgm
         apLssnz1dtS+CjLD8/j0eY5QsV/OJBDPlw30CH6iBsvd1a3PB/gxvXtb/a4+XPkrqavA
         nGs7h9aOjcI1UgDW8GL32ANeFPA6MNUGZa+dMXyqGpLMHlGHKiS+kqXzuzymp2GBCBLq
         2b+w==
X-Gm-Message-State: AFqh2kqQvVr15nG7EJ4uIYsdLpXyt/uLL4scVT7VUMuw5U+YaKVQ6POS
	MLHJqVvu/lsIqN/tkUDdPz2+nB5pzhaUmb6UK5YGnQ==
X-Google-Smtp-Source: AMrXdXvxmjQTr4Nsph9U+I9y09H1INAb5ilfDSD2FWeIEeUcchAWCzpHxhWbyZLm/ycq8dVEMRRYvURfFq7rfYhxVgI=
X-Received: by 2002:a05:651c:10ba:b0:28b:8515:e148 with SMTP id
 k26-20020a05651c10ba00b0028b8515e148mr549136ljn.62.1674086919742; Wed, 18 Jan
 2023 16:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
 <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
In-Reply-To: <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 18 Jan 2023 16:08:27 -0800
Message-ID: <CAHRSSExO0ZvPHj3z6SedhCpmZxYWpBR0nDgCPUNFkY4bqodgtg@mail.gmail.com>
Subject: Re: Please add android14-6.1
To: kernelci@groups.io, kernelci@lists.linux.dev, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Any progress on this?

(sorry if you got this twice - 1st one was sent with rich text and
rejected by lists.linux.dev)


On Fri, Dec 16, 2022 at 12:17 PM Todd Kjos <tkjos@google.com> wrote:
>
> +kernelci@lists.linux.dev
>
>
> On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com> wrote:
> >
> > Please add android14-6.1 branch to kernelci testing.
> >
> > repo: https://android.googlesource.com/kernel/common
> > branches: android14-6.1
> >
> > Thanks,
> >
> > -Todd
