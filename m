From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-11-06 #minutes
Message-ID: <5236058a-9041-b34e-4be8-f0db6592feec@collabora.com>
Date: Fri, 6 Nov 2020 10:36:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* LTP IPC tests run on a range of x86, arm64 and arm platforms
* New device imx6qp-wandboard-revd1 in lab-pengutronix
* Disable kselftest in lab-collabora due to long job timeout (2h)
* Recreate indexes without "background" option for Mongo DB 4.2


Technical Steering Committee minutes - 2020-11-03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

* Timeslot is tied to UTC.  Is this slot still working for everyone?
  -> will move back to 5pm UK time so it follows DST

* KCIDB

  KCIDB revision objects are not really revisions, they're occurences of
  revisions (multiple objects can represent the same commit in multiple re=
pos,
  or the same patchset in multiple maillists). However, they are identifie=
d
  with revision IDs.

  This makes it impossible to aggregate gradually-, or repeatedly-reported
  "revision occurrences" without losing the information on multiple source=
s.

  See an example of such a revision:
  https://staging.kernelci.org:3000/d/revision/revision?orgId=3D1&var-data=
set=3Dkernelci04&var-id=3D3650b228f83adda7e5ee532e2b90429c03f7b9ec

  So, we need to rename "revisions" to something else, and change their ID=
s
  again. The proposed changes are included into a draft PR and rename
  "revisions" to "sources", change their IDs to be fully up to origins (ag=
ain),
  and add the "revision_id" field to them with the syntax of the previous =
"id"
  We could have a problem with this approach if e.g. the origin tests the =
same
  source commit multiple times and reports it with different IDs Needs mor=
e
  thinking and discussion

  -> to be discussed in further detail over mainling list

* GPL compliance

  Should we add a custom footer on the nginx index to provide information =
about
  where to get the kernel source and the license text on storage.kernelci.=
org?
  https://groups.io/g/kernelci/topic/license_compliance_with/77943380
  -> yes

* kernelci.org disk space

  Running out of disk space on the root partition on the kernelci.org serv=
er=E2=80=A6
  This can be resolved by moving the Mongo DB data to the data partition. =
 It
  would seem necessary at some point to archive old data in Mongo DB, to m=
ove
  some documents to separate collections or dumped to a tarball.  It would
  avoid the issue of running out of space and keep the data size under con=
trol.
  -> agreed

* kernelci.org results into KCIDB

  We should be able to retrieve the old data if and when needed, also it s=
hould
  get pushed to KCIDB.

  -> sounds like a plan Submitting data to KCIDB with streaming JSON: Kevi=
n to
     start looking into this in the coming weeks


Technical Steering Committee minutes - 2020-10-27
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Very short meeting in the middle of OSS/ELC Europe 2020.

* login test cases:
  * Fixed issue with auto-login-action rename in LAVA
  * Workaround for kernel errors detected as =E2=80=9Clogin=E2=80=9D: take=
 overall job status
    into account


Advisory Board minutes - 2020-10-28
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing Windows quality tools with Microsoft to compare with Linux ke=
rnel
* Start preparing 2021: budget, memberships and general project updates


Advisory Board minutes - 2020-11-04
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Discussing OSS/ELC Europe, blog post getting published
* Follow-up from the previous Microsoft discussion about kernel metrics


Best wishes,
Guillaume
