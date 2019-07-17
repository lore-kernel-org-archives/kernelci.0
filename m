Subject: Re: next/master baseline: 7 runs, 0 regressions (next-20190717)
References: <5d2f063d.1c69fb81.64f72.9c8e@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <1ab642a0-0157-84c6-a3a8-da3ead6f55b1@collabora.com>
Date: Wed, 17 Jul 2019 14:00:56 +0100
MIME-Version: 1.0
In-Reply-To: <5d2f063d.1c69fb81.64f72.9c8e@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernel-build-reports@lists.linaro.org, kernelci@groups.io
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

On 17/07/2019 12:27, kernelci.org bot wrote:
> next/master baseline: 7 runs, 0 regressions (next-20190717)
> 
> Test results summary
> --------------------
> 
> run | platform                 | arch   | lab                      | compiler | defconfig          | errors
> ----+--------------------------+--------+--------------------------+----------+--------------------+-------
>   1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>   2 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>   3 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>   4 | rk3399-gru-kevin         | arm64  | lab-collabora            | clang-8  | defconfig          | 0/78
>   5 | rk3399-gru-kevin         | arm64  | lab-collabora            | clang-8  | defconfig          | 0/78
>   6 | rk3399-gru-kevin         | arm64  | lab-collabora            | gcc-8    | defconfig          | 0/78
>   7 | rk3399-gru-kevin         | arm64  | lab-collabora            | gcc-8    | defconfig          | 0/78

There's still an issue with this summary table as the "full"
defconfig is not shown, so there's no way to tell the difference
between runs 1, 2 or 3.  In the detailed sections, you can see
that they have CONFIG_ARM_LPAE=y, CONFIG_EFI=y and CONFIG_SMP=n
on top of the defconfig.

So it could be reformatted this way:


run | platform                 | arch   | lab                      | compiler | defconfig                                         | errors
----+--------------------------+--------+--------------------------+----------+---------------------------------------------------+-------
  1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61
  2 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig+CONFIG_SMP=n                   | 1/61
  3 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig                                | 1/61


which obviously makes the table quite a bit wider.

The width of each column is currently fixed but it could be
dynamically computed based on the results to avoid superfluous
spaces:

run | platform          | arch | lab           | compiler | defconfig                                         | errors
----+-------------------+------+---------------+----------+---------------------------------------------------+-------
  1 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61
  2 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+CONFIG_SMP=n                   | 1/61
  3 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig                                | 1/61


Is that still readable enough, or does it get so wide that it's
becoming too hard to read?

Or, does anyone have any better idea of how to show this
information?


Guillaume

>   Test:     baseline
>   Tree:     next
>   Branch:   master
>   Describe: next-20190717
>   URL:      git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   SHA:      e40115c06b1d3a6059ba379041e4661dbb6b02b8 
> 
> 
> Test Failures
> -------------
>   
> 
> run | platform                 | arch   | lab                      | compiler | defconfig          | errors
> ----+--------------------------+--------+--------------------------+----------+--------------------+-------
>   1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
> 
>   Results:     60 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-2-gefc755ba4a02/armel/baseline/rootfs.cpio.gz     
> 
>   bootrr - 61 tests: 60  PASS, 1 FAIL, 0 SKIP
>     * rk3x-i2c5-probed: never passed  
>       
> 
> run | platform                 | arch   | lab                      | compiler | defconfig          | errors
> ----+--------------------------+--------+--------------------------+----------+--------------------+-------
>   2 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
> 
>   Results:     60 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-2-gefc755ba4a02/armel/baseline/rootfs.cpio.gz     
> 
>   bootrr - 61 tests: 60  PASS, 1 FAIL, 0 SKIP
>     * rk3x-i2c5-probed: never passed  
>       
> 
> run | platform                 | arch   | lab                      | compiler | defconfig          | errors
> ----+--------------------------+--------+--------------------------+----------+--------------------+-------
>   3 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
> 
>   Results:     60 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
>   HTML log:    https://storage.kernelci.org//next/master/next-20190717/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-2-gefc755ba4a02/armel/baseline/rootfs.cpio.gz     
> 
>   bootrr - 61 tests: 60  PASS, 1 FAIL, 0 SKIP
>     * rk3x-i2c5-probed: never passed  
>                   
> _______________________________________________
> Kernel-build-reports mailing list
> Kernel-build-reports@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/kernel-build-reports
> 

