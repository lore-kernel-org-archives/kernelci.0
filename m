MIME-Version: 1.0
References: <CAHRSSExW6ig0=1Kx3jEM0mHEbh7W5G9yJGN0BxBfTiN9MBungA@mail.gmail.com>
 <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com>
 <CAH+k93EFwUw4KsKZirJKDOF=Xi8SCk80KyVYfJmFYxzLP69qJA@mail.gmail.com>
 <CAHRSSEw_3QEb6NS51LGN+FGjYeKma4=WO5kfjHrKM46+SofiEw@mail.gmail.com>
 <CAHRSSEz4n+=gAokMj4p5w++VDBPWic_rodvaUS-1eSp5rUpWNg@mail.gmail.com>
 <CAHRSSExgOW4CWc_YfUQcx_sJYanBNTrLiNntt67zxcWUPudcjQ@mail.gmail.com>
 <7hsgpu9snm.fsf@baylibre.com> <CAHRSSEwmxUXjD5DYJNXRJKsYPKyC54a9vrY=bRZLuEOZfJLmwQ@mail.gmail.com>
In-Reply-To: <CAHRSSEwmxUXjD5DYJNXRJKsYPKyC54a9vrY=bRZLuEOZfJLmwQ@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Thu, 22 Aug 2019 17:53:32 +0100
Message-ID: <CAH+k93G8PmCM5fZ_Tavm--H3CETzW6znKcS1BDPyZvhXEBsV0Q@mail.gmail.com>
Subject: Re: Please add/remove android branches from kernelci + clang builds
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io, Anmar Oueja <anmar.oueja@linaro.org>

On Wed, 21 Aug 2019 at 21:26, Todd Kjos <tkjos@google.com> wrote:
>
> On Wed, Aug 21, 2019 at 1:21 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > " via Groups.Io" <tkjos=google.com@groups.io> writes:
> >
> > > 4 requests related to android kernels (repo:
> > > https://android.googlesource.com/kernel/common):
> > >
> > > 1) android-4.14 is being moved to android-4.14-r (currently mirrored
> > > so testing can be moved to new branch)
> > >
> > > delete: android-4.14
> > > add: android-4.14-r
> > >
> > > 2) android-4.19 is being moved to android-4.19-r (currently mirrored
> > > so testing can be moved to new branch)
> > >
> > > delete: android-4.19
> > > add: android-4.19-r
> > >
> > > 3) android-4.9 is obsolete
> > >
> > > delete: android-4.19
> >
> > I assume you meant android-4.9 here (based on the previous sentence)?
>
> Indeed. Thanks.

I'm doing a pull request for these changes now. Did you mean all
android-4.9 trees are obsolete or only the exact "android-4.9" branch?

>
> >
> > Kevin
