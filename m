Subject: Re: [PATCH 2/2] arm64: defconfig: Add SC7180 VIDEOCC as module
References: <20211013105613.250450-1-angelogioacchino.delregno@collabora.com>
 <20211013105613.250450-3-angelogioacchino.delregno@collabora.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <3846239e-b150-9278-60f9-a52029079d8e@collabora.com>
Date: Fri, 29 Oct 2021 09:32:26 +0100
MIME-Version: 1.0
In-Reply-To: <20211013105613.250450-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org, bjorn.andersson@linaro.org, krzk@kernel.org, geert+renesas@glider.be, vkoul@kernel.org, jagan@amarulasolutions.com, agx@sigxcpu.org, biju.das.jz@bp.renesas.com, aford173@gmail.com, nm@ti.com, andrey.zhizhikin@leica-geosystems.com, saravanak@google.com, linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org, marijn.suijten@somainline.org, martin.botka@somainline.org, Collabora Kernel ML <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>

On 13/10/2021 11:56, AngeloGioacchino Del Regno wrote:
> This is required in order to be able to probe the Venus hardware
> video decoder/encoder driver on the SC7180 SoC: being this driver
> not boot-critical, it's sufficient to have it as a module.
> 
> This is being done as there are SC7180 device trees enabling
> support for this hardware, but not being probed due to these
> drivers not being built.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: "kernelci.org bot" <bot@kernelci.org>

https://staging.kernelci.org/test/plan/id/6177be0c2554c2fd1ba6c464/

Thanks,
Guillaume

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index bb97baa5f1d8..c20885f6d9bf 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -995,6 +995,7 @@ CONFIG_QCS_GCC_404=y
>  CONFIG_SC_DISPCC_7180=m
>  CONFIG_SC_GCC_7180=y
>  CONFIG_SC_GPUCC_7180=m
> +CONFIG_SC_VIDEOCC_7180=m
>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GCC_845=y
>  CONFIG_SDM_GPUCC_845=y
> 

