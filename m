Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [Bug Report] - kselftest build fails if output directory is first level sub-directory
References: <c25d7ea7-4f72-4a2b-d8c3-d317e64fcbbb@collabora.com>
 <CAK7LNATL4nMmKgrjS8meavnpn=HisD30QxuPUKDqtWWgbGcSZw@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a9470bfc-bddc-6aa6-0043-d49eb57611fe@linuxfoundation.org>
Date: Tue, 7 Jun 2022 15:39:20 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNATL4nMmKgrjS8meavnpn=HisD30QxuPUKDqtWWgbGcSZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Masahiro Yamada <masahiroy@kernel.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>, KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernelci@groups.io" <kernelci@groups.io>, Shuah Khan <skhan@linuxfoundation.org>

On 5/22/22 11:15 AM, Masahiro Yamada wrote:
> On Sat, May 21, 2022 at 3:44 PM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
>>
>> Hello,
>>
>> kselftest can be built using the kernel's top most Makefile without
>> using kselftest's Makefile directly. But there is bug in the top most
>> Makefile. The build fails if the specified output directory is first
>> level sub-directory. Here is a example to reproduce this bug:
>>
>> make kselftest-all O=build
>>
>> "The Make is working in a wrong directory, that is why the relative path
>> does not work." Masahiro Yamada. Feel free to fix it if someone pin the bug.
>>
>> It should be noted that the build works in some other combinations:
>> make kselftest-all (works)
>> make kselftest-all O=/tmp (works)
>> make kselftest-all O=build/build2 (works)
>>
>> My unsuccessful attempt to fix this bug can be found here:
>> https://lore.kernel.org/lkml/20220223191016.1658728-1-usama.anjum@collabora.com/
>>
>> Thanks,
>> Muhammad Usama Anjum
> 
> 
> This problem starts from the bad design of the kselftest framework.
> I did some research before. I think I can fix the root cause but
> currently I do not have enough time to do it.
> 
> 
> KBUILD_ABS_SRCTREE is a user-interface to request
> Kbuild to use the absolute path.
> If it is forced in the top Makefile, users have no way to
> negate it.
> It is true that using the absolute path is a quick work-around
> because you do not need to care about the current working directory.
> 
> If you insist on it,  just go ahead.  It is just two line changes.
> Once the issue is fixed in a better way, your patch can be reverted easily.
> 
> 
> 

Why don't we work on fixing it the wright way? I would rather go that
route than using short rem fixes.

Usama, would you be interested in working on a proper fix as recommended
by Masahiro?

thanks,
-- Shuah
