Subject: kernelci/staging.kernelci.org boot: 176 boots: 10 failed, 164 passed with 2 untried/unknown (staging-20200513.1)
References: <5ebcebbb.1c69fb81.a94d7.0004@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <e8236563-8e70-ce32-c8fa-386868c9a37e@collabora.com>
Date: Thu, 14 May 2020 08:01:51 +0100
MIME-Version: 1.0
In-Reply-To: <5ebcebbb.1c69fb81.a94d7.0004@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Similarly to my previous email with the new format for test email
reports, please see below an example boot report with the added
section at the top.=C2=A0 This explains the deprecation of boot
results and adds a link to the detailed matching baseline
results.

Likewise, please let us know if you have any comments about this
updated boot email format.

Boot email reports are generated in both plain text and html,
unlike test email reports that are only available in plain text.

Thanks,
Guillaume


-------- Forwarded Message --------
Subject: =09kernelci/staging.kernelci.org boot: 176 boots: 10 failed, 164 =
passed with 2 untried/unknown (staging-20200513.1)
Date: =09Wed, 13 May 2020 23:56:59 -0700 (PDT)
From: =09staging.kernelci.org bot <bot@kernelci.org>
To: =09gtucker@collabora.com, debug011@gtucker.io



kernelci/staging.kernelci.org boot: 176 boots: 10 failed, 164 passed with =
2 untried/unknown (staging-20200513.1)


    =E2=9A=A0=C2=A0Boot tests are now deprecated=C2=A0=E2=9A=A0

As kernelci.org is expanding its functional testing capabilities, the conc=
ept of boot testing is now deprecated. Boot results are scheduled to be dro=
pped on 5th June 2020. The full schedule for boot tests deprecation is avai=
lable on GitHub issue #238 <https://github.com/kernelci/kernelci-backend/is=
sues/238>.

The new equivalent is the baseline test suite which also runs sanity check=
s using dmesg and bootrr <https://github.com/kernelci/bootrr>.

See the baseline results for this kernel revision on this page:
https://staging.kernelci.org/test/job/kernelci/branch/staging.kernelci.org=
/kernel/staging-20200513.1/plan/baseline/

*kernelci/staging.kernelci.org boot: 176 boots: 10 failed, 164 passed with=
 2 untried/unknown (staging-20200513.1)*

Full Boot Summary: https://staging.kernelci.org/boot/all/job/kernelci/bran=
ch/staging.kernelci.org/kernel/staging-20200513.1/
Full Build Summary: https://staging.kernelci.org/build/kernelci/branch/sta=
ging.kernelci.org/kernel/staging-20200513.1/

Tree: kernelci
Branch: staging.kernelci.org
Git Describe: staging-20200513.1
Git Commit: 23faf34c1d96be0fd94fd15181f2a88472771424
Git URL: https://github.com/kernelci/linux.git
Tested: 71 unique boards, 16 SoC families, 9 builds out of 22

*Boot Regressions Detected:*

