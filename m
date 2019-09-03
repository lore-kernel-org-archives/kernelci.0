Return-Path: <dan.rue@linaro.org>
Date: Tue, 3 Sep 2019 15:18:05 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-09-03 #minutes
Message-ID: <20190903201805.jdrn6gtw4q7wbsuc@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Nick, Daniel, Guenter, Kevin, Matt, Michał

- broonie
  - Definitely not attending this week
  - No license on various git repos, got queries about this internally -
    many of these are dead/irrelevant but would be good to clarify and
    get stuff added:
    - lava-docker
    - kernelci-docker
    - builder-config2
    - kernelci-doc
    - builder-config-data
    - lava-slave-docker
    - pkg-lava-dispatcher
    - pkg-lava-server
    - kernelci-reports-config
    - builder-config
    - lava-kernel-tests
  - frontend / backend
    - AGPL -> LGPL
    - Matt got agreement from contributors.  
    - Just do it.

- clang
  - new arm64 failures: “asm goto”
  - CONFIG_MODVERSIONS creating some bizarre issues

- build resources
  - (still) need to rework Jenkins job to handle on-demand, pre-emptible
    builders
  - will have access to a *lot* more (cheap) cloud-build resources

