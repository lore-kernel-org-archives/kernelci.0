Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V3] selftests: vm: Add test for Soft-Dirty PTE bit
References: <20220224212335.3045905-1-usama.anjum@collabora.com>
 <edf398a7-b1a1-c7c9-5128-f37cfc3a5c95@linuxfoundation.org>
 <52f17759-c7b9-c13b-2c58-f9f2656d26f6@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <537c7ca4-6dde-cbb8-2c44-271acf96666d@linuxfoundation.org>
Date: Thu, 3 Mar 2022 11:18:28 -0700
MIME-Version: 1.0
In-Reply-To: <52f17759-c7b9-c13b-2c58-f9f2656d26f6@collabora.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, kernelci@groups.io, Will Deacon <will@kernel.org>, Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/27/22 11:55 PM, Muhammad Usama Anjum wrote:
> Hi,
> 
> Andrew had already accepted the patch. I'll send an iteration.
> 
> On 2/26/22 5:35 AM, Shuah Khan wrote:
>>> +#define PAGEMAP_PATH        "/proc/self/pagemap"
>>
>> Why is this names PATH - it is the file name right?
> I'll update the names of the macros.
> 
>>> +
>>> +int clear_refs;
>>> +int pagemap;
>>> +
>>
>> Get rid of these globals and pass these in - please find name
>> that clearly indicates them as fds
>>
> I'll update their names to indicate fds. This is a standalone test
> application. Shouldn't the usage of global variables be fine?
> 

It makes it harder to maintain. Unless there is reason, avoid globals.
I am not seeing a need for globals in this case, other than convenience.

thanks,
-- Shuah
