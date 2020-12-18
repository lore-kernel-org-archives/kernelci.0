MIME-Version: 1.0
References: <5fdc89c3.1c69fb81.c9707.68bb@mx.google.com> <3e1680ed-94b8-74c9-ffe6-c2bd71f2a705@collabora.com>
 <20201218140018.GZ1551@shell.armlinux.org.uk> <CAMj1kXH-z91_EOpw8_5DCm22DiaU7FxzsCMmWV3-4=uM-FCM1g@mail.gmail.com>
In-Reply-To: <CAMj1kXH-z91_EOpw8_5DCm22DiaU7FxzsCMmWV3-4=uM-FCM1g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Dec 2020 20:12:05 +0100
Message-ID: <CAMj1kXGnLCwXFRJAcmgLxRq6LXH5pyi1T8d0_5DPur4ez7yAPQ@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on ox820-cloudengines-pogoplug-series-3
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci-results@groups.io, Linus Walleij <linus.walleij@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Abbott Liu <liuwenliang@huawei.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "kernelci@groups.io" <kernelci@groups.io>, Ingo Molnar <mingo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Fri, 18 Dec 2020 at 15:01, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 18 Dec 2020 at 15:00, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Fri, Dec 18, 2020 at 01:48:09PM +0000, Guillaume Tucker wrote:
> > > Please see the bisection report below about a boot failure on
> > > ox820-cloudengines-pogoplug-series-3.  There was also a bisection
> > > yesterday with next-20201216 which landed on the same commit, on
> > > the same platform and also with oxnas_v6_defconfig.  I'm not
> > > aware of any other platform on kernelci.org showing the same
> > > regression.
> >
> > Ah, I bet I know what's happening.
> >
> > We test for the presence of VFP by issuing an instruction to read
> > FPSID. If VFP is not present, this will raise an undefined instruction
> > exception, and we expect to head into the vfp_testing_entry code.
> >
> > I bet Pogoplug, being an ARM11 MPCore platform, either raises an
> > exception here.
> >
> > We probably need to also rework the code in vfp_init() as well to
> > register a temporary hook when reading the FPSID.
> >
>
> Thanks for diagnosing that - I wasn't quite sure what was going on.
>
> I will look into this later today.

Working again with my fix applied:
