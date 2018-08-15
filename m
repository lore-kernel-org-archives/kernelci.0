Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Compilers from.. debian?
References: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
Date: Wed, 15 Aug 2018 08:21:49 -0700
In-Reply-To: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
	(Matt Hart's message of "Tue, 14 Aug 2018 20:21:09 +0100")
Message-ID: <7hefezlkoi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io

"Matt Hart" <matthew.hart@linaro.org> writes:

> Does anyone have a strong opinion about where we get our compiler releases from?

I think the current tarball way is a hack and not scalable, so...

> Currently it's a mash up of Linaro for ARM(32/64), MIPS from unknown,
> and X86 from whatever ubuntu is installed on the builder
>
> As part of my work to start building with multiple compiler versions,
> I've been creating Dockerfiles for the builders with different
> compiler versions installed in them. As I've been doing this, it's
> been really easy to just install the various compilers packages from
> Debian. They also cover a lot of architectures we're hoping to add in
> the future.
>
> Anyone mind if we start using Debian toolchain releases in future?
> I'm no toolchain expert, so I'm looking for some opinions.

It's better than what we're doing today, and has a much clearer
upgrade/migration path, so I say go for it!

Kevin
