Subject: Re: [PATCH] arm64: defconfig: enable regulator to fix mt8173 regression
References: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <d34874d6-b55c-546f-d9c8-651a98814815@collabora.com>
Date: Fri, 15 Oct 2021 17:20:51 +0100
MIME-Version: 1.0
In-Reply-To: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Adrian Ratiu <adrian.ratiu@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, Enric Balletbo Serra <eballetbo@gmail.com>, "kernelci@groups.io" <kernelci@groups.io>

On 11/10/2021 13:53, Adrian Ratiu wrote:
> A regression was introduced on some mediatek boards starting with
> v5.15-rc1 in commit 109fd20601e2b ("arm64: dts: mediatek: mt8173:
> Add domain supply for mfg_async") which effectively changed the
> regulator from the always-on dummy to DA9211 without explicitely
> enabling it, causing failures like the these caught by KernelCI
> on Hana Chromebooks [1]:
> 
> mtk-power-controller 10006000.syscon:power-controller: supply domain not found, using dummy regulator
> mtu3 11271000.usb: supply vbus not found, using dummy regulator
> xhci-mtk 11270000.usb: supply vbus not found, using dummy regulator
> 
> There might be another bug linking these power domains in the
> mediatek PM driver, but that is a separate issue wich needs
> addressing, for now just fix the obvious regression due to the
> new regulator requirement.
> 
> [1] https://github.com/kernelci/kernelci-project/issues/66
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
> Suggested-by: Enric Balletbo Serra <eballetbo@gmail.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

Tested-by: "kernelci.org bot" <bot@kernelci.org>


https://staging.kernelci.org/test/plan/id/616945b4043bf9aafba6c453/


Thanks,
Guillaume

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 156d96afbbfc..4901cc1213bb 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -616,6 +616,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_AXP20X=y
>  CONFIG_REGULATOR_BD718XX=y
>  CONFIG_REGULATOR_BD9571MWV=y
> +CONFIG_REGULATOR_DA9211=y
>  CONFIG_REGULATOR_FAN53555=y
>  CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_HI6421V530=y
> 

