Return-Path: <dan.rue@linaro.org>
Date: Wed, 23 Jan 2019 08:50:37 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-01-21 #minutes
Message-ID: <20190123145037.ejmrlqzwjqewmgcr@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- [gtucker]
  - Viewing test results on the kernelci.org front-end: is anyone
    looking into this? (previous discussion was about adopting a view
    similar to builds and boots)
    - [chaws] will be working on ‘environment’ columns this week
    - Check on mailing list whether it’s OK to disable the Tests page
      for now
  - This week: reducing bisection duplicates, increasing bisection LAVA
    job priority from “low” to “medium” to match other kernelci tests,
    avoid sending the same bisection report more than once
    - Idea: reply to previous bisection report when more platforms fail
      with the same commit
    - Use some kind of logic to avoid running many redundant bisections
      when one change breaks tens of platforms
  - Pending: build-configs.yaml, multiple compiler support for
    bisections and tests

- [matt]
  - What platforms are we running suspend/resume and IGT tests in LAVA?
    Linaro MMWG are looking at the same thing
  - Uses Debian IGT rootfs
  - IGT: Subset: DRM/KMS tests
  - Currently run on chromebooks

- [chaws] thoughts about uptading kernelci-core doc?

