Return-Path: <dan.rue@linaro.org>
Date: Tue, 26 Mar 2019 08:26:23 +0800
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-03-25 #minutes
Message-ID: <20190326002623.swe7qroqskh447k3@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Charles
  - Question on boot-*.json file generation (example below):
    - Boot:
      https://storage.kernelci.org/stable-rc/linux-4.19.y/v4.19.30-263-g4d3dbb42c4d4/arm/multi_v7_defconfig/gcc-7/lab-collabora/boot-exynos5422-odroidxu3.json
    - Lava:
      https://storage.kernelci.org/stable-rc/linux-4.19.y/v4.19.30-263-g4d3dbb42c4d4/arm/multi_v7_defconfig/gcc-7/lab-collabora/lava-json-exynos5422-odroidxu3.json
    - Are boot.json extracted from lava.json?
      - Matt - looks like the lava json files dont have the test plan in
        the filename so they are overwritten each time
      - That said, the backend has already extracted everything it needs
        at that point so I think the files are only written as
        courtesy/debug
      - Pure boot jobs are pushed to a different callback endpoint
        (/lava/boot rather than /lava/test) so that’s probably why
        there's a boot-*.json created but not a boot-nfs-*.json
      - Charles - which boot is referred in kci front-end? I see no
        test-plan in boot details
  - Couldn’t find lab-bjorn url?
    - Matt - It’s not a LAVA lab
    - Non-lava labs have to upload a json file then request the backend
      to parse it.
    - LAVA labs push all the callback data to an API endpoint and it is
      all parsed into the database

