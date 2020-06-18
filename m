From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-06-18 #minutes
Message-ID: <bc5e4d7d-45be-ddf4-fec3-bbe7be492a4c@collabora.com>
Date: Thu, 18 Jun 2020 16:33:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-06-16
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* KCIDB: Removing repo URL from revision IDs

* Sharing meeting time/URL on mailing list - done
  https://groups.io/g/kernelci/topic/audience_guest_can_join/74894108
  (every Tuesday 4pm UTC on https://meet.kernel.social/kernelci-dev)

* DT validation
  * Looks like there=E2=80=99s some issue with dependencies for the DT val=
idation tool
    not being properly installed in the container
    -> follow-up: https://github.com/kernelci/kernelci-core/pull/404

* New LAVA lab, CIP (Civil Infrastructure Platform Project)
  * https://github.com/kernelci/kernelci-core/pull/403
  * Chris will add more device-types over time
  * Should get enabled in production next week

* 2020-Q3 plan
  * project board: https://github.com/orgs/kernelci/projects/2
  * plan document shared on mailing list
    https://groups.io/g/kernelci/topic/kernelci_plans_for_2020_q3/74911398


Technical Steering Committee minutes - 2020-06-09
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* 2020-Q3 plan review:
  * to start next week
  * looking into the details of aligning data schemas
  * initial thoughts on KernelCI/KCIDB integration

* DT validation: https://github.com/kernelci/kernelci-core/issues/396

* Survey:
  * have you all filled it yet? https://forms.gle/Y5iuyLXgQr2y3SrF6
  * Share on workflows mailing list? Mention it on IRC channels?
    -> done

* Log lines filtering:
  New code for filtering (and how it can possibly affect log line links)

* KCIDB
  * Working around Google Cloud Python Function issue
  * Marking debug builds in KCIDB data?
    -> Too many different options that can be twiddled


Advisory Board minutes - 2020-06-10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing survey goals
* Now meeting every other week
* Discussing plans for Linux Plumbers Conference


Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix SoC name for some freescale boards, rename to "imx"
* Adjust configuration for Renesas boards being renamed upstream
* Add i386_defconfig to the default list of arch defconfigs
* Add the EFI "urgent" branch with minimal set of builds
* Add D2500CC x86_64 board in lab-clabbe
* Use "max" CPU for arm64 QEMU targets to enable all features
* Re-enable bisection email reports to be sent automatically
* Fix sorting by date on web dashboard with Firefox

Best wishes,
Guillaume
