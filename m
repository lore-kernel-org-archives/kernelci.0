From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-06-07
Message-ID: <8976b61d-0b39-d6c3-7235-a7f62c06ecb4@collabora.com>
Date: Fri, 7 Jun 2019 13:39:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* upgrade buildroot to 2019.02 and add a "baseline" version to run bootrr

* add "baseline" test plan and run it on a couple of Chromebooks

* add "buster" rootfs and use it with test plans that don't need extra tools

* upgrade ARC compiler toolchain to 2018.09-rc1

* fix cros-ec test plan name so it's enabled again

* store full build logs rather than only warnings and errors

* reduce build config for chrome-platform tree to only 3 builds

* add and fix several devices in lab-baylibre


Best wishes,
Guillaume
