Return-Path: <dan.rue@linaro.org>
Date: Tue, 25 Jun 2019 12:17:03 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-06-25 #minutes
Message-ID: <20190625171703.jykcgucbnzjimh7f@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Mark, Charles, Guillaume, Guenter, Daniel, Matt, Dan,
  Michal

- Matt
  - Can I add awscli to the build-base docker image for s3 support
    - [gtucker] it can be added because it’s small (1M) but it’s better
      if this can be avoided by using other tagged images

- Guillaume
  - Fixed issue with lab conflicts and regressions

- Dan
  - LAVA Alias update
    - Pull request submitted @
      https://github.com/kernelci/kernelci-core/pull/99
    - Side note - pep8 requirements mentioned but unclear.
      - [drue] my proposal is to use and enforce black or pycodestyle
        (pep8). I’ll submit a pull request
