MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com> <CACRpkdaHT1K22m2qHKwm9ZAw-HwupCTCYp7b+zFTqauJDs_buQ@mail.gmail.com>
In-Reply-To: <CACRpkdaHT1K22m2qHKwm9ZAw-HwupCTCYp7b+zFTqauJDs_buQ@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 4 Feb 2019 10:55:18 +0100
Message-ID: <CADYN=9KyrivES_uaSN4Xq5LaHWC4g9dT-5uiQYxQCu_DrVZxWw@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guillaume Tucker <guillaume.tucker@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, kernelci@groups.io

On Fri, 1 Feb 2019 at 13:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jan 31, 2019 at 7:28 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> > On Thu, Jan 31, 2019 at 12:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>
> >> could the GPIO tree:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/
> >>
> >> Branches "devel", "fixes" and "for-next" (no others!) be added to
> >> the kernelci loop?
> >
> >
> > We have the capacity to build them so I'm in favour of it.
> >
> > Out of interest, are there any existing tests that can be run to
> > cover the GPIO subsystem and which we could consider adding to
> > KernelCI?
>
> The blackbox (subsystem core) tests we have are done from
> userspace using the tests in Bartosz' libgpiod:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/tests
>
> These will (AFAIK) probe the gpio-mockup.c device which
> reflects its internal state out in debugfs, and thus it closes
> the loop on the core and test it.
>
> There has been some flux in the kernel parts lately as it
> is being refactored/improved.
>
> I think Anders is looking into enabling these tests.

Yes, that's on my list.

Cheers,
Anders
