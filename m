Message-ID: <921f80f5-a95d-ee12-2266-16503edea614@collabora.com>
Date: Wed, 26 Jan 2022 11:28:14 +0000
MIME-Version: 1.0
Subject: Re: ardb/for-kernelci bisection: baseline.dmesg.alert on da850-lcdk
References: <61e3f952.1c69fb81.3e21a.0062@mx.google.com>
 <517aaa07-a0e9-aad4-0cf6-158460dbd9fc@collabora.com>
 <CAMj1kXFWtn2PT81nvNs0e6YghwM2Kuc+jX+qnAqEha64Qn29mQ@mail.gmail.com>
 <CAL_JsqJJEaer6Z5Vhu3G20GHgqq9mEn+Tjok_qU_2ax0iA5ETg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <CAL_JsqJJEaer6Z5Vhu3G20GHgqq9mEn+Tjok_qU_2ax0iA5ETg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, robh+dt@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "kernelci-results@groups.io" <kernelci-results@groups.io>

On 25/01/2022 22:27, Rob Herring wrote:
> On Tue, Jan 25, 2022 at 4:21 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> (adding Arnd and Rob)
>>
>> On Tue, 25 Jan 2022 at 22:32, Guillaume Tucker
>> <guillaume.tucker@collabora.com> wrote:
>>>
>>> Hello Ard,
>>>
>>> Please see the bisection report below.  I had a look around the
>>> results and git history, this is about an "alert" message which
>>> is present in mainline and linux-next but one day it disappeared
>>> on your for-kernelci branch and then it was introduced again.
>>> See the regression history here:
>>>
>>>   https://linux.kernelci.org/test/case/id/61ef9d00e75a9ac935abbd26/
>>>
>>> The revision when it last passed was last Friday, and your branch
>>> has been force-pushed since then so I don't have access to the
>>> git history for it any more.  The bisection found a revert commit
>>> that apparently re-introduced the issue, but it's all a bit
>>> confusing as this commit is not there any more but the alert
>>> message still is.
>>>
>>> The error can be found here in the log:
>>>
>>>   https://storage.kernelci.org/ardb/for-kernelci/arm-irq-and-vmap-stacks-for-rmk-11-g12fa502217d5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html#L552
>>>
>>>   BUG: Bad page state in process kworker/u2:0  pfn:c3000
>>>
>>> So I'm not sure what happened, but it has highlighted this kernel
>>> bug so I guess it might be worth taking a look in case there was
>>> a commit somewhere in your tree that resolved it at some point
>>> last week.  What do you think?
>>>
>>
>> This may be related to a known problem regarding infinite recursion on
>> some DT nodes related to USB devices: Arnd or Rob would know more
>> about this.
> 
> That should be fixed in rc1. Commit 9b22c17a3cc5 ("of: Check
> 'of_node_reused' flag on of_match_device()").

Well the particular issue with the BUG message on da850-lcdk is
still there in v5.17-rc1:

  https://linux.kernelci.org/test/case/id/61ed2891c2717f210aabbd69/

So it doesn't look like there's a trivial solution to this in
Ard's tree.  I believe this issue has been around for a while, so
we'll add it to the list of kernel bugs detected by KernelCI and
it might be something someone will want to fix one day.

Thanks,
Guillaume
