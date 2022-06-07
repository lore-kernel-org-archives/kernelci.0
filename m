MIME-Version: 1.0
References: <a707847a-73a3-af9a-96d1-070cd294dbe8@redhat.com>
 <CACT4Y+ZKPRZmUhKpSzfH4qQX7EQrN_Nf4038K47PGRd1YM=D8Q@mail.gmail.com> <8cdcae43-f16f-b286-8bb3-276597d493d5@gmail.com>
In-Reply-To: <8cdcae43-f16f-b286-8bb3-276597d493d5@gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 7 Jun 2022 16:35:19 +0200
Message-ID: <CACT4Y+Zf7iGdB-Ex4TziNz2c-4w+n7H-ikgoEjJ=RGEjLKnMUg@mail.gmail.com>
Subject: Re: #KCIDB v9 release
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: kernelci@groups.io, Nikolai.Kondrashov@redhat.com, Guillaume Tucker <guillaume.tucker@collabora.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, syzkaller <syzkaller@googlegroups.com>

On Tue, 7 Jun 2022 at 15:43, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>
> Hi Dmitri,
>
> On 6/7/22 09:11, Dmitry Vyukov via groups.io wrote:
> > If we upload "log_excerpt" with crashes, does the dashboard allow
> > users to search for substrings in the "log_excerpt"?
> > Namely, if we upload whole kernel oops as "log_excerpt" (that would be
> > the intended use, right?), will it be possible to find all crashes
> > that contain a given function name?
>
> At the moment the dashboard doesn't allow that, but it shouldn't be too hard
> to add support for such filtering. I think I could do that in a couple hours work.
>
> So, please go ahead and send those excerpts, and I'll find some time to add
> that filtering.

I was just considering possibilities. I am not ready to send excerpts
right now. It will require switching to v4 of the API as well, right?
We are now on 3.0.
