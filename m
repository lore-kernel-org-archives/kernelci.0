Return-Path: <dan.rue@linaro.org>
Date: Tue, 21 May 2019 11:14:47 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-05-21 #minutes
Message-ID: <20190521161447.vewqbqo6b3huvgdw@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Nick Desaulniers, Michal, Daniel, Mark, Charles, Milosz
- Kevin ( conflict today, will likely miss the call )
  - email reports: regressions
    - should not report regressions if it’s also shown as a conflict:
      - https://lore.kernel.org/lkml/7h1s0y9fuq.fsf@baylibre.com/
    - [matt] Looks like this has been around for a while, same here
      - https://lists.linaro.org/pipermail/kernel-build-reports/2019-January/041406.html
      - Meson-gxl-s905x-khadas-vim shows as a regression and a conflict
- Nick introduction
  - Focused on building linux kernel with Clang from Google
  - Waiting on Andrew Morton to pick up some patches to unbreak some
    clang builds
- Clang status
  - Armv8 in production
  - Armv7 in staging
  - * clang status
    - Risc-v will be a while
- Matt, Guillaume also absent. Meeting adjourned early.
