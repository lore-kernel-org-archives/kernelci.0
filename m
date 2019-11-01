From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-11-01
Message-ID: <ac3c71c9-c732-bdee-ef6d-6b26cca682c8@collabora.com>
Date: Fri, 1 Nov 2019 21:24:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* fine-tune allocation of kernel builders for large defconfigs (allmodconfig
  typically) in Jenkins

* add arm64 kernel tree with for-kernelci branch

* enable support for reference branches for bisections where the good and bad
  revisions are not on the same branch (useful for stable-rc)

* enable Travis CI on Github for unit tests and coding standard

* add kci_build pull_tarball command to download and extract a source tarball
  and use it in Jenkins jobs


kernelci-backend
----------------

* enable kernel log highlighting based on log levels


Best wishes,
Guillaume
