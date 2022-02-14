Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V2 2/2] selftests: sgx: Treat CC as one argument
References: <20220214184109.3739179-1-usama.anjum@collabora.com>
 <20220214184109.3739179-3-usama.anjum@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d6212372-5239-c903-4f0f-9b3bcfc9b52d@linuxfoundation.org>
Date: Mon, 14 Feb 2022 14:00:01 -0700
MIME-Version: 1.0
In-Reply-To: <20220214184109.3739179-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jethro Beekman <jethro@fortanix.com>, Borislav Petkov <bp@suse.de>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, David.Laight@ACULAB.COM
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, Shuah Khan <skhan@linuxfoundation.org>

On 2/14/22 11:41 AM, Muhammad Usama Anjum wrote:
> CC can have multiple sub-strings like "ccache gcc". For check_cc.sh,
> CC needs to be treated like one argument. Put double quotes around it to
> make CC one string and hence one argument.
> 
> Fixes: 2adcba79e69d ("selftests/x86: Add a selftest for SGX")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   tools/testing/selftests/sgx/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
> index 2956584e1e37f..75af864e07b65 100644
> --- a/tools/testing/selftests/sgx/Makefile
> +++ b/tools/testing/selftests/sgx/Makefile
> @@ -4,7 +4,7 @@ include ../lib.mk
>   
>   .PHONY: all clean
>   
> -CAN_BUILD_X86_64 := $(shell ../x86/check_cc.sh $(CC) \
> +CAN_BUILD_X86_64 := $(shell ../x86/check_cc.sh "$(CC)" \
>   			    ../x86/trivial_64bit_program.c)
>   
>   ifndef OBJCOPY
> 

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

