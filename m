From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-04-24 #minutes
Message-ID: <c82f9739-4e46-744f-f407-0d3722eff15d@collabora.com>
Date: Fri, 24 Apr 2020 22:47:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-04-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Kubernetes
  * RFC PR: https://github.com/kernelci/kernelci-core/pull/364
  * discussiong init containers
  * do we still need small/medium/big? -> maybe only 4 and 8 core jobs

* kci_build proposal from Dan Rue
  https://groups.io/g/kernelci/topic/kci_build_proposal/73153442

  Make a Python library & emphasize Docker more

* From MSFT: linux image validation automation
  https://github.com/LIS/LISAv2/
  caveats: windows host... (uses powershell)

* kcidb
  * Notifications are working, but some timeout on SQL queries, investiga=
ting
  * New tool: kcidb-notify - generate notifications from report data with=
out
    submitting

* B4 has some patch identification stuff as part of the attest machinery
  https://git.kernel.org/pub/scm/utils/b4/b4.git/

* Twitter account getting used more
  https://twitter.com/kernelci/status/1252350594120970240

* New Jenkins on bot.kernelci.org with config-as-code plugin and Docker
  compose, blocked with some builders behind a firewall, aiming to go str=
aight
  to Kubernetes instead

* kernelci.org web frontend update: aiming to roll it out in 2 weeks=E2=80=
=99 time
  preview with test results on https://staging.kernelci.org

* Test log fragments
  * backend support merged to master
  * Some lines are missing sometimes, which looks like a LAVA bug -
    investigating
  * Log fragments for failed test cases in e-mail reports


Advisory Board minutes - 2020-04-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* preparing a survey to learn about general kernel CI users
* making a plan between now and Plumbers to reach some key objectives:
  * common database schema (kcidb)
  * common email report samples from kcidb
  * web dashboard showing the common results as well


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* new Chromebook platform in lab-collabora: mt8173-elm-hana
* several new Freescale platforms in lab-nxp
* 32-bit VDSO on arm64 enabled with CROSS_COMPILE_COMPAT
* kci_rootfs can now be used to build buster, buster-igt and buster-v4l2
* bug fixed with default builds view on frontend, to show failed builds o=
nly


Best wishes,
Guillaume
