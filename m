From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-12-02 #minutes
Message-ID: <e2c609ea-4795-5df2-6d03-340c949190a9@collabora.com>
Date: Mon, 2 Dec 2019 17:38:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* New Github issue templates have been added for feature requests and API
  tokens:

    https://github.com/kernelci/kernelci-core/issues/new/choose

* Legacy Python scripts have been removed as kci_build and kci_test can now be
  used to reproduce all the KernelCI steps.  See the documentation on this wiki
  page (work in progress):

    https://github.com/kernelci/kernelci-doc/wiki/KernelCI-command-line

* All Python scripts have now been converted to Python 3

* Fix value of "verbose git describe" in build meta-data

* Use yaml.safe_load() instead of yaml.load()

* Add more QEMU ARM variants including VExpress

* Add several new device types in lab-baylibre

* Add kci_build --publish-path to specify the relative path of kernel binaries
  on a storage server

* Add kci_test --mach to generate jobs only for a given SoC type

* Drop old LSK branches

* Update list of Android branches

* Fix issue with LAVA job names longer than 200 characters


kernelci-backend
----------------

* Upgrade to PyMongo v3.9 and use Mongo DB v4.2 with Debian Buster
  Note: Some unit tests still need to be updated to work.

* Bump PyYAML to v5.1 to fix security issue

* Use yaml.safe_load() instead of yaml.load()

* Fix Unicode handling in HTML kernel logs

* Fix exception with callbacks from cancelled LAVA jobs

Best wishes,
Guillaume

