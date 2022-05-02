MIME-Version: 1.0
References: <CAHRSSEyjupT5aq2Rs_k1rBrnJx_0RTN7O=A5Up3Cy+M--c7JHg@mail.gmail.com>
 <b788578e-65e5-4194-c130-e4252ce15813@collabora.com>
In-Reply-To: <b788578e-65e5-4194-c130-e4252ce15813@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 2 May 2022 11:55:30 -0700
Message-ID: <CAHRSSEzozDxBJ2T6oNxVzv83MC6J2uvYRCq5fDiWtnPcG4bnWQ@mail.gmail.com>
Subject: Re: many kernelci errors on Android branches
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io

Thanks Guillaume!

On Mon, May 2, 2022 at 11:54 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 29/04/2022 23:55, Todd Kjos via groups.io wrote:
> > We've been seeing massive failures in some of our branches lately that
> > don't seem to correlate to changes in the kernel source.
>
> This was due to some subtle side-effect in a configuration change
> that went into production last week to build kselftest with any
> kernel config.  A fix for that has been rolled out today to only
> build kselftest with kernel versions v5.10 or more recent.  The
> stable and Android trees are back to normal now.
>
> > For example, all android12-5.4 builds are flagged as failing.  The actual
> > builds seem to work in most cases, but they are apparently flagged as
> > failures because of the error in the kselftest log
> > <https://storage.kernelci.org/android/android12-5.4/ASB-2022-04-05_12-5.4-6-g99f7ebe8ce34/arm64/gki_defconfig/gcc-10/logs/kselftest.log>
> > :
> >
> > #
> > # 2022-04-25T23:25:44.634974
> > #
> > # make KBUILD_BUILD_USER=KernelCI FORMAT=.xz ARCH=arm64 HOSTCC=gcc
> > CROSS_COMPILE=aarch64-linux-gnu-
> > CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- CC="ccache
> > aarch64-linux-gnu-gcc" O=/tmp/kci/linux/build
> > -C/tmp/kci/linux/tools/testing/selftests -j4 gen_tar
> > #
> > make: Entering directory '/tmp/kci/linux/tools/testing/selftests'
> > make: *** No rule to make target 'gen_tar'.  Stop.
> > make: Leaving directory '/tmp/kci/linux/tools/testing/selftests'
>
> The gen_tar make target was added a bit before v5.10.  So I can
> confirm it's entirely a KernelCI build configuration issue and
> there's nothing wrong with the kernel code.
>
> > This started on April 25 and the 1 change since the passing builds could
> > not have caused the issue (change to symbol list which isn't used for
> > kernelci builds).
> >
> > Any suggestions on how to fix this?
>
> Sorry for the inconvenience.
>
> Best wishes,
> Guillaume
