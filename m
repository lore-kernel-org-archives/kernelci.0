Return-Path: <spbnick@gmail.com>
Message-ID: <8cdcae43-f16f-b286-8bb3-276597d493d5@gmail.com>
Date: Tue, 7 Jun 2022 16:43:01 +0300
MIME-Version: 1.0
Subject: Re: #KCIDB v9 release
References: <a707847a-73a3-af9a-96d1-070cd294dbe8@redhat.com>
 <CACT4Y+ZKPRZmUhKpSzfH4qQX7EQrN_Nf4038K47PGRd1YM=D8Q@mail.gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
In-Reply-To: <CACT4Y+ZKPRZmUhKpSzfH4qQX7EQrN_Nf4038K47PGRd1YM=D8Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dvyukov@google.com, Nikolai.Kondrashov@redhat.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, syzkaller <syzkaller@googlegroups.com>

Hi Dmitri,

On 6/7/22 09:11, Dmitry Vyukov via groups.io wrote:
> If we upload "log_excerpt" with crashes, does the dashboard allow
> users to search for substrings in the "log_excerpt"?
> Namely, if we upload whole kernel oops as "log_excerpt" (that would be
> the intended use, right?), will it be possible to find all crashes
> that contain a given function name?

At the moment the dashboard doesn't allow that, but it shouldn't be too hard 
to add support for such filtering. I think I could do that in a couple hours work.

So, please go ahead and send those excerpts, and I'll find some time to add 
that filtering.

Thanks!
Nick
