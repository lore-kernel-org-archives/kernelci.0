Subject: Re: finding clang builds in web UI
References: <CAKwvOdnFF_13xCRVH1dXJx00Go==ZMBCzCa7fOO+G02tQH8G3g@mail.gmail.com>
 <CAKwvOdn0MtijM2TLsrS4s=FHLSqDtcb=f+wfuy4H++0Xwr-n1w@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <421e1a65-344c-ae61-ae0a-a56f9481c9df@collabora.com>
Date: Mon, 22 Jun 2020 10:02:05 +0100
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn0MtijM2TLsrS4s=FHLSqDtcb=f+wfuy4H++0Xwr-n1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: ndesaulniers@google.com
Cc: kernelci@groups.io

Hi Nick,

On 16/06/2020 19:10, Nick Desaulniers via groups.io wrote:
> Additionally, if I go to
> https://kernelci.org/job/
> -> search `next`
> -> next tree master branch
> -> next-20200616
> -> baseline
> it looks like there's only gcc-8 builds.

That's because clang builds are not currently being tested in
production, as it was originally agreed to only do builds.  We
can easily turn this on for linux-next, like we're already doing
on staging.kernelci.org:

  https://staging.kernelci.org/test/job/kernelci/branch/staging.kernelci.org/kernel/staging-20200620.1/plan/baseline/

Let us know if that is what you want and I can make a PR.

> On Tue, Jun 16, 2020 at 11:06 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Hello,
>> I was on https://kernelci.org/build/ and in the filter I was looking
>> for `clang` but there's no results.  It looks like all 41 pages are
>> gcc builds.  Were clang builds run, or am I looking in the wrong
>> place?

Well, that works for me:

  https://kernelci.org/build/?clang

(URL arguments like ?clang are directly added to the filter box).

What you might have experienced is a limitation of the number of
builds to filter.  The frontend currently does a query to get all
the latest builds, in a 14-day window and with an upper limit of
1024.  Then it applies filters with arbitrary keywords
like "clang".  So if there were no linux-next updates over a
week-end but plenty of stable and android ones, the last
linux-next builds might be over 1024 behind and were not in the
returned query.

This is a limitation that can easily be overcome, if anything by
increasing that arbitrary number.  A better option would be to
add drop-down selectors for each column, to issue smaller
queries (i.e. only linux-next, and only clang in our case).

In any case, thanks for raising this issue, I guess it would be
helpful if you could give some feedback on an improved version
when we have it on staging.kernelci.org.

Guillaume
