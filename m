MIME-Version: 1.0
References: <CAHRSSExW6ig0=1Kx3jEM0mHEbh7W5G9yJGN0BxBfTiN9MBungA@mail.gmail.com>
 <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com>
In-Reply-To: <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Thu, 16 May 2019 12:48:43 +0100
Message-ID: <CAH+k93EFwUw4KsKZirJKDOF=Xi8SCk80KyVYfJmFYxzLP69qJA@mail.gmail.com>
Subject: Re: Please add 3 android common kernels to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Todd Kjos <tkjos@google.com>

On Wed, 15 May 2019 at 13:03, Matt Hart <matthew.hart@linaro.org> wrote:
>
> On Wed, 15 May 2019 at 07:09, via Groups.Io <tkjos=google.com@groups.io> wrote:
> >
> > Please add these three more android branches to kernelci:
> >
> > repo: https://android.googlesource.com/kernel/common
> >
>
> I'll make a pull request to add those today.

https://github.com/kernelci/kernelci-core/pull/77

I'm preparing a staging test today with the plan to do a production
rollout tomorrow assuming everything seems fine.

>
> > branches:
> > android-mainline (linux mainline regularly merged to stay close to tip)
> > android-4.19-gki-dev (development branch for "generic kernel image" work)
> > android-3.18 (needed to continue security update support when 3.18 LTS support is dropped)

android-3.18 was already on the trees list

>
> These sound like they will be frequently built so I've added 2 more
> GCE builders to the kernelci production instance in preparation.
>
> >
> > Thanks,
> >
> > -Todd
> >
> > 
