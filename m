From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-07-29 #minutes
Message-ID: <79c70330-da50-86b1-5457-e4fdd161a558@collabora.com>
Date: Wed, 29 Jul 2020 23:54:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-07-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* now moved from buildroot to debian (initramfs + pivot_root)

* kselftest:
  * use debian nfsroot, Linaro test-definitions
  * Draft PR: https://github.com/kernelci/kernelci-core/pull/445

* RISCV: debian (sid): rootfs ready
  https://github.com/kernelci/kernelci-core/pull/414

* Uploaded =E2=80=9Ckernelci=E2=80=9D package to PyPI
  https://pypi.org/project/kernelci/

* KCIDB
  * Sent an outline of KCIDB support to Dmitry Vyukov of syzbot/syzkaller.
  * Support for =E2=80=9Cissues=E2=80=9D and =E2=80=9Cincidents=E2=80=9D, =
and suppressing identical reports
  * Writing the same for Philip Li of 0-day.
  * Support for source code and build =E2=80=9Clinting=E2=80=9D
  * Tailored reports
  * Writing an introduction to KCIDB schema and submission next.
  * Thinking of releasing and deploying KCIDB v6 with v3 I/O schema
  * Bringing revision correlation
  * Handling duplicate objects
  * Submission reliability/feedback
  * Topic for discussion: aggregating results
  * BQ public data sets: https://cloud.google.com/bigquery/public-data/

* Kubernetes
  * Had a couple of issues with ansible and k8s
    https://github.com/kernelci/builder-config2/pull/24
    https://github.com/kernelci/builder-config2/issues/25

* New guest: Aditya
  * Discussion with Kevin regarding the logging part and wait.py
  * Discussion with Guillaume regarding k8s/job-build.jinja2 file


Technical Steering Committee minutes - 2020-07-28
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* kci_data: how to submit test results without LAVA callback
  * will start submitting raw/incomplete data to staging /test API
  * can be used as beta test /test API backend updates
  * ToDo: first step is to review and clean-up the fields being accepted a=
nd
    required
  * Next step is to drop the requirement for a kernel build to submit test
    results (revision/branch/tree should be enough)

* Documentation: =E2=80=9CHow to add new rootfs testsuite and how to add L=
AVA tests=E2=80=9D
  https://github.com/kernelci/kernelci-core/pull/444
  -> Path of least resistance for adding rootfs images, i.e. nfsroot with
     full-featured Buster base image and test definitions that can install
     extra test dependencies

* Kubernetes in  production
  * new Jenkins nodes in USA and Europe, issue with 90+ build-k8s containe=
rs
    getting started on node running the trigger jobs
  * hitting some bottleneck issues


Advisory Board minutes - 2020-07-22
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* 2020-Q3 plan update: OK except KUnit work hasn't resumed yet
* Discussing how to provide separate instances of KernelCI for members
* Also mentioned, xfstests is a good test plan but with stability issues


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix LKFT job submissions
* Improve error handling and help messages in kci_* CLI tools
* Replace the --token CLI arguments with --db-token and --lab-token
* New riscv64 rootfs based on debian/sid, not used for tests yet
* New production Jenkins instance using kernelci-jenkins with docker-compo=
se
* Kernel builds now running in Kubernetes clusters rather than Jenkins bui=
lders


Best wishes,
Guillaume
