Message-ID: <2aaa6787-619a-7672-05b7-e3ae07c87cce@collabora.com>
Date: Wed, 6 Jul 2022 17:48:14 +0100
MIME-Version: 1.0
Subject: Re: next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warnings (next-20220706)
References: <62c5b563.1c69fb81.1240a.62b2@mx.google.com>
 <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <CAKwvOdnusz+AjYzkW4pyHraJ1_exhwAz9bscMkRiqjiXRj+66g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Cc: "kernelci@groups.io" <kernelci@groups.io>

On 06/07/2022 17:40, Nick Desaulniers wrote:
> On Wed, Jul 6, 2022 at 9:16 AM kernelci.org bot <bot@kernelci.org> wrote:
>> next/master build: 205 builds: 8 failed, 197 passed, 21 errors, 52 warni=
ngs (next-20220706)
>>
>> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel=
/next-20220706/
>>
>> Tree: next
>> Branch: master
>> Git Describe: next-20220706
>> Git Commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
>> Built: 7 unique architectures
>>
>> Build Failures Detected:
>>
>> arm64:
>>     allmodconfig: (clang-15) FAIL
>>     allmodconfig: (gcc-10) FAIL
>>
>> arm:
>>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13)=
 FAIL
>>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clan=
g-13) FAIL
>>     allmodconfig: (clang-15) FAIL
>>     allmodconfig: (gcc-10) FAIL
>>
>> i386:
>>     allmodconfig: (clang-15) FAIL
>>
>> mips:
>>     decstation_64_defconfig: (gcc-10) FAIL
>>
>> Errors and Warnings Detected:
>>
>> arc:
>>
>> arm64:
>>     allmodconfig (gcc-10): 4 errors
>>     allmodconfig (clang-15): 1 error
>>
>> arm:
>>     allmodconfig (clang-15): 1 error, 13 warnings
>>     allmodconfig (gcc-10): 8 errors
>>     aspeed_g5_defconfig (clang-15): 10 warnings
>>     cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13):=
 1 error, 5 warnings
>>     cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang=
-13): 1 error, 5 warnings
>>     multi_v5_defconfig (clang-15): 2 warnings
>>     multi_v7_defconfig (clang-15): 12 warnings
>>
>> i386:
>>     allmodconfig (clang-15): 1 error
>>     allnoconfig (clang-15): 2 warnings
>>
>> mips:
>>     32r2el_defconfig (gcc-10): 1 warning
>>     32r2el_defconfig+kselftest (gcc-10): 1 warning
>>     fuloong2e_defconfig (gcc-10): 1 error
>>     lemote2f_defconfig (gcc-10): 1 error
>>     loongson2k_defconfig (gcc-10): 1 error
>>     loongson3_defconfig (gcc-10): 1 error
>>     rb532_defconfig (gcc-10): 1 warning
>>
>> riscv:
>>
>> x86_64:
>>
>> Errors summary:
>>
>>     4    drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:603:59: =
error: =E2=80=98-mgeneral-regs-only=E2=80=99 is incompatible with the use o=
f floating-point types
>>     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =
=E2=80=98-mhard-float=E2=80=99
>>     2    lib/maple_tree.c:4272:20: error: stack frame size (1096) exceed=
s limit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (217=
6) exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
>>     1    lib/maple_tree.c:4272:20: error: stack frame size (1144) exceed=
s limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    lib/maple_tree.c:4272:20: error: stack frame size (1072) exceed=
s limit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
>>     1    ERROR: modpost: "__aeabi_ui2d" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_i2d" [drivers/gpu/drm/amd/amdgpu/amdgp=
u.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dsub" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dmul" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_ddiv" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_dadd" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_d2uiz" [drivers/gpu/drm/amd/amdgpu/amd=
gpu.ko] undefined!
>>     1    ERROR: modpost: "__aeabi_d2iz" [drivers/gpu/drm/amd/amdgpu/amdg=
pu.ko] undefined!
> ^ interesting, these look new to me, must be from the new CrOS configs.

Except these were not meant to be part of this report as the CrOS
configs are built on a separate instance on
https://chromeos.kernelci.org

This is something we need to investigate, it looks like some
wires got crossed somehow.  We may however start sending email
reports for the CrOS builds (only doing LTS 5.10 and 5.15 at the
moment) and we're starting to run tests with Chromium OS
user-space too.  Please let us know if you're interested in any
of that.

Guillaume
