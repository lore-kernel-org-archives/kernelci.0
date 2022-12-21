Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C428FC
	for <kernelci@lists.linux.dev>; Wed, 21 Dec 2022 17:07:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id bp15so24386663lfb.13
        for <kernelci@lists.linux.dev>; Wed, 21 Dec 2022 09:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mQK8VsvOQhWqZCWELAhvAOyh9zj6YAZ9Cq7/go5FQ7E=;
        b=K4xd3jbrvPnOOYziMO5UTEvtakN0/5YI86UDkgOtWjEd4B4drnEun3moa+Ep2ZLUnu
         VGmB0wKd/L1PCm/gx7922HFO+v3TjNcR3rmb/7lKLk7F12T2VtYJfVZ0a8vHU+oswW3T
         zVBzcNXtQMlD8h/LnA7+FxeHH9BE6wR+urw1+4CAwhIBDh+2AJQVoN+7wNU8DJ8vgSah
         IrxXi41zaa1+VeuR6ENIxUYiT4LPVn303EuYn5uWoe8skh7cJ7U8Rir/ntD5akvU/X3M
         EUFJrIQCa2UMGBB5jLx99lhSL4m1zgiYm4VrAeKc2QGHmMph2Z9+SO3731kQZDyt6mwc
         qmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQK8VsvOQhWqZCWELAhvAOyh9zj6YAZ9Cq7/go5FQ7E=;
        b=sfY0OS1vxl8GZlrH0gYLU29vyVzk2B21vUbqvZOOtJBwA6DHOlnxpvvtQDe800Bj21
         pr6x9Iq24pKda6Z0lNdPYFJ9jSIvW2yWDiJWqbEOLTANmtnr73abSHmt334Znisk6lX+
         a2BKYrYu1azZ1s/kTRJnA2mi3KYkT0DT8+an5cV/UyTgn0txi3kWzhghVP71QUFVfKc7
         giee7r6/1EWvb15pj+komVsd4AO7Sxcbn9/dBdPhegTTEtYtPgkfn7qNx2zsqg7zTgQz
         BXVubye18WkvK2XpLDZqkIDyzGjdRXIYB3rZh86fjRAqEwZ5ayga0M7TiDIy16kL+uXR
         5btw==
X-Gm-Message-State: AFqh2kpB3k6iMdf3P7/UXTzpJUl1QWwpp63fN5y5kZhYWpSUnjtngB1S
	/l/TsUuJn0kevFfDmGj0mcOe76Mn05odKYmYuQNYOQ==
X-Google-Smtp-Source: AMrXdXvA3/FQlS9B1UMdfHpUcqBuwIusdeYPddZjUi54OIlGW8Nu56RP+/NMI40M5PW4a4qYare5AgcGrB9LAM14pTA=
X-Received: by 2002:a05:6512:3c8e:b0:4ae:5b4d:b124 with SMTP id
 h14-20020a0565123c8e00b004ae5b4db124mr131906lfv.261.1671642440726; Wed, 21
 Dec 2022 09:07:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEybbLKQvco=EWqnQmSihhqB7u8_SsZOnmuB=7KYiWFAig@mail.gmail.com>
 <CAHRSSEwTjFNRvQ8O2+d4F2uNdh9NTbGgCGQY080qTPhTSAaacg@mail.gmail.com> <196909140b94ca61e15b555335221127c8a3f650.camel@collabora.com>
In-Reply-To: <196909140b94ca61e15b555335221127c8a3f650.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 21 Dec 2022 09:07:07 -0800
Message-ID: <CAHRSSEzixTQ8SJGAWAmcd=OaPQKRd0AZKJcwouG7SLYO4-k9cQ@mail.gmail.com>
Subject: Re: Please add android13* LTS staging branches
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@groups.io, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yes, sorry about the noise. Thanks for adding them.


On Wed, Dec 21, 2022 at 7:25 AM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Hi Todd Kjos,
>
> As i know they are already added and being tested:
> https://linux.kernelci.org/job/android/branch/android13-5.15-lts/
> https://linux.kernelci.org/job/android/branch/android13-5.10-lts/
>
>
> On Fri, 2022-12-16 at 11:47 -0800, Todd Kjos via groups.io wrote:
> > +kernelci@lists.linux.dev
> >
> > On Tue, Nov 15, 2022 at 5:38 PM Todd Kjos <tkjos@google.com> wrote:
> >
> > > Please add android13-5.10-lts and android13-5.15-lts branches to
> > > kernelci
> > > testing.
> > >
> > > repo: https://android.googlesource.com/kernel/common
> > > branches: android13-5.15-lts, android13-5.10-lts
> > >
> > > Thanks,
> > >
> > > -Todd
> > >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Groups.io Links: You receive all messages sent to this group.
> > View/Reply Online (#1627): https://groups.io/g/kernelci/message/1627
> > Mute This Topic: https://groups.io/mt/95061589/6902820
> > Group Owner: kernelci+owner@groups.io
> > Unsubscribe:
> > https://groups.io/g/kernelci/unsub [denys.f@collabora.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
>
>
