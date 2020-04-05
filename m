MIME-Version: 1.0
References: <5e863110.1c69fb81.17969.099e@mx.google.com> <187eeb8e-5c70-4479-d806-a7123f9023c8@collabora.com>
 <MN2PR12MB4488D9D3984D03030D3BACC3F7C70@MN2PR12MB4488.namprd12.prod.outlook.com>
 <20200404090658.nxfvi5zg2rgag2qo@gilmour.lan>
In-Reply-To: <20200404090658.nxfvi5zg2rgag2qo@gilmour.lan>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 5 Apr 2020 10:11:23 -0400
Message-ID: <CADnq5_NbDH+aDFAwj2-rajD8QgF2J=Zmq2w9-7mh8wwRYVWk8Q@mail.gmail.com>
Subject: Re: mainline/master bisection: baseline.login on peach-pi
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Maxime Ripard <maxime@cerno.tech>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Shane Francis <bigbeeshane@gmail.com>, David Airlie <airlied@linux.ie>, Guillaume Tucker <guillaume.tucker@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "kernelci@groups.io" <kernelci@groups.io>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Joerg Roedel <jroedel@suse.de>, Tom Murphy <murphyt7@tcd.ie>, Enric Balletbo i Serra <enric.balletbo@collabora.com>

On Sat, Apr 4, 2020 at 8:46 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Fri, Apr 03, 2020 at 03:47:46PM +0000, Deucher, Alexander wrote:
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > > -----Original Message-----
> > > From: Guillaume Tucker <guillaume.tucker@collabora.com>
> > > Sent: Friday, April 3, 2020 10:14 AM
> > > To: Michael J. Ruhl <michael.j.ruhl@intel.com>; Shane Francis
> > > <bigbeeshane@gmail.com>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>
> > > Cc: kernelci@groups.io; dri-devel@lists.freedesktop.org; linux-
> > > kernel@vger.kernel.org; Tom Murphy <murphyt7@tcd.ie>; Joerg Roedel
> > > <jroedel@suse.de>; David Airlie <airlied@linux.ie>; Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>;
> > > Maxime Ripard <mripard@kernel.org>; Enric Balletbo i Serra
> > > <enric.balletbo@collabora.com>
> > > Subject: Re: mainline/master bisection: baseline.login on peach-pi
> > >
> > > Please see the bisection report below about a boot failure.
> > >
> > > Reports aren't automatically sent to the public while we're trialing new
> > > bisection features on kernelci.org but this one looks valid.
> > >
> > > This bisection was run with exynos_defconfig but the issue can also be
> > > reproduced with multi_v7_defconfig.  It doesn't appear to be affecting any
> > > other platforms on kernelci.org.  This looks like a DRM driver problem, the
> > > kernel image boots fine without the modules installed.  It actually started
> > > failing on Tuesday in mainline.
> >
> > Fixed with this patch:
> > https://patchwork.freedesktop.org/patch/359081/
> >
> > Just trying to get this into 5.7 and stable.  I was waiting for a
> > 5.6 back merge to drm-misc-next-fixes, but I could send it as a
> > separate PR if Dave or Daniel prefer.
>
> You should ask us next time, we're not doing them unless asked :)
>
> I've done it, it's compiling at the moment, it should be pushed in the
> next 10 minutes or so.
>

I sent out a generic ping on IRC.  Next time I'll be more specific.

Thanks!

Alex
