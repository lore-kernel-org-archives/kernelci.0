Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V2 1/2] selftests: x86: add validity check and allow field splitting
References: <20220214184109.3739179-1-usama.anjum@collabora.com>
 <20220214184109.3739179-2-usama.anjum@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8f62537f-e191-1d60-530a-9eb9c31b0511@linuxfoundation.org>
Date: Mon, 14 Feb 2022 13:59:42 -0700
MIME-Version: 1.0
In-Reply-To: <20220214184109.3739179-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jethro Beekman <jethro@fortanix.com>, Borislav Petkov <bp@suse.de>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, David.Laight@ACULAB.COM
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, Shuah Khan <skhan@linuxfoundation.org>

On 2/14/22 11:41 AM, Muhammad Usama Anjum wrote:
> Add check to test if CC has a string. CC can have multiple sub-strings
> like "ccache gcc". Erorr pops up if it is treated as single string and
> double quotes are used around it. This can be fixed by removing the
> quotes and not treating CC as a single string.
> 
> Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture detection")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes in V2:
> Update if condition to check if CC has a string
> ---
>   tools/testing/selftests/x86/check_cc.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/check_cc.sh b/tools/testing/selftests/x86/check_cc.sh
> index 3e2089c8cf549..8c669c0d662ee 100755
> --- a/tools/testing/selftests/x86/check_cc.sh
> +++ b/tools/testing/selftests/x86/check_cc.sh
> @@ -7,7 +7,7 @@ CC="$1"
>   TESTPROG="$2"
>   shift 2
>   
> -if "$CC" -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
> +if [ -n "$CC" ] && $CC -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>       echo 1
>   else
>       echo 0
> 

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
