Return-Path: <frowand.list@gmail.com>
Message-ID: <1c89133e-7bd2-862a-bd57-7fefdffb77ae@gmail.com>
Date: Thu, 12 May 2022 01:02:11 -0500
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
Alternative 2
   - Add an optional <prefix string> to test output.
   - Add "Configuration info lines", which are used to provide information
     about the KTAP format to programs that interpret the KTAP data.  The
     only type of "Configuration info lines" proposed provides the value
     of <prefix string> for programs that process the KTAP output.
   - Further types of "Configuration info lines" could be added.

Alternative 2b
   - Add an optional <prefix string> to test output.
   - Add a <prefix string> definition line of the form:
        ok 0 <prefix string>
     This line is essentially a phony "Test case result lines" for test 0.

================================================================================
## Configuration info lines

Occur in zero or more test case result lines, where <number> is 0 (zero),
following the "Plan line", before any other "Test case result" line.

   If there is no "Plan line" at the beginning of the test, then the
   "Configuration info lines" follow the "Version line", before any
   other "Test case result" line.

format:

   ok 0 <description> # [<directive>] [<diagnostic data>]]

<result> must be "ok".

The type of each "Configuration info line" is defined by the value
of <description>.

Each value of <description> used for a "Configuration info line" must be
listed in the specification.

Whether # <directive> is optional or required is defined for each type of
"Configuration info line".

#### Should '[<diagnostic data>]' be included in the format?


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# [output] prefix

ok 0 output_prefix #<prefix string>

   <prefix content is a constant string>
   Note: there is no space between "#" and "<prefix string>".  If there is one
   or more spaces after the "#", then there are part of the <prefix string>

   ## <diagnostic data> must not exist unless there is a way to determine the
   ## end of <prefix string>.
   ##
   ## Adding a way to determine the end of <prefix string> adds much complexity
   ## to the consumers of ktap output.  For example, if the format was:
   ##
   ##   ok 0 output_prefix #<prefix string>[#<diagnostic data>]
   ##
   ## then it is not possible for <prefix string> to contain '#', unless
   ## a method to escape '#' is provided.  E.G.:
   ##
   ##   ok 0 output_prefix #XXX test result \#\#\##<diagnostic data>
   ##
   ## would result in <prefix string> value of 'XXX test result ###'
   ##
   ## My recomendation: do not allow <diagnostic data> in output_prefix format.

   All subsequent test lines are prefixed with the <prefix string>.

   Indentation for "Nested tests" follows <prefix string>.  The indentation
   does NOT precede <prefix string>.

   "Diagnostic lines" are prefixed with the <prefix string>.

   "Unknown lines" may optionally be prefixed with the <prefix string>, but
   are not required to be prefixed with the <prefix string>.  It is allowed
   for some "Unknown lines" to not be prefixed with the <prefix string>, even
   if one or more other "Unknown lines" are prefixed with the <prefix string>.

   #### Does prefixing begin immediately (even for a subsequent "Configuration
   #### info line" or does it begin with the test 1 "Test case result line"
   #### line?
   ####
   ####    This question might be simplified if the output_prefix line is
   ####    required to be the last "Configuration info line".  (Or maybe even if
   ####    required to be the first "Configuration info line".


================================================================================
#### discussion notes:

PRO:
   Test output processing programs can detect the value of <prefix string>
   more deterministically than Alternative 1.

CON:
   More complex than Alternative 1.  (But alternative 2b is less complex than
   Alternative 2.)

================================================================================

