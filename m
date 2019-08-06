MIME-Version: 1.0
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
 <20190806190254.GH4527@sirena.org.uk>
In-Reply-To: <20190806190254.GH4527@sirena.org.uk>
From: "Guenter Roeck" <groeck@google.com>
Date: Tue, 6 Aug 2019 12:58:43 -0700
Message-ID: <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
Subject: Re: aarch64 Big Endian
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Aug 6, 2019 at 12:03 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Aug 06, 2019 at 11:45:25AM -0700, Nick Desaulniers via Groups.Io wrote:
>
> > I was able to "boot" a aarch64 kernel with CONFIG_CPU_BIG_ENDIAN=y,
> > but without a userspace image... the kernel seems to get stuck in a
> > loop somewhere.  I would have expected it to panic somewhere since no
> > rootfs was provided.
>
> > Is the boot failures KernelCI's reporting a boot timeout or no output at all?
>
> As I said in my previous reports and the linked logs I gave show it gets
> to userspace but can't figure out how to interpret init, there's plenty
> of output.  You can see this in any arm64 big endian job in -next.
>
> > [    0.351576] Unpacking initramfs...
> > [    0.451870] Freeing initrd memory: 14796K
> > [    0.454334] hw perfevents: enabled with armv8_pmuv3 PMU driver, 1
> > counters available
> > [    0.454815] kvm [1]: HYP mode not available
> > [    0.732776] request_module: kmod_concurrent_max (0) close to 0
> > (max_modprobes: 50), for module binfmt-4c46, throttling...
> > [    5.882267] request_module: modprobe binfmt-4c46 cannot be
> > processed, kmod busy with 50 threads for more than 5 seconds now
>
> This is the same symptoms, it will eventually time out trying to run
> init and generate a panic.  Those request_module messages are it trying
> to load binfmt_misc which is how the kernel handles unknown binaries,
> it's trying to run userspace but can't work out how to do that.
>

Correct. Also, while there is no root file system, there is an initrd
(or at least the log says so), and there is most likely a little
endian binary (init ?) in that initrd.

Guenter

> 
>
