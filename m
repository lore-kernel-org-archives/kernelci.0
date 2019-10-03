MIME-Version: 1.0
References: <df4f719d-d94a-2860-3606-5d17c2f05f9d@collabora.com> <7h7e5mwv0a.fsf@baylibre.com>
In-Reply-To: <7h7e5mwv0a.fsf@baylibre.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 3 Oct 2019 04:28:22 +0200
Message-ID: <CADYN=9J=KVKq6au-kozXCny84xRWdT0Q-gb1+cWqEDt3LTyvmA@mail.gmail.com>
Subject: Re: kernelci.org DNS record issue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>, kernel-build-reports@lists.linaro.org

On Thu, 3 Oct 2019 at 02:08, Kevin Hilman <khilman@baylibre.com> wrote:
>
> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>
> > We're experiencing some issues while transferring DNS records for
> > the kernelci.org domain.  Please bear with us while we're
> > actively working on restoring them.
>
> Everything should be back now.  Please report any issues here.

I can't download an uefi image:
$ wget https://storage.kernelci.org/images/uefi/111bbcf87621/OVMF.fd-X64-RE=
LEASE-111bbcf87621
--2019-10-03 04:24:14--
https://storage.kernelci.org/images/uefi/111bbcf87621/OVMF.fd-X64-RELEASE-1=
11bbcf87621
Resolving storage.kernelci.org (storage.kernelci.org)... failed: Name
or service not known.
wget: unable to resolve host address =E2=80=98storage.kernelci.org=E2=80=99

Then I tried to browse storage.kernelci.org , got the below error:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This site can=E2=80=99t be reached

storage.kernelci.org=E2=80=99s server IP address could not be found.
DNS_PROBE_FINISHED_NXDOMAIN
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Cheers,
Anders

>
> Thanks,
>
> Kevin
> _______________________________________________
> Kernel-build-reports mailing list
> Kernel-build-reports@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/kernel-build-reports
