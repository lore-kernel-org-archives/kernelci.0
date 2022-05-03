MIME-Version: 1.0
References: <CAHRSSEwMoYQz2ua+PmFRcWSXJREUtrsKCFdivDJ+XdJP9Di_MQ@mail.gmail.com>
 <f91a21bd782f3988cb6988ff96558dda036ca16f.camel@collabora.com>
In-Reply-To: <f91a21bd782f3988cb6988ff96558dda036ca16f.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 3 May 2022 07:45:41 -0700
Message-ID: <CAHRSSEynGz318YD-TmzZUyXE9ZquLGgoBJJnYzrFsUN8dp8NFA@mail.gmail.com>
Subject: Re: kernelci failures due to "pahole" missing
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@groups.io

Denys, Thanks for the update. Do you have a prediction for when it will
land?

On Mon, May 2, 2022 at 9:58 PM Denys Fedoryshchenko <denys.f@collabora.com>
wrote:

> Hi,
>
> We are testing in staging fix for that:
> https://github.com/kernelci/kernelci-core/pull/1158
>
> Also i noticed in some cases lz4 package required for this test,
> so added it too.
>
> Best regards,
> Denys
>
> On Fri, 2022-04-29 at 15:22 -0700, Todd Kjos via groups.io wrote:
> > We have a bunch of Android kernel test failures due to missing
> > "pahole" in
> > the build environment (example android13-5.15 gki_defconfig
> > <
> https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_13-5.15-1515-g7a68c2c45139/arm64/gki_defconfig/gcc-10/logs/kernel.log
> > >
> > ):
> >
> >
> >   LD      vmlinux.o
> >   MODPOST vmlinux.symvers
> >   MODINFO modules.builtin.modinfo
> >   GEN     modules.builtin
> > BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
> > Failed to generate BTF for vmlinux
> > Try to disable CONFIG_DEBUG_INFO_BTF
> > make[1]: *** [/tmp/kci/linux/Makefile:1247: vmlinux] Error 1
> > make[1]: Leaving directory '/tmp/kci/linux/build'
> > make: *** [Makefile:237: __sub-make] Error 2
> > make: Leaving directory '/tmp/kci/linux'
> >
> > Would it be possible to get pahole added to the build environments
> > used to
> > build android kernels?
> >
> > -Todd
> >
> >
> > 
> >
> >
>
>
>
