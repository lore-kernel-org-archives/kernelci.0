From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-02-14 #minutes
Message-ID: <65ac0e3f-494b-ade3-4a82-2f6a69393d2c@collabora.com>
Date: Sat, 15 Feb 2020 08:38:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: kernelci-members@groups.io

Technical Steering Committee minutes - 2020-02-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* New Jenkins instance bot.staging.kernelci.org now being used
  * Missing bisections
  * Specific files are not yet stored in encrypted repo

* Frontend view to show test runs for each test plan now 90% complete:

    https://staging.kernelci.org/test/job/kernelci/branch/staging.kernelc=
i.org/kernel/staging-20200213.0/plan/baseline/

  * Regressions caused on purpose on staging
  * Next step is to show details for all the test cases in a test run ("M=
ore
    info" links inside panels)

* KCIDB
  * test catalog draft: https://github.com/kernelci/kcidb/pull/24
  * another Grafana dashboard prototype under development

* KUnit
  Special guests: Brendan, Heidi, David (Google) to discuss KUnit in Kern=
elCI

  * Heidi began integration into kci_build with extra flags
  * Only building UML with allyesconfig atm
  * Full KUnit tests run takes 8-9 min on development machine
  * kunit runs generate a test_group.json for results
    * how do we upload this?
      suggested to use the /test API
    * kci_test should grow a way to upload via /test directly
  * Planning for KUnit to run only CPU arch-independent tests
    * Covering 32-bit and 64-bit is worth it though

  *  Actions
    * staging needs a new =E2=80=9Clab=E2=80=9D for Kunit tests with a to=
ken to push test
      results
    * Heidi to send PR (or branch) to show what is currently working


Advisory Board minutes - 2020-02-12
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* On-going discussions about admin topics and planning, nothing to public=
ly
  share yet


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There was no production update this week as the kernelci.org production s=
ervers
are being relocated.

Best wishes,
Guillaume
