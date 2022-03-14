MIME-Version: 1.0
References: <d0d460d7be0107a69e3c52477761a6fe694c1840.1646991629.git.guillaume.tucker@collabora.com>
In-Reply-To: <d0d460d7be0107a69e3c52477761a6fe694c1840.1646991629.git.guillaume.tucker@collabora.com>
From: "Guenter Roeck" <groeck@google.com>
Date: Mon, 14 Mar 2022 09:18:08 -0700
Message-ID: <CABXOdTcdgSSVTXDN0DjB+-2K+H76_YJeFrue_MFJmBkZQZu7JQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests, x86: fix how check_cc.sh is being invoked
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>, Dave Hansen <dave.hansen@linux.intel.com>, Collabora Kernel ML <kernel@collabora.com>, Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Mar 11, 2022 at 2:05 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> The $(CC) variable used in Makefiles could contain several arguments
> such as "ccache gcc".  These need to be passed as a single string to
> check_cc.sh, otherwise only the first argument will be used as the
> compiler command.  Without quotes, the $(CC) variable is passed as
> distinct arguments which causes the script to fail to build trivial
> programs.
>
> Fix this by adding quotes around $(CC) when calling check_cc.sh to
> pass the whole string as a single argument to the script even if it
> has several words such as "ccache gcc".
>
> Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture detection")
> Tested-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Reviewed-by: Guenter Roeck <groeck@google.com>

> ---
>
> Notes:
>     v2: rebase and drop changes in check_cc.sh
>
>  tools/testing/selftests/vm/Makefile  | 6 +++---
>  tools/testing/selftests/x86/Makefile | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index fbccdda93629..213f6a57d7f6 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -54,9 +54,9 @@ TEST_GEN_FILES += split_huge_page_test
>  TEST_GEN_FILES += ksm_tests
>
>  ifeq ($(MACHINE),x86_64)
> -CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
> -CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
> -CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
> +CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
> +CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_64bit_program.c)
> +CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_program.c -no-pie)
>
>  override TARGETS := protection_keys
>  BINARIES_32 := $(TARGETS:%=%_32)
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 8a1f62ab3c8e..53df7d3893d3 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -6,9 +6,9 @@ include ../lib.mk
>  .PHONY: all all_32 all_64 warn_32bit_failure clean
>
>  UNAME_M := $(shell uname -m)
> -CAN_BUILD_I386 := $(shell ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
> -CAN_BUILD_X86_64 := $(shell ./check_cc.sh $(CC) trivial_64bit_program.c)
> -CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh $(CC) trivial_program.c -no-pie)
> +CAN_BUILD_I386 := $(shell ./check_cc.sh "$(CC)" trivial_32bit_program.c -m32)
> +CAN_BUILD_X86_64 := $(shell ./check_cc.sh "$(CC)" trivial_64bit_program.c)
> +CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh "$(CC)" trivial_program.c -no-pie)
>
>  TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
>                         check_initial_reg_state sigreturn iopl ioperm \
> --
> 2.30.2
>
>
>
> ------------
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1448): https://groups.io/g/kernelci/message/1448
> Mute This Topic: https://groups.io/mt/89707412/955378
> Group Owner: kernelci+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci/unsub [groeck@google.com]
> ------------
>
>
