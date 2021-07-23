MIME-Version: 1.0
References: <60f9c3b4.1c69fb81.7d558.2406@mx.google.com>
In-Reply-To: <60f9c3b4.1c69fb81.7d558.2406@mx.google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jul 2021 16:22:02 +0200
Message-ID: <CAMj1kXFtZjTKOifJUMSiVkJ2hi7u5YZVnCWZ76TdaLYbAb2Mjg@mail.gmail.com>
Subject: Re: efi/urgent build: 3 builds: 0 failed, 3 passed (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: multipart/alternative; boundary="000000000000392fd605c7cb2146"
List-ID: <kernelci.groups.io>
To: info@kernelci.org

--000000000000392fd605c7cb2146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

Please see the report below: this used to list 4 configs that are tested
with my EFI branches, but for some reason, arm64 is no longer included.

Could this be reverted please?

Thanks,
Ard.




On Thu, 22 Jul 2021 at 21:15, kernelci.org bot <bot@kernelci.org> wrote:

> *efi/urgent build: 3 builds: 0 failed, 3 passed
> (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)*
> Full Build Summary:
> https://kernelci.org/build/efi/branch/urgent/kernel/efi-urgent-for-v5.14-=
rc2-2-g5bb60b28ce5be/
> Tree: efi
> Branch: urgent
> Git Describe: efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be
> Git Commit: 5bb60b28ce5bee48838c3fdc667c7247e722b34d
> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
> <https://git.kernel.org/cgit/linux/kernel/git/efi/efi.git/commit/?id=3D5b=
b60b28ce5bee48838c3fdc667c7247e722b34d>
> Built: 3 unique architectures
>
> *Detailed per-defconfig build reports:*
>
> *i386_defconfig* (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction
> mismatches
>
> *multi_v7_defconfig* (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section
> mismatches
>
> *x86_64_defconfig* (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0
> section mismatches
>
> =E2=94=80
> For more info write to <info@kernelci.org>
>

--000000000000392fd605c7cb2146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div><br></div><div>Please see the re=
port below: this used to list 4 configs that are tested with my EFI branche=
s, but for some reason, arm64 is no longer included.</div><div><br></div><d=
iv>Could this be reverted please?</div><div><br></div><div>Thanks,</div><di=
v>Ard.</div><div><br></div><div><br></div><div><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Jul 2021 at 2=
1:15, <a href=3D"http://kernelci.org">kernelci.org</a> bot &lt;<a href=3D"m=
ailto:bot@kernelci.org">bot@kernelci.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><u></u>

   =20
       =20
       =20
   =20
    <div>
        <span><strong>efi/urgent build: 3 builds: 0 failed, 3 passed (efi-u=
rgent-for-v5.14-rc2-2-g5bb60b28ce5be)</strong></span>
        <br>
        <table style=3D"border:none;padding-top:15px;padding-bottom:15px">
            <tbody>
                <tr><td>Full Build Summary: <a href=3D"https://kernelci.org=
/build/efi/branch/urgent/kernel/efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be/"=
 target=3D"_blank">https://kernelci.org/build/efi/branch/urgent/kernel/efi-=
urgent-for-v5.14-rc2-2-g5bb60b28ce5be/</a></td></tr>
                <tr><td style=3D"padding-top:25px"></td></tr>
                <tr><td>Tree: efi</td></tr>
                <tr><td>Branch: urgent</td></tr>
                <tr><td>Git Describe: efi-urgent-for-v5.14-rc2-2-g5bb60b28c=
e5be</td></tr>
                <tr><td>Git Commit: 5bb60b28ce5bee48838c3fdc667c7247e722b34=
d</td></tr>
                <tr><td>Git URL: <a href=3D"https://git.kernel.org/cgit/lin=
ux/kernel/git/efi/efi.git/commit/?id=3D5bb60b28ce5bee48838c3fdc667c7247e722=
b34d" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/efi=
/efi.git</a></td></tr>
                <tr><td>Built: 3 unique architectures</td></tr>
            </tbody>
        </table>
        <p style=3D"padding-bottom:5px"><strong>Detailed per-defconfig buil=
d reports:</strong></p>
        <p>
    <strong>i386_defconfig</strong> (i386, gcc-8) =E2=80=94 PASS, 0 errors,=
 0 warnings, 0 section mismatches
        </p>
        <p>
    <strong>multi_v7_defconfig</strong> (arm, gcc-8) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches
        </p>
        <p>
    <strong>x86_64_defconfig</strong> (x86_64, gcc-8) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches
        </p>
       =20
            <p style=3D"padding-top:10px">
                =E2=94=80
                <br>
                For more info write to
                &lt;<a href=3D"mailto:info@kernelci.org" target=3D"_blank">=
info@kernelci.org</a>&gt;
            </p>
       =20
    </div>
</blockquote></div></div>

--000000000000392fd605c7cb2146--
