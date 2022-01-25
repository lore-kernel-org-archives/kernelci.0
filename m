MIME-Version: 1.0
References: <61e3f952.1c69fb81.3e21a.0062@mx.google.com> <517aaa07-a0e9-aad4-0cf6-158460dbd9fc@collabora.com>
In-Reply-To: <517aaa07-a0e9-aad4-0cf6-158460dbd9fc@collabora.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 25 Jan 2022 23:21:44 +0100
Message-ID: <CAMj1kXFWtn2PT81nvNs0e6YghwM2Kuc+jX+qnAqEha64Qn29mQ@mail.gmail.com>
Subject: Re: ardb/for-kernelci bisection: baseline.dmesg.alert on da850-lcdk
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
Cc: "kernelci-results@groups.io" <kernelci-results@groups.io>, "kernelci@groups.io" <kernelci@groups.io>

(adding Arnd and Rob)

On Tue, 25 Jan 2022 at 22:32, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hello Ard,
>
> Please see the bisection report below.  I had a look around the
> results and git history, this is about an "alert" message which
> is present in mainline and linux-next but one day it disappeared
> on your for-kernelci branch and then it was introduced again.
> See the regression history here:
>
>   https://linux.kernelci.org/test/case/id/61ef9d00e75a9ac935abbd26/
>
> The revision when it last passed was last Friday, and your branch
> has been force-pushed since then so I don't have access to the
> git history for it any more.  The bisection found a revert commit
> that apparently re-introduced the issue, but it's all a bit
> confusing as this commit is not there any more but the alert
> message still is.
>
> The error can be found here in the log:
>
>   https://storage.kernelci.org/ardb/for-kernelci/arm-irq-and-vmap-stacks-for-rmk-11-g12fa502217d5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html#L552
>
>   BUG: Bad page state in process kworker/u2:0  pfn:c3000
>
> So I'm not sure what happened, but it has highlighted this kernel
> bug so I guess it might be worth taking a look in case there was
> a commit somewhere in your tree that resolved it at some point
> last week.  What do you think?
>

This may be related to a known problem regarding infinite recursion on
some DT nodes related to USB devices: Arnd or Rob would know more
about this.

At some point, my pending vmap'ed stacks code managed to catch this
but IIRC, the boot was still marked as a failure. I can't quite
explain why it no longer catches it, but this could be related to the
swapper stack not being vmap'ed.

I don't think the revert I attempted below actually helped though.


