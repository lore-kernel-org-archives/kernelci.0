Return-Path: <frowand.list@gmail.com>
Message-ID: <95dcdcd3-fb48-6e5c-3262-7aacaac71e78@gmail.com>
Date: Fri, 22 Apr 2022 18:10:39 -0500
MIME-Version: 1.0
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: use literal block instead of code-block
References: <20220316202622.324866-1-frowand.list@gmail.com>
 <20220316202622.324866-3-frowand.list@gmail.com>
 <CABVgOSngfB41BVoEvQ1JX+2oFvS7Mik58VfPm9pydmiC_GSD6Q@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <CABVgOSngfB41BVoEvQ1JX+2oFvS7Mik58VfPm9pydmiC_GSD6Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, "Bird, Tim" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmr167@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Latypov <dlatypov@google.com>, kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jon,

On 3/17/22 03:43, David Gow wrote:
> On Thu, Mar 17, 2022 at 4:26 AM <frowand.list@gmail.com> wrote:
>>
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> KTAP Specification: Change code-block directives to straightforward
>> literal blocks since the blocks do not contain code.
>>
>> Suggested-by: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> This looks good to me.
> 
> I'd personally rather push this through independently of the KTAP 2.0
> spec updates, as it's really just a minor formatting change to the
> spec, and it has no impact on the actual KTAP format.
> 
> So, if we can accept this independently, that'd be swell.
> 
> Reviewed-by: David Gow <davidgow@google.com>

I got distracted with other tasks, just now returning to this.

There has been no other comment in the last month, so I think it
is fair to go ahead and ask you to pull this patch.

Can you pull just this patch (patch 2/2) or would you prefer that
I do a version 2 which does not contain patch 1/2?

-Frank

> 
> Cheers,
> -- David
> 
> 
>>  Documentation/dev-tools/ktap.rst | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
>> index 37b5dc61bfb8..b9a57ceddd4f 100644
>> --- a/Documentation/dev-tools/ktap.rst
>> +++ b/Documentation/dev-tools/ktap.rst
>> @@ -115,34 +115,32 @@ The diagnostic data field is optional, and results which have neither a
>>  directive nor any diagnostic data do not need to include the "#" field
>>  separator.
>>
>> -Example result lines include:
>> -
>> -.. code-block:: none
>> +Example result lines include::
>>
>>         ok 1 test_case_name
>>
>>  The test "test_case_name" passed.
>>
>> -.. code-block:: none
>> +::
>>
>>         not ok 1 test_case_name
>>
>>  The test "test_case_name" failed.
>>
>> -.. code-block:: none
>> +::
>>
>>         ok 1 test # SKIP necessary dependency unavailable
>>
>>  The test "test" was SKIPPED with the diagnostic message "necessary dependency
>>  unavailable".
>>
>> -.. code-block:: none
>> +::
>>
>>         not ok 1 test # TIMEOUT 30 seconds
>>
>>  The test "test" timed out, with diagnostic data "30 seconds".
>>
>> -.. code-block:: none
>> +::
>>
>>         ok 5 check return code # rcode=0
>>
>> @@ -202,7 +200,7 @@ allowed to be either indented or not indented.
>>
>>  An example of a test with two nested subtests:
>>
>> -.. code-block:: none
>> +::
>>
>>         KTAP version 1
>>         1..1
>> @@ -215,7 +213,7 @@ An example of a test with two nested subtests:
>>
>>  An example format with multiple levels of nested testing:
>>
>> -.. code-block:: none
>> +::
>>
>>         KTAP version 1
>>         1..2
>> @@ -250,7 +248,7 @@ nested version line, uses a line of the form
>>
>>  Example KTAP output
>>  --------------------
>> -.. code-block:: none
>> +::
>>
>>         KTAP version 1
>>         1..1
>> --
>> Frank Rowand <frank.rowand@sony.com>
>>

