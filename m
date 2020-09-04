From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-09-04 #minutes
Message-ID: <0a514202-1409-8e17-e337-0b93774ce7d1@collabora.com>
Date: Fri, 4 Sep 2020 16:13:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-09-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* dt-validation
  Broonie using KernelCI containers for his local work - thanks Isaiah!

* Profile-driven optimization
  Once the AutoFDO stuff lands in the upstream kernel it is likely that th=
ere
  will be some benefit from sharing the profiling data between users - onc=
e
  this gets merged we should look into if/how we can share results (especi=
ally
  from benchmarking when we get to that) - need to understand what it look=
s
  like.

* LLVM/Clang

  * Pull request for containers, broonie will send one for build-configs.y=
aml
    once there=E2=80=99s an official release:
    https://github.com/kernelci/kernelci-core/pull/469

  * Which versions of clang do we want in production? Currently clang-9 an=
d
    clang-10, then should we move to clang-10 and clang-11 or clang-11 onl=
y?
    Worth checking with the Google people what they=E2=80=99re shipping, p=
ossibly could
    even use their production versions as stable ones to test against. Mar=
k to
    start thread, either mail or on github.
    -> https://github.com/kernelci/kernelci-core/issues/488

* Docker Hub

  Docker Hub limitations getting introduced on 1st November
  https://www.docker.com/blog/scaling-docker-to-serve-millions-more-develo=
pers-network-egress/
  We don=E2=80=99t actually need to keep pulling in every job, images get =
updated once
  a week.  So we could use tagged images and pull only if the tag is not
  present, rather than blindly pulling the =E2=80=9Clatest=E2=80=9D.

  It=E2=80=99s not entirely clear whether this will be impacting us direct=
ly or not,
  but it=E2=80=99s still a good idea to avoid doing Docker Hub pulls when =
we don=E2=80=99t need
  them.
  -> Alternative: deploy our own registry: (less limitations, more mainten=
ance)
     https://docs.docker.com/registry/deploying/

* LPC 2020

  * KernelCI notes (feel free to add some):
    https://docs.google.com/document/d/1sLFx8UDaMIIiU7gPrauNfp3kBVU_v8nXVN=
PlMUS9kHA/edit#heading=3Dh.toavnesaivaw
    -> Preparing KernelCI blog post next week based on that

  * KCIDB and kernelci.org: lessons learned from LPC 2020

    It=E2=80=99s a great tool for adding data from sources that are entire=
ly decoupled
    f rom kernelci.org, such as Fuego and Gentoo=E2=80=99s gKernelCI, 0-Da=
y etc=E2=80=A6 (seems
    like it=E2=80=99s not as trivial as one would have hoped, but it=E2=80=
=
=99s still early
    days) The need for =E2=80=9Cnative=E2=80=9D tests managed directly by =
kernelci.org is still
    very present.  So we can deduce some simple rules as to what should ge=
t
    connected to KCIDB and what should be added to the kernelci.org pipeli=
ne:

    * KCIDB: independent CI systems, distros and products using downstream
      kernel trees, private hardware=E2=80=A6

    * Native kernelci.org: upstream trees, tests using builds from
      kernelci.org, open source test suites and publicly available hardwar=
e
      only, community CI service for individual test labs=E2=80=A6

    All the native kernelci.org results are pushed to KCIDB, which becomes=
 a
    superset of that data in terms of diversity although not in terms of
    schema.  Future alternative KernelCI instances on =E2=80=9Cmember=E2=
=80=9D.kernelci.org
    should also have their data pushed to KCIDB, where everything can be
    compared.  Native kernelci.org tests benefit from a fully integrated
    pipeline with added functionality, rather than purely a database:
    configuration publicly managed on GitHub, regression tracking, automat=
