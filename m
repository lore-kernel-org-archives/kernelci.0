Subject: Re: some question
References: <08f301d69cb8$a8622c50$f92684f0$@ispras.ru>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <74c98edd-59f4-036c-c985-1d124b31da45@collabora.com>
Date: Wed, 25 Nov 2020 14:19:23 +0000
MIME-Version: 1.0
In-Reply-To: <08f301d69cb8$a8622c50$f92684f0$@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: diam@ispras.ru
Cc: kernelci@groups.io

On 07/10/2020 15:46, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=9C=D0=
=BE=D1=81=D0=BA=D0=B0=D0=BB=D0=B5=D0=B2 wrote:
> Hi!
>=20
> =C2=A0
>=20
> I=E2=80=99m participating in small science project, that consist in cent=
os-base kernel development.
>=20
> One of the goals is regression testing of memory management from one ver=
sion to another. And some autotesting system would be a great helpful for t=
his.
>=20
> I found *kernelci.org*in web and after reading howto=E2=80=99s have seve=
ral questions:
>=20
> 1.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Could I install kernelCi on local=
 computer(s) so, that it builds and tests our =C2=A0kernel? I think we can=
=E2=80=99t maintain actual lab, on the other hand testing in remote lab ma=
y be =C2=A0time-consuming due to coordination exps.

Yes, however setting up a complete KernelCI instance is not
trivial.  It includes: the kernelci-backend service, a Mongo DB
database, the kernelci-frontend service (web dashboard), and
Jenkins to coordinate the builds and submit tests.  Then you
would also need to have some kind of environment to run tests
such as a LAVA lab.  But it's entirely possible, it might take a
few days of work to get something that suits your needs.

> 2.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Could I add some new tests in tes=
tplan and what should I do for this?

Is this for your own instance, or to add some tests to run on
kernelci.org?

You can define tests that run in LAVA labs by creating a job
template and YAML configuration in the kernelci-core repository.
There is also some documentation about how to do that, and plenty
of existing ones to use as a reference:

  https://github.com/kernelci/kernelci-core

Thanks,
Guillaume
