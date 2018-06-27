Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Testing with distros
References: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com>
Date: Wed, 27 Jun 2018 16:05:40 -0700
In-Reply-To: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com> (Guillaume
	Tucker's message of "Fri, 22 Jun 2018 13:34:00 +0100")
Message-ID: <7hd0wbkeyj.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> One subject that comes up regularly is about testing distributions
> against upstream kernels in KernelCI.  We've been historically using a
> bare buildroot user-space to do boot testing and run very low-level test
> cases.  We're now starting to produce Debian root file systems for more
> advanced test plans and extend the coverage of kernel-user interfaces
> (DRM, V4L2...).
>
> It seems like there would also be some value in having tests that
> capture distro user-space breakages due to kernel changes.  This may
> mean building upstream kernels with a distro config, booting with a
> fixed stable user-space from that distro and detecting new failures.
>
> The next part to be defined would be what tests to run with these
> distros, as even booting means choosing which services to start etc...
> The point being to increase kernel test coverage without ending up
> testing the user-space itself as this would seem outside of the scope of
> KernelCI.
>
> Does this sound like a path worth exploring?

It definitely sounds like a path worth exploring, but personally, I'd
rather get our kernel-focused testing (and reporting!) figured out using
our debian baseline before tackling distros.

In particular, I think a kselftest and/or LTP testplan should probably
be next on the list.

Kevin
