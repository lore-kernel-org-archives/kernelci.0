MIME-Version: 1.0
References: <60f9c3b4.1c69fb81.7d558.2406@mx.google.com> <CAMj1kXFtZjTKOifJUMSiVkJ2hi7u5YZVnCWZ76TdaLYbAb2Mjg@mail.gmail.com>
 <d893a710-aa21-382e-c4a7-d81f611a7d31@collabora.com>
In-Reply-To: <d893a710-aa21-382e-c4a7-d81f611a7d31@collabora.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 26 Jul 2021 15:57:56 +0200
Message-ID: <CAMj1kXGca24NywoX=LMc4jgiyaBiMou+UxNaR16xZt0LN+32Tg@mail.gmail.com>
Subject: Re: efi/urgent build: 3 builds: 0 failed, 3 passed (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)
Content-Type: multipart/alternative; boundary="0000000000008eac4705c8072484"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, info@kernelci.org

--0000000000008eac4705c8072484
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Jul 2021 at 20:07, Guillaume Tucker <
guillaume.tucker@collabora.com> wrote:

> On 23/07/2021 15:22, Ard Biesheuvel wrote:
>
> Hello all,
>
> Please see the report below: this used to list 4 configs that are tested
> with my EFI branches, but for some reason, arm64 is no longer included.
>
> Thanks for reporting this.  It looks like a bug in the email report
> generator, the arm64 defconfig was built according to the web dashboard:
>
> https://linux.kernelci.org/build/efi/branch/urgent/kernel/efi-urgent-for=
-v5.14-rc2-2-g5bb60b28ce5be/
>
> We'll take a look, and at least you should be able to see the results
> there in the meantime.
>

Good to know.

Thanks,
Ard.




>
>
>
> On Thu, 22 Jul 2021 at 21:15, kernelci.org bot <bot@kernelci.org> wrote:
>
>> *efi/urgent build: 3 builds: 0 failed, 3 passed
>> (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)*
>> Full Build Summary:
>> https://kernelci.org/build/efi/branch/urgent/kernel/efi-urgent-for-v5.1=
4-rc2-2-g5bb60b28ce5be/
>>
>> Tree: efi
>> Branch: urgent
>> Git Describe: efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be
>> Git Commit: 5bb60b28ce5bee48838c3fdc667c7247e722b34d
>> Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
>> <https://git.kernel.org/cgit/linux/kernel/git/efi/efi.git/commit/?id=3D=
5bb60b28ce5bee48838c3fdc667c7247e722b34d>
>> Built: 3 unique architectures
>>
>> *Detailed per-defconfig build reports:*
>>
>> *i386_defconfig* (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section
>> mismatches
>>
>> *multi_v7_defconfig* (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0
>> section mismatches
>>
>> *x86_64_defconfig* (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0
>> section mismatches
>>
>> =E2=94=80
>> For more info write to <info@kernelci.org>
>>
>=20
>
>
>

--0000000000008eac4705c8072484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 23 Jul 2021 at 20:07, Guillau=
me Tucker &lt;<a href=3D"mailto:guillaume.tucker@collabora.com">guillaume.t=
ucker@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
  
    
  
  <div>
    <div>On 23/07/2021 15:22, Ard Biesheuvel
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div>Hello all,</div>
        <div><br>
        </div>
        <div>Please see the report below: this used to list 4 configs
          that are tested with my EFI branches, but for some reason,
          arm64 is no longer included.</div>
      </div>
    </blockquote>
    <p>Thanks for reporting this.=C2=A0 It looks like a bug in the email
      report generator, the arm64 defconfig was built according to the
      web dashboard:<br>
<a href=3D"https://linux.kernelci.org/build/efi/branch/urgent/kernel/efi-u=
rgent-for-v5.14-rc2-2-g5bb60b28ce5be/" target=3D"_blank">https://linux.kern=
elci.org/build/efi/branch/urgent/kernel/efi-urgent-for-v5.14-rc2-2-g5bb60b2=
8ce5be/</a></p>
    <p>We&#39;ll take a look, and at least you should be able to see the
      results there in the meantime.<br></p></div></blockquote><div><br></=
div><div>Good to know.</div><div><br></div><div>Thanks,</div><div>Ard.</div=
><div>=C2=A0</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Jul 2021 at
            21:15, <a href=3D"http://kernelci.org" target=3D"_blank">kerne=
lci.org</a>
            bot &lt;<a href=3D"mailto:bot@kernelci.org" target=3D"_blank">=
bot@kernelci.org</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <span><strong>efi/urgent build: 3 builds: 0 failed, 3
                  passed (efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be)</stro=
ng></span>
              <br>
              <table style=3D"border:none;padding-top:15px;padding-bottom:=
15px">
                <tbody>
                  <tr>
                    <td>Full Build Summary: <a href=3D"https://kernelci.or=
g/build/efi/branch/urgent/kernel/efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be/=
" target=3D"_blank">https://kernelci.org/build/efi/branch/urgent/kernel/efi=
-urgent-for-v5.14-rc2-2-g5bb60b28ce5be/</a></td>
                  </tr>
                  <tr>
                    <td style=3D"padding-top:25px"><br>
                    </td>
                  </tr>
                  <tr>
                    <td>Tree: efi</td>
                  </tr>
                  <tr>
                    <td>Branch: urgent</td>
                  </tr>
                  <tr>
                    <td>Git Describe:
                      efi-urgent-for-v5.14-rc2-2-g5bb60b28ce5be</td>
                  </tr>
                  <tr>
                    <td>Git Commit:
                      5bb60b28ce5bee48838c3fdc667c7247e722b34d</td>
                  </tr>
                  <tr>
                    <td>Git URL: <a href=3D"https://git.kernel.org/cgit/li=
nux/kernel/git/efi/efi.git/commit/?id=3D5bb60b28ce5bee48838c3fdc667c7247e72=
2b34d" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/ef=
i/efi.git</a></td>
                  </tr>
                  <tr>
                    <td>Built: 3 unique architectures</td>
                  </tr>
                </tbody>
              </table>
              <p style=3D"padding-bottom:5px"><strong>Detailed
                  per-defconfig build reports:</strong></p>
              <p> <strong>i386_defconfig</strong> (i386, gcc-8) =E2=80=94 =
PASS,
                0 errors, 0 warnings, 0 section mismatches </p>
              <p> <strong>multi_v7_defconfig</strong> (arm, gcc-8) =E2=80=
=94
                PASS, 0 errors, 0 warnings, 0 section mismatches </p>
              <p> <strong>x86_64_defconfig</strong> (x86_64, gcc-8) =E2=80=
=
=94
                PASS, 0 errors, 0 warnings, 0 section mismatches </p>
              <p style=3D"padding-top:10px"> =E2=94=80 <br>
                For more info write to &lt;<a href=3D"mailto:info@kernelci=
.org" target=3D"_blank">info@kernelci.org</a>&gt; </p>
            </div>
          </blockquote>
        </div>
      </div>
      
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div></div>

--0000000000008eac4705c8072484--
