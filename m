Return-Path: <clabbe@baylibre.com>
Date: Tue, 2 Nov 2021 22:40:31 +0100
From: "Corentin Labbe" <clabbe@baylibre.com>
Subject: Re: [PATCH] clk: composite: Also consider .determine_rate for rate + mux composites
Message-ID: <YYGwT0CKEd5Xu2jO@Red>
References: <163425193558.1688384.15520943968787313145@swboyd.mtv.corp.google.com>
 <20211015120559.3515645-1-martin.blumenstingl@googlemail.com>
 <04a58d50-634b-fa20-95b4-eb6831f77e85@collabora.com>
 <CAFBinCAEt9_EfLYWZEzTBK6iN97+Wacho7pNd2LYDPX3+goMzg@mail.gmail.com>
 <b6468523-a730-6a44-f4b9-3fd5b9ea2354@arm.com>
 <3e42ae24-8db4-fb11-edf2-a25bca47ecae@arm.com>
 <49a0dda1-8d0f-580c-d92d-de759b51edb3@gmail.com>
 <31d462cb-1158-dd13-0ca8-46d54d2502f5@collabora.com>
MIME-Version: 1.0
In-Reply-To: <31d462cb-1158-dd13-0ca8-46d54d2502f5@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Alex Bee <knaerzche@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, sboyd@kernel.org, heiko@sntech.de, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "kernelci@groups.io" <kernelci@groups.io>, Collabora Kernel ML <kernel@collabora.com>, Chen-Yu Tsai <wens@csie.org>

Le Tue, Nov 02, 2021 at 07:58:42AM +0000, Guillaume Tucker a =E9crit :
> +Kevin +Corentin
>=20
> On 01/11/2021 22:41, Alex Bee wrote:
> > Hi Guillaume,
> >=20
> > Am 01.11.21 um 23:11 schrieb Robin Murphy:
> >> On 2021-11-01 21:59, Robin Murphy wrote:
> >>> On 2021-11-01 20:58, Martin Blumenstingl wrote:
> >>>> Hi Guillaume,
> >>>>
> >>>> On Mon, Nov 1, 2021 at 9:19 PM Guillaume Tucker
> >>>> <guillaume.tucker@collabora.com> wrote:
> >>>>>
> >>>>> Hi Martin,
> >>>>>
> >>>>> Please see the bisection report below about a boot failure on
> >>>>> rk3328-rock64.
> >>>>>
> >>>>> Reports aren't automatically sent to the public while we're
> >>>>> trialing new bisection features on kernelci.org but this one
> >>>>> looks valid.
> >>>>>
> >>>>> Some more details can be found here:
> >>>>>
> >>>>> =A0=A0 https://linux.kernelci.org/test/case/id/617f11f5c157b666fb33=
58e6/
> >>>>>
> >>>>> Here's what appears to be the cause of the problem:
> >>>>>
> >>>>> [=A0=A0=A0 0.033465] CPU: CPUs started in inconsistent modes
> >>>>> [=A0=A0=A0 0.033557] Unexpected kernel BRK exception at EL1
> >>>>> [=A0=A0=A0 0.034432] Internal error: BRK handler: f2000800 [#1] PRE=
EMPT SMP
> >>>
> >>> What's weird is that that's really just the same WARN that's also
> >>> present in 'successful' logs, except for some reason it's behaving as
> >>> if the break handler hasn't been registered, despite that having
> >>> happened long before we got to smp_init(). At this point we're also
> >>> still some way off getting as far as initcalls, so I'm not sure that
> >>> the clock driver would be in the picture at all yet.
> >>>
> >>> Is the bisection repeatable, or is this just random flakiness
> >>> misleading things? I'd also note that you need pretty horrifically
> >>> broken firmware to hit that warning in the first place, which might
> >>> cast a bit of doubt over the trustworthiness of that board altogether.
>=20
> The bisection has checks to avoid false positives, so tests that
> produce flaky results won't normally lead to a report like this.
> Then they're manually triaged, and there were 2 separate
> bisections that landed on this same commit.
>=20
> >> Ah, on closer inspection it might be entirely repeatable for a given
> >> kernel build, but with the behaviour being very sensitive to code/data
> >> segment layout changes...
> >>
> >> ...
> >> 23:44:24.457917=A0 Filename '1007060/tftp-deploy-dvdnydcw/kernel/Image=
'.
> >> 23:44:24.460178=A0 Load address: 0x2000000
> >> ...
> >> 23:44:27.180962=A0 Bytes transferred =3D 33681920 (201f200 hex)
> >> ...
> >> 23:44:27.288135=A0 Filename
> >> '1007060/tftp-deploy-dvdnydcw/ramdisk/ramdisk.cpio.gz.uboot'.
> >> 23:44:27.288465=A0 Load address: 0x4000000
> >> ...
>=20
> That is indeed where the remaining false positives are still
> likely to be coming from, when the infrastructure consistently
> causes test failures following particular kernel revisions.  I
> don't think there's an easy way to rule those out, but we can try
> to address them one by one at least.
>=20
> In the case of colliding address ranges in the bootloader, we
> could add a check with the "good" revision and extra data in the
> kernel image to make it at least as big as the "bad" revision...
>=20
> > could you try updating u-boot to more recent version: the ramdisk
> > address has been moved [1] to 0x06000000 in v2020.01-rc5.
>=20
> Thanks for investigating this.  The board is in BayLibre's lab.
>=20
> Corentin, Kevin, could you please take a look?
>=20

Hello

I tried to update uboot on it but failed for today.
I found only how to flash sdcard (doiing it remotly), but the board boots S=
PI first (and I saw no documentation on how to flash SPI).
I need to have physical access to change this.
So probably later this week.

Regards
