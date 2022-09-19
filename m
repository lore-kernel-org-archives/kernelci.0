Message-ID: <e0261ec2-f085-81ac-4130-de0c3d69d93b@suse.cz>
Date: Mon, 19 Sep 2022 12:04:16 +0200
MIME-Version: 1.0
Subject: Re: kernelci/staging-next staging-next-20220916.0: 3 runs 1 failures
References: <632464ba.630a0220.d15ef.6eca@mx.google.com>
 <08412769-30f9-c901-8a14-efd5835be68a@collabora.com>
 <185f4c80-9bef-4fc5-732e-b194ad0f2ee8@suse.cz>
 <7d9fe347-fcd4-ae69-8a17-2a71a8145202@suse.cz>
 <a68d9276-b6b4-7578-3f13-91b2de3f71f7@collabora.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <a68d9276-b6b4-7578-3f13-91b2de3f71f7@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: kernelci-results-staging@groups.io, "kernelci@groups.io" <kernelci@groups.io>, Brendan Higgins <brendanhiggins@google.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>

On 9/17/22 09:01, Guillaume Tucker wrote:
> On 17/09/2022 00:17, Vlastimil Babka wrote:
>> On 9/16/22 18:28, Vlastimil Babka wrote:
>>> On 9/16/22 14:57, Guillaume Tucker wrote:
>>>> Hello,
>>>
>>> Hi, what's the .config here please?
>>> Thanks.
>> 
>> Nevermind, reproduced it and will fix soon, thanks!
> 
> Great!  Since this was reported by a KernelCI email, could you
> please add this to your fix?
> 
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>

I'd love to, but it was still possible to amend the broken commit and
Reported-by: for the whole of it would be misleading. We currently lack a
standard way for giving the report credit in such situation :/

> 
> It was using the plain default config, I've put it here anyway:
> 
>   https://storage.staging.kernelci.org/images/tmp/kunit-config
> 
> We'll soon be adding artifacts to test results, I guess we can
> include the config file in that.
> 
>> Wonder why no other existing bot didn't report it sooner, it's been in next
>> for a while - they don't run kunit tests?
> 
> I suppose we're the first public CI system to be running KUnit...
> Glad that helped, sounds like a very good start.

Yep, thanks a lot!

> Thanks,
> Guillaume
> 

