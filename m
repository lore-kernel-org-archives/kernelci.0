From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-04-26
Message-ID: <666d887d-7406-dff8-1246-0e6e6f860dd6@collabora.com>
Date: Fri, 26 Apr 2019 17:39:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* test-configs:
  * several new devices were added in lab-pengutronix including
    the first MIPS boards
  * 2 orange pi devices were added in lab-baylibre
  * am57xx-beagle-x15 was added in lab-drue

* build-configs: android-q branches were added

* debos: stretch-ltp was added for i386, amd64, arm and arm64

* tests: pytest was added to cover the YAML configuration

Note: stretch-v4l2 is failing to build at the moment, so it will
remain at the last successful build which was 20190404.0.


kernelci-backend
----------------

* test reports: improve formatting when no failures

* boot reports: fix exception when lab conflicts are found

* api: fix handler to delete lab entries
  (used by kci_admin in particular)


Best wishes,
Guillaume
