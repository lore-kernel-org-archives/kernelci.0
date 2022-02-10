Return-Path: <keescook@chromium.org>
Date: Thu, 10 Feb 2022 15:55:48 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH V2] selftests/exec: Rename file binfmt_script to binfmt_script.py
Message-ID: <202202101555.EE737A35@keescook>
References: <20220210222319.1864680-1-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220210222319.1864680-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 11, 2022 at 03:23:19AM +0500, Muhammad Usama Anjum wrote:
> Rename file for readability purpose. Update its usage and references.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> This path was suggested while review of the following patch. Please
> apply it after applying that one first:
> 	selftests/exec: Add non-regular to TEST_GEN_PROGS
> Changes in V2:
> 	Remove changes from binfmt_script.py, they were wrong

Thanks! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  tools/testing/selftests/exec/Makefile                           | 2 +-
>  .../testing/selftests/exec/{binfmt_script => binfmt_script.py}  | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/testing/selftests/exec/{binfmt_script => binfmt_script.py} (100%)
> 
> diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
> index a89ba6de79870..a0b8688b08369 100644
> --- a/tools/testing/selftests/exec/Makefile
> +++ b/tools/testing/selftests/exec/Makefile
> @@ -3,7 +3,7 @@ CFLAGS = -Wall
>  CFLAGS += -Wno-nonnull
>  CFLAGS += -D_GNU_SOURCE
>  
> -TEST_PROGS := binfmt_script
> +TEST_PROGS := binfmt_script.py
>  TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
>  TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
>  # Makefile is a run-time dependency, since it's accessed by the execveat test
> diff --git a/tools/testing/selftests/exec/binfmt_script b/tools/testing/selftests/exec/binfmt_script.py
> similarity index 100%
> rename from tools/testing/selftests/exec/binfmt_script
> rename to tools/testing/selftests/exec/binfmt_script.py
> -- 
> 2.30.2
> 

-- 
Kees Cook
