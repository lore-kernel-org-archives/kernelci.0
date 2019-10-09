Subject: Re: kernelci/staging.kernelci.org baseline: 59 runs, 1 regressions (staging-20191009.1)
References: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <557293d8-dde3-b24a-988f-f9b90dccf5f4@collabora.com>
Date: Wed, 9 Oct 2019 12:53:10 +0100
MIME-Version: 1.0
In-Reply-To: <5d9dc6c8.1c69fb81.ffa07.41ad@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: mgalka@collabora.com, alexandra.pereira@collabora.com, dan.rue@linaro.org, matthew.hart@linaro.org, broonie@kernel.org, kernelci@baylibre.com, anders.roxell@linaro.org
Cc: kernelci@groups.io

On 09/10/2019 12:38, kernelci.org bot wrote:
> run | platform                     | arch   | lab          | compiler | defconfig                    | errors
> ----+------------------------------+--------+--------------+----------+------------------------------+-------
> 10  | exynos5422-odroidxu3         | arm    | lab-baylibre | gcc-8    | multi_v7_defconfig           | 1/1   
> 
>   Results:     0 PASS, 1 FAIL, 0 SKIP
>   Full config: multi_v7_defconfig
>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   http://staging-storage.kernelci.org/kernelci/staging.kernelci.org/staging-20191009.1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-exynos5422-odroidxu3.txt
>   HTML log:    http://staging-storage.kernelci.org/kernelci/staging.kernelci.org/staging-20191009.1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-exynos5422-odroidxu3.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-8-gd700ebb99e8f/armel/baseline/rootfs.cpio.gz  
> 
>   1 tests: 0 PASS, 1 FAIL, 0 SKIP
>     * login:
>         failing since 13 days (last pass: staging-20190925.1, first fail: staging-20190925.2)   
>                                                                                              
> 
> run | platform                     | arch   | lab          | compiler | defconfig                    | errors
> ----+------------------------------+--------+--------------+----------+------------------------------+-------
> 40  | qemu_arm64-virt-gicv2        | arm64  | lab-baylibre | gcc-8    | defconfig                    | 1/5   
> 
>   Results:     4 PASS, 1 FAIL, 0 SKIP
>   Full config: defconfig
>   Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
>   Plain log:   http://staging-storage.kernelci.org/kernelci/staging.kernelci.org/staging-20191009.1/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
>   HTML log:    http://staging-storage.kernelci.org/kernelci/staging.kernelci.org/staging-20191009.1/arm64/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
>   Rootfs:      https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-8-gd700ebb99e8f/arm64/baseline/rootfs.cpio.gz       
> 
>   dmesg - 3 tests: 2  PASS, 1 FAIL, 0 SKIP
>     * emerg:
>         never passed
>         1 lines  

Any thoughts on showing measurements in test reports, i.e. the
number of lines with emergency messages in this case?

It's not exactly great, but I don't know how to make something
generic and still more useful without doing a lot of redesign at
several levels.  Ideally we should be showing the log lines
themselves in the email, like we do with builds, but that's not
so easy to do with LAVA.  I guess the next step would be
extracting the log lines associated with each test case as they
should be there. Then we would be using that rather than storing
the number of lines in a "measurement".

See also the PR: https://github.com/kernelci/kernelci-backend/pull/166

Guillaume
