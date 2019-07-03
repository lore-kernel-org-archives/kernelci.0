Return-Path: <dan.rue@linaro.org>
Date: Wed, 3 Jul 2019 08:34:31 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-07-02 #minutes
Message-ID: <20190703133431.txetxpqee7ejbndv@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Anders, Charles, Guillaume, Mark, Matt, Michal, Daniel

- Guillaume
  - LTP test plan: up for grabs?
    - [gtucker] on hold for now, low level of interest at the moment
  - LAVA downloads: http + squid + checksums, or https with LAVA
    built-in cache?
    - [gtucker] Sounds like http + squid + checksums is the way to go,
      adding checksums when posting files to the upload API in
      kernelci-backend
    - [matt] LAVA suggests squid in documentation so Linaro lab has used
      it for a while - Doc
  - Viewing test results on the front-end: are there any plans to fix
    this?
    - Charles to try to come up with some simple test results front-end
      (kibana based)
  - I’ve spent some time on gfx-ci tools (cibuglog, ezbench), some
    interesting things
    - cibuglog and modified patchwork could be used for testing patches
    - cibuglog is yet another front-end / back-end using Django
    - ezbench is not currently used in production but has some great
      bisection logic which could be reused for complex test suites in
      KernelCI
    - next step: experiment with ezbench bisection separately from the
      rest of ezbench features (building tests, scheduling runs,
      producing reports…)

- Michal
  - Changes in /test API
    https://github.com/kernelci/kernelci-backend/pull/141
    - [gtucker] check with Bjorn and Kevin as they have non-LAVA labs
    - It’s worth getting some feedback to verify it is functional and
      also that the API design is good before we document and publish it
      for good

- Anders
  - Uefi - where should we have the uefi images, at storage.kernelci.org
    or should it be somewhere else that Ard can upload new whenever he
    needs/want?
  - https://github.com/roxell/kernelci-core/commit/5282995a6abcc50c826826c0e8ffae131eb4b805

