Return-Path: <dan.rue@linaro.org>
Date: Mon, 11 Mar 2019 14:41:49 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-03-11 #minutes
Message-ID: <20190311194149.v6albgr7hmtvh25m@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Amro, Anders, Charles, Daniel, Guenter, Guillaume, Mark,
  Matt, Michal, Milosz, Dan, Kevin

- Matt
  - How to get clang(-8) builds running on production?
    - Must fix email report issue discovered with
      https://github.com/kernelci/kernelci-core-staging/pull/106
    - Start doing arm64 on production?
      - Arm64_defconfig fine once patch lands to clean it up
    - For armv7, support different email recipients? Or remove a lot of
      the email report verbosity and just send all reports to the same
      recipients?
      - Fix email issue above
      - Arm7 when arch-complete can differentiate between environments
      - Frontend show compiler
    - Email reports
      - Warning counts limited to 10
      - Remove warnings from per-defconfig
      - Keep errors
  - Moving this meeting or having alternative times, to get Kevin in
    more regularly
    - Broonie to run a new doodle

- Charles
  - Kernelci ELK dashboards
  - [mark] one of the things that kernelci.org does really well is
    individual boot page
  - [amro] a bit difficult to consume some of the nested data
  - [amro] can filter by lab, arch, config, platform and show boot
    result metrics
  - [gtucker] have you looked at test results (not just boot results)?
    - [amro] because results are nested, it’s hard to index them. Need
      to bring data to the root of the document
    - [charles] we can create a table for this, it’s just a matter of
      what we want to show to developers. Very doable.
  - screenshot:
    http://people.linaro.org/~dan.rue/files/Screenshot%20from%202019-03-11%2009-40-09.png

