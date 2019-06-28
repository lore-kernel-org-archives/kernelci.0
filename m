From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-02-28
Message-ID: <546303a7-1ff6-80e0-c3b0-babcd6167942@collabora.com>
Date: Fri, 28 Jun 2019 15:00:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add support for LAVA device type aliases

* fix email report triggers for branches that build less than 4 CPU
  architectures

* build buster-igt for MIPS again (no platforms to test it yet)

* add kernelci.org branch in the kernelci kernel tree on Github to run tests


kernelci-backend
----------------

* do not treat conflicting boot results between labs as regressions

* add line in bisection email reports about using Reported-by kernelci.org bot


Also, bisections have been re-enabled in lab-baylibre as well as for several
maintainer trees that have been rebased on a newer revision (v5.2-rc1 had a
known problem on rk3288).

Best wishes,
Guillaume
