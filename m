Return-Path: <dan.rue@linaro.org>
Date: Tue, 30 Jul 2019 12:49:47 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-07-30 #minutes
Message-ID: <20190730174947.rjegp7f4qoy5bphv@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Anders, Dan, Daniel, Guenter, Guillaume, Mark, Matt

- gtucker
  - Tracking issues on Github:
    - Can we make this project public?
      https://github.com/orgs/kernelci/projects/1
      - gtucker will try to make it public, assuming it’s possible.
        - Matt has made it public
    - Started organising things in kernelci-core with milestones:
      https://github.com/kernelci/kernelci-core/issues
    - https://github.com/kernelci/kernelci-core/milestones
      - [drue] raised discussion that milestones should be better
        defined so they are complete-able 
  - EzBench bisection proof-of-concept for other projects such as
    KernelCI: https://gitlab.collabora.com/gtucker/scalpel/
    - [drue] nice work! Few questions discussed in the meeting: this
      does not use ‘git bisect’; it’s its own bisection algorithm.
      Unknown whether or not it has some of the same issues, like when
      you end up on a merge commit (or if that’s an unsolvable problem).

- broonie
  - Web UI needs some work for clang builds
    - Can’t see from the boot page if builds are with clang
      (https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20190730/
      for example)
    - No indication of conflicts with GCC.
    - https://github.com/kernelci/kernelci-frontend/issues/44
  - clang not showing up in e-mail reports for -next (this is I think
    the issue I was initially reporting last week, coupled with the web
    UI issue making it non-obvious that this was the problem)
    - Today there were failures on a bunch of BE platforms, plus at
      least QDF2400 failing to boot 
    - https://github.com/kernelci/kernelci-core/issues/127
  - Big endian builds with clang are failing to understand the rootfs
    still.
    - Some possibility that it could be sending the wrong rootfs getting
      sent only for clang builds but seems unlikely.
    - Can we blacklist for now? More than 50% of the current errors.
    - Can’t send pull requests myself - volunteers?
  - Kernel-build-reports doesn’t seem to be archiving all the reports
    (size issues?) - missing some -next reports.
    - Matt will raise with Linaro ITS

- Anders
  - Uefi PR https://github.com/kernelci/kernelci-core/pull/100
    - [gtucker] Bare minimum is to have versions used for the binaries,
      and some reproduction
    - [roxell] do we require this of other binaries, such as clang?
      - [mark] Version strings contain such versioning metadata. Trying
        to avoid some random binary that we don’t know the provenance
        (like we dealt with on mips)
      - [gtucker] Copy builds to storage.kernelci.org to avoid external
        dependency
    - [roxell] can we move forward now and defer some of the other
      requirements until the build is improved
      - [matt] all the metadata is there, but there is no full build
        log. For next release, they’ve agreed to push the build log too
        (for next one). I can copy everything we have to storage.kci -
        is that sufficient? One manual step to do it now, can be updated
        manually for subsequent releases. Binaries plus metadata from
        build, plus some brief text file for breadcrumbs.
        - [mark] that sounds fine
        - [anders] issue is linaro doesn’t have x86 until august; ard’s
          does, which is the main issue.
          - Need to gather metadata for x86 then pull it in too.
        - [gtucker] i think it would be good enough
  - Allmodconfig - downprioritised and I’ve been bikeshedding sorry.
    - [drue] url?
      - https://github.com/kernelci/kernelci-core/issues/20
    - [gtucker] if it doesn’t boot it might not be worth the effort.
      Take a lot of resource to build and already have some coverage

