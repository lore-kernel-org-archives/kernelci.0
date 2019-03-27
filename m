Subject: Email reports from staging and automated staging tests
References: <5c9a7406.1c69fb81.4db25.ff2d@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <9ac7fc41-379d-24d0-b316-61fbb0f381ef@collabora.com>
Date: Wed, 27 Mar 2019 09:11:13 +0100
MIME-Version: 1.0
In-Reply-To: <5c9a7406.1c69fb81.4db25.ff2d@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hello,

I've revived the main jobs on staging.kernelci.org to build and
test the kernelci-core/staging.kernelci.org branch with the
intent to automatically update it every day with all the open
PRs.  It has a series of extra patches to make it appropriate on
staging, with a separate tree and bisection reports disabled to
avoid spamming people.  The history can be found here:

  https://github.com/kernelci/kernelci-core/commits/staging.kernelci.org

I've initially put only mgalka and myself on the list of
recipients for these jobs, but I think it would make sense to
have all the contributors whose code gets tested on staging.  So
please let me know if you wish to be added or not added to the
list.

I've started a tool to gather all the PRs for a particular Github
project into a "staging" branch with an extra series of patches
to apply on top of it:

  https://gitlab.collabora.com/gtucker/kernelci-staging-tools

I'll add a README and if this looks fine then it should be moved
to Github.  Also we should probably have a Linux kernel tree for
KernelCI to have a branch to test on staging, as at the moment
it's using my own tree.

The next bit that needs to be automated is to push the staging
branches to the Github repos.  For this I think we'll need to
create a Github user with some dedicated SSH keys.  The script
can be used for any project (kernelci-core, kernelci-backend,
kernelci-frontend...).  We would also need an extra user to
deploy the backend and frontend branches over SSH on the staging
server.  After that, it could add a change to a test kernel
branch and trigger a kernel-tree-monitor job to get the whole
thing running.  That could be run as a daily Jenkins job.

Guillaume


-------- Forwarded Message --------
Subject: staging/kernelci-stable build: 7 builds: 0 failed, 7 passed, 126=
 warnings (v4.20.17-1-g836086c352db)
Date: Tue, 26 Mar 2019 11:48:38 -0700 (PDT)
From: kernelci.org bot <bot@kernelci.org>
To: gtucker@collabora.com, mgalka@collabora.com

staging/kernelci-stable build: 7 builds: 0 failed, 7 passed, 126 warnings=
 (v4.20.17-1-g836086c352db)

Full Build Summary: https://staging.kernelci.org/build/staging/branch/ker=
nelci-stable/kernel/v4.20.17-1-g836086c352db/

Tree: staging
Branch: kernelci-stable
Git Describe: v4.20.17-1-g836086c352db
Git Commit: 836086c352db12e584eda192158bee1c92f0d121
Git URL: https://gitlab.collabora.com/gtucker/linux.git
Built: 6 unique architectures

Warnings Detected:

arc:    arc-linux-gcc (ARCv2 ISA Linux uClibc toolchain 2017.09) 7.1.1 20=
170710

    nsim_hs_defconfig: 3 warnings

arm64:    aarch64-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0

    defconfig: 122 warnings

arm:    arm-linux-gnueabihf-gcc (Debian 7.4.0-1) 7.4.0

    multi_v7_defconfig: 1 warning


Warnings summary:

    3    drivers/soc/rockchip/pm_domains.c:814:20: warning: shift count i=
s negative [-Wshift-count-negative]
    3    drivers/soc/rockchip/pm_domains.c:802:21: warning: shift count i=
s negative [-Wshift-count-negative]
    3    drivers/soc/rockchip/pm_domains.c:801:22: warning: shift count i=
s negative [-Wshift-count-negative]
    3    drivers/soc/rockchip/pm_domains.c:800:22: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:816:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:815:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:804:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:803:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:778:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:777:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:776:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:775:22: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:774:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:773:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:772:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:771:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:770:21: warning: shift count i=
s negative [-Wshift-count-negative]
    2    drivers/soc/rockchip/pm_domains.c:742:21: warning: shift count i=
s negative [-Wshift-count-negative]
    1    scripts/mod/file2alias.c:989:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:989:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:978:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:978:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:967:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:967:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:956:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:956:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:933:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:933:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:917:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:917:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:898:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:898:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:881:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:881:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:864:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:864:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:844:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:844:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:832:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:832:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:759:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:759:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:739:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:739:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:615:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:615:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:577:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:577:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:557:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:557:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:546:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:546:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:535:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:535:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:511:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:511:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:467:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:467:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:442:1: warning: adding 'unsigned long' =
