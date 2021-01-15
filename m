Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Please add android12-5.10 kernel to kernelci
In-Reply-To: <CAHRSSEy_a-WOm4a11iMS=hKAJk7YmAPUPV50JCAO4DnSXsOiUQ@mail.gmail.com>
References: <CAHRSSEzfP_NbK+b5M3_AAR7H7ujhdTdJ9W2JCiSMvNDZzGVykw@mail.gmail.com>
 <CAHRSSEzpdAVDcn5C4yYEWn6c_rgaFSwp+JvT4MP9kv80MZV=3A@mail.gmail.com>
 <CAHRSSEwrm5SVkuus8y5ycqp_tAQF4UOSo+hFLhVKKNu6s2b_KA@mail.gmail.com>
 <7hlfd8mwrm.fsf@baylibre.com>
 <CAHRSSEy_a-WOm4a11iMS=hKAJk7YmAPUPV50JCAO4DnSXsOiUQ@mail.gmail.com>
Date: Fri, 15 Jan 2021 14:24:22 -0800
Message-ID: <7hr1mlyh2h.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io

Yes, it was merged a couple days ago.  Not sure yet why there haven't
been any builds.

We did have some infra failures which caused a bit of a build backlog
that might have caused this be deep in the queue, but I thought we made
it through that backlog.

I'll double-check with Guillaume on Monday to see what's going on here.

Sorry for the delay,

Kevin

Todd Kjos <tkjos@google.com> writes:

> Hi Kevin,
>
> Has this been applied yet? I don't see any android12-5.10 builds.
>
> -Todd
>
> On Mon, Jan 4, 2021 at 9:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Todd Kjos <tkjos@google.com> writes:
>>
>> > We recently added the android12-5.10 branch. Please add it to kernelci
>> testing.
>> >
>> > repo: https://android.googlesource.com/kernel/common
>> > branch: android12-5.10
>>
>> PR submitted[1].  Adding android12 along with the stable tree(s)
>>
>> Kevin
>>
>> [1] https://github.com/kernelci/kernelci-core/pull/578
>>
