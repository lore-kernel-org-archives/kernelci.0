From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-10-25
Message-ID: <ee6c2ef8-b562-9c3c-762b-e185af092170@collabora.com>
Date: Fri, 25 Oct 2019 15:09:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* fixed filters for lab-clabbe to only run kernels from some trees

* added Github issue template for adding a new kernel branch

* enabled sleep test plan on rk3399-gru-kevin

* added support for KCONFIG_* options in defconfig

* fixed test plan filters to avoid submitting some unwanted jobs

* stop running currently broken test plans and android kernels in lab-collabora


kernelci-backend
----------------

* fixed handling of file server paths for build binaries

* show measurements in test report emails

* rename /etc/linaro to /etc/kernelci (config files default location)


kernelci-frontend
-----------------

* rename /etc/linaro to /etc/kernelci (config files default location)

* bump Flask version to 1.0


All the staging and production servers have also been upgraded to Debian Buster
or except those running Ubuntu that is still supported.  The ansible playbooks
for backend and frontend have been updated for Debian Buster accordingly.

Best wishes,
Guillaume
