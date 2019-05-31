From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-05-31
Message-ID: <6ff9a612-e5ca-9684-a75b-57d707c52c39@collabora.com>
Date: Fri, 31 May 2019 14:58:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* retire the legacy build.py script as the new kci_build command line tool is
  now used in automated Jenkins jobs

* add support for out-of-tree config fragments in bisections
  (i.e. virtualvideo, kselftest...)

* enable igt test plan on rk3399-gru-kevin for kernels v4.19+

* disable v4l2-compliance email reports to linux-media until some improvements
  have been made to only notify when new regressions are found or when
  regressions are fixed

* add the chrome-platform tree and build the for-kernelci branch

* upgrade stretch-v4l2 and stretch-igt to get the latest tests


kernelci-backend
----------------

* add build environment name to the test reports (i.e. gcc-8, clang-8...)

* add support for LAVA jobs that run several test suites, which will be useful
  for the baseline test plan (bootrr + kernel log checks)


Best wishes,
Guillaume
