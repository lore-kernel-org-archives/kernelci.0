MIME-Version: 1.0
References: <CAHRSSEz9mSKcgUznGRsED4W4nTP6r5OH5sHL1Q4Nq9Jp5Ld+YA@mail.gmail.com>
 <13817.1643859357948628611@groups.io>
In-Reply-To: <13817.1643859357948628611@groups.io>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 3 Feb 2022 08:02:15 -0800
Message-ID: <CAHRSSExzb=nr45mm3u2M2OBX2+rPte=PoCBq6ZdvG5jiVORR9g@mail.gmail.com>
Subject: Re: please drop deprecated android kernel branches
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Alexandra Pereira <alexandra.pereira@collabora.com>
Cc: kernelci@groups.io

Thanks Alex. Looks like I forgot to include two more: android-4.9-p
and android-4.14-p. These should be removed too -- but there is no
urgency.

Should I start self-serving via that github site?

On Wed, Feb 2, 2022 at 7:36 PM Alexandra Pereira
<alexandra.pereira@collabora.com> wrote:
>
> Hi Todd,
>
> On Mon, Jan 31, 2022 at 03:49 PM, Todd Kjos <tkjos@google.com> wrote:
>
> >
> > The following branches are now out of support. Please drop them from
> > kernelci build/test:
> >
> > android-4.4-p
> > android-4.4-p-release
> > android-4.9-p-release
> > android-4.14-p-release
> >
>
> I've made this PR accordingly: https://github.com/kernelci/kernelci-core/pull/1021
>
> It should get deployed in production on Monday.
>
> BR,
> Alex
