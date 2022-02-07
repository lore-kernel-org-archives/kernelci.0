Return-Path: <frowand.list@gmail.com>
Subject: Re: [PATCH v2 1/1] Documentation: dev-tools: clarify KTAP specification wording
References: <20220207162813.3091899-1-frowand.list@gmail.com>
 <e795ad1a-ddb1-f0af-4a74-7c2c6a0a949a@gmail.com>
 <0de1426c-5b5d-9160-cd5c-00185fa516f5@gmail.com>
 <BYAPR13MB2503C78EE66DBC27ECF3FE8AFD2C9@BYAPR13MB2503.namprd13.prod.outlook.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <48b9b944-732d-d187-af39-756d87eedfa9@gmail.com>
Date: Mon, 7 Feb 2022 11:40:03 -0600
MIME-Version: 1.0
In-Reply-To: <BYAPR13MB2503C78EE66DBC27ECF3FE8AFD2C9@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: "Bird, Tim" <Tim.Bird@sony.com>, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Brendan Higgins <brendanhiggins@google.com>
Cc: "rmr167@gmail.com" <rmr167@gmail.com>, "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>, "dlatypov@google.com" <dlatypov@google.com>, "kernelci@groups.io" <kernelci@groups.io>, "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2/7/22 11:06 AM, Bird, Tim wrote:
> 
> 
>> -----Original Message-----
>> From: Frank Rowand <frowand.list@gmail.com>
>>
>> On 2/7/22 10:38 AM, Frank Rowand wrote:
>>> On 2/7/22 10:28 AM, frowand.list@gmail.com wrote:
>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>
>>>> Add the spec version to the title line.
>>>>
>>>> Explain likely source of "Unknown lines".
>>>>
>>>> "Unknown lines" in nested tests are optionally indented.
>>>>
>>>> Add "Unknown lines" items to differences between TAP & KTAP list
>>>>
>>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>>> ---
>>>
>>> Please do not apply this version (v2).  I was working off the KTAP specification
>>                                                                 ^^^^ TAP
> 
> What???

I was looking at the proposed TAP v14 from:
  branch 'git14' of https://github.com/isaacs/testanything.github.io.git
while David was looking at
  branch 'tap-14-specification' of https://github.com/TestAnything/Specification/

David did not find the line type of "Anything else" in the TAP v14 he was looking
at, but did find it in TAP v13 (tap-version-13-specification.md) which is in
https://github.com/TestAnything/testanything.github.io
so my reference to TAP "Anything else" in the patch remains valid.  The lack
of "Anything else" in the TAP v14 that David was looking at is why I initially
said to not apply this patch (v2).

> 
>>> from a different github repo than I should have been referencing.
>>
>> OK to proceed with this version of the patch.  I was referencing the proposed
>> TAP version 14, which is in a different github repo than the TAP version 13
>> specification.  Everything in this patch is consistent with TAP version 13,
>> as well as the proposed TAP version 14.
> 
> I'm confused by this message.
> Will there be a v3 of the patch, or are you saying to just apply the original v2 of
> this patch?

Sorry for the confusion.  There is no longer a need for v3 of the patch, so it is
ok to apply v2 if it passes review.

> 
> For the original (v2) of the patch, which I believe is 
> https://lore.kernel.org/all/20220207162813.3091899-1-frowand.list@gmail.com/
> 
> you can add a "Reviewed-by" from me.
>  -- Tim
> 

