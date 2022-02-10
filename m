Return-Path: <keescook@chromium.org>
Date: Thu, 10 Feb 2022 09:46:17 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/exec: Add non-regular to TEST_GEN_PROGS
Message-ID: <202202100945.BCDDA1BE3D@keescook>
References: <20220210171323.1304501-1-usama.anjum@collabora.com>
 <e8397c75-32df-b1d2-c3c3-21c5c0943ef6@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e8397c75-32df-b1d2-c3c3-21c5c0943ef6@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 10, 2022 at 10:34:20AM -0700, Shuah Khan wrote:
> On 2/10/22 10:13 AM, Muhammad Usama Anjum wrote:
> > non-regular file needs to be compiled and then copied to the output
> > directory. Remove it from TEST_PROGS and add it to TEST_GEN_PROGS. This
> > removes error thrown by rsync when non-regular object isn't found:
> > 
> > rsync: [sender] link_stat "/linux/tools/testing/selftests/exec/non-regular" failed: No such file or directory (2)
> > rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1333) [sender=3.2.3]
> > 
> > Fixes: 0f71241a8e32 ("selftests/exec: add file type errno tests")
> > Reported-by: "kernelci.org bot" <bot@kernelci.org>
> > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > ---
> >   tools/testing/selftests/exec/Makefile | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
> > index 551affb437fe1..a89ba6de79870 100644
> > --- a/tools/testing/selftests/exec/Makefile
> > +++ b/tools/testing/selftests/exec/Makefile
> > @@ -3,8 +3,8 @@ CFLAGS = -Wall
> >   CFLAGS += -Wno-nonnull
> >   CFLAGS += -D_GNU_SOURCE
> > -TEST_PROGS := binfmt_script non-regular
> > -TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216
> > +TEST_PROGS := binfmt_script
> > +TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
> >   TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
> >   # Makefile is a run-time dependency, since it's accessed by the execveat test
> >   TEST_FILES := Makefile
> > 
> 
> This change looks good to me. regular is a binary and TEST_GEN_PROGS is
> where it belongs.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Also binfmt_script could be renamed to clearly identify that it is python
> script. This can be done in a separate patch.

Yeah, I agree: that would help with skimming the Makefile for
correctness.

-- 
Kees Cook
