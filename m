Date: Fri, 25 Oct 2019 17:01:26 +0100
From: Will Deacon <will@kernel.org>
Subject: Re: Branch for kernelci
Message-ID: <20191025160124.GA10854@willie-the-truck>
References: <20191015202114.GA120152@google.com>
 <CAHRSSExkad8q8bdjF77t_JOwfFmDpERfq4CDthSZp8p23HoJ+w@mail.gmail.com>
 <20191016095636.GA4881@sirena.co.uk>
 <20191016123833.GG49619@arrakis.emea.arm.com>
 <20191016125416.GA11371@sirena.co.uk>
 <20191016164621.xa2nc6li2luiujug@willie-the-truck>
 <CAH1_8nDFfrScfM87pNJrT8TeQU7Q9muNMH34AiKx=5_7vc5GOQ@mail.gmail.com>
 <20191023164208.GC27010@willie-the-truck>
 <CAH1_8nCXvjm0TziMY9EeNFirK5Z4MLKgNYNdmQBAHG_dCQ=T8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nCXvjm0TziMY9EeNFirK5Z4MLKgNYNdmQBAHG_dCQ=T8Q@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernelci@groups.io, tkjos@google.com

Hi Guillaume,

On Wed, Oct 23, 2019 at 07:16:42PM +0100, Guillaume Tucker wrote:
>    On Wed, Oct 23, 2019 at 5:42 PM Will Deacon <[1]will@kernel.org> wro=
te:
>      On Tue, Oct 22, 2019 at 08:53:03PM +0100, Guillaume Tucker wrote:
>      >=A0 =A0 =A0 [3][4]https://github.com/kernelci/kernelci-core/issue=
s/new/choose
>      >
>      >=A0 =A0 Would you be so kind as to filing one of those?=A0 You'll=
 be the
>      >=A0 =A0 first one actually using this template so I hope it'll be
>      >=A0 =A0 self-explanatory but please let us know if you have any q=
uestions
>      >=A0 =A0 or comments.
>=20
>      Hmm, so I don't actually have a github account anymore and it feel=
s a
>      bit OTT to create one just to fill in a form... Is the form
>      accessible some other way?
>=20
>    =A0Alright then, I'll ask you a couple of things here instead:
>    How much build coverage do you need for your branch?=A0 Is it just
>    for arm64, or do you need other architectures to be built as
>    well?=A0 Do you need only the main defconfig or do you want all the
>    variants such as allmodconfig, defconfig with big-endian...

arm64 only, with build coverage for allnoconfig, defconfig and allmodconf=
ig.
The boot/runtime tests only need to worry about defconfig.

>    How often do you expect your branch to be updated?=A0 Every branch
>    is monitored hourly on [5]kernelci.org, so if it's updated less
>    often then it's easier to cope with a larger build coverage.

Hard to tell, but at most maybe once a day?

>    Which recipients should receive the email reports?=A0 The standard
>    reports are for builds and basic tests (boot and checks for
>    kernel errors).=A0 I guess that should be Catalin, you and
>    linux-arm-kernel as for CKI?

Yes, please.

Thanks,

Will
