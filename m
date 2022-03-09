Return-Path: <keescook@chromium.org>
Date: Wed, 9 Mar 2022 11:22:37 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] selftests/lkdtm: add config and turn off CFI_FORWARD_PROTO
Message-ID: <202203091122.A51B31230A@keescook>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220217205620.2512094-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, kernel@collabora.com, kernelci@groups.io, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 18, 2022 at 01:56:19AM +0500, Muhammad Usama Anjum wrote:
> Add config options which are needed for LKDTM sub-tests.
> STACKLEAK_ERASING test needs GCC_PLUGIN_STACKLEAK config.
> READ_AFTER_FREE and READ_BUDDY_AFTER_FREE tests need
> INIT_ON_FREE_DEFAULT_ON config.
> 
> CFI_FORWARD_PROTO always fails as there is no active CFI system of some
> kind. Turn it off for now by default until proper support.

Building under LTO Clang on arm64, this is available. What's the right
way to add a CONFIG that isn't always available?

-Kees

> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  tools/testing/selftests/lkdtm/config    | 2 ++
>  tools/testing/selftests/lkdtm/tests.txt | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftests/lkdtm/config
> index 46f39ee762086..adc9fa60057c5 100644
> --- a/tools/testing/selftests/lkdtm/config
> +++ b/tools/testing/selftests/lkdtm/config
> @@ -2,8 +2,10 @@ CONFIG_LKDTM=y
>  CONFIG_DEBUG_LIST=y
>  CONFIG_SLAB_FREELIST_HARDENED=y
>  CONFIG_FORTIFY_SOURCE=y
> +CONFIG_GCC_PLUGIN_STACKLEAK=y
>  CONFIG_HARDENED_USERCOPY=y
>  CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
> +CONFIG_INIT_ON_FREE_DEFAULT_ON=y
>  CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
>  CONFIG_UBSAN=y
>  CONFIG_UBSAN_BOUNDS=y
> diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
> index 6b36b7f5dcf96..aa947b0ce1eeb 100644
> --- a/tools/testing/selftests/lkdtm/tests.txt
> +++ b/tools/testing/selftests/lkdtm/tests.txt
> @@ -72,7 +72,7 @@ USERCOPY_STACK_FRAME_FROM
>  USERCOPY_STACK_BEYOND
>  USERCOPY_KERNEL
>  STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
> -CFI_FORWARD_PROTO
> +#CFI_FORWARD_PROTO
>  FORTIFIED_STRSCPY
>  FORTIFIED_OBJECT
>  FORTIFIED_SUBOBJECT
> -- 
> 2.30.2
> 

-- 
Kees Cook
