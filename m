Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] selftests: x86: allow expansion of $(CC)
References: <20220210190642.1477814-1-usama.anjum@collabora.com>
 <20220210190642.1477814-2-usama.anjum@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a34f2fc8-f4aa-fef4-d1dd-f3fdb5114f72@linuxfoundation.org>
Date: Thu, 10 Feb 2022 13:51:51 -0700
MIME-Version: 1.0
In-Reply-To: <20220210190642.1477814-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Jethro Beekman <jethro@fortanix.com>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>

On 2/10/22 12:06 PM, Muhammad Usama Anjum wrote:
> CC can have multiple sub-strings like "ccache gcc". Erorr pops up if
> it is treated as single string and double quote are used around it.
> This can be fixed by removing the quotes and not treating CC a single
> string.
> 
> Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture detection")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   tools/testing/selftests/x86/check_cc.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/check_cc.sh b/tools/testing/selftests/x86/check_cc.sh
> index 3e2089c8cf549..aff2c15018b53 100755
> --- a/tools/testing/selftests/x86/check_cc.sh
> +++ b/tools/testing/selftests/x86/check_cc.sh
> @@ -7,7 +7,7 @@ CC="$1"
>   TESTPROG="$2"
>   shift 2
>   
> -if "$CC" -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
> +if $CC -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>       echo 1
>   else
>       echo 0
> 

The intent is testing if $CC is set. Does this change work when
$CC is not set?

thanks,
-- Shuah


