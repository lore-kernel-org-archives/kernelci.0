Return-Path: <dan.rue@linaro.org>
Date: Mon, 19 Nov 2018 12:30:29 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-11-19
Message-ID: <20181119183029.t46goyzahbym3i77@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Daniel Diaz, Guillaume, Matt, Milosz, Dan, Ana, Anders,
  Mark, Anmar, Kevin

- Ana:
  - Next iteration of the test reports:
    - https://github.com/kernelci/kernelci-backend/pull/84 comments on
      removing even more stuff from the reports?
      - [milosz] from experience working on LKFT you might only report
        on ‘regressions’ (pass->fail transition). Reporting failures
        from version to version isn’t that interesting.
      - [broonie] +1
    - Any other trees that should start getting test reports emails? And
      which tests?
      - Enable in the media tree and decide once we get feedback from
        the media developers if they find it useful or not

- gtucker
  - Tested RISC-V builds, see new PR #49
  - Ready to merge support for automated bisection reports recipients
  - Planning to split x86 into i386 and x86_64 this week
    - [matt] mips has the same problem. We build one but there are
      really many
      - [matt] kernelci using an old compiler with unknown origin. Need
        to use debian distributed toolchain. What to do in the meantime?
        - [broonie] may just need to get the right debian package set
          defined

- Matt
  - Build-environment support, ready for merge?
    - https://github.com/kernelci/kernelci-core-staging/pull/43
    - https://github.com/kernelci/kernelci-core-staging/pull/48
    - https://github.com/kernelci/kernelci-backend/pull/86
      - Ah I’ve just seen it needs a rebase
    - Agreed to merge on staging after rebased

- Dan
  - Config fragment support
    - Example from media pilot
      https://github.com/kernelci/kernelci-core-staging/commit/2c177df190f95c838b6eb8a2e2ef985111dc214c
    - [kevin] we’re likely going to need something like this. Proposals
      welcome
    - Out of tree config management
      - Kernelci could pull from a url
    - [broonie] should spend time doing things upstream as much as
      possible
    - Build generation scripts would need to be updated to store this
      information
    - Fragment and full configs are stored are stored as build
      artifacts. Build.py knows about the fragments. Not shown in web ui
    - Anders working on all mod config; still working through a few
      issues. Minimal boot config plus all mod config.
    - [matt] the API needs to know where the frag came from or offer the
      file when reporting bugs/boot issues

- [gtucker] can we remove filtering on mailing list for unsubscribers?
  kernelci@groups.io
  - [kevin] +1; presumably groups.io has some spam filtering.

- Agpl -> lgpl. Matt planning on emailing all contributors and asking.

- [Matt] should we merge kernelci-frontend and kernelci-backend
  - Nope :)
