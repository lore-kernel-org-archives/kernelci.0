Return-Path: <dan.rue@linaro.org>
Date: Tue, 4 Jun 2019 13:48:07 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-06-04 #minutes
Message-ID: <20190604184807.isjktbnyrqhaytvq@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Michał, Charles, Mark, Guillaume, Guenter, Daniel, Kevin,
  Dan, Amro

- Kevin
  - build logs: start saving full build logs (instead of just make cmds
    and stderr).  
    - Goal is to enable other post-processing / analysis (e.g. ELK
      stack)
      - [gtucker] we can add --verbose to the build command
  - buildroot
    - add “baseline” version: who will add this (already done)
    - pushed a rebased `kernelci/2019.05` branch to `latest` (built on
      staging)
      - Should kernelci/latest be updated?
    - Jenkins job migration to scripts: is this ready?

- Guillaume
  - Should we consider building fewer kernels for maintainer trees? i.e.
    many trees with plain defconfigs and a couple of test fragments
    - [gtucker] I’ll go through some of the maintainer trees we have and
      check with them which builds they actually want (defconfigs,
      fragments)
  - Adding buster-igt rootfs using meson to build libdrm and igt
  - Slow response from Bjorn & Linaro so have now forked bootrr in
    kernelci/bootrr to use in baseline buildroot

- Michał
  - “tests” API currently uses build_id, job_id and boot_id is anyone
    actually using it? Is it worth to keep it ?
    - Need to check if frontend is using those ids.
      - If it does we should probably change it to use the metadata
  - “tests” API changes. Adding metadata handling like in lava callback.
    - No-one seems to be using the “tests” API
    - Making “tests” and “callback” APIs behave similarly and sharing
      some code feels like a good direction

- broonie
  - Would be nice to have bisections visible in the UI, not that I have
    the time/UI skills to do it.
    - [gtucker] This has actually been in my backlog for a while, if
      people are showing interest then it should rise in priority.

- Drue
  - Alias support in LAVA 2019.05. I tried using it but couldn’t figure
    it out :-/, but it should solve the board naming problem.
    - https://github.com/danrue/lava.therub.org
    - https://github.com/danrue/lava-docker-compose

