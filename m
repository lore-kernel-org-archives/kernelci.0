Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V3] selftests: vm: Add test for Soft-Dirty PTE bit
References: <20220224212335.3045905-1-usama.anjum@collabora.com>
 <3b7c068b-ac7e-62fc-f0cd-a8dbf8642876@redhat.com>
 <6133317f-4da0-3aae-f352-b75f0f94dbd4@linuxfoundation.org>
 <87o82mkhif.fsf@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ee9b8c8b-0d27-bd01-e10d-9062c32f2486@linuxfoundation.org>
Date: Thu, 3 Mar 2022 14:46:08 -0700
MIME-Version: 1.0
In-Reply-To: <87o82mkhif.fsf@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: David Hildenbrand <david@redhat.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, kernelci@groups.io, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 3/3/22 11:39 AM, Gabriel Krisman Bertazi wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> On 2/28/22 2:37 AM, David Hildenbrand wrote:
>>> On 24.02.22 22:23, Muhammad Usama Anjum wrote:
>>>> This introduces three tests:
>>>> 1) Sanity check soft dirty basic semantics: allocate area, clean, dirty,
>>>> check if the SD bit flipped.
>>>> 2) Check VMA reuse: validate the VM_SOFTDIRTY usage
>>>> 3) Check soft-dirty on huge pages
>>>>
>>>> This was motivated by Will Deacon's fix commit 912efa17e512 ("mm: proc:
>>>> Invalidate TLB after clearing soft-dirty page state"). I was tracking the
>>>> same issue that he fixed, and this test would have caught it.
>>>>
>>> A note that madv_populate.c already contains some SOFTDIRTY tests
>>> regarding MADV_POPULATE. Eventually we want to factor out
>>> softdirty/pagemap handling+checks for easier reuse.
>>>
>>
>> Is this patch unnecessary then?
> 
> It is not unnecessary since the madv test doesn't cover the bug tested
> here, afaik.  But, as mentioned when I originally submitted this patch,
> it should be merged into selftests/vm/madv_populate.c or, at least,
> reuse that existing infrastructure.
> 
> https://lore.kernel.org/lkml/87lf553z5g.fsf@collabora.com/
> 

Oops this one came in a few months ago and appears to have slipped
through and didn't get the right attention. Sorry about that.

Please resend the patch and cc all the everybody on this thread.

I would like to have your patch reviewed and looked at first. This
patch needs rework sine it has several comments to be addressed.

thanks,
-- Shuah
