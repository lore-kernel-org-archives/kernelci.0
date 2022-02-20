Date: Sun, 20 Feb 2022 21:06:33 +0100
From: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH 2/2] selftests: sgx: Treat CC as one argument
Message-ID: <YhKfSUXC/U1twT9h@iki.fi>
References: <20220210190642.1477814-1-usama.anjum@collabora.com>
 <20220210190642.1477814-3-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220210190642.1477814-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Jethro Beekman <jethro@fortanix.com>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>

On Fri, Feb 11, 2022 at 12:06:41AM +0500, Muhammad Usama Anjum wrote:
> CC can have multiple sub-strings like "ccache gcc". For check_cc.sh,
> CC needs to be treated like one argument. Put double quotes around it to
> make CC one string and hence one argument.
> 
> Fixes: 2adcba79e69d ("selftests/x86: Add a selftest for SGX")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  tools/testing/selftests/sgx/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
> index 2956584e1e37f..75af864e07b65 100644
> --- a/tools/testing/selftests/sgx/Makefile
> +++ b/tools/testing/selftests/sgx/Makefile
> @@ -4,7 +4,7 @@ include ../lib.mk
>  
>  .PHONY: all clean
>  
> -CAN_BUILD_X86_64 := $(shell ../x86/check_cc.sh $(CC) \
> +CAN_BUILD_X86_64 := $(shell ../x86/check_cc.sh "$(CC)" \
>  			    ../x86/trivial_64bit_program.c)
>  
>  ifndef OBJCOPY
> -- 
> 2.30.2
> 


Tested-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
