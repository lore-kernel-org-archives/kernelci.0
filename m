Message-ID: <8907d4a9-2a3f-3442-2c5e-6c34f196d2a8@collabora.com>
Date: Sun, 13 Mar 2022 21:09:44 +0500
MIME-Version: 1.0
From: "Usama" <usama.anjum@collabora.com>
Subject: [bug report] selftests: futex: warning during build with multiple jobs
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>
Cc: usama.anjum@collabora.com, Shuah Khan <shuah@kernel.org>, "kernelci@groups.io >> \"kernelci@groups.io\"" <kernelci@groups.io>, Collabora Kernel ML <kernel@collabora.com>

Hi,

On linux-next
cd tools/testing/selftests/futex && make clean -j 32
gives warning
make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent
make rule.
The full logs with with different reproduction steps can be found here:
https://storage.staging.kernelci.org/next/master/next-20220310/x86_64/x86_64_defconfig+kselftest/gcc-10/logs/kselftest.log.
Usually this type of warning shouldn't come when $MAKE is being used
instead of make in Makefile.

Maybe `define CLEAN` inside override construct defined in parent
makefile is not getting jobsever information when child make process
executes. I've enabled verbose mode and tried with other makefile flags
(-p, -d etc) as well. Documentation mentions that if make is unable to
identify the child process correctly, this warning will appear.

Please share if you have any thoughts on it.

-- 
Muhammad Usama Anjum
