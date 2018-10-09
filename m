Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] build and package kselftests
References: <CADYN=9JFD1QamRP=y1WLiS9PkaVZJXHKFHTkCObZf9fSFYhqdQ@mail.gmail.com>
Date: Tue, 09 Oct 2018 10:23:40 +0200
In-Reply-To: <CADYN=9JFD1QamRP=y1WLiS9PkaVZJXHKFHTkCObZf9fSFYhqdQ@mail.gmail.com>
	(Anders Roxell's message of "Thu, 4 Oct 2018 10:21:03 +0200")
Message-ID: <7hk1mr4jg3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: kernelci@groups.io

Anders Roxell <anders.roxell@linaro.org> writes:

> I would like to run kselftest on mainline and next on every mainline
> RC ornext tag.
> Would it be possible to build and package kselftest at the same time
> the kernel gets built?
> Kselftest should be built against the headers from the kernel source
> and/or git repo since the primary focus are to find regressions.

Can you have a look at build.py in the kernelci-core repo[1] and add
support for building kselftest?

Kevin

[1] https://github.com/kernelci/kernelci-core-staging
