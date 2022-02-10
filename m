Return-Path: <keescook@chromium.org>
Date: Thu, 10 Feb 2022 13:15:19 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/exec: Rename file binfmt_script to binfmt_script.py
Message-ID: <202202101312.23076F5@keescook>
References: <20220210192845.1533204-1-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220210192845.1533204-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 11, 2022 at 12:28:45AM +0500, Muhammad Usama Anjum wrote:
> Rename file for readability purpose. Update its usage and references.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> This path was suggested while review of the following patch. Please
> apply it after applying that one first:
> 	selftests/exec: Add non-regular to TEST_GEN_PROGS
> ---
>  tools/testing/selftests/exec/Makefile          |  2 +-
>  .../exec/{binfmt_script => binfmt_script.py}   | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  rename tools/testing/selftests/exec/{binfmt_script => binfmt_script.py} (90%)
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
> similarity index 90%
> rename from tools/testing/selftests/exec/binfmt_script
> rename to tools/testing/selftests/exec/binfmt_script.py

Everything from here up, yes. Thank you! :)

All the rest aren't right: it's talking about the binfmt_script subsystem
of the kernel, rather than the binfmt_script.py test script file itself.

> index 05f94a741c7aa..6f717fedc97bd 100755
> --- a/tools/testing/selftests/exec/binfmt_script
> +++ b/tools/testing/selftests/exec/binfmt_script.py
> @@ -28,11 +28,11 @@ foreach my $a (@ARGV) {
>  '''
>  
>  ##
> -# test - produce a binfmt_script hashbang line for testing
> +# test - produce a binfmt_script.py hashbang line for testing
>  #
>  # @size:     bytes for bprm->buf line, including hashbang but not newline
>  # @good:     whether this script is expected to execute correctly
> -# @hashbang: the special 2 bytes for running binfmt_script
> +# @hashbang: the special 2 bytes for running binfmt_script.py
>  # @leading:  any leading whitespace before the executable path
>  # @root:     start of executable pathname
>  # @target:   end of executable pathname
> @@ -45,7 +45,7 @@ def test(name, size, good=True, leading="", root="./", target="/perl",
>      global test_num, tests, NAME_MAX
>      test_num += 1
>      if test_num > tests:
> -        raise ValueError("more binfmt_script tests than expected! (want %d, expected %d)"
> +        raise ValueError("more binfmt_script.py tests than expected! (want %d, expected %d)"
>                           % (test_num, tests))
>  
>      middle = ""
> @@ -68,7 +68,7 @@ def test(name, size, good=True, leading="", root="./", target="/perl",
>      if len(newline) > 0:
>          buf += 'echo this is not really perl\n'
>  
> -    script = "binfmt_script-%s" % (name)
> +    script = "binfmt_script.py-%s" % (name)
>      open(script, "w").write(buf)
>      os.chmod(script, 0o755)
>  
> @@ -78,17 +78,17 @@ def test(name, size, good=True, leading="", root="./", target="/perl",
>  
>      if proc.returncode == 0 and b'Executed interpreter' in stdout:
>          if good:
> -            print("ok %d - binfmt_script %s (successful good exec)"
> +            print("ok %d - binfmt_script.py %s (successful good exec)"
>                    % (test_num, name))
>          else:
> -            print("not ok %d - binfmt_script %s succeeded when it should have failed"
> +            print("not ok %d - binfmt_script.py %s succeeded when it should have failed"
>                    % (test_num, name))
>      else:
>          if good:
> -            print("not ok %d - binfmt_script %s failed when it should have succeeded (rc:%d)"
> +            print("not ok %d - binfmt_script.py %s failed when it should have succeeded (rc:%d)"
>                    % (test_num, name, proc.returncode))
>          else:
> -            print("ok %d - binfmt_script %s (correctly failed bad exec)"
> +            print("ok %d - binfmt_script.py %s (correctly failed bad exec)"
>                    % (test_num, name))
>  
>      # Clean up crazy binaries
> @@ -167,5 +167,5 @@ test(name="two-under-leading",   size=int(SIZE/2), leading=" ")
>  test(name="two-under-lead-trunc-arg", size=int(SIZE/2), leading=" ", arg=" ")
>  
>  if test_num != tests:
> -    raise ValueError("fewer binfmt_script tests than expected! (ran %d, expected %d"
> +    raise ValueError("fewer binfmt_script.py tests than expected! (ran %d, expected %d"
>                       % (test_num, tests))
> -- 
> 2.30.2
> 

-- 
Kees Cook
