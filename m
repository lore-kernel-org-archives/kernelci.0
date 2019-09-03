Subject: Re: kernelci/staging.kernelci.org build: 12 builds: 1 failed, 11 passed, 1 error, 36 warnings (staging-20190902.2)
References: <5d6d4aeb.1c69fb81.397c0.e8c8@mx.google.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <b66aaa4d-d86e-976e-c172-3e41f3397fd9@collabora.com>
Date: Tue, 3 Sep 2019 08:22:59 +0100
MIME-Version: 1.0
In-Reply-To: <5d6d4aeb.1c69fb81.397c0.e8c8@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: mgalka@collabora.com, alexandra.pereira@collabora.com, dan.rue@linaro.org, matthew.hart@linaro.org, broonie@kernel.org, kernelci@baylibre.com, anders.roxell@linaro.org
Cc: kernelci@groups.io

On 02/09/2019 18:01, kernelci.org bot wrote:
> -----------------------------------------------------------------------=
---------
> defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, clang-8) =E2=80=94 FAIL, 1 =
error, 0 warnings, 0 section mismatches
>=20
> Errors:
>     /bin/sh: 1: gcc: not found
>=20
> -----------------------------------------------------------------------=
---------
> defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

That's more as expected.  Mark's patch was missing from the
staging kernel branch in some builds last week, so some build
errors were not reported as a result.


Now we need the merge_config.sh fixup applied upstream before
merging PR #157 otherwise it fails during the config options
checks due to the grep exit code issue:

  https://lore.kernel.org/lkml/a60fe77a1475ba960ad9fc851f1ace2196b661b8.1=
567436778.git.guillaume.tucker@collabora.com/


After that, the plan is to revisit the problem to finally solve
clang builds with config fragments.  There are several options:

* wrap merge_config.sh in a Makefile somehow, or

* change merge_config.sh to propagate some options to the make command
  (make CC=3D$CC ...), but this fragile, or

* stop using merge_config.sh altogether, leaving it partly broken
  upstream but with a good solution for our particular issue with
  a Python function in kci_build using scripts/config

Guillaume
