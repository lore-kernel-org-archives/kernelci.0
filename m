MIME-Version: 1.0
References: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
 <20190806190254.GH4527@sirena.org.uk> <CABXOdTckrMfM_-5+pJ37KHveLE8oRDvFAzPftnp_5--fYJVuXQ@mail.gmail.com>
 <20190806200809.GI4527@sirena.org.uk>
In-Reply-To: <20190806200809.GI4527@sirena.org.uk>
From: "Guenter Roeck" <groeck@google.com>
Date: Tue, 6 Aug 2019 13:45:44 -0700
Message-ID: <CABXOdTcWG-wh9ZHMVmON+B4cxV64-8HDkTvpG61eTNAOYbs-jw@mail.gmail.com>
Subject: Re: aarch64 Big Endian
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Aug 6, 2019 at 1:08 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Aug 06, 2019 at 12:58:43PM -0700, Guenter Roeck wrote:
> > On Tue, Aug 6, 2019 at 12:03 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > This is the same symptoms, it will eventually time out trying to run
> > > init and generate a panic.  Those request_module messages are it trying
> > > to load binfmt_misc which is how the kernel handles unknown binaries,
> > > it's trying to run userspace but can't work out how to do that.
>
> > Correct. Also, while there is no root file system, there is an initrd
> > (or at least the log says so), and there is most likely a little
> > endian binary (init ?) in that initrd.
>
> Right, sorry - should've mentioned.  You need a big endian root
> filesystem (or init) to go with a big endian kernel.  The kernelci one
> should be:
>
>         http://storage.kernelci.org/images/rootfs/buildroot/arm64be/

FWIW, I generated a big endian aarch64 root file system with buildroot
and gave it a try with gcc 8.3.0. Works fine for me, at least with "-M
virt" in qemu. I have not yet tried any other machines.

Guenter
