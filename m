Return-Path: <dan.rue@linaro.org>
Date: Wed, 17 Jul 2019 09:25:31 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-07-16 #minutes
Message-ID: <20190717142531.hge5hi7udd2pl7yx@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Guillaume, Kevin, Mark, Matt, Michał, Nick, Daniel

- Guillaume
  - There are things we could do to improve the structure of the project
    independently of joining the LF, such as:
    - Reviewing and improving documentation around how the project
      operates
    - Defining the purpose of the project (upstream kernel testing…)
    - Creating a roadmap or at least a backlog (Github issues?) These
      things should help provide some visibility to people who are
      getting interested in the project, and also help coordinate
      development efforts.
  - Test results on the kernelci.org front-end: the work done on
    kernelci.automotivelinux.org could be a good starting point as it is
    based on kernel revisions.  It doesn’t know about sub-groups though.
    This may still be the shortest path to a functional Tests view on
    the front-end.
    - [KH] anyone else working on this?
    - [KH] background: BayLibre has done some experiments for AGL, which
      are now outdated due to the migration from 3-level (suite, set,
      case) to multi-level nested groups
      - Code available, but needs rebase/rework:
        https://github.com/BayLibre/kernelci-frontend/tree/wip/tests-by-build
  - CKI Hackfest agenda: https://cki-project.org/posts/hackfest-agenda/

- Nick
  - New Android virtual device, possibly to replace Android Emulator.
  - Build with Clang-9?
  - Interest in mainline, stable kernels.

- Michał
  - Non-LAVA labs support in kernelci-backend

- Kevin
  - Supporting multi-node jobs in the backend
    - BayLibre working on using multi-node jobs to add power-measurement
      for boots and tests (host job controls measurement equipment,
      target job does normal boot/test)
    - multi-node docs are ...
    - multi-node jobs have a callback for each (sub)job
      - all (sub)jobs show the same device-type, so currently the boot
        logs (and lava-json-*.json) are overwritten
        - patch coming for this soon

- Matt
  - Building perf?
    - Sounds like a yes, I will do a PR

New features needed/requested/discussed during meeting
- build email reports
  - show/highlight only new warnings, deltas
  - Cut down the size of boot reports
    - Mark has some ideas here, may start looking at them once some
      paperwork goes through internally.