arm:
multi_v7_defconfig:
clang-9:
tegra124-nyan-big:
lab-collabora <https://staging.kernelci.org/boot/id/5ebc30bd513ddd5e445afc=
40/>: failing since 5 days <https://staging.kernelci.org/boot/all/job/kerne=
lci/branch/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (la=
st pass: staging-20200507.1 <https://staging.kernelci.org/boot/id/5eb433f26=
c75984ccd509847/> - first fail: staging-20200507.2 <https://staging.kernelc=
i.org/boot/id/5eb4834154224ffca697dddb/>)
gcc-8:
bcm2836-rpi-2-b:
lab-collabora <https://staging.kernelci.org/boot/id/5ebc2e676623429c425afc=
40/>: failing since 113 days <https://staging.kernelci.org/boot/all/job/ker=
nelci/branch/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (=
last pass: staging-20200117.0 <https://staging.kernelci.org/boot/id/5e217f5=
9d26c42ba35686f52/> - first fail: staging-20200121.0 <https://staging.kerne=
lci.org/boot/id/5e26d20fe7e65a913ad9150e/>)
tegra124-nyan-big:
lab-collabora <https://staging.kernelci.org/boot/id/5ebc32ff520a208e955afc=
38/>: failing since 5 days <https://staging.kernelci.org/boot/all/job/kerne=
lci/branch/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (la=
st pass: staging-20200507.1 <https://staging.kernelci.org/boot/id/5eb42654d=
2e3487528e26a40/> - first fail: staging-20200507.2 <https://staging.kernelc=
i.org/boot/id/5eb48332d3e0c19dca97dd93/>)
arm64:
defconfig:
clang-9:
meson-g12a-sei510:
lab-baylibre <https://staging.kernelci.org/boot/id/5ebc2c2090b9cb16975afc3=
8/>: new failure <https://staging.kernelci.org/boot/all/job/kernelci/branch=
/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (last pass: s=
taging-20200512.2 <https://staging.kernelci.org/boot/id/5ebb17d9c07482c16fe=
6f456/>)
meson-gxl-s805x-p241:
lab-baylibre <https://staging.kernelci.org/boot/id/5ebc2d43961555b6eb5afc5=
b/>: failing since 1 day <https://staging.kernelci.org/boot/all/job/kernelc=
i/branch/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (last=
 pass: staging-20200512.0 <https://staging.kernelci.org/boot/id/5eba3125c9e=
fec7feda51410/> - first fail: staging-20200512.2 <https://staging.kernelci.=
org/boot/id/5ebb198d22fe12c249e6f451/>)
meson-gxl-s905d-p230:
lab-baylibre <https://staging.kernelci.org/boot/id/5ebc2d47961555b6eb5afc5=
e/>: new failure <https://staging.kernelci.org/boot/all/job/kernelci/branch=
/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (last pass: s=
taging-20200512.2 <https://staging.kernelci.org/boot/id/5ebb18b6a309159116e=
6f44f/>)
sun50i-h6-orangepi-3:
lab-clabbe <https://staging.kernelci.org/boot/id/5ebc2c5ef1aea45f465afc44/=
>: new failure <https://staging.kernelci.org/boot/all/job/kernelci/branch/s=
taging.kernelci.org/kernel/staging-20200513.1/#regressions> (last pass: sta=
ging-20200512.2 <https://staging.kernelci.org/boot/id/5ebb944c1ef4d4c6dae6f=
44b/>)
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
gcc-8:
sun50i-a64-pine64-plus:
lab-baylibre <https://staging.kernelci.org/boot/id/5ebc28593e2e510c6d5afc5=
6/>: failing since 1 day <https://staging.kernelci.org/boot/all/job/kernelc=
i/branch/staging.kernelci.org/kernel/staging-20200513.1/#regressions> (last=
 pass: staging-20200512.2 <https://staging.kernelci.org/boot/id/5ebb14113b6=
19a2e62e6f450/> - first fail: staging-20200513.0 <https://staging.kernelci.=
org/boot/id/5ebc1cbe87c285caf25afc3d/>)

*Boot Failures Detected:*

arm64:
defconfig:
clang-9:
sun50i-a64-pine64-plus <https://staging.kernelci.org/boot/sun50i-a64-pine6=
4-plus/job/kernelci/branch/staging.kernelci.org/kernel/staging-20200513.1/d=
efconfig/defconfig/>: 1 failed lab
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
gcc-8:
sun50i-a64-pine64-plus <https://staging.kernelci.org/boot/sun50i-a64-pine6=
4-plus/job/kernelci/branch/staging.kernelci.org/kernel/staging-20200513.1/d=
efconfig/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/>: 1 failed lab
arm:
multi_v7_defconfig:
gcc-8:
bcm2836-rpi-2-b <https://staging.kernelci.org/boot/bcm2836-rpi-2-b/job/ker=
nelci/branch/staging.kernelci.org/kernel/staging-20200513.1/defconfig/multi=
_v7_defconfig/>: 1 failed lab
tegra124-jetson-tk1 <https://staging.kernelci.org/boot/tegra124-jetson-tk1=
/job/kernelci/branch/staging.kernelci.org/kernel/staging-20200513.1/defconf=
ig/multi_v7_defconfig/>: 2 failed labs
tegra124-nyan-big <https://staging.kernelci.org/boot/tegra124-nyan-big/job=
/kernelci/branch/staging.kernelci.org/kernel/staging-20200513.1/defconfig/m=
ulti_v7_defconfig/>: 1 failed lab

=E2=94=80
For more info write to <info@kernelci.org <mailto:info@kernelci.org>>

