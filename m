Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <6331e5ad.170a0220.e0823.68b9@mx.google.com>
In-Reply-To: <6331e5ad.170a0220.e0823.68b9@mx.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Sep 2022 20:35:47 +0200
Message-ID: <CAMuHMdUR5EBXpdpWqoG1hDQqEiuVK4MOeH77g0inL33Dyj3kYg@mail.gmail.com>
Subject: Re: renesas/next baseline: 627 runs, 40 regressions (renesas-next-2022-09-26-v6.0-rc1)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io, kernelci@groups.io

Dear KernelCI,

On Mon, Sep 26, 2022 at 8:08 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/next baseline: 627 runs, 40 regressions (renesas-next-2022-09-26-v6.0-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab           | compiler | defconfig                    | regressions
> -----------------------------+-------+---------------+----------+------------------------------+------------
> hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig                    | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+crypto    | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig           | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+ima       | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_defconfig              | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+ima                | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+debug              | 1
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMIZE_BASE=y | 2
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig+crypto             | 2
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig                    | 2
> meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig+arm...ook+videodec | 1
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+crypto    | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig           | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+ima       | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig          | 1
> qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a15        | arm   | lab-collabora | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-collabora | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+debug     | 1
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 4
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm...ook+videodec | 1
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1

Thanks for your report!

I believe none of the regressions listed above are introduced in
renesas-next-2022-09-26-v6.0-rc1, as renesas/next contains no
commits that affect the above platforms, except for those that are
already in v6.0-rc1.

Please improve your reporting.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
