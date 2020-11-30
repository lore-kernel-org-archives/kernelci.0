From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-11-30 #minutes
Message-ID: <b807cd1d-750f-ce19-4da6-579ce5ac104a@collabora.com>
Date: Mon, 30 Nov 2020 19:51:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix main kselftest build issues, remaining ones are likely due to kselft=
est
* Enable clang-10 builds on mainline
* Enable RISC-V builds with clang-11 on linux-next
* Enable initial subset of IGT tests on i915
* Fix boot bisection following callback data changes in recent versions of=
 LAVA
* Fix Renesas board names due to devicetree changes after v5.4
* Update Renesas and CIP email settings (addresses, test plans)
* Change dove-cubox to mach mvebu
* Add lab-kontron with 2 initial devices and baseline-nfs test plan


Technical Steering Committee minutes - 2020-11-10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Special topic: Tekton

Tim and Trevor shared with us their recent experiments using Tekton.  It's
particularly interesting for KernelCI as we're facing on-going issues with
Jenkins while we're also leaning towards running more things in the Cloud.

* CI/CD framework for Kubernetes
* All in YAML, dashboard, CLI
* Setup: using kubeadm (not Minikube) single node rather than a proper clo=
ud
  cluster
* Example: meta-python OE layer
  https://github.com/threexc/yocto-tekton
* See also: https://hub-preview.tekton.dev/
* Initial implementation (very rough):
  https://github.com/moto-timo/kernelci-core/tree/tekton/tekton


Technical Steering Committee minutes - 2020-11-17
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Extra meeting: KCIDB

We spent an extra hour before the weekly to review the situation with KCID=
B.

* how to get kernelci.org production data sent to KCIDB
  -> manage pool of open KCIDB connections as properties of Celery tasks
* review any known issues with KCIDB schema
  -> how to group results for generating email reports
* status of the various CI systems interested to send data
  -> send a regular (monthly?) email with status update
* plan to start sending email reports to public mailing lists
  -> get production kernelci.org native results in KCIDB
  -> work out any changes needed in the schema
  -> start with a minimal schema with required fields
  -> extend gradually and maybe drop =E2=80=9Cincomplete=E2=80=9D data as =
submitters adjust

Main meeting

* KCIDB
  ARM now sending results to KCIDB playground
  Gentoo making progress, no results yet
  Renaming "revisions" to "checkouts" with origin-generated IDs and patchs=
et

* Jenkins
  k8s runner issues, almost all jobs are timing out
  -> resolved by garbage collecting incomplete k8s jobs

* kci_build
  * Splitting =E2=80=9Ckci_build build_kernel=E2=80=9D with new JSON forma=
t for intermediary
    state, potentially aligning with tuxmake to ease transition later on
  * Separate build logs for kselftest or anything =E2=80=9Cextra=E2=80=9D =
other than kernel
    build

* LTP
  * ltp-ipc is now in production, other LAVA labs can run it
  * ltp-crypto is getting added next
    -> see with montjoie if his tests can be added to LTP crypto
    -> follow-up: they appear to be rather different things, can be both a=
dded
       separately and maybe consolidated together later on

* Tim's Tekton experiments
  * KubeCon is on now
    https://events.linuxfoundation.org/kubecon-cloudnativecon-north-americ=
a/?utm_source=3Dkuberntes.io&utm_medium=3Dsearch&utm_campaign=3DKC_CNC_Virt=
ual
  * cri-o/cri-o-runc/k8s/tekton-operator installed on debian-10 system (no
    flannel or calico container networking, just cri-o bridge networking)
  * The tekton operator makes it simple to install tekton:
    https://github.com/tektoncd/operator

* User Guide: initial version now available with example to add btrfs test=
 plan

* backend: Login test case backend fixes now in production

* Build emails:
  https://github.com/kernelci/kernelci-core/issues/516
  =E2=80=9Cnext/master build: 225 builds: 14 failed, 211 passed, 1097 erro=
rs, 458 warnings (next-20200924)=E2=80=9D
  -> this may be due to the size of some of these emails, with a huge amou=
nt of
     Clang and kselftest warnings

* See also: Hardware to be added to BayLibre=E2=80=99s lab
  https://twitter.com/BayLibre/status/1328465742690275328


Technical Steering Committee minutes - 2020-11-24
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* KCIDB
  * Worked more on designing KCIDB notification system this week, decided =
a
    custom solution would be complex and is better avoided.
  * Studied SQLAlchemy, which has a nice layered design. It seems to suppo=
rt
    BigQuery (as well as most of everything else), got through a tutorial.

* New test plans
  * Hardly any other lab than lab-collabora is running tests other than
    baseline.  Maybe each lab should take a look at what makes sense for t=
hem
    to run too (we now have 10 LAVA labs + 2 non-LAVA).
  * Ramping up LTP and kselftest

* kselftest
  Working on kselftests build and testing other kernel makefile options to
  selftests. Maybe all and merge can help to fix problems during build rel=
ated
  to missing config and wrong headers directories.


Advisory Board minutes - 2020-11-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Short meeting with not all regular attendees
* Discussing how to better spread the load across the team


Advisory Board minutes - 2020-11-25
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing roles in the project for the year ahead
* Reviewing Travis CI's new billing plans, looking for free alternatives
  https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing
* Agreed to use the Azure and GCE clusters for Tekton experiments
* Planning blog post with roadmap and last year in review


Best wishes,
Guillaume
