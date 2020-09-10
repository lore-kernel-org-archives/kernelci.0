Subject: Re: next/pending-fixes build: 213 builds: 0 failed, 213 passed, 1437 errors, 244 warnings (v5.9-rc4-322-g03ef16f8dff9)
References: <5f58c669.1c69fb81.db1a2.5f8e@mx.google.com>
 <20200910091752.74f327f0@canb.auug.org.au>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <21e21937-724b-ee09-a4ef-ee76fcb2af11@collabora.com>
Date: Thu, 10 Sep 2020 10:01:13 +0100
MIME-Version: 1.0
In-Reply-To: <20200910091752.74f327f0@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: sfr@canb.auug.org.au
Cc: kernelci@groups.io, Shuah Khan <shuahkh@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>

On 10/09/2020 00:17, Stephen Rothwell wrote:
> Hi kernelci.org,
>=20
> On Wed, 09 Sep 2020 05:11:21 -0700 (PDT) "kernelci.org bot" <bot@kernelc=
i.org> wrote:
>>
>> next/pending-fixes build: 213 builds: 0 failed, 213 passed, 1437 errors=
, 244 warnings (v5.9-rc4-322-g03ef16f8dff9)
>>
>> Full Build Summary: https://kernelci.org/build/next/branch/pending-fixe=
s/kernel/v5.9-rc4-322-g03ef16f8dff9/
>>
>> Tree: next
>> Branch: pending-fixes
>> Git Describe: v5.9-rc4-322-g03ef16f8dff9
>> Git Commit: 03ef16f8dff93dcaf454582ffb92d47b62db096a
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git
>> Built: 7 unique architectures
>>
>> Errors and Warnings Detected:
>>
>> Errors summary:
>>
>>     582  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No s=
uch file or directory
>>     375  /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:=
10: fatal error: asm/types.h: No such file or directory
>>     120  /usr/include/stdio.h:27:10: fatal error: bits/libc-header-star=
t.h: No such file or directory
>>     16   /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-sta=
rt.h: No such file or directory
>>     15   arc-elf32-gcc: error: unrecognized command line option =E2=80=
=98-pthread=E2=80=99
>>     14   /bin/sh: 1: llc: not found
>>     13   /bin/sh: 3: llc: not found
>>     13   /bin/sh: 1: clang: not found
>>     11   test_execve.c:4:10: fatal error: cap-ng.h: No such file or dir=
ectory
>>     9    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or =
directory
>>     9    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or=
 directory
>>     8    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or =
directory
>>     8    posix_timers.c:10:10: fatal error: sys/time.h: No such file or=
 directory
>>     8    kselftest_harness.h:56:10: fatal error: asm/types.h: No such f=
ile or directory
>>     8    collect2: error: ld returned 1 exit status
>=20
> It looks like something has gone wrong with the build system ...

Thanks for spotting this.

These are errors while building kselftests, due to some missing
dependencies.  I guess it would help if they were reported
separately from the actual kernel build errors.

In any case, we're looking into fixing the kselftests build
environment at the moment so please bear with us :)

Best wishes,
Guillaume