>
>
> On 16/01/2022 10:54, KernelCI bot wrote:
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >
> > ardb/for-kernelci bisection: baseline.dmesg.alert on da850-lcdk
> >
> > Summary:
> >   Start:      ac634ca2f750 ARM: switch_to: clean up Thumb2 code path
> >   Plain log:  https://storage.kernelci.org/ardb/for-kernelci/v5.16-9704-gac634ca2f750/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
> >   HTML log:   https://storage.kernelci.org/ardb/for-kernelci/v5.16-9704-gac634ca2f750/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
> >   Result:     7395d7a5fec5 Revert "usb: musb: Set the DT node on the child device"
> >
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> >
> > Parameters:
> >   Tree:       ardb
> >   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
> >   Branch:     for-kernelci
> >   Target:     da850-lcdk
> >   CPU arch:   arm
> >   Lab:        lab-baylibre
> >   Compiler:   gcc-10
> >   Config:     davinci_all_defconfig
> >   Test case:  baseline.dmesg.alert
> >
> > Breaking commit found:
> >
> > -------------------------------------------------------------------------------
> > commit 7395d7a5fec55b99263d476e733c167dbcaf0525
> > Author: Ard Biesheuvel <ardb@kernel.org>
> > Date:   Sat Jan 15 17:57:52 2022 +0100
> >
> >     Revert "usb: musb: Set the DT node on the child device"
> >
> >     This reverts commit cf081d009c447647c6b36aced535ca427dbebe72.
> >
> > diff --git a/drivers/usb/musb/am35x.c b/drivers/usb/musb/am35x.c
> > index bf2c0fa6cb32..660641ab1545 100644
> > --- a/drivers/usb/musb/am35x.c
> > +++ b/drivers/usb/musb/am35x.c
> > @@ -500,8 +500,6 @@ static int am35x_probe(struct platform_device *pdev)
> >       pinfo.num_res = pdev->num_resources;
> >       pinfo.data = pdata;
> >       pinfo.size_data = sizeof(*pdata);
> > -     pinfo.fwnode = of_fwnode_handle(pdev->dev.of_node);
> > -     pinfo.of_node_reused = true;
> >
> >       glue->musb = musb = platform_device_register_full(&pinfo);
> >       if (IS_ERR(musb)) {
> > diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
> > index fd4ae2dd24e5..e4e0195131da 100644
> > --- a/drivers/usb/musb/da8xx.c
> > +++ b/drivers/usb/musb/da8xx.c
> > @@ -563,8 +563,6 @@ static int da8xx_probe(struct platform_device *pdev)
> >       pinfo.num_res = pdev->num_resources;
> >       pinfo.data = pdata;
> >       pinfo.size_data = sizeof(*pdata);
> > -     pinfo.fwnode = of_fwnode_handle(np);
> > -     pinfo.of_node_reused = true;
> >
> >       glue->musb = platform_device_register_full(&pinfo);
> >       ret = PTR_ERR_OR_ZERO(glue->musb);
> > diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
> > index 417c30bff9ca..5b7d576bf6ee 100644
> > --- a/drivers/usb/musb/jz4740.c
> > +++ b/drivers/usb/musb/jz4740.c
> > @@ -231,7 +231,6 @@ static int jz4740_probe(struct platform_device *pdev)
> >       musb->dev.parent                = dev;
> >       musb->dev.dma_mask              = &musb->dev.coherent_dma_mask;
> >       musb->dev.coherent_dma_mask     = DMA_BIT_MASK(32);
> > -     device_set_of_node_from_dev(&musb->dev, dev);
> >
> >       glue->pdev                      = musb;
> >       glue->clk                       = clk;
> > diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> > index 1aeb34dbe24f..f5d97eb84cb5 100644
> > --- a/drivers/usb/musb/mediatek.c
> > +++ b/drivers/usb/musb/mediatek.c
> > @@ -538,8 +538,6 @@ static int mtk_musb_probe(struct platform_device *pdev)
> >       pinfo.num_res = pdev->num_resources;
> >       pinfo.data = pdata;
> >       pinfo.size_data = sizeof(*pdata);
> > -     pinfo.fwnode = of_fwnode_handle(np);
> > -     pinfo.of_node_reused = true;
> >
> >       glue->musb_pdev = platform_device_register_full(&pinfo);
> >       if (IS_ERR(glue->musb_pdev)) {
> > diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
> > index 7d4d0713f4f0..d2b7e613eb34 100644
> > --- a/drivers/usb/musb/omap2430.c
> > +++ b/drivers/usb/musb/omap2430.c
> > @@ -327,7 +327,6 @@ static int omap2430_probe(struct platform_device *pdev)
> >       musb->dev.parent                = &pdev->dev;
> >       musb->dev.dma_mask              = &omap2430_dmamask;
> >       musb->dev.coherent_dma_mask     = omap2430_dmamask;
> > -     device_set_of_node_from_dev(&musb->dev, &pdev->dev);
> >
> >       glue->dev                       = &pdev->dev;
> >       glue->musb                      = musb;
> > diff --git a/drivers/usb/musb/ux500.c b/drivers/usb/musb/ux500.c
> > index 8ea62c344328..9bce19b5ffd7 100644
> > --- a/drivers/usb/musb/ux500.c
> > +++ b/drivers/usb/musb/ux500.c
> > @@ -262,7 +262,6 @@ static int ux500_probe(struct platform_device *pdev)
> >       musb->dev.parent                = &pdev->dev;
> >       musb->dev.dma_mask              = &pdev->dev.coherent_dma_mask;
> >       musb->dev.coherent_dma_mask     = pdev->dev.coherent_dma_mask;
> > -     device_set_of_node_from_dev(&musb->dev, &pdev->dev);
> >
> >       glue->dev                       = &pdev->dev;
> >       glue->musb                      = musb;
> > -------------------------------------------------------------------------------
> >
> >
> > Git bisection log:
> >
> > -------------------------------------------------------------------------------
> > git bisect start
> > # good: [1df6e064cf9e15ed39703b2fd087f4a7aaa30180] mm: make 'highmem' symbol ro_after_init
> > git bisect good 1df6e064cf9e15ed39703b2fd087f4a7aaa30180
> > # bad: [ac634ca2f750618d79257c126f4e00ef24de2565] ARM: switch_to: clean up Thumb2 code path
> > git bisect bad ac634ca2f750618d79257c126f4e00ef24de2565
> > # bad: [7395d7a5fec55b99263d476e733c167dbcaf0525] Revert "usb: musb: Set the DT node on the child device"
> > git bisect bad 7395d7a5fec55b99263d476e733c167dbcaf0525
> > # first bad commit: [7395d7a5fec55b99263d476e733c167dbcaf0525] Revert "usb: musb: Set the DT node on the child device"
> > -------------------------------------------------------------------------------
> >
> >
> > 
> >
> >
>
