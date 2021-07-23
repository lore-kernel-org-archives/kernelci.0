Subject: Re: efi/urgent build: 3 builds: 0 failed, 3 passed (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)
References: <60f9c3b4.1c69fb81.7d558.2406@mx.google.com>
 <CAMj1kXFtZjTKOifJUMSiVkJ2hi7u5YZVnCWZ76TdaLYbAb2Mjg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <d893a710-aa21-382e-c4a7-d81f611a7d31@collabora.com>
Date: Fri, 23 Jul 2021 19:07:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFtZjTKOifJUMSiVkJ2hi7u5YZVnCWZ76TdaLYbAb2Mjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, ardb@kernel.org, info@kernelci.org

On 23/07/2021 15:22, Ard Biesheuvel wrote:
> Hello all,
>
> Please see the report below: this used to list 4 configs that are tested=
 with my EFI branches, but for some reason, arm64 is no longer included.

Thanks for reporting this.=C2=A0 It looks like a bug in the email report g=
enerator, the arm64 defconfig was built according to the web dashboard:
https://linux.kernelci.org/build/efi/branch/urgent/kernel/efi-urgent-for-v=
5.14-rc2-2-g5bb60b28ce5be/

We'll take a look, and at least you should be able to see the results ther=
e in the meantime.

Best wishes,
Guillaume

>
> Could this be reverted please?
>
> Thanks,
> Ard.
>
>
>
>
> On Thu, 22 Jul 2021 at 21:15, kernelci.org <http://kernelci.org> bot <bo=
t@kernelci.org <mailto:bot@kernelci.org>> wrote:
>
>     *efi/urgent build: 3 builds: 0 failed, 3 passed (efi-urgent-for-v5.1=
4-rc2-2-g5bb60b28ce5be)*
>     Full Build Summary: https://kernelci.org/build/efi/branch/urgent/ker=
nel/efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be/
>
>     Tree: efi
>     Branch: urgent
>     Git Describe: efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be
>     Git Commit: 5bb60b28ce5bee48838c3fdc667c7247e722b34d
>     Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git=
 <https://git.kernel.org/cgit/linux/kernel/git/efi/efi.git/commit/?id=3D5bb=
60b28ce5bee48838c3fdc667c7247e722b34d>
>     Built: 3 unique architectures
>
>     *Detailed per-defconfig build reports:*
>
>     *i386_defconfig* (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches
>
>     *multi_v7_defconfig* (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches
>
>     *x86_64_defconfig* (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches
>
>     =E2=94=80
>     For more info write to <info@kernelci.org <mailto:info@kernelci.org>=
>
>
>=20


