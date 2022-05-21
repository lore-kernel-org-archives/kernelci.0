Message-ID: <c25d7ea7-4f72-4a2b-d8c3-d317e64fcbbb@collabora.com>
Date: Sat, 21 May 2022 11:44:32 +0500
MIME-Version: 1.0
From: "Usama" <usama.anjum@collabora.com>
Subject: [Bug Report] - kselftest build fails if output directory is first level sub-directory
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>
Cc: usama.anjum@collabora.com, Shuah Khan <shuah@kernel.org>, KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernelci@groups.io" <kernelci@groups.io>

Hello,

kselftest can be built using the kernel's top most Makefile without
using kselftest's Makefile directly. But there is bug in the top most
Makefile. The build fails if the specified output directory is first
level sub-directory. Here is a example to reproduce this bug:

make kselftest-all O=build

"The Make is working in a wrong directory, that is why the relative path
does not work." Masahiro Yamada. Feel free to fix it if someone pin the bug.

It should be noted that the build works in some other combinations:
make kselftest-all (works)
make kselftest-all O=/tmp (works)
make kselftest-all O=build/build2 (works)

My unsuccessful attempt to fix this bug can be found here:
https://lore.kernel.org/lkml/20220223191016.1658728-1-usama.anjum@collabora.com/

Thanks,
Muhammad Usama Anjum
