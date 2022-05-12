Return-Path: <frowand.list@gmail.com>
Message-ID: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
Date: Thu, 12 May 2022 00:59:17 -0500
MIME-Version: 1.0
From: Frank Rowand <frowand.list@gmail.com>
Subject: [RFC] KTAP spec v2: prefix to KTAP data
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

In the middle of the "RFC - kernel test result specification (KTAP)" thread,
started in August 2021, Tim Bird made a suggestion to allow a prefix to the
KTAP data format:

> Just as a side note, in some Fuego tests, it was very useful to include an identifier
> in thethe prefix nested tests.  The output looked like this:
>
> TAP version 13
> 1..2
> [batch_id 4] TAP version 13
> [batch_id 4] 1..2
> [batch_id 4] ok 1 - cyclictest with 1000 cycles
> [batch_id 4] # problem setting CLOCK_REALTIME
> [batch_id 4] not ok 2 - cyclictest with CLOCK_REALTIME
> not ok 1 - check realtime
> [batch_id 4] TAP version 13
> [batch_id 4] 1..1
> [batch_id 4] ok 1 - IOZone read/write 4k blocks
> ok 2 - check I/O performance
>
> Can I propose that the prefix not be fixed by the spec, but that the spec indicates that
> whatever the prefix is on the TAP version line, that prefix must be used with the output for
> all lines from the test (with the exception of unknown lines)?

The thread was discussing many other items, but this is the one that I want
to focus on in this new RFC thread.

Tim's original email was:

   https://lore.kernel.org/r/BYAPR13MB2503A4B79074D8ED5579345DFDCB9@BYAPR13MB2503.namprd13.prod.outlook.com

There was one reply to this that commented on Tim's suggestion (and also many
other items in the thread) at:

   https://lore.kernel.org/r/202108301226.800F3D6D4@keescook

> Oh, interesting. This would also allow parallel (unique) test execution
> to be parsable. That sounds workable. (Again, this needs LAVA patching
> again...)

I found Tim's original suggestion to be useful, so I have come up with
two possible ways to modify the KTAP specification to implement what Tim
was thinking about.  I would not be surprised if someone else has a better
suggestion than mine, but I will reply to this email with my two alternatives
to start a discussion.  My alternatives are not in the form of patches, but
if discussion leads to a good result then I will create a patch for review.

-Frank
