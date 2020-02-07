From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-02-07 #minutes
Message-ID: <d7847bb4-be3a-91e8-1910-be76ef229648@collabora.com>
Date: Fri, 7 Feb 2020 20:07:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-02-04
=================================================

* Matt: Where do we want the Jenkins config, kci-core or new repo?
  * new one: kernelci-jenkins + deploy tools in kernelci-jenkins-config

* BQ migrated to new dataset (with defconfig name/url)

* We can get rid of *.done files

* GitHub issues/dashboard
  https://github.com/orgs/kernelci/projects/1?fullscreen=true

* Discussion on a pub/sub service for triggers/notification of new
  builds/tests/etc

  e.g. MQTT service running in/with the backend

* On-going issues with Jenkins and Docker, investigating


Advisory Board minutes - 2020-02-05
===================================

* The technical steering committee needs to investigate how to produce metrics

* Discussing marketing plan

* Discussing how to test distributions with KernelCI


Summary of changes going into production
========================================

kernelci-core
-------------

* Add linux-pm testing branch

* Drop legacy "$ARCH".done files to simplify Jenkins setup

* New Allwinner boards in lab-baylibre:
  sun50i-h5-nanopi-neo-plus2, sun8i-r40-bananapi-m2-ultra

* Add "kci_rootfs upload" command

* Update cros-ec test plan with new Chromium OS Embedded Controller test suite


kernelci-backend
----------------

* Update test case and regression schema to show more details on frontend

* Allow more API calls to count test case and regression documents

* Add new Mongo DB indexes to help with showing test results on frontend


kernelci-frontend
-----------------

* Drop deprecated boot bisection range feature to suppress error messages


Best wishes,
Guillaume
