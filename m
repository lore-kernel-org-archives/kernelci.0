Subject: Re: [PATCH] arm64: defconfig: Enable SC7180 interconnect driver
References: <20211011154003.904355-1-angelogioacchino.delregno@collabora.com>
 <5fd543da-fd49-23c5-f4ba-531aaf8cb377@kernel.org>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <f8dbb399-9f18-4b7a-4863-1719263cc615@collabora.com>
Date: Fri, 29 Oct 2021 09:30:43 +0100
MIME-Version: 1.0
In-Reply-To: <5fd543da-fd49-23c5-f4ba-531aaf8cb377@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Georgi Djakov <djakov@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, bjorn.andersson@linaro.org
Cc: catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org, krzk@kernel.org, geert+renesas@glider.be, vkoul@kernel.org, jagan@amarulasolutions.com, agx@sigxcpu.org, biju.das.jz@bp.renesas.com, aford173@gmail.com, nm@ti.com, andrey.zhizhikin@leica-geosystems.com, saravanak@google.com, linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org, marijn.suijten@somainline.org, martin.botka@somainline.org, Collabora Kernel ML <kernel@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>

On 12/10/2021 11:49, Georgi Djakov wrote:
> On 11.10.21 18:40, AngeloGioacchino Del Regno wrote:
>> On SC7180 device trees, almost all of the nodes are declaring
>> interconnect properties, including the QUP nodes: at least on
>> some machines, leaving this configuration option disabled, or
>> as a module, the kernel appears to hang while initializing the
>> QUP node containing the UART device.
>>
>> To solve this issue, enable the interconnect driver for this
>> SoC as built-in.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
>=20
> Acked-by: Georgi Djakov <djakov@kernel.org>

Tested-by: "kernelci.org bot" <bot@kernelci.org>

https://staging.kernelci.org/test/plan/id/6177be0c2554c2fd1ba6c464/

Thanks,
Guillaume

>> ---
>> =C2=A0 arch/arm64/configs/defconfig | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index fc40ae9e9bdb..171848ace3ac 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1172,6 +1172,7 @@ CONFIG_INTERCONNECT_IMX8MQ=3Dm
>> =C2=A0 CONFIG_INTERCONNECT_QCOM=3Dy
>> =C2=A0 CONFIG_INTERCONNECT_QCOM_MSM8916=3Dm
>> =C2=A0 CONFIG_INTERCONNECT_QCOM_OSM_L3=3Dm
>> +CONFIG_INTERCONNECT_QCOM_SC7180=3Dy
>> =C2=A0 CONFIG_INTERCONNECT_QCOM_SDM845=3Dy
>> =C2=A0 CONFIG_INTERCONNECT_QCOM_SM8150=3Dm
>> =C2=A0 CONFIG_INTERCONNECT_QCOM_SM8250=3Dm
>>
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

