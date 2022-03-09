Return-Path: <keescook@chromium.org>
Date: Wed, 9 Mar 2022 11:23:36 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/2] selftests/lkdtm: add config
Message-ID: <202203091123.33E89F5@keescook>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <20220217205620.2512094-2-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220217205620.2512094-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 18, 2022 at 01:56:20AM +0500, Muhammad Usama Anjum wrote:
> Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
> needs KASAN enabled.

I'd prefer this use the SLAB_DEBUG options -- KASAN is very heavy.

-Kees

> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: 9c4f6ebc3665 ("lkdtm/heap: Add vmalloc linear overflow test")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  tools/testing/selftests/lkdtm/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/lkdtm/config b/tools/testing/selftests/lkdtm/config
> index adc9fa60057c5..4e8af0f712f74 100644
> --- a/tools/testing/selftests/lkdtm/config
> +++ b/tools/testing/selftests/lkdtm/config
> @@ -7,6 +7,7 @@ CONFIG_HARDENED_USERCOPY=y
>  CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
>  CONFIG_INIT_ON_FREE_DEFAULT_ON=y
>  CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
> +CONFIG_KASAN=y
>  CONFIG_UBSAN=y
>  CONFIG_UBSAN_BOUNDS=y
>  CONFIG_UBSAN_TRAP=y
> -- 
> 2.30.2
> 

-- 
Kees Cook
