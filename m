From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-04-07 #minutes
Message-ID: <d739cb52-d393-8ecb-0987-4cc896274b14@collabora.com>
Date: Tue, 7 Apr 2020 17:01:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

IMPORTANT - REDUCED BUILD CAPACITY
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Due to a sharp increase in the Microsoft Azure global workload, many
kernelci.org builders have been turned off temporarily.  We don't know ho=
w long
this will last, and only essential branches are being built at the moment=
.  The
current list of enabled build configurations is:

* mainline
* next
* lee_android_3.18
* stable_3.16
* stable_4.4
* stable_4.9
* stable_4.14
* stable_4.19
* stable_5.4
* stable_5.6
* stable-rc_3.16
* stable-rc_4.4
* stable-rc_4.9
* stable-rc_4.14
* stable-rc_4.19
* stable-rc_5.4
* stable-rc_5.6

We are working on enabling support for pre-emptible builders to increase =
the
build capacity regardless, so hopefully we should soon be gradually rampi=
ng
things up again over the next few weeks.


Technical Steering Committee minutes - 2020-03-31
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Clang-build Linux
  * Reported-by: KernelCI tag in CBL issues tracker:
      https://github.com/ClangBuiltLinux/linux/issues?q=3Dlabel%3A%22%5BR=
eported-by%5D+KernelCI%22+
    Lowball count; some issues get fixed without tracking these properly,=
 or
    without having seen the report from KernelCI.

  * build report email changes reverted to have all the details back, the=
y are
    needed for the Clang team's workflow

* kcidb
  * Grafana updated with new schema https://staging.kernelci.org:3000/

  * kcidb reporting TODO:
    * Remembering sent notifications
    * Formatting and sending e-mails
    * Caching data before submission

  * Sending kcidb results still takes too long
    -> caching to be implemented on receiving end, transparent to kcidb u=
sers

    [    INFO/MainThread] Task kcidb-tests[0a278e57-bec7-4128-8621-a3e55d=
b0b227] succeeded in 5.14888362633s: ObjectId('5e8224645fbf28e92d9bf482'


* pre-emptible builds
  * initial testing with GCE (google-compute-engine Jenkins plugin)

  * Matt recommended eventually using Juju for cloud-agnostic way
    (https://juju.is/)

  * a few issues in https://github.com/kernelci/kernelci-jenkins/issues

* KUnit
  * providing backend API tokens for staging

  * how to accept test results when there are no builds (static analysis =
in
    general will have this problem)

* kselftest build
  * need =E2=80=98rsync=E2=80=99 on builders (PR sent)

  * how/when do docker images get re built/pushed
    -> manual process at the moment, Docker Hub credentials needed for
       pushing updates automatically

  * some tests (eg bpf) depend on latest clang

  * FVP status?
    broonie: LAVA support landed

* staging.kernelci.org improvemnts to do:
  * add weekly Mongo DB public dumps shared on storage.staging.kernelci.o=
rg
  * time boxing to only get recent data and limit dump size
  * making the logs available every 8h (backend, frontend, automation)

* Jenkins config-as-code
  * GitHub auth still not enabled on staging
    -> Production doesn=E2=80=99t use GitHub auth so not a blocker for de=
ployment there
  * Still needs bisection job to be added to kernelci-jenkins

  * time to start looking at Jenkins alternatives?
    *  Concourse (https://concourse-ci.org/) ?
    * Switch to microservices + k8s?

* test log fragments:
  * issues with empty log_lines in some test cases
  * recent ascii encoding issue found by Kevin


Advisory Board minutes - 2020-04-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Members=E2=80=99 logos now live: https://kernelci.org/
* Discussing how to provide builders in the long-term
* Discussing how to create metrics about kernelci.org impact


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* reduce number of defconfigs built with Clang on linux-next
* re-enable lab-pengutronix
* several new i.mx6 and i.mx7 devices in lab-nxp
* HTTP urls used for all artifacts to enable easy proxy caching in labs
* list of stable branches revisited (added 3.16 and 5.6, removed 3.18)
* new "KCIDB (beta)" tab on web frontend with link to kcidb


Best wishes,
Guillaume
