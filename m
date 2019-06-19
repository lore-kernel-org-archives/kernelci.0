From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-02-19
Message-ID: <559ba0ea-8a2b-0367-b55a-bb0074b09dbb@collabora.com>
Date: Wed, 19 Jun 2019 17:34:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* extend default LAVA deploy timeout to 10 min

* add ox820-cloudengines-pogoplug-series-3 and sun5i-a13-olinuxino-micro in
  lab-baylibre

* optimise in size the new buster rootfs

* add buster-igt with latest i-g-t built using meson

* only send clang reports for next/master branch

* update the agross tree url and use ci-next branch

* bug fixes: initial clone in kci_build, stale test_suite.json file in debos


Best wishes,
Guillaume
