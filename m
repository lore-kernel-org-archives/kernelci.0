Message-ID: <ddb52ffe-5016-cc5a-3af4-a0a8e7b3e119@collabora.com>
Date: Sat, 26 Feb 2022 12:32:23 +0500
MIME-Version: 1.0
Subject: Re: [PATCH V2] selftests: Fix build when $(O) points to a relative path
References: <20220216223817.1386745-1-usama.anjum@collabora.com>
 <46489cd9-fb7a-5a4b-7f36-1c9f6566bd93@collabora.com>
 <63870982-62ba-97f2-5ee2-d4457a7a5cdb@linuxfoundation.org>
 <9a643612-ea85-7b28-a792-770927836d43@linuxfoundation.org>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <9a643612-ea85-7b28-a792-770927836d43@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org

On 2/26/22 2:13 AM, Shuah Khan wrote:
> On 2/25/22 11:01 AM, Shuah Khan wrote:
>> On 2/25/22 10:22 AM, Muhammad Usama Anjum wrote:
>>> Any thoughts about it?
>>>
>>
>> No to post please.
>>
>>> On 2/17/22 3:38 AM, Muhammad Usama Anjum wrote:
>>>> Build of bpf and tc-testing selftests fails when the relative path of
>>>> the build directory is specified.
>>>>
>>>> make -C tools/testing/selftests O=3Dbuild0
>>>> make[1]: Entering directory
>>>> '/linux_mainline/tools/testing/selftests/bpf'
>>>> ../../../scripts/Makefile.include:4: *** O=3Dbuild0 does not exist.=C2=
=A0
>>>> Stop.
>>>> make[1]: Entering directory
>>>> '/linux_mainline/tools/testing/selftests/tc-testing'
>>>> ../../../scripts/Makefile.include:4: *** O=3Dbuild0 does not exist.=C2=
=A0
>>>> Stop.
>>>>
>>>> Makefiles of bpf and tc-testing include scripts/Makefile.include file.
>>>> This file has sanity checking inside it which checks the output path.
>>>> The output path is not relative to the bpf or tc-testing. The sanity
>>>> check fails. Expand the output path to get rid of this error. The
>>>> fix is
>>>> the same as mentioned in commit 150a27328b68 ("bpf, preload: Fix build
>>>> when $(O) points to a relative path").
>>>>
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>> ---
>>>> Changes in V2:
>>>> Add more explaination to the commit message.
>>>> Support make install as well.
>>
>=20
> Does the same happen when you use make kselftest-all?
No, this problem doesn't appear when using make kselftest-all.

As separate output directory build was broken in kernel's top most
Makefile i.e., make kselftest-all O=3Ddir. (I've sent separate patch to
fix this:
https://lore.kernel.org/lkml/20220223191016.1658728-1-usama.anjum@collabora=
.com/)
So people must have been using kselftest's internal Makefile directly to
keep object files in separate directory i.e., make -C
tools/testing/selftests O=3Ddir and in this way the build of these tests
(bpf, tc-testing) fail. This patch is fixing those build errors.

>=20
> I am unable to reproduce what you are seeing?
make -C tools/testing/selftests O=3Ddir should reproduce this problem.

>=20
> thanks,
> -- Shuah
>=20
