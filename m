MIME-Version: 1.0
References: <CAHRSSEwMoYQz2ua+PmFRcWSXJREUtrsKCFdivDJ+XdJP9Di_MQ@mail.gmail.com>
 <f91a21bd782f3988cb6988ff96558dda036ca16f.camel@collabora.com>
 <CAHRSSEynGz318YD-TmzZUyXE9ZquLGgoBJJnYzrFsUN8dp8NFA@mail.gmail.com>
 <16EBDBAB78C06CE6.10903@groups.io> <adcac2f5fdfdaec902e49f08b16924c09cb7d6cf.camel@collabora.com>
 <850e223c3512417ce8d9497d3395e6b6f0d27b55.camel@collabora.com>
 <CAHRSSEwGmJopp2fjJXt_rNgH+Um3jMoCACxyrdZo=V9HkYVKVw@mail.gmail.com>
 <7c8acd8bb5277c8d10c00ea6d356267fb6938524.camel@collabora.com>
 <CAHRSSExQrtbZDPLowaFxOgbnGR2Eh3twY9GOrQ_QUEkFTpde5w@mail.gmail.com>
 <e8ffc2b3cf8ccdcf8ca6d455a9495559d56cbcb9.camel@collabora.com>
 <CAHRSSEy7cT-Y-4-Vx_hGi+ubYK8_tar6kaxcsaVMF29J34Evbg@mail.gmail.com> <02da7d7581da74c0d32092ae1e6da35947731351.camel@collabora.com>
In-Reply-To: <02da7d7581da74c0d32092ae1e6da35947731351.camel@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 13 Jul 2022 10:32:49 -0700
Message-ID: <CAHRSSEyFW6bNs2xjQybmy9gSOia8ZwcE_xpOz4613pnsJMwNwg@mail.gmail.com>
Subject: Re: kernelci failures due to "pahole" missing
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@groups.io

Denys, thanks for the update. I don't consider this urgent, but I would
eventually like to see our "gki_defconfig" builds be green again.

On Tue, Jul 12, 2022 at 2:49 AM Denys Fedoryshchenko <denys.f@collabora.com>
wrote:

