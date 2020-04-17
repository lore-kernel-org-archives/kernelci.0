From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-04-17 #minutes
Message-ID: <ea03c20e-8ae9-59e6-a8c8-e0257105cbf4@collabora.com>
Date: Fri, 17 Apr 2020 18:02:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-04-14
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* kcidb

  * new release of kcidb: https://github.com/kernelci/kcidb/releases/tag/=
v5
    (no schema changes)

  * Message queue infrastructure deployed to =E2=80=9Ckernelci=E2=80=9D G=
CP, should be ready
    for submission. Reports should be sent to
    kernelci-results-staging@groups.io. CKI is switching tomorrow.

  * A bunch of test reports already sent to the maillist.
    https://groups.io/g/kernelci-results-staging/topics

  * Set up new service accounts to have minimal access for submission/que=
rying
    (one per CI system), and have a separate, shared, all-powerful accoun=
t for
    maintenance. Sent to Kevin and Guillaume.
    https://github.com/kernelci/kcidb#administrator-guide

* Kubernetes experiments are on-going

* kernelci.org monitoring

  * Zabbix vs xymon
  * what do we want to monitor?
    * backend, frontend, jenkins, grafana, static servers (not builders)
    * software updates, disk space, services health

* Jenkins

  * kernelci-jenkins is now complete (except GitHub auth=E2=80=A6), deplo=
ying in
    production

* Web frontend

  * test views are all there, starting =E2=80=9Cfinalising=E2=80=9D phase=
 now before roll out
    https://staging.kernelci.org/job/

* Test case log fragments now work well for nested group->sub_group->test=
_case

* kernelci-backend lacks proper unit tests, this should be part of the re=
work


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* new kci_rootfs tool now used to build Debian Buster rootfs images
* enable stable and mainline trees in lab-clabbe as well as several new b=
oards
* add ONFIG_MEDIA_TEST_SUPPORT=3Dy to virtualvideo fragment for vivid tes=
ting
* clang-10 enabled to build linux-next with arm, arm64 and x86_64 defconf=
igs

Best wishes,
Guillaume
