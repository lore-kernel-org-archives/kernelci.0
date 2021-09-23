Date: Thu, 23 Sep 2021 16:53:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
Subject: Re: next/master build: 209 builds: 5 failed, 204 passed, 5 errors, 1677 warnings (next-20210923)
Message-ID: <YU0Tgl9qtuItvcxB@archlinux-ax161>
References: <614c2968.1c69fb81.73f15.96e0@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <614c2968.1c69fb81.73f15.96e0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: llvm@lists.linux.dev, kernelci@groups.io, Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>

Hello,

Sorry I have not been paying to these reports as of late :/ I am going
to go through this and touch on the clang failures/warnings.

On Thu, Sep 23, 2021 at 12:14:48AM -0700, kernelci.org bot wrote:
> ================================================================================
> 
> Detailed per-defconfig build reports:
> 
> --------------------------------------------------------------------------------
> allmodconfig (x86_64, clang-12) — FAIL, 2 errors, 6 warnings, 0 section mismatches
> 
> Errors:
>     kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

https://github.com/ClangBuiltLinux/linux/issues/1463
https://lore.kernel.org/r/20210922145822.3935141-1-nathan@kernel.org/

Testing and review appreciated :)

>     drivers/staging/greybus/audio_topology.c:977:12: error: stack frame size of 3288 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-larger-than=]

I don't see this with LLVM 13; according to my reverse bisect, it is
resolved with b2f933a6ce83 in LLVM. Not sure if it is worth working
around?

> Warnings:
>     ./usr/include/linux/bcache.h:354:2: warning: field '' with variable sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>     ./usr/include/linux/bcache.h:355:2: warning: field '' with variable sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>     2 warnings generated.

https://github.com/ClangBuiltLinux/linux/issues/1065

>     vmlinux.o: warning: objtool: .altinstructions+0x30: don't know how to handle non-section reloc symbol x86_early_init_platform_quirks

Filed, I will try to reduce this down tomorrow:

https://github.com/ClangBuiltLinux/linux/issues/1464

>     fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x10cd: stack state mismatch: cfa1=4+184 cfa2=4+176

https://github.com/ClangBuiltLinux/linux/issues/612

> --------------------------------------------------------------------------------
> allnoconfig (x86_64, clang-10) — PASS, 0 errors, 3 warnings, 0 section mismatches
> 
> Warnings:
>     arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't find starting instruction
>     arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find starting instruction
>     arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find starting instruction

The fact that these do not show up with clang-12 below means it is
probably an LLVM bug that got fixed so there is probably not much that
we can do. We have discussed dropping clang-10 support because the list
of issues that we were fixed in newer releases is continuously growing.

> --------------------------------------------------------------------------------
> defconfig (arm64, clang-12) — PASS, 0 errors, 816 warnings, 0 section mismatches
> 
> Warnings:
>     aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/arch/arm64/lib/xor-neon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>     aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/af_alg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>     aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/algif_rng.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>     aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.15.0-rc2-next-20210923/kernel/crypto/authenc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

<snip>

These warnings are entirely self inflicted, as I describe in this
comment on our issue tracker:

https://github.com/ClangBuiltLinux/linux/issues/1249#issuecomment-759781520

> --------------------------------------------------------------------------------
> defconfig+CONFIG_EFI=n (riscv, clang-12) — FAIL, 1 error, 2 warnings, 0 section mismatches
> 
> Errors:
>     arch/riscv/include/asm/jump_label.h:49:36: error: Unsupported relocation type

If you feel like disabling another configuration...

https://github.com/ClangBuiltLinux/continuous-integration2/commit/7df9c54dfa81c043e5f74052da5d25431d3c0bce

Alternatively, disable this build and re-enable it when clang-13 is
available.

> Warnings:
>     kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused-variable]

Not specific to clang:

https://lore.kernel.org/r/YUhuHcHeeNELK8cr@hirez.programming.kicks-ass.net/

> --------------------------------------------------------------------------------
> multi_v7_defconfig (arm, clang-12) — PASS, 0 errors, 20 warnings, 0 section mismatches
> 
> Warnings:
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>     clang: warning: argument unused during compilation: '-Wa,-march=armv7-a' [-Wunused-command-line-argument]

https://github.com/ClangBuiltLinux/linux/issues/1315

I believe that Arnd has some patches for this in his randconfig tree
that should resolve this? I assume they need a little polish :)

https://git.kernel.org/arnd/playground/c/046362165a04f2c3a55f84ffac5d623883e66058
https://git.kernel.org/arnd/playground/c/8565a7ccf8b6a118cc3f2893d63d6c450276daab

Cheers,
Nathan