> Hi,
>
> Sorry for the delay, it took longer than this meeting as we faced major
> issue - current system design cannot handle large objects upload
> (larger than ~200Mbyte) and there is no easy workaround for that.
>
> Theoretically, the new system architecture (kernelci-api) solves this
> problem, but it will take several months to finalize it.
> I'll try to develop a partial upload method (so it will upload file by
> chunks), but that too will take some time as i have only few hours per
> week aside from primary project and other developers are also
> overloaded.
> Also during discussion it was suggested alternative solution: to run
> dedicated jenkins job running directly on one of builders, instead of
> kubernetes, as this will allow us to use scp upload method similar as
> we do with rootfs builds.
> But this will also require creation of a completely new job
> configuration for the Jenkins.
>
> On Fri, 2022-07-08 at 10:02 -0700, Todd Kjos via groups.io wrote:
> > Any update from your Thursday meeting?
> >
> > On Wed, Jun 29, 2022 at 4:27 AM Denys Fedoryshchenko
> > <denys.f@collabora.com>
> > wrote:
> >
> > > We faced multiple issues.
> > > 1) Most builders instance not suitable for this job, as it require
> > > large amount of RAM. Found workaround, tested in staging.
> > > 2) The problem with the build time, it significantly exceeds the
> > > time
> > > of usual builds. Theoretically, the problem can be solved by
> > > increasing
> > > the limits.
> > > 3) Some tools was missing, thats solved.
> > > 4) Some of the created objects during build exceed the size that
> > > the
> > > library that we use to upload objects to storage can handle. This
> > > will
> > > require significant changes in some parts of project to solve and
> > > major
> > > blocker for me.
> > >
> > > I'm still not sure what to do next with that, and I'll discuss this
> > > at
> > > the next weekly meeting (this Thursday).
> > >
> > > On Tue, 2022-06-28 at 12:16 -0700, Todd Kjos via groups.io wrote:
> > > > Any update on this?
> > > >
> > > >
> > > > On Tue, May 10, 2022 at 12:50 PM Denys Fedoryshchenko
> > > > <denys.f@collabora.com> wrote:
> > > > >
> > > > > On Tue, 2022-05-10 at 10:53 -0700, Todd Kjos via groups.io
> > > > > wrote:
> > > > > > On Tue, May 10, 2022 at 12:20 AM Denys Fedoryshchenko <
> > > > > > denys.f@collabora.com>
> > > > > > wrote:
> > > > > >
> > > > > > > Update
> > > > > > >
> > > > > > > We identified all packages required for kernel build:
> > > > > > > dwarves, lz4, python3/python.
> > > > > > >
> > > > > > > We got ASB-2022-04-05_13-5.10-206-g4dce9d7a65b1 built on
> > > > > > > our
> > > > > > > staging
> > > > > > > pipeline, but with error:
> > > > > > >  LD      vmlinux
> > > > > > >   BTFIDS  vmlinux
> > > > > > > FAILED unresolved symbol xdp_buff
> > > > > > >
> > > > > >
> > > > > > Which config and arch was this?
> > > > > gki_defconfig
> > > > > arm64
> > > > > But it is a bit old snapshot i'm using as reference.
> > > > > Tomorrow i will try latest 5.10 if anything changed.
> > > > >
> > > > > Container Log:
> > > > >   LD      .tmp_vmlinux.kallsyms1
> > > > >   KSYMS   .tmp_vmlinux.kallsyms1.S
> > > > >   AS      .tmp_vmlinux.kallsyms1.S
> > > > >   LD      .tmp_vmlinux.kallsyms2
> > > > >   KSYMS   .tmp_vmlinux.kallsyms2.S
> > > > >   AS      .tmp_vmlinux.kallsyms2.S
> > > > >   LD      vmlinux
> > > > >   BTFIDS  vmlinux
> > > > > FAILED unresolved symbol xdp_buff
> > > > > make[1]: *** [/tmp/kci/linux/Makefile:1267: vmlinux] Error 255
> > > > > make[1]: Leaving directory '/tmp/kci/linux/build'
> > > > > make: *** [Makefile:185: __sub-make] Error 2
> > > > > make: Leaving directory '/tmp/kci/linux'
> > > > >
> > > > > "branch": "staging-android",
> > > > > "commit": "4dce9d7a65b14d5949b20ced210413d04d914053",
> > > > > "describe": "ASB-2022-04-05_13-5.10-206-g4dce9d7a65b1",
> > > > > "describe_verbose": "v5.10-19504-g4dce9d7a65b1",
> > > > > "tree": "kernelci",
> > > > > "url": "https://github.com/kernelci/linux.git"
> > > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > I will create PR now to allocate larger builders (to
> > > > > > > address
> > > > > > > LTO
> > > > > > > memory
> > > > > > > overconsumption) and we will do test build on android
> > > > > > > pipeline.
> > > > > > >
> > > > > >
> > > > > > Thanks for helping with this!
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > On Thu, 2022-05-05 at 08:23 +0300, Denys Fedoryshchenko
> > > > > > > wrote:
> > > > > > > > Short update.
> > > > > > > > Some of builders crashed due OOM, but not because of
> > > > > > > > logs,
> > > > > > > > but because LTO during linking phase consume more than
> > > > > > > > 21Gb
> > > > > > > > of
> > > > > > > > RAM,
> > > > > > > > and k8s builders allocated for project have only 4Gb
> > > > > > > > allocated.
> > > > > > > > It is not easy to solve, as it is either require to
> > > > > > > > change
> > > > > > > > LTO to
> > > > > > > > "Thin
> > > > > > > > LTO" (or disable it totally) to reduce memory
> > > > > > > > consumption,
> > > > > > > > which
> > > > > > > > is
> > > > > > > > not
> > > > > > > > great, or increase builders size (and that means
> > > > > > > > additional
> > > > > > > > costs
> > > > > > > > and
> > > > > > > > approvals related to that).
> > > > > > > > We are discussing on IRC possible solutions to this
> > > > > > > > problem.
> > > > > > > >
> > > > > > > > On Wed, 2022-05-04 at 12:06 +0300, Denys Fedoryshchenko
> > > > > > > > wrote:
> > > > > > > > > At the moment I have identified a problem with more
> > > > > > > > > packages
> > > > > > > > > that
> > > > > > > > > are
> > > > > > > > > missing, now it is python, and i'm adding it as well,
> > > > > > > > > but
> > > > > > > > > need
> > > > > > > > > to
> > > > > > > > > test
> > > > > > > > > everything manually, and then on staging.
> > > > > > > > >
> > > > > > > > > Here is example of build that needs python:
> > > > > > > > >
> https://linux.kernelci.org/build/id/6271d9f8c49e05f410dc7b53/
> > > > > > > > >
> > > > > > >
> > >
> https://storage.kernelci.org/android/android13-5.10/ASB-2022-04-05_13-5.10-206-g4dce9d7a65b1/arm64/gki_defconfig/clang-14/logs/kernel.log
> > > > > > > > >
> > > > > > > > > Also, another problem some of the builders crashed,
> > > > > > > > > probably
> > > > > > > > > due to
> > > > > > > > > OOM
> > > > > > > > > or insufficient resources.
> > > > > > > > >
> https://linux.kernelci.org/build/id/6271db3a3c249a41a7dc7b48/
> > > > > > > > >
> > > > > > >
> > >
> https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_13-5.15-1526-g22e9215f1bea/arm64/gki_defconfig/clang-14/logs/kernel.log
> > > > > > > > >
> > > > > > > > > On manual tests, builds with pahole create about
> > > > > > > > > 819Mbyte
> > > > > > > > > of
> > > > > > > > > warnings,
> > > > > > > > > such as:
> > > > > > > > > "namespace__recode_dwarf_types: couldn't find 0x13423
> > > > > > > > > type
> > > > > > > > > for
> > > > > > > > > 0x3d6a5
> > > > > > > > > (member)!"
> > > > > > > > > I am currently investigating whether these issues are
> > > > > > > > > related.
> > > > > > > > > Therefore, it takes a bit more time than i expected,
> > > > > > > > > than
> > > > > > > > > just
> > > > > > > > > adding
> > > > > > > > > a
> > > > > > > > > pahole/dwarves package.
> > > > > > > > >
> > > > > > > > > I will update as soon as more information available.
> > > > > > > > >
> > > > > > > > > On Tue, 2022-05-03 at 07:45 -0700, Todd Kjos wrote:
> > > > > > > > > > Denys, Thanks for the update. Do you have a
> > > > > > > > > > prediction
> > > > > > > > > > for
> > > > > > > > > > when
> > > > > > > > > > it
> > > > > > > > > > will land?
> > > > > > > > > >
> > > > > > > > > > On Mon, May 2, 2022 at 9:58 PM Denys Fedoryshchenko
> > > > > > > > > > <denys.f@collabora.com> wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > >
> > > > > > > > > > > We are testing in staging fix for that:
> > > > > > > > > > > https://github.com/kernelci/kernelci-core/pull/1158
> > > > > > > > > > >
> > > > > > > > > > > Also i noticed in some cases lz4 package required
> > > > > > > > > > > for
> > > > > > > > > > > this
> > > > > > > > > > > test,
> > > > > > > > > > > so added it too.
> > > > > > > > > > >
> > > > > > > > > > > Best regards,
> > > > > > > > > > > Denys
> > > > > > > > > > >
> > > > > > > > > > > On Fri, 2022-04-29 at 15:22 -0700, Todd Kjos via
> > > > > > > > > > > groups.io
> > > > > > > > > > > wrote:
> > > > > > > > > > > > We have a bunch of Android kernel test failures
> > > > > > > > > > > > due
> > > > > > > > > > > > to
> > > > > > > > > > > > missing
> > > > > > > > > > > > "pahole" in
> > > > > > > > > > > > the build environment (example android13-5.15
> > > > > > > > > > > > gki_defconfig
> > > > > > > > > > > >
> > > > > > > > > > > <
> > > > > > >
> > >
> https://storage.kernelci.org/android/android13-5.15/ASB-2022-04-05_13-5.15-1515-g7a68c2c45139/arm64/gki_defconfig/gcc-10/logs/kernel.log
> > > > > > > > > > > > >
> > > > > > > > > > > > ):
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >   LD      vmlinux.o
> > > > > > > > > > > >   MODPOST vmlinux.symvers
> > > > > > > > > > > >   MODINFO modules.builtin.modinfo
> > > > > > > > > > > >   GEN     modules.builtin
> > > > > > > > > > > > BTF: .tmp_vmlinux.btf: pahole (pahole) is not
> > > > > > > > > > > > available
> > > > > > > > > > > > Failed to generate BTF for vmlinux
> > > > > > > > > > > > Try to disable CONFIG_DEBUG_INFO_BTF
> > > > > > > > > > > > make[1]: *** [/tmp/kci/linux/Makefile:1247:
> > > > > > > > > > > > vmlinux]
> > > > > > > > > > > > Error 1
> > > > > > > > > > > > make[1]: Leaving directory '/tmp/kci/linux/build'
> > > > > > > > > > > > make: *** [Makefile:237: __sub-make] Error 2
> > > > > > > > > > > > make: Leaving directory '/tmp/kci/linux'
> > > > > > > > > > > >
> > > > > > > > > > > > Would it be possible to get pahole added to the
> > > > > > > > > > > > build
> > > > > > > > > > > environments
> > > > > > > > > > > > used to
> > > > > > > > > > > > build android kernels?
> > > > > > > > > > > >
> > > > > > > > > > > > -Todd
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > >
> >
> >
> > 
> >
> >
>
>
>
