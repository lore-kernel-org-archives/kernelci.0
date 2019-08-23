From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-08-23
Message-ID: <fb929737-e71c-3fc9-bdd0-1616b1775086@collabora.com>
Date: Fri, 23 Aug 2019 17:57:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* stop booting odroid-x2 with LPAE configs

* remove deprecated android-4.19-gki-dev branch

* fix clang docker images with testing and experimental Debian repos

* rename arm-soc tree to soc

* disable all fragments builds with clang due to limitation in merge_config.sh

* enable QEMU i386 tests

* add UEFI boot tests on QEMU for arm, arm64, i386 and x86_64

* add Alex and Anders to the list of kernelci recipients


Best wishes,
Guillaume