to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:442:1: note: use array indexing to sile=
nce this warning
    1    scripts/mod/file2alias.c:1377:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1377:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1364:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1364:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1339:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1339:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1327:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1327:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1312:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1312:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1295:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1295:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1282:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1282:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1262:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1262:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1243:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1243:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1233:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1233:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1208:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1208:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1192:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1192:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1121:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1121:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1105:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1105:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1089:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1089:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1078:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1078:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1053:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1053:1: note: use array indexing to sil=
ence this warning
    1    scripts/mod/file2alias.c:1044:1: warning: adding 'unsigned long'=
 to a string does not append to the string [-Wstring-plus-int]
    1    scripts/mod/file2alias.c:1044:1: note: use array indexing to sil=
ence this warning
    1    net/ipv4/tcp_input.c:4315:49: warning: array subscript is above =
array bounds [-Warray-bounds]
    1    drivers/pinctrl/bcm/pinctrl-bcm2835.c:707:40: warning: implicit =
conversion from enumeration type 'enum bcm2835_pinconf_param' to differen=
t enumeration type 'enum pin_config_param' [-Wenum-conversion]
    1    arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dtb: Warning (gr=
aph_endpoint): /soc/mdp@5100000/ports/port@3/endpoint: graph connection t=
o node '/soc/hdmi-tx@4a00000/ports/port@0/endpoint' is not bidirectional
    1    arch/arc/mm/tlb.c:914:2: warning: ISO C90 forbids variable lengt=
h array 'pd0' [-Wvla]
    1    arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is=
 not used [-Wunused-value]
    1    40 warnings generated.
    1    39 warnings generated.
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

-------------------------------------------------------------------------=
-------
32r2el_defconfig (mips, gcc-7) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

-------------------------------------------------------------------------=
-------
defconfig (riscv, gcc-7) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

-------------------------------------------------------------------------=
-------
defconfig (arm64, gcc-7) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

-------------------------------------------------------------------------=
-------
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 122 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/file2alias.c:442:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:442:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:467:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:467:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:511:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:511:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:535:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:535:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:546:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:546:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:557:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:557:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:577:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:577:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:615:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:615:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:739:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:739:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:759:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:759:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:832:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:832:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:844:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:844:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:864:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:864:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:881:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:881:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:898:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:898:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:917:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:917:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:933:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:933:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:956:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:956:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:967:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:967:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:978:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:978:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:989:1: warning: adding 'unsigned long' to a =
string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:989:1: note: use array indexing to silence t=
his warning
    scripts/mod/file2alias.c:1044:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1044:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1053:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1053:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1078:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1078:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1089:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1089:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1105:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1105:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1121:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1121:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1192:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1192:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1208:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1208:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1233:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1233:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1243:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1243:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1262:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1262:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1282:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1282:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1295:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1295:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1312:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1312:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1327:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1327:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1339:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1339:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1364:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1364:1: note: use array indexing to silence =
this warning
    scripts/mod/file2alias.c:1377:1: warning: adding 'unsigned long' to a=
 string does not append to the string [-Wstring-plus-int]
    scripts/mod/file2alias.c:1377:1: note: use array indexing to silence =
this warning
    39 warnings generated.
    drivers/pinctrl/bcm/pinctrl-bcm2835.c:707:40: warning: implicit conve=
rsion from enumeration type 'enum bcm2835_pinconf_param' to different enu=
meration type 'enum pin_config_param' [-Wenum-conversion]
    1 warning generated.
    drivers/soc/rockchip/pm_domains.c:742:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:742:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:770:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:770:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:771:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:771:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:772:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:772:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:773:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:773:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:774:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:774:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:775:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:775:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:776:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:776:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:777:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:777:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:778:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:778:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:800:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:800:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:800:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:801:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:801:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:801:22: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:802:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:802:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:802:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:803:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:803:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:804:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:804:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:814:20: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:814:20: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:814:20: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:815:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    drivers/soc/rockchip/pm_domains.c:816:21: warning: shift count is neg=
ative [-Wshift-count-negative]
    40 warnings generated.

-------------------------------------------------------------------------=
-------
multi_v7_defconfig (arm, gcc-7) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dtb: Warning (graph_e=
ndpoint): /soc/mdp@5100000/ports/port@3/endpoint: graph connection to nod=
e '/soc/hdmi-tx@4a00000/ports/port@0/endpoint' is not bidirectional

-------------------------------------------------------------------------=
-------
nsim_hs_defconfig (arc, gcc-7) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arc/mm/tlb.c:914:2: warning: ISO C90 forbids variable length arr=
ay 'pd0' [-Wvla]
    arch/arc/include/asm/cmpxchg.h:95:29: warning: value computed is not =
used [-Wunused-value]
    net/ipv4/tcp_input.c:4315:49: warning: array subscript is above array=
 bounds [-Warray-bounds]

-------------------------------------------------------------------------=
-------
x86_64_defconfig (x86_64, gcc-7) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---
For more info write to <info@kernelci.org>
