Message-ID: <b00ea362-1d9d-601c-8481-b562c26e53b5@collabora.com>
Date: Thu, 14 Apr 2022 16:10:06 +0500
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: Fix separate output directory build of kselftests
References: <20220223191016.1658728-1-usama.anjum@collabora.com>
 <63c5d7ad-b0b2-9b37-16c3-354ac10858b6@collabora.com>
 <CAK7LNATkTPEBPWBSv6Rum0siHiHcJ0Q7VvPVoUQFH=S0M1fqow@mail.gmail.com>
 <d10a70cf-24a5-997a-09df-0bb2f4146b86@collabora.com>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <d10a70cf-24a5-997a-09df-0bb2f4146b86@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: usama.anjum@collabora.com, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, kernel@collabora.com, kernelci@groups.io, Kees Cook <keescook@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi,

At this time:
make kselftest-all (works)
make kselftest-all O=/tmp (works)
make kselftest-all O=build (doesn't work, investigation was shared)
make kselftest-all O=build/build2 (works)

I'd shared my final thoughts in the last email. I don't see any other
solution. If anybody has any other thoughts on how to cleanly fix `make
kselftest-all O=build`, do share.

Thanks,
Usama

On 4/4/22 4:09 PM, Muhammad Usama Anjum wrote:
> From [Makefile](https://elixir.bootlin.com/linux/latest/source/Makefile):
> ```
> ifeq ($(abs_srctree),$(abs_objtree))
>         # building in the source tree
>         srctree := .
> 	building_out_of_srctree :=
> else
>         ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
>                 # building in a subdirectory of the source tree
>                 srctree := ..
>         else
>                 srctree := $(abs_srctree)
>         endif
> 	building_out_of_srctree := 1
> endif
> ```
> `ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))` condition is setting
> `srctree` to `..`. This is wrong. This condition isn't considering that
> `header_install` doesn't depend on `abs_srctree and abs_objtree`. This
> condition needs to be tweaked or removed for the `install_headers` to
> work fine and fix this issue. I've added `KBUILD_ABS_SRCTREE=1` to the
> kselftest target which sets the `srctree` to `abs_srctree` and thus
> forcefully affecting only kselftest targets. This seems like the clean
> fix. Alternatively we should remove this condition `ifeq
> ($(abs_srctree)/,$(dir $(abs_objtree)))` but it'll affect other targets
> as well.
> 
> Complete details of investigation can be found here:
> https://github.com/kernelci/kernelci-project/issues/92#issuecomment-1087406222
> 
> On 3/17/22 11:08 PM, Masahiro Yamada wrote:
>> On Thu, Mar 17, 2022 at 7:49 PM Muhammad Usama Anjum
>> <usama.anjum@collabora.com> wrote:
>>>
>>> Reminder. Shuah is okay with this patch. Any thoughts?
>>
>> I do not think this is the right fix,
>> but something you just happen to find working.
>>
>>
>> The Make is working in a wrong directory, that is why
>> the relative path does not work
>> (and you use the absolute path to work around it)
>>
> `ifeq ($(abs_srctree)/,$(dir $(abs_objtree))) \ srctree := ..` has
> broken the `make headers_install` when called through
> selftests/Makefile. We can remove it or use the absolute path each time.
> 

-- 
Muhammad Usama Anjum
