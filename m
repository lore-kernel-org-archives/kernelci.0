From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-09-27
Message-ID: <4bc6e259-f752-de82-5270-31d99dd0bd37@collabora.com>
Date: Fri, 27 Sep 2019 21:59:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* added baseline-fastboot test variant and run it on one platform in
  lab-baylibre (sei510)


kernelci-backend
----------------

* removed AGPL license file now that the project is all LGPLv2.1+

* added login test case to all test suites using LAVA meta-data, to report a
  failure when the platform failed to boot to a login prompt rather than no
  test results at all.

* improved test email summary formatting to deal with long values and scale
  better with many test runs


Best wishes,
Guillaume
