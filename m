MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com> <CACRpkdaHT1K22m2qHKwm9ZAw-HwupCTCYp7b+zFTqauJDs_buQ@mail.gmail.com>
In-Reply-To: <CACRpkdaHT1K22m2qHKwm9ZAw-HwupCTCYp7b+zFTqauJDs_buQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Feb 2019 13:31:30 +0100
Message-ID: <CAMRc=McgppJXj3UTHO0yS0CyUyF1HdPDki1NnsOb4wR3x7p4fg@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guillaume Tucker <guillaume.tucker@gmail.com>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>

pt., 1 lut 2019 o 13:15 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Jan 31, 2019 at 7:28 PM Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> > On Thu, Jan 31, 2019 at 12:50 PM Linus Walleij <linus.walleij@linaro.or=
g> wrote:
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
>

Hello,

yes we have a set of userspace tests that can be run if you can enable
the gpio-mockup testing module. I can help with building the suite -
it requires udev and kmod to work.

Also: Linus is right - we've had a fix applied to the gpiolib tree
last release that broke a single test-case and we're now in progress
of reworking the entire testing interface. I hope to get it in for
v5.1 and then I'd need to rework the user-space part as well.

Let me know if you need anything else.

Best regards,
Bartosz Golaszewski
