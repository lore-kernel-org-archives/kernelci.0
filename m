From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-02-28 #minutes
Message-ID: <d74e64ae-e26f-36c4-0d83-d6a8f2cd42a5@collabora.com>
Date: Fri, 28 Feb 2020 20:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-02-25
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Builds storage seems like something we can outsource, use a third party
  artifact store?
  * Artifactorial, Artifactory, s3 etc?
  * https://jfrog.com/artifactory/
  * Something that deals with removing old builds automatically, quotas e=
tc
  * When we looked at it in the past cost was an issue (bandwidth more th=
an
    hosting when we looked at it), might be easier now with companies act=
ively
    engaged and perhaps able to offer as a sponsorship.
  * Are there existing libcloud abstractions?
  * Makes sense to people, at least as an alternative that could be used =
in
    development/other deployments even if we stick with the current
    implementation for the production service for now.

* kcidb
  * kcidb test catalog progress
  * kcidb reporting update
    * proposal: Google pub/sub used directly by kcidb-submit
    * using BigQuery + PubSub is still part of a PoC effort
  * Renaming KCIDB
    * "KCIRP"?
  * kernelci-backend: add valid/waived fields needed (required?) by kcidb=
:
    https://github.com/kernelci/kernelci-backend/pull/219

* Test case logs: status?  Khouloud vs Michal
  * The features are complementary: Khouloud=E2=80=99s PR for line number=
s in HTML,
    then Michal=E2=80=99s PR for log fragments, then Khouloud=E2=80=99s o=
riginal PR can be
    rebased to store line numbers in Mongo DB

* clang
  * Clang builds ready to go?
  * https://github.com/kernelci/kernelci-core/pull/325
  * emails being sent for production or just staging?
    * clang-8 reports in production atm, clang-9 will be once deployed
  Edit: clang-9 builds have now been deployed in production for linux-nex=
t
  https://kernelci.org/build/next/branch/master/kernel/next-20200228/

* Further thoughts on KernelCI metrics?
  https://groups.io/g/kernelci/topic/kernelci_org_metrics_call_for/712114=
64
  * Number of Reported-by tags
  * Retrospective report, comparison with previous kernel releases
    * Coverage: branches, tests, platforms
    * Show information from various angles: per tree, per platform type..=
.
  * Send "targeted" reports to patch authors for new build warnings to
    facilitate use of Reported-by (esp with clang builds)
    * Build bisection? And/or patches from mailing lists
  * Plan for "unlimited" build capacity to propose ideas


Advisory Board minutes - 2020-02-26
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Top priority is to improve reporting and remove limitations to expand t=
est
  coverage

* Second top priority is to get the buy-in from maintainers and kernel
  community

* GitHub project board roadmap to be used as the basis for defining work =
items
    https://github.com/orgs/kernelci/projects/1?fullscreen=3Dtrue

* KernelCI has signed up for the Linux Kernel Mentorship Project, the top=
ic
  being kselftest
    https://www.linuxfoundation.org/blog/2019/03/announcing-the-linux-ker=
nel-mentorship-project-on-communitybridge-a-new-linux-foundation-platform=
/


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* NXP has joined kernelci.org with a new LAVA lab

* build linux-next master with clang-9 rather than clang-8

* fix URLs for dtbs in kernel build data

* baseline and sleep email reports now sent for the chrome-platform tree

* new devices in BayLibre's lab: meson-sm1-khadas-vim3l and bcm2711-rpi-4=
-b


Best wishes,
Guillaume
