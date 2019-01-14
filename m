Return-Path: <dan.rue@linaro.org>
Date: Mon, 14 Jan 2019 09:50:44 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-01-14 #minutes
Message-ID: <20190114155044.g2xy3a5e42ynivj7@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Charles Oliveira, Daniel Díaz, Guenter Roeck, Guillaume
  Tucker, Dan Rue, Mark Brown, Matt Hart

- [matt]
  - Scrap HTML emails everywhere?
    - Ask HTML receivers
  - In kernel defconfig build lists
    - Kernel tree owner can update the defconfig list without us having
      to roll out updated configs
      - [mark] let’s see what 0day does and others; how do they solve
        this?
      - [drue] perhaps a separate repo that manages configs like this
        out of band from the kernel tree and out of band from kernelci’s
        release cycle. This could also be useful to manage and support
        fragments.
      - [gtucker] what’s the actual usecase of wanting to filter
        defconfigs?
        - [matt] speed
        - [mark] well kernelci’s point is coverage. If you just want one
          built, you don’t need kernelci.
      - [matt] we’ll wait until the yaml work is completed by gtucker
        before making any changes here
    - Very useful for testing
      - [gtucker] Other way to do this is in build-configs.yaml with all
        the other build configuration settings (see initial work in
        kernelci-core-staging PR #75)

- [gtucker]
  - Test regressions merged on staging, testing last changes to the test
    reports
  - Adding fix for MIPS (remove hacks and use gcc-7)
  - V4l2 & dynamic metadata: adding a template parameter to the
    test-configs.yaml test plans settings to specify the video driver to
    use in the test (discovering the driver name at runtime isn’t
    practical with current LAVA)

- [drue]
  - Next steps on ‘[Help] How to use kernelci to establish a local CI
    lab?’?
    - [chaws] I mentioned this repo:
      https://github.com/kernelci/kernelci-core, but still unsure what
      the next step is
    - Li’s asking for support using kernelci-docker locally, not adding
      a lab to kernelci. There are a lot of versions of this repo in the
      wild, so it’s not clear who should help him. Matt can show him how
      he does it.
