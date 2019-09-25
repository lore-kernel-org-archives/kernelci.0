From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-09-24
Message-ID: <61b8edbb-0fe1-26e0-662f-34d631ce8777@collabora.com>
Date: Wed, 25 Sep 2019 13:35:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

(Sorry, sending this one day after the fact)

Summary of changes going into production today:


kernelci-core
-------------

* enabled initial dmesg test cases in baseline test plan and run it on all
  platforms

* added initial fastboot test plan to run on one platform in lab-baylibre
  (sei510)

* refactored and consolidated test plan names and related YAML configuration in
  preparation for introducing the new kci_test command line tool

* upgraded debos docker image to Debian Buster to use latest golang


kernelci-backend
----------------

* relicensed all the code from AGPLv3+ to LGPLv2.1+ as agreed with all
  contributors and to align with other KernelCI projects

* removed deprecated part of the API to send test results, the new one which
  was rolled out in the previous release is now the official way of submitting
  test results from non-LAVA labs to kernelci-backend

* fixed logic when downloading the rootfs meta-data build_info.json if the
  rootfs is on the local file system


Best wishes,
Guillaume
