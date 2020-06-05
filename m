From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-06-05 #minutes
Message-ID: <31916308-faef-c575-b25b-0b54ef6c8c31@collabora.com>
Date: Fri, 5 Jun 2020 23:25:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--- IMPORTANT: BOOT TESTS DEPRECATION NOTICE ---

Boot tests are now officially deprecated, they are not run in labs any mor=
e and
boot email reports have stopped.  The Boots tab on the kernelci.org fronte=
nd
now shows a link to "baseline" results instead.

Details of the schedule can be found on this GitHub issue:

  https://github.com/kernelci/kernelci-backend/issues/238

Boot views will remain on the frontend for at least a week, to not break l=
inks
in recent boot emails.


Technical Steering Committee minutes - 2020-06-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Introduction: Isaiah
  * intern for 11 weeks
  * interested in all parts of the project
  * suggestion: integrating DT validation in KernelCI
    https://github.com/kernelci/kernelci-core/issues/396

* Introduction: Mathieu
  * TuxML research project
    https://groups.io/g/kernelci/message/767
  * Discussion topic: about scaling kernelci with containers
  * Discussed how to use kernelci with TuxML, to build kernels
  * Pipeline systems: Tekton, Gitlab CI
    Gitlab CI example, from Kevin=E2=80=99s kernel tree:
    https://gitlab.com/khilman/linux-amlogic/-/blob/gitlab-ci/.gitlab-ci.y=
ml

* Transition from boot tests to functional tests
  * Staging frozen this week until
  * Roll out in production on Friday with no boot tests

* 2020-Q3 plan review
  https://docs.google.com/document/d/1KCIv6L3XrsNFIu4GzFMTV7Qx6Jlm2trc-bvR=
IbDEVV8/edit#

* Survey is now open: https://forms.gle/Y5iuyLXgQr2y3SrF6


Technical Steering Committee minutes - 2020-05-26
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* qemu CPU types for arm64
  * Using "max" CPU type to enable all supported features
    https://github.com/kernelci/kernelci-core/pull/388
  * Checking on staging, if no big issue this can get merged now

  * Longer term promoting some qemu-docker or something so we have more co=
ntrol
    over qemu versions might be good, LAVA is convenient for integration
    though
  * clabble at BayLibre had some work on the container stuff.

* On-going clean up:
  * moving jpl files to kernelci-jenkins
  * then, moving YAML files to separate config project
  * then, making kernelci-core a pure =E2=80=9Ckernelci=E2=80=9D Python pa=
ckage
  * Removing boot views in frontend
  * Removing boot-related code in backend

* Clang: Build time regressions on -next, was this noticed?
  https://github.com/ClangBuiltLinux/linux/issues/1032
  * not directly noticed by KernelCI, build times are stored but not used =
as a
    performance test at the moment.
  * otherwise, there was some discussion on IRC of the READ_ONCE() changes
    making compilers unhappy

* Kernel builders
  * production back to the previous state of trees/branches
  * k8s: how to best send `file_server_resource` (or equivalent) to test-r=
unner
    * Idea: generate the =E2=80=9Cstatic=E2=80=9D meta-data before build, =
it will contain
      file_server_resource

* KCIDB
  * revision-correlation PR still on review
    https://github.com/kernelci/kcidb/pull/84


Advisory Board minutes - 2020-06-03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Reviewing 2020-Q3 plan following TSC discussion


Advisory Board minutes - 2020-05-27
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Making last tweaks to the KernelCI Community Survey
* Discussing next blog topics for https://foundation.kernelci.org/blog/


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Boot test deprecation:
  * https://kernelci.org frontend updated to not show boot results in Boot=
s tab
  * boot tests not run in labs any more
  * boot emails not sent any more
  * baseline-nfs test plan variant created, run on a handful of devices

* kernelci-core documentation updated with kci_rootfs sample commands

* rootfs Jenkins files moved to kernelci-jenkins repository

* fixed bug to order data correctly on frontend Tests default view

* sponsors page updated https://kernelci.org/sponsors/

* new Docker image for DT validation kernelci/dt-validation


Best wishes,
Guillaume
