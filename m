Return-Path: <dan.rue@linaro.org>
Date: Thu, 30 Aug 2018 13:43:04 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-08-30
Message-ID: <20180830184304.75ai3ecfuf23ip6w@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Milosz, Dan, Ana, Mark, Matt, Guillaume, Guenter

- Matt
  - LAVA ConfigurationError should be parsed as unknown result rather than fail
    - Assigned to Matt

- Agenda items from Collabora:
  - YAML test configuration
    - https://github.com/kernelci/lava-ci-staging/pull/96
    - Tested on staging, polishing documentation now.
    - Merged, working fine
  - Staging update pull request https://github.com/kernelci/lava-ci/pull/122
    - usb: add test cases after suspend/resume
    - usb, sleep: use the Debian file system rather than buildroot
    - remove all LAVA v1 and other various stale code and configuration data
    - replace lib.device_map with YAML-based lib.test_configs and 
      test-configs.yaml
  - Test results backend refactoring
    - Based on the outcome of past discussions, we suggest that we replace the
      current backend test models implementation (suite, sets, cases) with more
      flexible ones (group, cases) in order to allow more flexibility in terms
      of hierarchy.  This would seem like a starting point with the minimal
      changes required to be able to store test results from any test suite.
  - Reporting test suites results v3 was merged. No mails sent yet.
    - Ana will send mail to the list
  - MIPS pull request 
    https://github.com/kernelci/kernelci-build-staging/pull/53
    - Matt will merge

- Azure builder issue
  - Not clear what’s going on, but lose connection to build host
  - Could be firewall configuration
  - [matt] i’ll try changing the configuration to connect directly to the
    host/port22 so that we aren’t connecting to a container on a high port
    number, which might be contributing to the problem

