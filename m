Message-ID: <a68d9276-b6b4-7578-3f13-91b2de3f71f7@collabora.com>
Date: Sat, 17 Sep 2022 09:01:39 +0200
MIME-Version: 1.0
Subject: Re: kernelci/staging-next staging-next-20220916.0: 3 runs 1 failures
References: <632464ba.630a0220.d15ef.6eca@mx.google.com>
 <08412769-30f9-c901-8a14-efd5835be68a@collabora.com>
 <185f4c80-9bef-4fc5-732e-b194ad0f2ee8@suse.cz>
 <7d9fe347-fcd4-ae69-8a17-2a71a8145202@suse.cz>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <7d9fe347-fcd4-ae69-8a17-2a71a8145202@suse.cz>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: kernelci-results-staging@groups.io, "kernelci@groups.io" <kernelci@groups.io>, Brendan Higgins <brendanhiggins@google.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>

On 17/09/2022 00:17, Vlastimil Babka wrote:
> On 9/16/22 18:28, Vlastimil Babka wrote:
>> On 9/16/22 14:57, Guillaume Tucker wrote:
>>> Hello,
>>>
>>> On 16/09/2022 13:57, staging.kernelci.org bot wrote:
>>>> kernelci/staging-next staging-next-20220916.0: 3 runs 1 failures
>>>>
>>>> Summary
>>>> =======
>>>>
>>>> Tree:     kernelci
>>>> Branch:   staging-next
>>>> Describe: staging-next-20220916.0
>>>> URL:      https://github.com/kernelci/linux.git
>>>> SHA1:     d2957623a1103bf8971b0754bc04193dce0dbde2
>>>>
>>>> Name            | Result   | Total    | Failures
>>>> ----------------+----------+----------+---------
>>>> kunit           | fail     |      244 |        4
>>>> kver            | pass     |        0 |        0
>>>> fstests         | None     |      247 |        5
>>>>
>>>>
>>>> Failing tests
>>>> =============
>>>>
>>>> kunit
>>>> -----
>>>>
>>>> * slub_test.test_next_pointer
>>>> * slub_test.test_first_word
>>>> * slub_test.test_clobber_50th_byte
>>>> * slub_test.test_clobber_redzone_free
>>>
>>> We're just starting to run KUnit in Kubernetes with the new
>>> KernelCI API & pipeline and these failures showed up on
>>> next-20220916.  Here's the details from the log:
>>>
>>> [12:52:08] ================== slub_test (5 subtests) ==================
>>> [12:52:08] [PASSED] test_clobber_zone
>>> [12:52:08] # test_next_pointer: EXPECTATION FAILED at lib/slub_kunit.c:50
>>> [12:52:08] Expected 3 == slab_errors, but
>>> [12:52:08] slab_errors == 0
>>> [12:52:08] # test_next_pointer: EXPECTATION FAILED at lib/slub_kunit.c:62
>>> [12:52:08] Expected 2 == slab_errors, but
>>> [12:52:08] slab_errors == 0
>>> [12:52:08] not ok 2 - test_next_pointer
>>> [12:52:08] [FAILED] test_next_pointer
>>> [12:52:08] # test_first_word: EXPECTATION FAILED at lib/slub_kunit.c:85
>>> [12:52:08] Expected 2 == slab_errors, but
>>> [12:52:08] slab_errors == 0
>>> [12:52:08] not ok 3 - test_first_word
>>> [12:52:08] [FAILED] test_first_word
>>> [12:52:08] # test_clobber_50th_byte: EXPECTATION FAILED at lib/slub_kunit.c:100
>>> [12:52:08] Expected 2 == slab_errors, but
>>> [12:52:08] slab_errors == 0
>>> [12:52:08] not ok 4 - test_clobber_50th_byte
>>> [12:52:08] [FAILED] test_clobber_50th_byte
>>> [12:52:08] # test_clobber_redzone_free: EXPECTATION FAILED at lib/slub_kunit.c:117
>>> [12:52:08] Expected 2 == slab_errors, but
>>> [12:52:08] slab_errors == 0
>>> [12:52:08] not ok 5 - test_clobber_redzone_free
>>> [12:52:08] [FAILED] test_clobber_redzone_free
>>> [12:52:08] # Subtest: slub_test
>>> [12:52:08] 1..5
>>> [12:52:08] # slub_test: pass:1 fail:4 skip:0 total:5
>>> [12:52:08] # Totals: pass:1 fail:4 skip:0 total:5
>>> [12:52:08] not ok 23 - slub_test
>>> [12:52:08] ==================== [FAILED] slub_test ====================
>>>
>>>
>>> I've reproduced them by hand with the same Docker environment so
>>> it seems valid but it would be great if you could please confirm.
>>> Are they known failures, and do you know when they were
>>> introduced?  They're not failing in mainline afaict.
>>
>> Hi, what's the .config here please?
>> Thanks.
> 
> Nevermind, reproduced it and will fix soon, thanks!

Great!  Since this was reported by a KernelCI email, could you
please add this to your fix?

  Reported-by: "kernelci.org bot" <bot@kernelci.org>


It was using the plain default config, I've put it here anyway:

  https://storage.staging.kernelci.org/images/tmp/kunit-config

We'll soon be adding artifacts to test results, I guess we can
include the config file in that.

> Wonder why no other existing bot didn't report it sooner, it's been in next
> for a while - they don't run kunit tests?

I suppose we're the first public CI system to be running KUnit...
Glad that helped, sounds like a very good start.

Thanks,
Guillaume

