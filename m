From: alexandra.pereira@collabora.com
Subject: Bi-Weekly Meeting 2021-08-(10&17)
Message-ID: <fe87f17d-c4bb-97af-6e70-218c758d124e@collabora.com>
Date: Tue, 17 Aug 2021 15:27:41 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, alexandra.pereira@collabora.com

2021-08-17

Attendees: Micha=C5=82, Mark, Isaiah, Alicef, Alice, Kevin, Alex

Agenda:

- Micha=C5=82 - Working on new local instance setup guide - Initially aimin=
g=20
in covering a minimal setup - Gradually extending the scope


2021-08-10

Attendees: Alex, Mgalka, Broonie, Isaiah, Alicef

Agenda:

- Alex - Enabled more tests due to new Chromebooks - Working on=20
skiplists, some issues with linaro=E2=80=99s definition - Was always showin=
g the=20
output from skipped tests even if only running some specific collection=20
- Micha=C5=82 - Added buildroot support to kci_rootfs - Additional=20
rootfs_type - =E2=80=9Cbuildroot=E2=80=9D - Docker image (kernelci/buildroo=
t) created -=20
Contains all dependencies needed to use buildroot - Uses buildroot=20
attached as a volume - Next step: change current buildroot creation job=20
to use docker and kci_rootfs

