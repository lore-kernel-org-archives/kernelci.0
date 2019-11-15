From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-11-15 #minutes
Message-ID: <1b777ccb-e8a6-e363-596d-43a3e7e1e243@collabora.com>
Date: Fri, 15 Nov 2019 17:12:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add docstrings in modules recently added (used by kci_test)

* add android-3.18-preview branch from Lee's tree

* add several more boards in lab-baylibre

* update automated bisection to use kci_test

* add reference branches for stable-rc to enable bisection on them

* enable allmodconfig builds by default on arm (was only built with -next)

* schedule some builds on small/medium/big builders depending on defconfig


kernelci-backend
----------------

* enable Travis CI on Github

* fix build emails when no errors and no warnings

* add test plan variant meta-data to enable bisection to cover tests


kernelci-frontend
-----------------

* add banner about foundation.kernelci.org

* update favicon with new KernelCI logo


Best wishes,
Guillaume
