From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2020-05-11 #minutes
Message-ID: <3a23bb06-e808-2f7e-fdeb-559185a6664f@collabora.com>
Date: Mon, 11 May 2020 17:06:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--- IMPORTANT: BOOT TESTS DEPRECATION NOTICE ---

As the work to convert the web frontend to show functional test results is
nearing completion, there is now a plan to finally deprecate boot tests as=
 per
the details on this GitHub issue:

  https://github.com/kernelci/kernelci-backend/issues/238

There will be an email tomorrow with the detailed schedule.  Please let us=
 know
if this going to cause any disruption in your workflow or if you have any
comments or questions.


Technical Steering Committee minutes - 2020-05-05
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Clang
  * Looking into clang-10 arm64 allyesconfig failures, will bring up the A=
RM
    LLVM team tomorrow.
  * I386 one patch away from building+booting w/ Clang
  * Patches enabling -gz=3Dzlib, -gdwarf-5, in tree Rust
  * clang for android?  I noticed this week that the android trees are onl=
y
    built with gcc -> Yes, please file a bug to track
  * Clang Travis tests: using KernelCI builds or their own?
    * Separate builds for the time being, waiting for LLVM make support to=
 land
      in mainline before enabling that in kernelci and using it (i.e. full
      binutils=E2=80=A6)  `make LLVM=3D1` rather than `make CC=3Dclang` is=
 in mainline.

* k8s
  * builds are scaling well across multiple clusters (2x Azure, 4x GCP)
  * build failure catching needs work (e.g. build fails vs. k8s infra fail=
s)
  * Jenkins: random worker disconnects

* web frontend
  * latest version ready to deploy into production
    https://staging.kernelci.org/
  * Guide users looking for boot results to the baseline results
  * Non-LAVA labs need to switch from boots to baseline results (lab-bjorn=
,
    lab-qcom, lab-baylibre-seattle)

* Jenkins
  * Jenkins DSL jobs in Folders: discussing variables in a DSL YAML templa=
te
  * Login to bot.kernelci.org - sorted, will create users manually for now

* Misc.
  * Branches with slashes -> getting fixed next week
  * Feedback about Jitsi for weekly video call
    * worked well
    * per-user connection stats are super cool (c.f. upper left corner of =
each
      users video)


Advisory Board minutes - 2020-05-06
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing plans for adding a blog to foundation.kernelci.org
* Discussing user survey to learn about KernelCI users


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

No production update this week due to low amount of recent changes and the
freeze of staging to roll out the new website in production.


Best wishes,
Guillaume
