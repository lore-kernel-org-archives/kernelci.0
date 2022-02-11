Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] selftests: x86: allow expansion of $(CC)
References: <20220210190642.1477814-1-usama.anjum@collabora.com>
 <20220210190642.1477814-2-usama.anjum@collabora.com>
 <a34f2fc8-f4aa-fef4-d1dd-f3fdb5114f72@linuxfoundation.org>
 <99625ceecead4e9eb73de2fc8acb2ae9@AcuMS.aculab.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7a501981-e4ce-fb08-7c1e-6aca26245cef@linuxfoundation.org>
Date: Fri, 11 Feb 2022 10:13:15 -0700
MIME-Version: 1.0
In-Reply-To: <99625ceecead4e9eb73de2fc8acb2ae9@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Laight <David.Laight@ACULAB.COM>, Muhammad Usama Anjum <usama.anjum@collabora.com>, Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Jethro Beekman <jethro@fortanix.com>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: "kernel@collabora.com" <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>, "kernelci.org bot" <bot@kernelci.org>, Shuah Khan <skhan@linuxfoundation.org>

On 2/11/22 9:47 AM, David Laight wrote:
> From: Shuah Khan
>> Sent: 10 February 2022 20:52
>>
>> On 2/10/22 12:06 PM, Muhammad Usama Anjum wrote:
>>> CC can have multiple sub-strings like "ccache gcc". Erorr pops up if
>>> it is treated as single string and double quote are used around it.
>>> This can be fixed by removing the quotes and not treating CC a single
>>> string.
>>>
>>> Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture detection")
>>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>>    tools/testing/selftests/x86/check_cc.sh | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/x86/check_cc.sh b/tools/testing/selftests/x86/check_cc.sh
>>> index 3e2089c8cf549..aff2c15018b53 100755
>>> --- a/tools/testing/selftests/x86/check_cc.sh
>>> +++ b/tools/testing/selftests/x86/check_cc.sh
>>> @@ -7,7 +7,7 @@ CC="$1"
>>>    TESTPROG="$2"
>>>    shift 2
>>>
>>> -if "$CC" -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>>> +if $CC -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>>>        echo 1
>>>    else
>>>        echo 0
>>>
>>
>> The intent is testing if $CC is set. Does this change work when
>> $CC is not set?
> 
> More by luck than judgement. Before and after.
> If $CC might be empty you probably want:
> 
> [ -n "$CC" ] && { echo 0; return; }
> 
> The subject is also wrong. Should be "allow field splitting' of ${CC}.
> (no brace or curly braces, not round ones.)
> 

Good points. It would be good enhancement to add the check - since the
current logic doesn't handle the null CC

thanks,
-- Shuah
