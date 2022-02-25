Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V2] selftests: Fix build when $(O) points to a relative path
References: <20220216223817.1386745-1-usama.anjum@collabora.com>
 <46489cd9-fb7a-5a4b-7f36-1c9f6566bd93@collabora.com>
 <63870982-62ba-97f2-5ee2-d4457a7a5cdb@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9a643612-ea85-7b28-a792-770927836d43@linuxfoundation.org>
Date: Fri, 25 Feb 2022 14:13:10 -0700
MIME-Version: 1.0
In-Reply-To: <63870982-62ba-97f2-5ee2-d4457a7a5cdb@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org

On 2/25/22 11:01 AM, Shuah Khan wrote:
> On 2/25/22 10:22 AM, Muhammad Usama Anjum wrote:
>> Any thoughts about it?
>>
> 
> No to post please.
> 
>> On 2/17/22 3:38 AM, Muhammad Usama Anjum wrote:
>>> Build of bpf and tc-testing selftests fails when the relative path of
>>> the build directory is specified.
>>>
>>> make -C tools/testing/selftests O=build0
>>> make[1]: Entering directory '/linux_mainline/tools/testing/selftests/bpf'
>>> ../../../scripts/Makefile.include:4: *** O=build0 does not exist.  Stop.
>>> make[1]: Entering directory '/linux_mainline/tools/testing/selftests/tc-testing'
>>> ../../../scripts/Makefile.include:4: *** O=build0 does not exist.  Stop.
>>>
>>> Makefiles of bpf and tc-testing include scripts/Makefile.include file.
>>> This file has sanity checking inside it which checks the output path.
>>> The output path is not relative to the bpf or tc-testing. The sanity
>>> check fails. Expand the output path to get rid of this error. The fix is
>>> the same as mentioned in commit 150a27328b68 ("bpf, preload: Fix build
>>> when $(O) points to a relative path").
>>>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>> Changes in V2:
>>> Add more explaination to the commit message.
>>> Support make install as well.
> 

Does the same happen when you use make kselftest-all?

I am unable to reproduce what you are seeing?

thanks,
-- Shuah

