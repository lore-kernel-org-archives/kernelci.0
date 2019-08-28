Return-Path: <dan.rue@linaro.org>
Date: Wed, 28 Aug 2019 09:54:45 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-08-27 #minutes
Message-ID: <20190828145445.j6mwzbhli7jzo2ro@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- broonie
  - Got a confliciting meeting

- Kevin
  - conflict: will miss (or be very late)
  - email report: regression false positives
  - email to list: Subject: kernelci-backend: /callback/lava/test: only
    "lava" results? [gtucker] just replied before the meeting

- Matt
  - While I’m fixing the boot emails bug, Nick is happy to turn off boot
    testing for clang
  - I will enable more clang builds with more build capacity (stable)

- gtucker
  - Running out of space on staging-ci.kernelci.org (master node) - I
    have no ssh access to that server so can someone please do some
    clean-up?
    - [Matt] main problem is debos rootfs jobs leaving artifacts on the
      master
  - Related to the email thread mentioned above, we need to sort out
    test views and roll out baseline test plan as discussed a while ago
  - Making good progress on kci_test command line tool and Pipeline jobs
    to run tests, gradual changes in a series of PRs
  - Found some issues with merge_config.sh and the loop that verifies
    all the confing options, we’ll need to use something else altogether
    with scripts/config --enable/--disable and our own checks in the
    resulting config file

- Mgalka
  - “Bootstraping a Local KernelCI” presentation at ELCNA 2019
    - Showing a proposal for a dockerized dev setup
    - Showing tolls like kernelci-admin/kci and kernelci-core/kci_build
      as means to facilitate the work
    - Slides:
      https://static.sched.com/hosted_files/ossna19/1e/Bootstraping%20Local%20KernelCI.pdf
    - Session has been recorded, will be available when LFEvents
      publishes it.
  - Conitinuation towards creating a single docker-compose file that’ll
    integrate AGL KernelCI docker + LAVA as a single easily deployable
    dev enviroment.
