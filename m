From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-01-10 #minutes
Message-ID: <096e9d53-f51c-cbbf-3d7a-8b9ea3bf5fff@collabora.com>
Date: Tue, 14 Jan 2020 07:02:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes that went into production last Friday:

kernelci-core
-------------

* new "kci_rootfs build" command to build debos rootfs on the command line

* enable automated bisections for single test case (not sending reports to the
  public initially)

* add support for Pine H64 model B


kernelci-backend
----------------

* fix some unit tests using newer version of mongomock

* fix some PyMongo deprecation warnings

* filter more bisection emails by not including the list of recipients in the
  report hash (to avoid duplicates sent to slightly different recipients)

* handle test case regressions to trigger single test case bisections and drop
  support for boot bisections

Best wishes,
Guillaume
