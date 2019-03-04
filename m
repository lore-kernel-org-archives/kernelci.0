Return-Path: <dan.rue@linaro.org>
Date: Mon, 4 Mar 2019 09:00:19 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-03-04 #minutes
Message-ID: <20190304150019.lavqz4scihyrnitm@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Charles Oliveira, Guenter Roeck, Dan Rue, Mark Brown, Matt
  Hart, Amro Hassan, Anders Roxell, Michal Galka, Daniel Díaz, Guillaume
  Tucker, Alice Ferrazzi
- Matt
  - I will do the PR to move clang builds to production
    - Will also move the google builders
  - Using idle cpu time on builders to run randconfig builds
    - Ask Arnd
- Broonie
  - rmk complaining it’s taking ~4 days to build his tree
    - There was a massive backlog last week somehow
    - Looks like it might’ve been to do with rolling out gtucker’s
      changes, cleared now anyway.
- Dan
  - Adding x15’s and naming convention
    - Linaro lab uses name ‘x15’ for board, not the dtb name. Won’t be
      possible to rename boards in linaro lab.
    - Lava supports aliases
      - But do they work as expected?
        - [drue]....no.
    - There are two different boards named x15, and x15 can boot with
      two different DTBs
    - Will look at adding a naming convention page to kernelci wiki - i
      guess i’ll post to mailing list first for review.
- Daniel
  - Working on a bisection shell script for lkft
  - Interested in helping decouple the kernelci bisection from jenkins
    and working together
    - [guillaume] it’s not really coupled with jenkins right now, though
      it is hard to use on the command line.
    - Intel freedesktop folks have some advanced bisection tools too
      https://gitlab.freedesktop.org/gfx-ci
- Amro
  - Just touching base on behalf of Charles on his PR for extra callback
    to ES experimental. Any further holdoffs?
    - https://github.com/kernelci/kernelci-core-staging/pull/68
