Subject: Re: [PATCH 4.9 000/103] 4.9.190-stable review
References: <20190822171728.445189830@linuxfoundation.org>
 <5d5f064c.1c69fb81.f049d.97cb@mx.google.com> <7hy2zk25l2.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <7149204d-b7e8-ae92-40c7-c5230f944558@collabora.com>
Date: Fri, 23 Aug 2019 08:24:18 +0100
MIME-Version: 1.0
In-Reply-To: <7hy2zk25l2.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io

On 22/08/2019 23:33, Kevin Hilman wrote:
> [ removed stable lists, etc. ]
> 
> Guillaume,
> 
> The regression reporting looks strange here.  The headers shows zero
> fails, but the email body reports several regressions detected.
> 
> What's up here?

I believe this falls into the category of regressions in the bug
report since we've added support for multiple compilers.  Matt is
on the case - does this look like a new, different problem?

Also note that bisections aren't run on stable-rc yet but if the
same regressions occur on stable then they should get bisected.

Guillaume

> "kernelci.org bot" <bot@kernelci.org> writes:
> 
>> stable-rc/linux-4.9.y boot: 110 boots: 0 failed, 94 passed with 15 offline, 1 untried/unknown (v4.9.189-104-gfefc589434fc)
>>
>> Full Boot Summary: https://kernelci.org/boot/all/job/stable-rc/branch/linux-4.9.y/kernel/v4.9.189-104-gfefc589434fc/
>> Full Build Summary: https://kernelci.org/build/stable-rc/branch/linux-4.9.y/kernel/v4.9.189-104-gfefc589434fc/
>>
>> Tree: stable-rc
>> Branch: linux-4.9.y
>> Git Describe: v4.9.189-104-gfefc589434fc
>> Git Commit: fefc589434fcd4cf95d9dc24271b21e7913ef6e4
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>> Tested: 54 unique boards, 21 SoC families, 15 builds out of 197
>>
>> Boot Regressions Detected:
>>
>> arm:
>>
>>     bcm2835_defconfig:
>>         gcc-8:
>>           bcm2835-rpi-b:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>
>>     omap2plus_defconfig:
>>         gcc-8:
>>           am335x-boneblack:
>>               lab-drue: new failure (last pass: v4.9.189-105-g9c965ba1a288)
>>
>>     sama5_defconfig:
>>         gcc-8:
>>           at91-sama5d4_xplained:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>
>>     socfpga_defconfig:
>>         gcc-8:
>>           socfpga_cyclone5_de0_sockit:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>
>> arm64:
>>
>>     defconfig:
>>         gcc-8:
>>           apq8016-sbc:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>           juno-r2:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>           meson-gxbb-odroidc2:
>>               lab-baylibre-seattle: failing since 1 day (last pass: v4.9.189-96-g4cd56b7fcd6f - first fail: v4.9.189-97-g6971d2d959e5)
>>
>> Offline Platforms:
>>
>> arm64:
>>
>>     defconfig:
>>         gcc-8
>>             apq8016-sbc: 1 offline lab
>>             juno-r2: 1 offline lab
>>             meson-gxbb-odroidc2: 1 offline lab
>>
>> arm:
>>
>>     sama5_defconfig:
>>         gcc-8
>>             at91-sama5d4_xplained: 1 offline lab
>>
>>     sunxi_defconfig:
>>         gcc-8
>>             sun5i-r8-chip: 1 offline lab
>>
>>     bcm2835_defconfig:
>>         gcc-8
>>             bcm2835-rpi-b: 1 offline lab
>>
>>     multi_v7_defconfig:
>>         gcc-8
>>             alpine-db: 1 offline lab
>>             at91-sama5d4_xplained: 1 offline lab
>>             qcom-apq8064-cm-qs600: 1 offline lab
>>             qcom-apq8064-ifc6410: 1 offline lab
>>             socfpga_cyclone5_de0_sockit: 1 offline lab
>>             sun5i-r8-chip: 1 offline lab
>>
>>     socfpga_defconfig:
>>         gcc-8
>>             socfpga_cyclone5_de0_sockit: 1 offline lab
>>
>>     qcom_defconfig:
>>         gcc-8
>>             qcom-apq8064-cm-qs600: 1 offline lab
>>             qcom-apq8064-ifc6410: 1 offline lab
>>
>> ---
>> For more info write to <info@kernelci.org>

