From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-10-11
Message-ID: <020a07cc-8606-9b15-8abe-e793e5145c1a@collabora.com>
Date: Fri, 11 Oct 2019 21:42:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add kernelci.lab, kernelci.test and kci_test as new Python modules and
  command line tool to manage lab configuration and job submission

* new test-runner.jpl Jenkins Pipeline job using kci_test to improve job
  submission and run for each kernel build rather than at the end of all the
  builds for a branch.

* fix path to kvm_guest.config fragment, which should enable builds with it

* add more android q branches

* fix agross email address


kernelci-backend
----------------

* show number of passing tests / total tests in email reports summaries than
  the number of failures


Best wishes,
Guillaume
