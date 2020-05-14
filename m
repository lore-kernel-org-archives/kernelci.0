Subject: kernelci/staging.kernelci.org baseline: 167 runs, 7 regressions (staging-20200514.0)
References: <5ebce8ce.1c69fb81.c274.4b92@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <812faa30-b801-f91e-d436-d21d8d232ff8@collabora.com>
Date: Thu, 14 May 2020 07:55:08 +0100
MIME-Version: 1.0
In-Reply-To: <5ebce8ce.1c69fb81.c274.4b92@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Please see below an example of the reduced test email format
which only shows regressions but also has links to all the
results, and more details on the frontend.  As a result, these
email reports are not sent if there were no regressions.

This is what is expected to be deployed in production on Monday
to go hand-in-hand with the new web frontend.  Please let us know
if you find any issues.  More sample test email reports can be
found on the staging results mailing list:

  https://groups.io/g/kernelci-results-staging/topics

Emails up to revision staging-20200514.0 are using the previous
detailed format, newer reports will be like this one.

Note: In this case, one same regression was found in 2 labs and
was listed twice.  This is probably something that can be
improved in the report to avoid showing duplicated information.
Still it's important to track it this way in the database.

Thanks,
Guillaume


-------- Forwarded Message --------
Subject: kernelci/staging.kernelci.org baseline: 167 runs, 7 regressions (staging-20200514.0)
Date: Wed, 13 May 2020 23:44:30 -0700 (PDT)
From: staging.kernelci.org bot <bot@kernelci.org>
To: gtucker@collabora.com, debug011@gtucker.io

kernelci/staging.kernelci.org baseline: 167 runs, 7 regressions (staging-20200514.0)

Regressions Summary
-------------------

platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
exynos5422-odroidxu3 | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    
tegra124-jetson-tk1  | arm  | lab-baylibre  | clang-9  | multi_v7_defconfig | 0/1    
tegra124-jetson-tk1  | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    
tegra124-jetson-tk1  | arm  | lab-baylibre  | gcc-8    | multi_v7_defconfig | 0/1    
tegra124-jetson-tk1  | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 0/1    
tegra124-nyan-big    | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    
tegra124-nyan-big    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 0/1    

  Details:  https://staging.kernelci.org/test/job/kernelci/branch/staging.kernelci.org/kernel/staging-20200514.0/plan/baseline/

  Test:     baseline
  Tree:     kernelci
  Branch:   staging.kernelci.org
  Describe: staging-20200514.0
  URL:      https://github.com/kernelci/linux.git
  SHA:      a3b0fec31a5d6d3cb9c327318cd4c88fab5e28d5 


Test Regressions
---------------- 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
exynos5422-odroidxu3 | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc9a0d1f955c12235afc44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~exp1~20191211193200.102 )
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc9a0d1f955c12235afc45
      new failure (last pass: staging-20200513.1) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-jetson-tk1  | arm  | lab-baylibre  | clang-9  | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc98f751b2987fcc5afc57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~exp1~20191211193200.102 )
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-baylibre/baseline-tegra124-jetson-tk1.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-baylibre/baseline-tegra124-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc98f751b2987fcc5afc58
      failing since 5 days (last pass: staging-20200507.1, first fail: staging-20200507.2) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-jetson-tk1  | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc9927d3812770235afc47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~exp1~20191211193200.102 )
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-tegra124-jetson-tk1.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-tegra124-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc9927d3812770235afc48
      failing since 5 days (last pass: staging-20200507.1, first fail: staging-20200507.2) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-jetson-tk1  | arm  | lab-baylibre  | gcc-8    | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc9dc223d592f42b5afc3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-tegra124-jetson-tk1.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-tegra124-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc9dc223d592f42b5afc3d
      failing since 5 days (last pass: staging-20200507.1, first fail: staging-20200507.2) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-jetson-tk1  | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc9dfde601dc356c5afc42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc9dfde601dc356c5afc43
      failing since 5 days (last pass: staging-20200507.1, first fail: staging-20200507.2) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-nyan-big    | arm  | lab-collabora | clang-9  | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebc999b9f2ef087745afc49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~exp1~20191211193200.102 )
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/clang-9/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebc999b9f2ef087745afc4a
      failing since 6 days (last pass: staging-20200507.1, first fail: staging-20200507.2) 


platform             | arch | lab           | compiler | defconfig          | results
---------------------+------+---------------+----------+--------------------+--------
tegra124-nyan-big    | arm  | lab-collabora | gcc-8    | multi_v7_defconfig | 0/1    

  Details:     https://staging.kernelci.org/test/plan/id/5ebca0489a7d9a3bbe5afc45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.staging.kernelci.org//kernelci/staging.kernelci.org/staging-20200514.0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz 

  * baseline.login: https://staging.kernelci.org/test/case/id/5ebca0489a7d9a3bbe5afc46
      failing since 6 days (last pass: staging-20200507.1, first fail: staging-20200507.2)  
