Return-Path: <dan.rue@linaro.org>
Date: Mon, 3 Dec 2018 13:19:20 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-12-03
Message-ID: <20181203191920.iw3p2ynoo2icjoss@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees:
    - Ana Guerrero Lopez
    - Charles Oliveira
    - Daniel Díaz
    - Guenter Roeck
    - Guillaume Tucker
    - Mark Brown
    - Milosz Wasilewski
    - Naresh Kamboju
- [gtucker]
  - Main issue this week: proper fix for the test db queries.  Is anyone
    on the case already?
    - gtucker to start working on it today, will share progress on irc /
      github
  - Clang: would be good to have a build in Jenkins to validate the PR +
    Docker image
  - Update on Jenkins builds getting stuck with “all*config”: it still
    happens on staging with v2.153, so not worth upgrading prod.  I’m
    disabling them in my kernelci-core branch now instead to avoid this
    issue, missing regular defconfig files are causing job errors as
    expected.  Would still be good to understand the root cause as this
    wasn’t an issue before we moved to running jobs in Docker
    containers.
- [ana]
  - Sending this week PR for tracking regressions in the backend + mail
    reporting for comments
