Return-Path: <frowand.list@gmail.com>
Message-ID: <ceab750d-c107-9273-3718-9632085362b3@gmail.com>
Date: Tue, 30 Aug 2022 10:06:35 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] ktap_v2: change version to 2-rc in KTAP specification
References: <20220829233150.3564612-1-frowand.list@gmail.com>
 <20220829233150.3564612-2-frowand.list@gmail.com>
 <Yw4InUF5TpR/wdwb@casper.infradead.org>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <Yw4InUF5TpR/wdwb@casper.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Matthew Wilcox <willy@infradead.org>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>, Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/30/22 07:54, Matthew Wilcox wrote:
> On Mon, Aug 29, 2022 at 06:31:49PM -0500, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Prepare KTAP Specification for the process of creating version 2.
>>
>> The version will remain "2-rc" until the final commit to complete
>> Version 2.  Adding the "-rc" ensures that none of the development
>> versions will be mistaken for the completed version 2.
>>
>> After this commit, Sphinx complains that we now need more '=' signs:
>>
>>   Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
>>   ===================================================
>>   The Kernel Test Anything Protocol (KTAP), version 2-rc
>>   ===================================================
> 
> Hey Frank, you can actually use overlength lines to prevent this kind of
> problem from occurring.  eg, this is perfectly acceptable:
> 
> ===================================================================
> Hi
> ===================================================================
> 
> I wonder if we should prefer this style to avoid the rash of complaints
> when a headline is changed.

Thanks, that is useful to know.  I think it might be a good idea to
switch to the longer style at some point before the final version 2
release.

-Frank
