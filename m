Return-Path: <dan.rue@linaro.org>
Date: Mon, 15 Oct 2018 11:03:01 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-10-15
Message-ID: <20181015160301.azhyrfcngeugnzoz@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Attendees: broonie, dan, gtucker, milosz, Kevin, Ana, matt

- [khilman] more upstream kernel trees (Vinod K)
  - new GCE builders coming online soon(ish) -- Matt has the credentials
  - Kevin will follow-up with Vinod: proposing to start with 1 branch

- Fluentd - is there an existing framework that will work for us?
  - Could have fluentd running on the DUT and the dispatcher to relay logs
  - Would require networking
  - Fluentbitd is a couple hundred k

- Tests using lava-test-case scripting is a bit inconvenient - is this our
  plan? Hard to reproduce locally
  - Using lava-test-shell solves some parsing problems - getting the test
    output per test out of the logs.

- If test suites can create an output artifact, we can just use that
  - Getting them out of lava isn’t easy. Need another service to host them,
    such as artifactorial (LKFT is using artifactorial)

- Wiki.kernelci.org is still a problem. Ana will move over the last bits to the
  new wiki. Dan changed mailing list link to the correct location, anyway.
  - Imported images
    https://github.com/kernelci/kernelci-doc/wiki/Architecture-Overview

- Adding firmware to modules tarball is needed

