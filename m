MIME-Version: 1.0
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 4 Oct 2018 10:21:03 +0200
Message-ID: <CADYN=9JFD1QamRP=y1WLiS9PkaVZJXHKFHTkCObZf9fSFYhqdQ@mail.gmail.com>
Subject: build and package kselftests
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

I would like to run kselftest on mainline and next on every mainline
RC ornext tag.
Would it be possible to build and package kselftest at the same time
the kernel gets built?
Kselftest should be built against the headers from the kernel source
and/or git repo since the primary focus are to find regressions.

Cheers,
Anders
