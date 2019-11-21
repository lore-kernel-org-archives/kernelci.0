Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Please add/remove android branches from kernelci + clang builds
In-Reply-To: <CAHRSSEyz+SVUspLjwDJBVLjnNtqXd8gKH+3hiitw70M=N1qw-Q@mail.gmail.com>
References: <CAHRSSExW6ig0=1Kx3jEM0mHEbh7W5G9yJGN0BxBfTiN9MBungA@mail.gmail.com> <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com> <CAH+k93EFwUw4KsKZirJKDOF=Xi8SCk80KyVYfJmFYxzLP69qJA@mail.gmail.com> <CAHRSSEw_3QEb6NS51LGN+FGjYeKma4=WO5kfjHrKM46+SofiEw@mail.gmail.com> <CAHRSSEz4n+=gAokMj4p5w++VDBPWic_rodvaUS-1eSp5rUpWNg@mail.gmail.com> <CAHRSSExgOW4CWc_YfUQcx_sJYanBNTrLiNntt67zxcWUPudcjQ@mail.gmail.com> <7hsgpu9snm.fsf@baylibre.com> <CAHRSSEwmxUXjD5DYJNXRJKsYPKyC54a9vrY=bRZLuEOZfJLmwQ@mail.gmail.com> <CAH+k93G8PmCM5fZ_Tavm--H3CETzW6znKcS1BDPyZvhXEBsV0Q@mail.gmail.com> <CAHRSSEytdV_pGQvH7+NGLMU3V3zDN43PxwgcWG3HQR8gqueghA@mail.gmail.com> <CAH+k93GhFGf9U2Am-V+ivf3Wn8d7H8vjg==8BGN0g8UW-p0K=A@mail.gmail.com> <CAHRSSEzg++6oUoG38v2x+e8K3H07q+k3jTnG6GPCgFSp-yLA=Q@mail.gmail.com> <CAHRSSEx=-rJGjk2USG+ghvf66+NaWtv5jEQzZ08=WHFoKh1cPg@mail.gmail.com> <CAHRSSEyz+SVUspLjwDJBVLjnNtqXd8gKH+3hiitw70M=N1qw-Q@mail.gmail.com>
Date: Thu, 21 Nov 2019 15:40:12 -0800
Message-ID: <7hsgmgn6hv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>, Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io, Anmar Oueja <anmar.oueja@linaro.org>

Todd Kjos <tkjos@google.com> writes:

> ...also please delete the following 3 obsolete android branches:
>
> android-3.18-n-release

I don't see this one...

> android-4.4-n
> android-4.4-n-release

... or any of these either.  In fact I don't see any -n branches in our
build-configs file at all:

https://github.com/kernelci/kernelci-core/blob/master/build-configs.yaml

Kevin
