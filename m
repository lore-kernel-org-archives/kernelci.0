From: "Gustavo Padovan" <gustavo.padovan@collabora.com>
Subject: Weekly Meeting 2021-08-03
Message-ID: <5fdef8ee-e32e-b60f-69fa-417c87a6c14a@collabora.com>
Date: Wed, 4 Aug 2021 07:23:19 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>

Attendees: Guillaume, Nikolai, Michal, Gustavo, Nick, Kevin, Isaiah,=20
Mark, Alicef, Alex

Agenda:


gtucker

- Hackfest #2 - Sept 6-10
https://groups.io/g/kernelci/topic/kernelci_hackfest_2_sept/84607239
- Moving all remaining content on the old wiki to kernelci.org/docs
https://github.com/kernelci/kernelci-doc/wiki
	- it would be good if more people could look at it and review

Nikolai

- Feeling better, but still recovering. Spending all available hours on=20
CKI, unfortunately.
- Starting a two-week vacation next week.

broonie

- LAVA update: Linaro are very busy ATM, they are doing patch review and=
=20
are aware that it=E2=80=99s very slow. Probably going to continue for a wh=
ile.
- Guillaume mentioned Issue to be able to create a MR. Some people, even=
=20
with a gitlab account can't create a MR. Mark will poke some people from=
=20
LAVA
- Generating kubernetes jobs: it could be interesting to generalize this=
=20
out of the jenkins jobs.
	-Guillaume suggested it could be treated as just another runtime.
	- Kevin mentioned the possibility of using tuxmake instead

Nick

- Making changes to LLVM=3D1 builds
	- CROSS_COMPILE inference=20
https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.=
com/=20

	- LLVM_IAS=3D1 on by default=20
https://lore.kernel.org/lkml/20210802234304.3519577-1-ndesaulniers@google.=
com/=20

	- To build architectures that don=E2=80=99t support it yet (PowerPC, s390=
),=20
use LLVM_IAS=3D0=09
- RISCV, Hexagon support
	- Need to update Documentation/
	- riscv https://linux.kernelci.org/build/id/6108b9fa598cb4ccf6b13669/
- Clang-13 branch cut
- Having better tools to compare with other builds would be great (gcc=20
vs Clang)
	- This is an extension to the idea of enabling =E2=80=9C2nd derivative=E2=
=
=80=9D=20
regressions, to look at the diff between regressions with one build=20
compared to another build.=C2=A0 The first step would probably be to=20
comparewith other revisions (e.g. maintainer branch on top of mainline=E2=
=80=A6).


CIP instance

- cip.kernelci.org to redirect to https://linux.kernelci.org/job/cip/
- No need right now for a full CIP dedicated instance
- DNS update: CNAME kernelci.org, then nginx config to redirect to the=20
URL with the CIP tree

--=20
Gustavo Padovan
Collabora Ltd.
