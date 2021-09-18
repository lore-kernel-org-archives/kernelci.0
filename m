Return-Path: <Nikolai.Kondrashov@redhat.com>
Subject: Re: Syzbot sends URLs in config names to KCIDB
References: <73b0f3cd-a382-4f77-1d2e-e081e4e05cc2@redhat.com>
 <CACT4Y+YKgm63c8idp0o=3y1SZKOWzx4nqYduCcz78p1W5L8iew@mail.gmail.com>
 <4295a09c-17b9-1ba6-947b-c6695e564052@gmail.com>
 <CAKdWgSzy85kG-sedQiCBKRADwV_C2EP1j4B6U6ypRFB7Rjw=oA@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <d950070e-29e7-0e81-c2ee-08edde2f1dc6@redhat.com>
Date: Sat, 18 Sep 2021 08:10:54 +0300
MIME-Version: 1.0
In-Reply-To: <CAKdWgSzy85kG-sedQiCBKRADwV_C2EP1j4B6U6ypRFB7Rjw=oA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Vishal Bhoj <vishal.bhoj@linaro.org>, Nikolai Kondrashov <spbnick@gmail.com>
Cc: tuxsuite <tuxsuite@linaro.org>, syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, kernelci@groups.io

On 9/17/21 10:53 PM, Vishal Bhoj wrote:
> Hi Nick,
> 
> 
> On Fri, 17 Sept 2021 at 21:28, Nikolai Kondrashov <spbnick@gmail.com 
> <mailto:spbnick@gmail.com>> wrote:
> 
>     On 9/17/21 6:49 PM, Dmitry Vyukov via groups.io <http://groups.io> wrote:
>      > On Fri, 17 Sept 2021 at 17:45, Nikolai Kondrashov
>      > <Nikolai.Kondrashov@redhat.com <mailto:Nikolai.Kondrashov@redhat.com>>
>     wrote:
>      >>
>      >> Hi Dmitry,
>      >>
>      >> I've just noticed, but Syzbot has been sending URLs in build "config_name"
>      >> fields for a while (see attached example), whereas the field is
>     intended for a
>      >> descriptive, human-readable name instead.
>      >>
>      >> Do you think you could fix that?
>      >>
>      >> Thank you.
>      >> Nick
>      >
>      > Hi Nick,
>      >
>      > The attached info does not look like info from syzbot. It does not use
>      > tuxbuild. That's somebody else.
> 
>     My bad, Friday evening got the best of me, sorry 🤦‍♂️
> 
>     That's coming from Tuxsuite.
> 
>     Whoever is responsible for Tuxsuite at Linaro now,
>     could you please take a look?
> 
> 
> Thanks for letting us know, I have fixed it at our end now. Do let me know if 
> the data needs any improvement.

Looks good now! Thanks a lot, Vishal!

Nick

