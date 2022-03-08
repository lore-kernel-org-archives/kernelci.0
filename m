Message-ID: <f12e7608-eaf3-2dc9-46fa-4dc656c3e40b@collabora.com>
Date: Tue, 8 Mar 2022 16:17:13 +0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] selftests/lkdtm: add config and turn off CFI_FORWARD_PROTO
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <0c22d702-b451-e9b3-8d3f-7c28ca71c1da@collabora.com>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <0c22d702-b451-e9b3-8d3f-7c28ca71c1da@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>

Reminder!

On 2/28/22 12:06 PM, Muhammad Usama Anjum wrote:
> Hi,
> 
> Any thoughts?
> 
> On 2/18/22 1:56 AM, Muhammad Usama Anjum wrote:
>> Add config options which are needed for LKDTM sub-tests.
>> STACKLEAK_ERASING test needs GCC_PLUGIN_STACKLEAK config.
>> READ_AFTER_FREE and READ_BUDDY_AFTER_FREE tests need
>> INIT_ON_FREE_DEFAULT_ON config.
>>
>> CFI_FORWARD_PROTO always fails as there is no active CFI system of some
>> kind. Turn it off for now by default until proper support.
>>
>> Cc: Kees Cook <keescook@chromium.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>  tools/testing/selftests/lkdtm/config    | 2 ++
>>  tools/testing/selftests/lkdtm/tests.txt | 2 +-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftests/lkdtm/config
>> index 46f39ee762086..adc9fa60057c5 100644
>> --- a/tools/testing/selftests/lkdtm/config
>> +++ b/tools/testing/selftests/lkdtm/config
>> @@ -2,8 +2,10 @@ CONFIG_LKDTM=y
>>  CONFIG_DEBUG_LIST=y
>>  CONFIG_SLAB_FREELIST_HARDENED=y
>>  CONFIG_FORTIFY_SOURCE=y
>> +CONFIG_GCC_PLUGIN_STACKLEAK=y
>>  CONFIG_HARDENED_USERCOPY=y
>>  CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
>> +CONFIG_INIT_ON_FREE_DEFAULT_ON=y
>>  CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
>>  CONFIG_UBSAN=y
>>  CONFIG_UBSAN_BOUNDS=y
>> diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
>> index 6b36b7f5dcf96..aa947b0ce1eeb 100644
>> --- a/tools/testing/selftests/lkdtm/tests.txt
>> +++ b/tools/testing/selftests/lkdtm/tests.txt
>> @@ -72,7 +72,7 @@ USERCOPY_STACK_FRAME_FROM
>>  USERCOPY_STACK_BEYOND
>>  USERCOPY_KERNEL
>>  STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
>> -CFI_FORWARD_PROTO
>> +#CFI_FORWARD_PROTO
>>  FORTIFIED_STRSCPY
>>  FORTIFIED_OBJECT
>>  FORTIFIED_SUBOBJECT
