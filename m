Message-ID: <92e86248-c8ad-757a-a5b7-7b515790aa50@collabora.com>
Date: Thu, 3 Feb 2022 09:14:58 +0000
MIME-Version: 1.0
Subject: Re: mainline/master baseline: 832 runs, 27 regressions (v5.17-rc2-60-g88808fbbead4)
References: <61fb39e3.1c69fb81.549c9.14a2@mx.google.com>
 <CAOMZO5C4KPeRGdOVu_N-Cp98zi20j+L+o7v9na2y3PzujKmbGg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <CAOMZO5C4KPeRGdOVu_N-Cp98zi20j+L+o7v9na2y3PzujKmbGg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Fabio Estevam <festevam@gmail.com>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, kernelci-results@groups.io, "kernelci@groups.io" <kernelci@groups.io>

On 03/02/2022 03:02, Fabio Estevam wrote:
> Hi,
> 
> On Wed, Feb 2, 2022 at 11:11 PM kernelci.org bot <bot@kernelci.org> wrote:
> 
>> platform                     | arch   | lab           | compiler | defconfig                    | regressions
>> -----------------------------+--------+---------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | clang-13 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/61fb1e2a208297ad0e5d6f0e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63)
>>   Plain log:   https://storage.kernelci.org//mainline/master/v5.17-rc2-60-g88808fbbead4/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//mainline/master/v5.17-rc2-60-g88808fbbead4/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220121.0/arm64/rootfs.cpio.gz
> 
> Has anyone had a chance to bisect this OOM issue?

Yes, well the automated bisection worked:

https://groups.io/g/kernelci-results/message/22701

Feel free to report this result, if you have the time.  Ideally
that's done with a reply to the original email thread for the
commit found by the bisection (not yet automated).  Or let me
know if you prefer that I do it instead.

Best wishes,
Guillaume
