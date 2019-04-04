From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-04-04
Message-ID: <bf9c9ebb-6cf7-3569-95b8-cb892ee8ef91@collabora.com>
Date: Thu, 4 Apr 2019 18:43:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

* test-configs: fix imx6ul-pico-hobbit using barebox

* kci_build: split into sub-commands and improve help messages

* buildroot: upgrade to 2018.11 and add MIPS variant

* stretch-igt: disable MIPS builds as currently broken in igt


On the staging and testing side of things, there's now a Linux
kernel tree in the kernelci Github project to hold branches to
test the kernelci.org infrastructure:

  https://github.com/kernelci/linux

I'm gradually automating the steps required to run all the
pending changes on staging, see this wip repo:

  https://gitlab.collabora.com/gtucker/kernelci-staging-tools


Guillaume
