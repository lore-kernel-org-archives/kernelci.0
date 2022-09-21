MIME-Version: 1.0
References: <632a0af0.170a0220.966bf.0c66@mx.google.com> <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
 <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
In-Reply-To: <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Sep 2022 09:17:38 -0300
Message-ID: <CAOMZO5BObC4MwcA=XdtRVmhtZdH4m++vLRoerDhbdw18KNnA+g@mail.gmail.com>
Subject: Re: next/master baseline: 539 runs, 389 regressions (next-20220920)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Collabora Kernel ML <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>, "kernelci-results@groups.io" <kernelci-results@groups.io>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Guillaume,

On Wed, Sep 21, 2022 at 6:18 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 21/09/2022 04:48, Fabio Estevam wrote:
> > Hi,
> >
> > On Tue, Sep 20, 2022 at 3:48 PM kernelci.org bot <bot@kernelci.org> wrote:
> >>
> >> next/master baseline: 539 runs, 389 regressions (next-20220920)
> >
> > Does anyone know which commit caused such a massive regression?
> >
> > Looks like it is gpiod_get_index related.
>
> There's a bisection report, does it look like it?

Sorry, I missed the git-bisect results in the original email.

Just noticed a fix for this problem on today's linux-next, so we are
all good, thanks:

commit 8b10ca2f7551e024b60ab5e27d3e3630c029000a
Author: Michael Walle <michael@walle.cc>
Date:   Fri Sep 16 13:01:18 2022 +0200

    gpiolib: fix OOB access in quirk callbacks

    Commit a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
    introduced an array of quirk functions which get iterated over. But a
    sentinal value is missing. Add it.

    Fixes: a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
    Signed-off-by: Michael Walle <michael@walle.cc>
    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
    Tested-by: Conor Dooley <conor.dooley@microchip.com>
    Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
    Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
    Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
