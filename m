Subject: Re: [PATCH 1/2] arm64: defconfig: Add SC7180 GPUCC and DISPCC as module
References: <20211013105613.250450-1-angelogioacchino.delregno@collabora.com>
 <20211013105613.250450-2-angelogioacchino.delregno@collabora.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <4ccafe75-ac55-c496-5d9c-c7f5d3976159@collabora.com>
Date: Fri, 29 Oct 2021 09:31:39 +0100
MIME-Version: 1.0
In-Reply-To: <20211013105613.250450-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org, bjorn.andersson@linaro.org, krzk@kernel.org, geert+renesas@glider.be, vkoul@kernel.org, jagan@amarulasolutions.com, agx@sigxcpu.org, biju.das.jz@bp.renesas.com, aford173@gmail.com, nm@ti.com, andrey.zhizhikin@leica-geosystems.com, saravanak@google.com, linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org, marijn.suijten@somainline.org, martin.botka@somainline.org, Collabora Kernel ML <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>

On 13/10/2021 11:56, AngeloGioacchino Del Regno wrote:
> SC_DISPCC_7180 and SC_GPUCC_7180 are not boot-critical clock
> controller drivers, but these are required in order to get
> DPU1/display support (so, to allow probing DRM_MSM) and Adreno
> GPU support, which are modules as well.
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
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 171848ace3ac..bb97baa5f1d8 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -992,7 +992,9 @@ CONFIG_MSM_GCC_8994=y
>  CONFIG_MSM_MMCC_8996=y
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
> +CONFIG_SC_DISPCC_7180=m
>  CONFIG_SC_GCC_7180=y
> +CONFIG_SC_GPUCC_7180=m
>  CONFIG_SDM_CAMCC_845=m
>  CONFIG_SDM_GCC_845=y
>  CONFIG_SDM_GPUCC_845=y
> 

