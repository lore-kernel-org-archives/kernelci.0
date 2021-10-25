MIME-Version: 1.0
References: <4fe6b129-4ce9-fcac-112c-42d9b8094999@redhat.com>
In-Reply-To: <4fe6b129-4ce9-fcac-112c-42d9b8094999@redhat.com>
From: "Vishal" <vishal.bhoj@linaro.org>
Date: Mon, 25 Oct 2021 21:07:21 +0530
Message-ID: <CAKdWgSzBC2=yXCqfFsgJSctG52=B=kk=XizcBh=XM38MjoXveg@mail.gmail.com>
Subject: Re: Tuxsuite sending impossible commit names to KCIDB
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io

Hi Nikolai,

On Mon, 25 Oct 2021 at 20:16, Nikolai Kondrashov <
Nikolai.Kondrashov@redhat.com> wrote:

> Hi Vishal,
>
> I've just noticed that tuxsuite is sending impossible values of
> "commit_name"
> revision fields to KCIDB. Please see one example attached.
>
> The revision specifies the "commit_hash" to be
> "87066fdd2e30fe9dd531125d95257c118a74617e", but the "commit_name" is
> "v5.15-rc6-240-gda1a4fdec89b".
>
> The commit name output by "git describe" is supposed to contain the
> shortened
> commit hash on the end, after "-g", and this commit name contains the
> shortened hash of another commit, which doesn't seem to exist in the
> referenced repository at all.
>
> Could you check what's going on there, and perhaps fix this?
>

Thanks for reporting this. I have fixed this in our backend. We have
support for users to apply patches on top of the kernel tree which was
causing the issue. I have now blocked such data from being sent to kcidb.


>
> Thank you.
> Nick
>
> P.S. Your fix to the "config_name" seems to be working nicely, thanks!
>

Regards,
Vishal
