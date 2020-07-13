From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-07-13 #minutes
Message-ID: <abb643f7-6a14-937c-515e-e6b32fef5378@collabora.com>
Date: Mon, 13 Jul 2020 13:49:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-06-30
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Google BigQuery hosting: current trial period expired
  -> Kevin to migrate BQ to kernelci.org gSuite

* KernelCI installation
  * Discuss inconsistencies in kernelci-backend-config INSTALL.md file
    https://github.com/kernelci/kernelci-backend-config/blob/master/INSTAL=
L.md
    -> next steps: submit PR with obvious cleanups, 2nd PR as draft/RFC wi=
th
       questions on the confusing parts

* LPC 2020:
  Nikolai started a shared presentation on reporting for LPC. Plan is to d=
o a
  joint presentation with Guillaume

* Clang: Enable functional testing in production
  https://github.com/kernelci/kernelci-core/pull/416


Technical Steering Committee minutes - 2020-07-07
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* tuxbuild recap
  * does what it says
  * fixed-size VMs with 4 cores are a limitation for allmodconfig builds
  * not seeing a clear advantage over k8s

* brooning bringing his =E2=80=9Clab=E2=80=9D back with virtual boards (QE=
MU, ARM fastmodels)
  * Latest QEMU
    -> worth using Docker-provided QEMU in LAVA or using cloud VMs qemu 5.=
0
       from Debian unstable currently
    -> consider building QEMU and providing it by KernelCI? (i.e. via Dock=
er
       images or packages)
    -> consider running tests with qemu/models in k8s if we start scheduli=
ng
       more tests on emulated targets
  * broonie might be willing to help set up a KernelCI "community" LAVA la=
b

* what is JenkinsX?
  - CI/CD for cloud stuff, might solve some problems deploying on cloud - =
makes
    it easier to deploy Tekton stuff. Investigating.
  - see also TCF: https://intel.github.io/tcf/

* kci_data
  * First attempt and basic implementation done
  * Utilizes kernelci-backend /test API as a PoC
  * PR: https://github.com/kernelci/kernelci-core/pull/409
  * mockup https://gist.github.com/gctucker/46e704ddbffa2ee806ec8793ff1444=
49/

* LPC Testing Micro-Conference announced
  https://www.linuxplumbersconf.org/blog/2020/testing-and-fuzzing-microcon=
ference-accepted-into-2020-linux-plumbers-conference/

* Kubernetes support: rebased on jenkins job files move, nearly ready for =
prod

* ELC-NA: Kevin gave a talk on KernelCI, begged for help in many areas, go=
t a
  bit of interest on mailing list already.


Advisory Board minutes - 2020-07-08
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Reviewing survey draft report
* Discussing how to help 0-Day and Syzbot send results to KernelCI


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Replace basic status with test counts on default Tests view
* New broonie-misc branch
* Add linux-5.7.y branch to stable and stable-rc
* More i.MX boards in lab-nxp
* Basic "validate" commands in kci_build and kci_test for YAML config
* New Dockerfile for running Kubernetes jobs
* Update baseline tests to use buildroot 2020.05


Best wishes,
Guillaume
