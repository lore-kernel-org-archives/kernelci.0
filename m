Date: Fri, 3 Dec 2021 08:51:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Message-ID: <Yao86FeC2ybOobLO@archlinux-ax161>
References: <20211129165803.470795-1-nathan@kernel.org>
 <202112011140.DA93B3E@keescook>
 <CAK7LNASW2F3SxgR6ydMaW7-ZumsxDv2QQTDqVxqJA1JWN3r4FA@mail.gmail.com>
 <YaodyZzu0MTCJcvO@elver.google.com>
MIME-Version: 1.0
In-Reply-To: <YaodyZzu0MTCJcvO@elver.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Marco Elver <elver@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com, kernelci@groups.io, llvm@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, glider@google.com

On Fri, Dec 03, 2021 at 02:38:17PM +0100, Marco Elver wrote:
> On Thu, Dec 02, 2021 at 05:26PM +0900, Masahiro Yamada wrote:
> > On Thu, Dec 2, 2021 at 4:41 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> > > > This patch series raises the minimum supported version of LLVM to
> > > > 11.0.0.
> [...]
> > Only positive feedback so far.
> > 
> > All applied to linux-kbuild.
> 
> Some of the "dynamic" checks for compiler support unfortunately aren't
> as easily grepable -- as far as I can tell, we can also include the
> below, which would save us 2 cc-option invocations for all clang builds.
> 
> And just in case:
> 
> Acked-by: Marco Elver <elver@google.com>
> 
> for the rest as well.
> 
> Thanks,
> -- Marco
> 
> ------ >8 ------
> 
> From: Marco Elver <elver@google.com>
> Date: Fri, 3 Dec 2021 14:18:44 +0100
> Subject: [PATCH] Revert "ubsan, kcsan: Don't combine sanitizer with kcov on
>  clang"
> 
> This reverts commit ea91a1d45d19469001a4955583187b0d75915759.
> 
> The minimum Clang version is now 11.0, which fixed the UBSAN/KCSAN vs.
> KCOV incompatibilities.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=45831
> Signed-off-by: Marco Elver <elver@google.com>

Thanks!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/Kconfig.kcsan | 11 -----------
>  lib/Kconfig.ubsan | 12 ------------
>  2 files changed, 23 deletions(-)
> 
> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index e0a93ffdef30..b81454b2a0d0 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -10,21 +10,10 @@ config HAVE_KCSAN_COMPILER
>  	  For the list of compilers that support KCSAN, please see
>  	  <file:Documentation/dev-tools/kcsan.rst>.
>  
> -config KCSAN_KCOV_BROKEN
> -	def_bool KCOV && CC_HAS_SANCOV_TRACE_PC
> -	depends on CC_IS_CLANG
> -	depends on !$(cc-option,-Werror=unused-command-line-argument -fsanitize=thread -fsanitize-coverage=trace-pc)
> -	help
> -	  Some versions of clang support either KCSAN and KCOV but not the
> -	  combination of the two.
> -	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
> -	  in newer releases.
> -
>  menuconfig KCSAN
>  	bool "KCSAN: dynamic data race detector"
>  	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
>  	depends on DEBUG_KERNEL && !KASAN
> -	depends on !KCSAN_KCOV_BROKEN
>  	select STACKTRACE
>  	help
>  	  The Kernel Concurrency Sanitizer (KCSAN) is a dynamic
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index e5372a13511d..31f38e7fe948 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -27,16 +27,6 @@ config UBSAN_TRAP
>  	  the system. For some system builders this is an acceptable
>  	  trade-off.
>  
> -config UBSAN_KCOV_BROKEN
> -	def_bool KCOV && CC_HAS_SANCOV_TRACE_PC
> -	depends on CC_IS_CLANG
> -	depends on !$(cc-option,-Werror=unused-command-line-argument -fsanitize=bounds -fsanitize-coverage=trace-pc)
> -	help
> -	  Some versions of clang support either UBSAN or KCOV but not the
> -	  combination of the two.
> -	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
> -	  in newer releases.
> -
>  config CC_HAS_UBSAN_BOUNDS
>  	def_bool $(cc-option,-fsanitize=bounds)
>  
> @@ -46,7 +36,6 @@ config CC_HAS_UBSAN_ARRAY_BOUNDS
>  config UBSAN_BOUNDS
>  	bool "Perform array index bounds checking"
>  	default UBSAN
> -	depends on !UBSAN_KCOV_BROKEN
>  	depends on CC_HAS_UBSAN_ARRAY_BOUNDS || CC_HAS_UBSAN_BOUNDS
>  	help
>  	  This option enables detection of directly indexed out of bounds
> @@ -72,7 +61,6 @@ config UBSAN_ARRAY_BOUNDS
>  config UBSAN_LOCAL_BOUNDS
>  	bool "Perform array local bounds checking"
>  	depends on UBSAN_TRAP
> -	depends on !UBSAN_KCOV_BROKEN
>  	depends on $(cc-option,-fsanitize=local-bounds)
>  	help
>  	  This option enables -fsanitize=local-bounds which traps when an
> -- 
> 2.34.0.384.gca35af8252-goog
> 
