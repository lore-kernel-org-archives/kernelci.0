MIME-Version: 1.0
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com> <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
 <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
 <20200702144955.GA1132145@aurel32.net> <20200702181553.GA3226@aletheia.cgn.bolug.org>
In-Reply-To: <20200702181553.GA3226@aletheia.cgn.bolug.org>
From: "Manuel A. Fernandez Montecelo" <manuel.montezelo@gmail.com>
Date: Thu, 2 Jul 2020 22:15:54 +0200
Message-ID: <CAPQ4b8nVgcanT3SF8P+S0MwbpEBi0YB3zoAzhj99ukDWGetEvg@mail.gmail.com>
Subject: Re: Improve kernelci setup for RISC-V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Karsten Merker <merker@debian.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, David Abdurachmanov <david.abdurachmanov@sifive.com>, Atish Patra <Atish.Patra@wdc.com>, "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>

Hi,

Em qui., 2 de jul. de 2020 =C3=A0s 20:21, Karsten Merker
<merker@debian.org> escreveu:
> [...]
> In contrast to debootstrap, mmdebstrap can handle multiple suites
> without problems and automatically takes care of adding the
> corresponding sources.list entries in the chroot.  The capability of
> creating a chroot from multiple suites makes it also more resilient to
> cases where one of the base packages temporarily has to move from
> "unstable" to "unreleased".  The latter hasn't happened for a long
> time, but it could in principle happen again - when that happens it is
> usually only a temporary issue, but using mmdebstrap instead of
> debootstrap completely avoids that becoming a problem at all.
>
> Unfortunately there are certain differences between the debootstrap and
> the mmdebstrap commandline parameters, so mmdebstrap is not a direct
> 1:1 replacement for debootstrap, but the two are similar enough that
> this shouldn't pose a serious problem.

Yeah, I think that it depends on the effort.  I'd suggest to start
with the current set-up of debos with debootstrap underneath, it
should work for now and most of the time, and if needed or deemed
useful, add support for mmdebstrap.

Great to see this happening BTW, thanks all working on it for the effort :-=
)

--=20
Manuel A. Fernandez Montecelo <manuel.montezelo@gmail.com>
