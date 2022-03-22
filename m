Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [bug report] selftests: futex: warning during build with multiple jobs
References: <8907d4a9-2a3f-3442-2c5e-6c34f196d2a8@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <73470cb9-bb3c-eb4a-a1af-d15f6e15a60b@linuxfoundation.org>
Date: Tue, 22 Mar 2022 14:46:15 -0600
MIME-Version: 1.0
In-Reply-To: <8907d4a9-2a3f-3442-2c5e-6c34f196d2a8@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "kernelci@groups.io >> \"kernelci@groups.io\"" <kernelci@groups.io>, Collabora Kernel ML <kernel@collabora.com>, Shuah Khan <skhan@linuxfoundation.org>

On 3/13/22 10:09 AM, Muhammad Usama Anjum wrote:
> Hi,
> 
> On linux-next
> cd tools/testing/selftests/futex && make clean -j 32
> gives warning
> make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> The full logs with with different reproduction steps can be found here:
> https://storage.staging.kernelci.org/next/master/next-20220310/x86_64/x86_64_defconfig+kselftest/gcc-10/logs/kselftest.log.
> Usually this type of warning shouldn't come when $MAKE is being used
> instead of make in Makefile.
> 
> Maybe `define CLEAN` inside override construct defined in parent
> makefile is not getting jobsever information when child make process
> executes. I've enabled verbose mode and tried with other makefile flags
> (-p, -d etc) as well. Documentation mentions that if make is unable to
> identify the child process correctly, this warning will appear.
> 
> Please share if you have any thoughts on it.
> 

futex test defines its own clean to catch all the sub-directories
overriding common clean. Changing it not override won't do the
clean properly.

Propose a fix that works for -j build as well keeping override in
place.

thanks,
-- Shuah

