Message-ID: <e7353d66-1f12-1bed-1ad8-0bcc94864487@collabora.com>
Date: Fri, 14 Jan 2022 20:33:58 +0000
MIME-Version: 1.0
Subject: Re: next/master bisection: baseline.login on qemu_arm64-virt-gicv3-uefi
References: <61d7f358.1c69fb81.5c9a2.cca7@mx.google.com>
 <YdhDyy9BU4X7wZFM@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <YdhDyy9BU4X7wZFM@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: "kernelci@groups.io" <kernelci@groups.io>, "kernelci-results@groups.io" <kernelci-results@groups.io>

On 07/01/2022 13:44, Mark Brown wrote:
> On Fri, Jan 07, 2022 at 12:01:28AM -0800, KernelCI bot wrote:
> 
>>   Start:      3770333b3f8c Add linux-next specific files for 20220106
>>   Plain log:  https://storage.kernelci.org/next/master/next-20220106/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
>>   HTML log:   https://storage.kernelci.org/next/master/next-20220106/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
> 
> These log links are 404ing for me - that directory only has a .json
> file.  It looks to be a case smashing issue, the correct links are:
> 
>    https://storage.kernelci.org/next/master/next-20220106/arm64/defconfig+config_arm64_64k_pages=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
>    https://storage.kernelci.org/next/master/next-20220106/arm64/defconfig+config_arm64_64k_pages=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
> 
> (note that the CONFIG_ has been rewritten to lower case).

Thanks for reporting the issue, I've found the root cause and
made a PR to fix it:

  https://github.com/kernelci/kernelci-core/pull/986

If this works we should deploy it in production on Monday.

Cheers,
Guillaume

