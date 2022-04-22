Return-Path: <frowand.list@gmail.com>
Message-ID: <ee73ec15-db6c-e0bb-ddb1-012499d08b11@gmail.com>
Date: Fri, 22 Apr 2022 18:25:49 -0500
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/2] Documentation: dev-tools: KTAP spec change version to 2-rc
References: <20220316202622.324866-1-frowand.list@gmail.com>
 <20220316202622.324866-2-frowand.list@gmail.com>
 <CABVgOSm_rQcBhbC5C7Z7_+zEheCjkjHCmzKHyx7b5bYLESvA0A@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <CABVgOSm_rQcBhbC5C7Z7_+zEheCjkjHCmzKHyx7b5bYLESvA0A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, "Bird, Tim" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmr167@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Latypov <dlatypov@google.com>, kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 3/17/22 03:43, David Gow wrote:
> On Thu, Mar 17, 2022 at 4:26 AM <frowand.list@gmail.com> wrote:
>>
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Prepare KTAP Specification for the process of creating Version 2.
>> The version will remain 2-rc until the final commit to complete
>> Version 2.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> This seems okay to me, though I'd generally rather this stay in a
> branch rather than hitting torvalds/master while there aren't any
> substantive changes to the actual spec. (Basically, let's not rush
> naming this "2-rc" for 5.18 if there aren't any other changes: a 2-rc
> which is practically the same as 1 is probably going to be more
> confusing than helpful if it sticks around for a whole kernel release.

Sounds good.  In my reply (a few minutes ago) to your other email, I offer
to host a branch.  The branch approach sounds good to me.

> 
> (Also, when would we want to update the various mentions of "KTAP
> version 1" in the document to "KTAP version 2" or "KTAP version 2-rc"?
> Now, when 2 is released, at the first breaking change to that example,
> etc?)

There are only a few references to version 1.  I can create a patch to change
them to version 2 (other than the version of the document itself).

If we are working on a branch, it should not make a big difference when the
internal uses of "version 1" are changed to "version 2".  If I do it right
away then it won't get overlooked.

-Frank

> 
> Cheers,
> -- David
> 
>>  Documentation/dev-tools/ktap.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
>> index 5ee735c6687f..37b5dc61bfb8 100644
>> --- a/Documentation/dev-tools/ktap.rst
>> +++ b/Documentation/dev-tools/ktap.rst
>> @@ -1,7 +1,7 @@
>>  .. SPDX-License-Identifier: GPL-2.0
>>
>>  ===================================================
>> -The Kernel Test Anything Protocol (KTAP), version 1
>> +The Kernel Test Anything Protocol (KTAP), version 2-rc
>>  ===================================================
> 
> Nit: Sphinx complains that we now need more '=' signs:
> 
> Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
> ===================================================
> 
> 
> The Kernel Test Anything Protocol (KTAP), version 2-rc
> ===================================================
> 
>>
>>  TAP, or the Test Anything Protocol is a format for specifying test results used
>> --
>> Frank Rowand <frank.rowand@sony.com>
>>

