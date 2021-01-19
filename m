Subject: Re: Please add android12-5.10 kernel to kernelci
References: <CAHRSSEzfP_NbK+b5M3_AAR7H7ujhdTdJ9W2JCiSMvNDZzGVykw@mail.gmail.com>
 <CAHRSSEzpdAVDcn5C4yYEWn6c_rgaFSwp+JvT4MP9kv80MZV=3A@mail.gmail.com>
 <CAHRSSEwrm5SVkuus8y5ycqp_tAQF4UOSo+hFLhVKKNu6s2b_KA@mail.gmail.com>
 <7hlfd8mwrm.fsf@baylibre.com>
 <CAHRSSEy_a-WOm4a11iMS=hKAJk7YmAPUPV50JCAO4DnSXsOiUQ@mail.gmail.com>
 <7hr1mlyh2h.fsf@baylibre.com>
 <CAHRSSEzCgOGZXKOX4-agVQAtubcmKypqC9T6aMwiNk447RiuKw@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <225a5cb3-5f13-6cb9-cef5-66c471128d41@collabora.com>
Date: Tue, 19 Jan 2021 18:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <CAHRSSEzCgOGZXKOX4-agVQAtubcmKypqC9T6aMwiNk447RiuKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>, Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

On 19/01/2021 17:56, Todd Kjos wrote:
> Hi Kevin, I'm seeing android12-5.10 builds now. Thanks!

Yes there was a production update earlier today.  Changes don't
get rolled out automatically when they're merged on GitHub, to
avoid transient issues.  Typically that happens once a week while
builds and tests are paused.

Guillaume

> On Fri, Jan 15, 2021 at 2:24 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Yes, it was merged a couple days ago.  Not sure yet why there haven't
>> been any builds.
>>
>> We did have some infra failures which caused a bit of a build backlog
>> that might have caused this be deep in the queue, but I thought we made
>> it through that backlog.
>>
>> I'll double-check with Guillaume on Monday to see what's going on here.
>>
>> Sorry for the delay,
>>
>> Kevin
>>
>> Todd Kjos <tkjos@google.com> writes:
>>
>>> Hi Kevin,
>>>
>>> Has this been applied yet? I don't see any android12-5.10 builds.
>>>
>>> -Todd
>>>
>>> On Mon, Jan 4, 2021 at 9:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>>
>>>> Todd Kjos <tkjos@google.com> writes:
>>>>
>>>>> We recently added the android12-5.10 branch. Please add it to kernelci
>>>> testing.
>>>>>
>>>>> repo: https://android.googlesource.com/kernel/common
>>>>> branch: android12-5.10
>>>>
>>>> PR submitted[1].  Adding android12 along with the stable tree(s)
>>>>
>>>> Kevin
>>>>
>>>> [1] https://github.com/kernelci/kernelci-core/pull/578
>>>>