ed
    bisection=E2=80=A6

  * KCIDB BoF

    * Submission HOWTO published, could use expansion, perhaps.

    * Playground system setup. Could be used for playing around with
      reporting. Everything is separate, except Grafana, which just needs
      another dataset specified, and the result maillist.

    * Got Tim Bird from Sony, Alice Ferrazzi from GKernelCI and Tim Orling=
 from
      Intel involved, see details in the shared document with LPC notes.

  * Real-Time tests
    preempt-rt test plan (based on Daniel Wagner=E2=80=99s existing work)
    https://github.com/kernelci/kernelci-core/pull/475
    See also: https://github.com/bristot/rtsl
    https://linuxplumbersconf.org/event/7/contributions/645/

* KCIDB

  * Grafana now preserves specified dataset names across dashboard links t=
o
    make experimenting easier.

  * Experimenting with parsing JSON streams in Python to support pushing m=
ore
    than one report to KCIDB tools. The stock module is unable to do this.=
 Made
    jq.py support parsing streams, but performance is quarter of the stock=
 json
    module, even with added optimizations, so far. Perhaps that's good eno=
ugh
    for the start, though.

* kselftest: no test results on staging.kernelci.org?
  -> Fixed, there was an arm64 build breakage in linux-next
  -> Adding more devices to run kselftest


Technical Steering Committee minutes - 2020-08-18
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* User settings file
  * Settings file support being added in kernelci-core
  * Backend API tokens in k8s secrets, that needs to be stored in a settin=
gs
    file now.
    -> Shared volume, or k8s secrets dumped in settings file? TBD

* LLVM/Clang and config fragments
  Should we implement our own thing rather than merge_config.sh?
  -> Turns out, LLVM=3D1 solves the problem as long as we're using all the=
 LLVM
     toolchain.  The issue remains when ussing CC=3Dclang but GNU for ever=
ything
     else (linker...)

* Bisection
  * Fixed, there was a glitch in Jenkins job parameters after k8s roll-out=
...
  * Please check kernelci-results@groups.io for reports until we enable se=
nding
    them to the public lists automatically again

* Generic API for test reuslts in kernelci-backend
  * Cleaning up backend test API and kci_data
  * Fixed some issues with test counts and cleaned up fields
  * Next step is to drop requirements for build-related meta-data (for DT
    validation and KUnit=E2=80=A6)

* KCIDB
  * In-object gradual reporting in KCIDB
  * WIP: Common Reporting article and LPC talk
  * Common Reporting BoF approved. Looks like it will be on Thursday.
  * Picking up Submission HOWTO again.
  * CKI is stretching KCIDB with their requirements. Reporting core dumps =
and
    coverage.

* KUnit
  Initial review/testing with PR from Brendan

* LAVA callback support
  * LAVA log filtering enabled on staging
  * Changes in login test case, WIP

* Other notes:
  https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci=
/


Advisory Board minutes - 2020-08-19
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Public datawarehouse with dummy data for illustration is live:
  https://datawarehouse.cki-project.org

* LPC update: testing/fuzzing MC schedule published:
  https://linuxplumbersconf.org/event/7/sessions/80/#20200826


Advisory Board minutes - 2020-09-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Metric: pain-free kernel migration.  How does KernelCI facilitate that?
  * Kernel release report with summary of results from KernelCI?
  * Find out which parts break when migrating to a new kernel
    -> Guenter: DRM, sound, wireless
    -> Guy: what about kernel configuration?
       Kernel version changes, but also need to verify that the config is
       compatible See also:
    -> Guillaume: see also https://github.com/TuxML (was discussed at LPC)

* Discussing LPC results, KernelCI was mentioned in many places


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Add support for user settings files, see documentation:
  https://github.com/kernelci/kernelci-core/blob/master/doc/settings.md

* Enable kselftest tarball with kernel builds which include the kselftest
  fragment (tests not run yet in production)

* Switch to LLVM=3D1 for LLVM/Clang builds, which fixes config fragments s=
upport
  with Clang but now uses all LLVM toolchain rather than mixed LLVM/GNU

* Clean up schema for submitting test results in kernelci-backend generic =
API

* Several more new NXP i.mx6,7,8 boards

* Enable extra linux-next builds with 64K pages on arm64

* Fix Renesas branch name


Best wishes,
Guillaume
