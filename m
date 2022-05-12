Return-Path: <frowand.list@gmail.com>
Message-ID: <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com>
Date: Thu, 12 May 2022 01:01:22 -0500
MIME-Version: 1.0
Subject: Re: [RFC] KTAP spec v2: prefix to KTAP data
References: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/12/22 00:59, Frank Rowand wrote:
> In the middle of the "RFC - kernel test result specification (KTAP)" thread,
> started in August 2021, Tim Bird made a suggestion to allow a prefix to the
> KTAP data format:
> 
>> Just as a side note, in some Fuego tests, it was very useful to include an identifier
>> in thethe prefix nested tests.  The output looked like this:
>>
>> TAP version 13
>> 1..2
>> [batch_id 4] TAP version 13
>> [batch_id 4] 1..2
>> [batch_id 4] ok 1 - cyclictest with 1000 cycles
>> [batch_id 4] # problem setting CLOCK_REALTIME
>> [batch_id 4] not ok 2 - cyclictest with CLOCK_REALTIME
>> not ok 1 - check realtime
>> [batch_id 4] TAP version 13
>> [batch_id 4] 1..1
>> [batch_id 4] ok 1 - IOZone read/write 4k blocks
>> ok 2 - check I/O performance
>>
>> Can I propose that the prefix not be fixed by the spec, but that the spec indicates that
>> whatever the prefix is on the TAP version line, that prefix must be used with the output for
>> all lines from the test (with the exception of unknown lines)?
> 
> The thread was discussing many other items, but this is the one that I want
> to focus on in this new RFC thread.
> 
> Tim's original email was:
> 
>    https://lore.kernel.org/r/BYAPR13MB2503A4B79074D8ED5579345DFDCB9@BYAPR13MB2503.namprd13.prod.outlook.com
> 
> There was one reply to this that commented on Tim's suggestion (and also many
> other items in the thread) at:
> 
>    https://lore.kernel.org/r/202108301226.800F3D6D4@keescook
> 
>> Oh, interesting. This would also allow parallel (unique) test execution
>> to be parsable. That sounds workable. (Again, this needs LAVA patching
>> again...)
> 
> I found Tim's original suggestion to be useful, so I have come up with
> two possible ways to modify the KTAP specification to implement what Tim
> was thinking about.  I would not be surprised if someone else has a better
> suggestion than mine, but I will reply to this email with my two alternatives
> to start a discussion.  My alternatives are not in the form of patches, but
> if discussion leads to a good result then I will create a patch for review.
> 
> -Frank

================================================================================
Alternative 1
   - Add an optional <prefix string> to test output.
================================================================================
## <prefix string>

If the optional [<prefix string>] is present for any line of the KTAP formatted
output, then it must be present for all lines of the KTAP formatted output
(except for "Diagnostic lines", are allowed to not be prefixed with
<prefix string>, as described below).

The "Version lines" format is changed from:

   KTAP version 1

to:

   [<prefix string>] KTAP version 1

The "Plan lines" format is changed from:

   "1..N"

to:

   [<prefix string>] "1..N"

The "Test case result lines" format is changed from:

   <result> <number> [<description>][ # [<directive>] [<diagnostic data>]]

to:

   [<prefix string>] <result> <number> [<description>][ # [<directive>] [<diagnostic data>]]


   <prefix content is a constant string>

   All subsequent test lines are prefixed with the <prefix string>.

   Indentation for "Nested tests" follows <prefix string>.  The indentation
   does NOT precede <prefix string>.

   "Diagnostic lines" are prefixed with the <prefix string>.

   "Unknown lines" may optionally be prefixed with the <prefix string>, but
   are not required to be prefixed with the <prefix string>.  It is allowed
   for some "Unknown lines" to not be prefixed with the <prefix string>, even
   if one or more other "Unknown lines" are prefixed with the <prefix string>.


================================================================================
#### discussion notes:

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PRO: minimally invasive to specification.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
CON:

KTAP does not include any mechanism to describe the value of <prefix string>
to test harnesses and test output processing programs.  The test output
processing programs must infer the value of <prefix string> by detecting
the <prefix string> in the "Version lines".

The detection of a "Version lines" might be a match of the regex:

   "^.*KTAP version 2$"

This risks falsely detecting a "Version lines", but the risk is small???

The impact of falsely detecting a "Version lines" may be large if the
beginning of test detection is a state machine that moves into a "detect
either Plan lines or Test case result lines" after falsely detecting a
"Version lines".  The impact may be small if the state maching instead
moves into a "detect Version lines, Plan lines, or Test case result lines".


================================================================================

