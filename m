Return-Path: <keescook@chromium.org>
Date: Thu, 10 Feb 2022 09:45:11 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/exec: Add non-regular to TEST_GEN_PROGS
Message-ID: <202202100945.1A6C624A@keescook>
References: <20220210171323.1304501-1-usama.anjum@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220210171323.1304501-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 10, 2022 at 10:13:23PM +0500, Muhammad Usama Anjum wrote:
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

Eek, thanks for fixing this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
