From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-12-15 #minutes
Message-ID: <9a15d6fc-ae63-2c24-5c32-26fa8b4b457e@collabora.com>
Date: Tue, 15 Dec 2020 08:08:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>

Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Add hp-11A-G6-EE-grunt device type (x86 AMD Chromebook)
* Enable ltp-crypto test plan on an initial set of platforms
* Move remaining Jenkins files from kernelci-core to kernelci-jenkins
* Replace Travis CI with GitHub Actions in kernelci-core repository
* Drop "Boots" tab from web frontend after 6 months deprecation warning


Technical Steering Committee minutes - 2020-12-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Web frontend: kernelci.org/soc is slow

  -> All the =E2=80=9Cobvious=E2=80=9D Mongo DB indexes have been created,=
 there are still some
     performance issues to be investigated.  It=E2=80=99s kind of puzzling=
 that the
     =E2=80=9CJobs=E2=80=9D and =E2=80=9CTests=E2=80=9D tabs are performin=
g OK but not the SoC one, which
     arguably does the same things but with the =E2=80=9Cmach=E2=80=9D fie=
ld added to filter by
     SoC family.  It would also be worth considering archiving old data as=
 the
     frontend and email reports only use recent data anyway

  -> https://github.com/kernelci/kernelci-frontend/issues/131

* KCIDB - intermediate "caching" database

  SQLAlchemy doesn't seem to work out for implementing our notification
  system. Our case doesn't really match their primary use case well, so we=
 end
  up having to describe everything we need in a complex and obscure way, a=
nd it
  still doesn't work well.

  Going back to trying a custom approach, but simplifying it further, as m=
uch
  as possible.

* kci_build

  Kernel build commands being reworked as individual steps
  https://github.com/kernelci/kernelci-core/pull/554

* Discussion: how to manage increasing test load with LTP, kselftest etc..=
.

  -> identify which tests to run on which platforms to maximise the value =
of
     the results, see what other projects are doing about that


Technical Steering Committee minutes - 2020-12-08
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* KCIDB

  Another schema PR up for review: rename "description" to "comment" for a=
ll
  objects.

  Seeing a clear path forward on notification system design. Started
  implementation, filling in the details as I go. Hope to get to a prototy=
pe
  before leaving for a Christmas break on Dec 18.

  Will send a link to the design doc to the dashboard use case thread

* kernelci-backend rework
  * Started with adding tests for LAVA callback handling
  * The goal is to refactor the implementation of LAVA callback handling t=
o
    simplify the code and make it more sustainable

* kci_build

  Narrowing down the kci_build rework with separate steps, final tweaks an=
d
  fixes, got kselftest built OK.

* Improving documentation

  * updated kernelci-jenkins README.md, useful for migrating to a new syst=
em
  * started new file with list of test plans (only LTP coverage so far):
    https://github.com/kernelci/kernelci-core/blob/master/doc/test-suites.=
md

* Clang

  TravisCI shutting down CI for OSS projects; just killed our initial CI..=
.big
  thanks to KernelCI keeping us covered!
  -> You=E2=80=99re welcome :) In fact some KernelCI GitHub projects also =
use Travis CI
     for static checks and they=E2=80=99re running out of credit now=E2=80=
=
=A6  We have approval
     to pay for a basic plan but exploring free alternatives (GitHub actio=
ns,
     gitlab.com=E2=80=A6)
     -> Now moved kernelci-core to GitHub Actions, it's free and does the =
job


Advisory Board minutes - 2020-12-09
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing alternatives to Travis CI (now resolved with GitHub Actions)
* Project objectives and roadmap to be reviewed in January for 2021
* Discussing the project's advisory board roles


Best wishes,
Guillaume
