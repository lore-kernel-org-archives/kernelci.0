Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080D6AA2
	for <kernelci@lists.linux.dev>; Mon, 24 Jul 2023 12:38:53 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:a3a8:4340:a0c:d6cd] (unknown [IPv6:2001:861:4a40:8620:a3a8:4340:a0c:d6cd])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BDC0E6607063;
	Mon, 24 Jul 2023 13:38:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690202331;
	bh=fmacBSsL+I4bneQBThFqCJ1/JmrpKbMW6qGxCZXwIo4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z9i69TX7kFzdEqnR16r+uNIsRqu3NmUB7vmU4cerCmCQSoGYAVzh3mC9jvtDcxbDA
	 lKZdSr4FDHTY3GGYuIJyAfoTGPkC9zjFMaOZ31imS6GrRPsraFV3w6t7NHWBNvbIfe
	 uNWaSkCp0mfZi3KfhZOgIJOh+VtoF8YaiEBH3QTnY6A/F1BDP8f2RoxDoORrI4fxqb
	 LTOyrL1yJFNWxiJduAAJbJsznr9s+4ytUtLtzRIU2nHW7Od+aB+AJzy6F9sM2cNYCm
	 /9/6HS3C/Jre8BJU+3+5ofiTQKG/MF0UQ4ZgmWK5lj0HKYCOw98420K0e2oa/R7tsq
	 A1Lw3R2TWdc5A==
Message-ID: <2f443a56-3a84-dead-2c79-a25781780357@collabora.com>
Date: Mon, 24 Jul 2023 14:38:48 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Missing Rust results
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernelci@lists.linux.dev
References: <CANiq72m=3yVV73R4OCWBkt54MaBhb-P472pPMeN-xPb6uWpvgA@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CANiq72m=3yVV73R4OCWBkt54MaBhb-P472pPMeN-xPb6uWpvgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Miguel,

On 13/06/2023 12:22, Miguel Ojeda wrote:
> Hi KernelCI,
> 
> Apparently the Rust-related jobs are not working properly, e.g. see
> the last report from late April for `rust-for-linux`:
> 
>     https://linux.kernelci.org/job/rust-for-linux/

Sorry about that and for the delay in replying, I think it's been
overlooked for a little while now.  We've also been distracted by
some infrastructure issues but that's getting resolved now.

> Does somebody know what could be happening or how we could see the
> latest logs for everything Rust related (in case something hints there
> at the problem)?
> 
> Guillaume suggested it could be failing to find the new toolchain
> Docker image or something similar, given the recent changes/upgrades.
> The `rust-next` branch received the version bump only a couple weeks
> ago or so, so it would appear that something else broke before that?
> (i.e. it has not worked before nor after).

I think I've found the root cause of the issue while manually
testing rustc-1.70.  Here's how what I'm doing with the linux
source tree checkout out as next-20230724, first to get started:


$ docker pull kernelci/staging-rustc-1.70:x86-kselftest-kernelci
$ docker run -it \
    -v $HOME/src/linux:/home/kernelci/linux \
    kernelci/staging-rustc-1.70:x86-kselftest-kernelci \
    /bin/bash
kernelci@43d722abec07:~$ cd linux
kernelci@43d722abec07:~/linux$ kci_build generate_fragments --kdir=/home/kernelci/linux --build-config=next
kernel/configs/debug.config
kernel/configs/kselftest.config
kernel/configs/tiny.config
kernel/configs/x86-chromebook.config
kernel/configs/arm64-chromebook.config
kernel/configs/videodec.config
kernel/configs/rust.config
kernel/configs/rust-samples.config
kernel/configs/kselftest.config


Then one issue is that gcc is not installed since rustc-1.70 is
based on the clang toolchain Docker image.  So LLVM=1 needs to be
used, e.g.:


kernelci@43d722abec07:~/linux$ make x86_64_defconfig
  HOSTCC  scripts/basic/fixdep
/bin/sh: 1: gcc: not found
make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 127
make[1]: *** [/home/kernelci/linux/Makefile:641: scripts_basic] Error 2
make: *** [Makefile:234: __sub-make] Error 2
kernelci@43d722abec07:~/linux$ make LLVM=1 x86_64_defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#


For Rust, of course we need the rust.config fragment.  Same
thing, LLVM=1 is needed when merging the config:


kernelci@43d722abec07:~/linux$ LLVM=1 ./scripts/kconfig/merge_config.sh arch/x86/configs/x86_64_defconfig kernel/configs/rust.config 
Using arch/x86/configs/x86_64_defconfig as base
Merging kernel/configs/rust.config
#
# configuration written to .config
#
Value requested for CONFIG_PRINT_QUOTA_WARNING not in final .config
Requested value:  # CONFIG_PRINT_QUOTA_WARNING is not set
Actual value:     

Value requested for CONFIG_SECURITY_SELINUX_DISABLE not in final .config
Requested value:  CONFIG_SECURITY_SELINUX_DISABLE=y
Actual value:     

Value requested for CONFIG_RETHUNK not in final .config
Requested value:  # CONFIG_RETHUNK is not set
Actual value:     


Then we can start building a kernel.  I don't think KernelCI is
currently using LLVM=1 with Rust builds, but I can't be
completely sure of that either since I still haven't found a job
log showing the error.  I'll keep looking this week and maybe
schedule jobs by hand if needed.

It shouldn't be very hard to add the bits needed to pass LLVM=1
for Rust.  The main potential issue is if we want to build with
Rust enabled and another toolchain than clang in the future, but
I think we'll have a better way of configurting compiler flags by
then anyway.  So if that's the issue we should be able to fix it
this week too.  I wonder how it worked in the past though.

Then the build fails but that's another issue.  In principle we
should get these errors in KernelCI:


kernelci@43d722abec07:~/linux$ make LLVM=1 bzImage -j3
  SYNC    include/config/auto.conf.cmd
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
[...]
***
*** Rust compiler 'rustc' is too new. This may or may not work.
***   Your version:     1.70.0
***   Expected version: 1.68.2
***
  RUSTC L rust/core.o
  BINDGEN rust/bindings/bindings_generated.rs
  BINDGEN rust/bindings/bindings_helpers_generated.rs
Failed to run rustfmt: Internal rustfmt error (non-fatal, continuing)
  BINDGEN rust/uapi/uapi_generated.rs
thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/_/include/linux/compiler_types_h_146_2)" is not a valid Ident', /home/kernelci/.cargo/registry/src/index.crates.io-6f17d22bba15001f/proc-macro2-1.0.24/src/fallback.rs:693:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
make[2]: *** [rust/Makefile:348: rust/uapi/uapi_generated.rs] Error 1
make[2]: *** Deleting file 'rust/uapi/uapi_generated.rs'
make[2]: *** Waiting for unfinished jobs....
thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/_/include/linux/compiler_types_h_146_2)" is not a valid Ident', /home/kernelci/.cargo/registry/src/index.crates.io-6f17d22bba15001f/proc-macro2-1.0.24/src/fallback.rs:693:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
make[2]: *** [rust/Makefile:342: rust/bindings/bindings_generated.rs] Error 1
make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
make[1]: *** [/home/kernelci/linux/Makefile:1296: prepare] Error 2
make: *** [Makefile:234: __sub-make] Error 2


> Thanks!

Hope this helps :)

Thanks,
Guillaume

