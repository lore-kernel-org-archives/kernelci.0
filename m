Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: next/master baseline: 368 runs, 20 regressions (next-20200825)
In-Reply-To: <5f450985.1c69fb81.d0e74.7478@mx.google.com>
References: <5f450985.1c69fb81.d0e74.7478@mx.google.com>
Date: Tue, 25 Aug 2020 10:58:05 -0700
Message-ID: <7ho8mysj4i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: kernelci-results@groups.io

[ -linux-next, +kernelci dev ]

"kernelci.org bot" <bot@kernelci.org> writes:

> next/master baseline: 368 runs, 20 regressions (next-20200825)
>
> Regressions Summary
> -------------------
>
> platform              | arch  | lab           | compiler | defconfig                    | results
> ----------------------+-------+---------------+----------+------------------------------+--------
> at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig              | 0/1    
> bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig                    | 3/4    
> exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig             | 0/1    
> exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...G_ARM_LPAE=y | 0/1    
> exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 0/1    
> exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconfig           | 0/1    
> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 4/5    
> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig           | 4/5    
> omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig          | 0/1    
> rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig                    | 83/88  
> rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_BASE=y | 83/88  
> rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig                    | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig           | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defconfig           | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig              | 0/1    
> sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | sunxi_defconfig              | 0/1    
>
>   Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20200825/plan/baseline/
>
>   Test:     baseline
>   Tree:     next
>   Branch:   master
>   Describe: next-20200825
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   SHA:      3a00d3dfd4b68b208ecd5405e676d06c8ad6bb63 
>
>
> Test Regressions
> ---------------- 
>
>
> platform              | arch  | lab           | compiler | defconfig                    | results
> ----------------------+-------+---------------+----------+------------------------------+--------
> at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig              | 0/1    
>
>   Details:     https://kernelci.org/test/plan/id/5f44d1f560dfd32ca09fb433
>
>   Results:     0 PASS, 1 FAIL, 0 SKIP
>   Full config: sama5_defconfig
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/armel/baseline/rootfs.cpio.gz 
>
>   * baseline.login: https://kernelci.org/test/case/id/5f44d1f560dfd32ca09fb434
>       failing since 118 days (last pass: next-20200424, first fail: next-20200428)  
>
>
> platform              | arch  | lab           | compiler | defconfig                    | results
> ----------------------+-------+---------------+----------+------------------------------+--------
> bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig                    | 3/4    
>
>   Details:     https://kernelci.org/test/plan/id/5f44d354974cc7a9749fb42b
>
>   Results:     3 PASS, 1 FAIL, 0 SKIP
>   Full config: defconfig
>   Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/arm64/baseline/rootfs.cpio.gz 
>
>   * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f44d354974cc7a9749fb42f
>       new failure (last pass: next-20200824)
>       1 lines
>
>     2020-08-25 08:59:02.167000  Connected to bcm2837-rpi-3-b console [channel connected] (~$quit to exit)
>     2020-08-25 08:59:02.167000  (user:khilman) is already connected
>     2020-08-25 08:59:18.764000  .
>     2020-08-25 08:59:18.765000  
>     2020-08-25 08:59:18.765000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -0800)
>     2020-08-25 08:59:18.765000  
>     2020-08-25 08:59:18.765000  DRAM:  948 MiB
>     2020-08-25 08:59:18.780000  RPI 3 Model B (0xa02082)
>     2020-08-25 08:59:18.866000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
>     2020-08-25 08:59:18.899000  Loading Environment from FAT... *** Warning - bad CRC, using default environment
>     ... (379 line(s) more)

Shouldn't we show the last few lines of the log instead of the first
few lines?

> platform              | arch  | lab           | compiler | defconfig                    | results
> ----------------------+-------+---------------+----------+------------------------------+--------
> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 4/5    
>
>   Details:     https://kernelci.org/test/plan/id/5f44d4448493d6f73c9fb42b
>
>   Results:     4 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/armel/baseline/rootfs.cpio.gz 
>
>   * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d4448493d6f73c9fb431
>       failing since 40 days (last pass: next-20200706, first fail: next-20200715)
>       60 lines
>
>     2020-08-25 09:05:03.232000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c802
>     2020-08-25 09:05:03.238000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c803
>     2020-08-25 09:05:03.244000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c804
>     2020-08-25 09:05:03.249000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c805
>     2020-08-25 09:05:03.255000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c806
>     2020-08-25 09:05:03.261000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c807
>     2020-08-25 09:05:03.267000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c808
>     2020-08-25 09:05:03.273000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c809
>     2020-08-25 09:05:03.278000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c80a
>     2020-08-25 09:05:03.284000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c80b
>     ... (49 line(s) more)

... similar here ...

> platform              | arch  | lab           | compiler | defconfig                    | results
> ----------------------+-------+---------------+----------+------------------------------+--------
> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig           | 4/5    
>
>   Details:     https://kernelci.org/test/plan/id/5f44d6605371b404fc9fb42b
>
>   Results:     4 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/armel/baseline/rootfs.cpio.gz 
>
>   * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d6605371b404fc9fb431
>       failing since 40 days (last pass: next-20200706, first fail: next-20200715)
>       60 lines
>
>     2020-08-25 09:14:02.674000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c802
>     2020-08-25 09:14:02.680000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c803
>     2020-08-25 09:14:02.686000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c804
>     2020-08-25 09:14:02.692000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c805
>     2020-08-25 09:14:02.698000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c806
>     2020-08-25 09:14:02.704000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c807
>     2020-08-25 09:14:02.710000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c808
>     2020-08-25 09:14:02.716000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c809
>     2020-08-25 09:14:02.722000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c80a
>     2020-08-25 09:14:02.728000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c80b
>     ... (49 line(s) more)
>       
... and here.

It's not always true, but I think typically the last part of the log
will be more interesting to spotting an issue.

Kevin
