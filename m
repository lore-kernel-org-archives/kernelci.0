Message-ID: <08412769-30f9-c901-8a14-efd5835be68a@collabora.com>
Date: Fri, 16 Sep 2022 14:57:48 +0200
MIME-Version: 1.0
Subject: Re: kernelci/staging-next staging-next-20220916.0: 3 runs 1 failures
References: <632464ba.630a0220.d15ef.6eca@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <632464ba.630a0220.d15ef.6eca@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: kernelci-results-staging@groups.io, "kernelci@groups.io" <kernelci@groups.io>, Brendan Higgins <brendanhiggins@google.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>

Hello,

On 16/09/2022 13:57, staging.kernelci.org bot wrote:
> kernelci/staging-next staging-next-20220916.0: 3 runs 1 failures
> 
> Summary
> =======
> 
> Tree:     kernelci
> Branch:   staging-next
> Describe: staging-next-20220916.0
> URL:      https://github.com/kernelci/linux.git
> SHA1:     d2957623a1103bf8971b0754bc04193dce0dbde2
> 
> Name            | Result   | Total    | Failures
> ----------------+----------+----------+---------
> kunit           | fail     |      244 |        4
> kver            | pass     |        0 |        0
> fstests         | None     |      247 |        5
> 
> 
> Failing tests
> =============
> 
> kunit
> -----
> 
> * slub_test.test_next_pointer
> * slub_test.test_first_word
> * slub_test.test_clobber_50th_byte
> * slub_test.test_clobber_redzone_free

We're just starting to run KUnit in Kubernetes with the new
KernelCI API & pipeline and these failures showed up on
next-20220916.  Here's the details from the log:

[12:52:08] ================== slub_test (5 subtests) ==================
[12:52:08] [PASSED] test_clobber_zone
[12:52:08] # test_next_pointer: EXPECTATION FAILED at lib/slub_kunit.c:50
[12:52:08] Expected 3 == slab_errors, but
[12:52:08] slab_errors == 0
[12:52:08] # test_next_pointer: EXPECTATION FAILED at lib/slub_kunit.c:62
[12:52:08] Expected 2 == slab_errors, but
[12:52:08] slab_errors == 0
[12:52:08] not ok 2 - test_next_pointer
[12:52:08] [FAILED] test_next_pointer
[12:52:08] # test_first_word: EXPECTATION FAILED at lib/slub_kunit.c:85
[12:52:08] Expected 2 == slab_errors, but
[12:52:08] slab_errors == 0
[12:52:08] not ok 3 - test_first_word
[12:52:08] [FAILED] test_first_word
[12:52:08] # test_clobber_50th_byte: EXPECTATION FAILED at lib/slub_kunit.c:100
[12:52:08] Expected 2 == slab_errors, but
[12:52:08] slab_errors == 0
[12:52:08] not ok 4 - test_clobber_50th_byte
[12:52:08] [FAILED] test_clobber_50th_byte
[12:52:08] # test_clobber_redzone_free: EXPECTATION FAILED at lib/slub_kunit.c:117
[12:52:08] Expected 2 == slab_errors, but
[12:52:08] slab_errors == 0
[12:52:08] not ok 5 - test_clobber_redzone_free
[12:52:08] [FAILED] test_clobber_redzone_free
[12:52:08] # Subtest: slub_test
[12:52:08] 1..5
[12:52:08] # slub_test: pass:1 fail:4 skip:0 total:5
[12:52:08] # Totals: pass:1 fail:4 skip:0 total:5
[12:52:08] not ok 23 - slub_test
[12:52:08] ==================== [FAILED] slub_test ====================


I've reproduced them by hand with the same Docker environment so
it seems valid but it would be great if you could please confirm.
Are they known failures, and do you know when they were
introduced?  They're not failing in mainline afaict.

We'll be adding support for tracking regressions soon so we'll be
able to know when failures start to appear automatically.  For
now, it's useful to double check we're producing valid results.

Thanks,
Guillaume
