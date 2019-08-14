Return-Path: <dan.rue@linaro.org>
Date: Wed, 14 Aug 2019 11:52:06 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-08-13 #minutes
Message-ID: <20190814165206.ukdpzbgo5hgotx3a@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- broonie
  - More multi-compiler/clang breakage:
    - BIG_ENDIAN problems are that the builds don’t actually turn on
      CPU_BIG_ENDIAN:
      - https://github.com/kernelci/kernelci-core/issues/136
      - Unclear if the make_config.sh fixes are going to get merged
        promptly
        - Looks like Guiliame’s bit is getting pushback, request to get
          it merged in 
    - Should we just turn off the multi-compiler support until the
      pending issues are addressed?
      - Matt has understood out the build e-mails problem, needs a
        couple of days more to figure out a fix
      - Matt will deply clang into Docker images for now
  - OdroidX2 with multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
    - Just blacklist it (or drop that configuration)?
    - Never worked
    - Agreed, Matt to take action to blacklist that board/config combo
  - Persistent failures:
    - rk3399-firefly (random crash after cpufreq, no response)
      - Popular board
      - Kevin could try to bisect? Might be cpufreq 
    - Meson-gxm-khadas-vim2 (panfrost?)
      - Link?
        https://storage.kernelci.org/next/master/next-20190809/arm64/defconfig/clang-8/lab-baylibre/boot-meson-gxm-khadas-vim2.html
      - Looks like it was Panfrost
      - Kevin will investigate

- Kevin/Baylibre has some fastboot stuff ready to merge
  - Checking in with Matt on status
