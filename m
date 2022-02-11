Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V2] selftests/exec: Rename file binfmt_script to binfmt_script.py
References: <20220210222319.1864680-1-usama.anjum@collabora.com>
 <202202101555.EE737A35@keescook>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <18cf9c45-b270-2c44-9eb8-d6f3e947ae49@linuxfoundation.org>
Date: Thu, 10 Feb 2022 17:34:20 -0700
MIME-Version: 1.0
In-Reply-To: <202202101555.EE737A35@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/10/22 4:55 PM, Kees Cook wrote:
> On Fri, Feb 11, 2022 at 03:23:19AM +0500, Muhammad Usama Anjum wrote:
>> Rename file for readability purpose. Update its usage and references.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> This path was suggested while review of the following patch. Please
>> apply it after applying that one first:
>> 	selftests/exec: Add non-regular to TEST_GEN_PROGS
>> Changes in V2:
>> 	Remove changes from binfmt_script.py, they were wrong
> 
> Thanks! :)
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Thank you both. I will queue this up for Linux 5.18-rc1

thanks,
-- Shuah
