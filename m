Message-ID: <2ac8cecb-5e14-a8b2-7629-a9ab9d474585@collabora.com>
Date: Tue, 8 Mar 2022 13:11:07 +0500
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: Fix separate output directory build of kselftests
References: <20220223191016.1658728-1-usama.anjum@collabora.com>
 <6e954470-f593-e27a-d15c-ecd5c28f4dca@linuxfoundation.org>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <6e954470-f593-e27a-d15c-ecd5c28f4dca@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, shuah@kernel.org, linux-kselftest@vger.kernel.org, keescook@chromium.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/4/22 2:32 AM, Shuah Khan wrote:
> On 2/23/22 12:10 PM, Muhammad Usama Anjum wrote:
>> Build of kselftests fail if kernel's top most Makefile is used for
>> running or building kselftests with separate output directory. The
>> absolute path is needed to reference other files during this kind of
>> build. Set KBUILD_ABS_SRCTREE to use absolute path during the build. It
>> fixes the following different types of errors:
>>
>> make kselftest-all O=/linux_mainline/build
>> Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
>>
>> make kselftest-all O=build
>> Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> I've tested this patch on top of next-20220217. The latest next-20220222
>> have missing patches.
> 
> Can you give more details on the use-cases you tested? Did you test all
> the ways kselftest are built?
> 
Yeah, I've tried to test all the ways. Here are the different ways I've
used to test it:
1) Same directory build of kselftest (this is already working)
make kselftest
make kselftest-all
make kselftest-install
make kselftest-clean
make kselftest-gen_tar

2) These were failing when separate output directory is specified either
as relative or absolute path. After adding this patch, these are also
working. kselfetst.rst mentions separate output directory build in this way.
make kselftest O=build
make kselftest-all O=build
make kselftest-install O=build
make kselftest-clean O=build
make kselftest-gen_tar O=build

make kselftest O=/build
make kselftest-all O=/build
make kselftest-install O=/build
make kselftest-clean O=/build
make kselftest-gen_tar O=/build

Tested on top of next-20220307 after applying this patch.
