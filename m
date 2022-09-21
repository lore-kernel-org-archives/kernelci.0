MIME-Version: 1.0
References: <632a0af0.170a0220.966bf.0c66@mx.google.com> <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
 <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
In-Reply-To: <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
From: "Guenter Roeck" <groeck@google.com>
Date: Wed, 21 Sep 2022 07:30:07 -0700
Message-ID: <CABXOdTcc4cRSoTRZL04S_6esEp5GTwyT8TGOrrRO1gaTQjir7g@mail.gmail.com>
Subject: Re: next/master baseline: 539 runs, 389 regressions (next-20220920)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: festevam@gmail.com, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Collabora Kernel ML <kernel@collabora.com>, "kernelci-results@groups.io" <kernelci-results@groups.io>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

 On Wed, Sep 21, 2022 at 2:19 AM Guillaume Tucker
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
>

Yes. The problem has been fixed in next-20220921.

Guenter
