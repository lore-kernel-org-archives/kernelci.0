Return-Path: <dan.rue@linaro.org>
Date: Mon, 25 Feb 2019 13:30:17 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-02-25 #minutes
Message-ID: <20190225193017.q6hryexqpwz5d4hw@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

I missed the meeting last week but the notes were quite short. Including
them now down below.

2019-02-25
- Attendees: Charles Oliveira, Guenter Roeck, Dan Rue, Mark Brown, Matt
  Hart, Amro Hassan
- Dan
  - Ready to add home lab to kernelci. Can I just do a PR? What
    considerations are there?
  - Matt, can you help me with the x15 job this week? I think it’s close
    and we’ll be able to add mine as well as LKFT’s to kernelci.
  - Process is: Create kernelci user and generate key in lava. Give key
    to Matt or Guillaume to add to jenkins. Modify labs.ini to add the
    lab to kernelci.
    - Add lab-<labname> for production, and lab-<labname>-dev for
      staging. The production lab will be tested in staging before being
      deployed.
- Matt
  - ARM64 defconfig now builds with clang
  - Guillaume has a pull request open to do clang building in production

2019-02-18
- Attendees: Anders, Charles, Guillaume, Mark
- Clang
- LTP - debos
- Allmodconfig with
  KCONFIG_ALLCONFIG=$(pwd)/arch/arm64/configs/defconfig

