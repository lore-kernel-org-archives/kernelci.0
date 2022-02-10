Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH] selftests/exec: Add non-regular to TEST_GEN_PROGS
References: <20220210171323.1304501-1-usama.anjum@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e8397c75-32df-b1d2-c3c3-21c5c0943ef6@linuxfoundation.org>
Date: Thu, 10 Feb 2022 10:34:20 -0700
MIME-Version: 1.0
In-Reply-To: <20220210171323.1304501-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/10/22 10:13 AM, Muhammad Usama Anjum wrote:
> non-regular file needs to be compiled and then copied to the output
> directory. Remove it from TEST_PROGS and add it to TEST_GEN_PROGS. This
> removes error thrown by rsync when non-regular object isn't found:
> 
> rsync: [sender] link_stat "/linux/tools/testing/selftests/exec/non-regular" failed: No such file or directory (2)
> rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1333) [sender=3.2.3]
> 
> Fixes: 0f71241a8e32 ("selftests/exec: add file type errno tests")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   tools/testing/selftests/exec/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
> index 551affb437fe1..a89ba6de79870 100644
> --- a/tools/testing/selftests/exec/Makefile
> +++ b/tools/testing/selftests/exec/Makefile
> @@ -3,8 +3,8 @@ CFLAGS = -Wall
>   CFLAGS += -Wno-nonnull
>   CFLAGS += -D_GNU_SOURCE
>   
> -TEST_PROGS := binfmt_script non-regular
> -TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216
> +TEST_PROGS := binfmt_script
> +TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
>   TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
>   # Makefile is a run-time dependency, since it's accessed by the execveat test
>   TEST_FILES := Makefile
> 

This change looks good to me. regular is a binary and TEST_GEN_PROGS is
where it belongs.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Also binfmt_script could be renamed to clearly identify that it is python
script. This can be done in a separate patch.

thanks,
-- Shuah
