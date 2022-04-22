Return-Path: <frowand.list@gmail.com>
Message-ID: <37465a0f-7deb-bedb-1a84-90324f554ad1@gmail.com>
Date: Fri, 22 Apr 2022 18:16:53 -0500
MIME-Version: 1.0
Subject: Re: [RFC PATCH 0/2] Documentation: dev-tools: begin KTAP spec v2 process
References: <20220316202622.324866-1-frowand.list@gmail.com>
 <CABVgOSmkvxhHSJx0W6BEYz=Ai9vB=nCz625dSKLLUfU0rMLkFA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <CABVgOSmkvxhHSJx0W6BEYz=Ai9vB=nCz625dSKLLUfU0rMLkFA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, "Bird, Tim" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmr167@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Daniel Latypov <dlatypov@google.com>, kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 3/17/22 03:42, David Gow wrote:
> On Thu, Mar 17, 2022 at 4:26 AM <frowand.list@gmail.com> wrote:
>>
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> An August 2021 RFC patch [1] to create the KTAP Specification resulted in
>> some discussion of possible items to add to the specification.
>> The conversation ended without completing the document.
>>
>> Progress resumed with a December 2021 RFC patch [2] to add a KTAP
>> Specification file (Version 1) to the Linux kernel.  Many of the
>> suggestions from the August 2021 discussion were not included in
>> Version 1.  This patch series is intended to revisit some of the
>> suggestions from the August 2021 discussion.
> 
> Thanks for kicking this off again. There were definitely a lot of good
> ideas in those threads which we haven't got to yet.
> 
> I think there is an interesting line to walk between keeping KTAP
> sufficiently "TAP-like" (particularly w/r/t being able to reuse
> existing TAP parsers), and actually adding features, but I don't
> recall seeing many such issues in the previous threads.
> 
>>
>> Patch 1 changes the Specification version to "2-rc" to indicate
>> that following patches are not yet accepted into a final version 2.
> 
> I'm okay with this, though I'd want us to be a little careful with the
> timing so we don't end up with, for example, 5.18 having a KTAP spec
> called 2-rc which is functionally indistinguishable from v1.

I finally have some time to return to this.

I could host a branch on my kernel.org "frowand" linux kernel.  When
agreement is reached on a patch on this mail list, I would add it
to the branch.  When the discussion determines that it is time to
release a version 2 of the specification I would add one more commit
that only updates the version.

Does that sound like a good way to proceed?

> 
>>
>> Patch 2 is an example of a simple change to the Specification.  The
>> change does not change the content of the Specification, but updates
>> a formatting directive as suggested by the Documentation maintainer.
> 
> Thanks -- personally, I'd rather this change _does_ go in straight
> away, even before the 2-rc renaming.
> 
>> I intend to take some specific suggestions from the August 2021
>> discussion to create stand-alone RFC patches to the Specification
>> instead of adding them as additional patches in this series.  The
>> intent is to focus discussion on a single area of the Specification
>> in each patch email thread.
> 
> Seems like a sensible way to structure the discussion. It could get a
> little bit messy if there end up being merge conflicts, but the whole
> thing could be collapsed into a single patchset later if that ended up
> making more sense. (Though that might remove the need for the "rc"
> version, depending on exactly when and how it happened.)

Yes, if I host a branch then no need for the preliminary rc version.

> 
> I'd also be curious to see patches to tests and/or test parsers to
> show off any particularly compatibility-breaking and/or interesting
> changes, though I don't think that _has_ to be a prerequisite for
> discussion or the spec.

That is a good suggestion.

-Frank

> 
>>
>> [1] https://lore.kernel.org/r/CA+GJov6tdjvY9x12JsJT14qn6c7NViJxqaJk+r-K1YJzPggFDQ@mail.gmail.com
>> [2] https://lore.kernel.org/r/20211207190251.18426-1-davidgow@google.com
>>
>> Frank Rowand (2):
>>   Documentation: dev-tools: KTAP spec change version to 2-rc
>>   Documentation: dev-tools: use literal block instead of code-block
>>
>>  Documentation/dev-tools/ktap.rst | 20 +++++++++-----------
>>  1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> --
>> Frank Rowand <frank.rowand@sony.com>
>>
> 
> Cheers,
> -- David

