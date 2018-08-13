Return-Path: <dan.rue@linaro.org>
Date: Mon, 13 Aug 2018 09:49:59 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-08-13
Message-ID: <20180813144959.2zubcbojvnlk75sv@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees - Ana, Guillaume, Guenter, Mark, Matt, Dan

- Dan - ok with everyone to post minutes to mailing list after meeting?
  - Mark - concern about unstructured mailing list discussions
  - Dan - I’d like to try and see how it goes

- Guillaume
  - Rewriting the device map as “test configs”, first PR for early
    feedback: https://github.com/kernelci/lava-ci-staging/pull/96
    - Suggestion to add support to use yaml config files, rather than
    having them defined in python
  - Can we drop lava-v1?
    - [matt] Looks like the last lab that uses v1 is offline since July
    11, but they don’t have any v1 devices anymore either
    - [matt] +1
  - Should we test with “SMP=n” all ARM devices? Some failures are seen
  on veyron-jaq and nyan-big only with SMP=n, they should not fail but
  otoh it’s not a config normally used in production devices.
    - [mark] yes, it’s good to check to catch issues that were assumed
    by developers and find real problems. Similar to testing what
    testing RT used to do before SMP was common.
  - Improve coordination when syncing staging with prod (and merging
  kernelci-build with lava-ci)
    - If kernelci-build and lava-ci were combined, it would make
    deployment simpler (less need to do an atomic sync when making big
    changes)
    - Last week deploying the changes wasn’t easy because Matt wasn’t
    highly available at the same time as Guillaume
    - Matt, ana, +1
    - [guillaume] should we put them in lavaci ?
    - 6 hours without builds on friday. Staging -> prod requires
    downtime. Better to do it during quiet period

- Ana
  - PR for https://github.com/kernelci/kernelci-backend/pull/70 open for
  review, code to send the test suite report emails
  - Rootfs with test suites - pulling test suite from git repo. Need a
  way to handle versioning
  - Support for building mips - do we need to support the 3 mips
  architectures? The advantage of having all mips arches is we have mips
  32 bits little endian and bit endian and also mips 64 bits little
  endian.
    - [Matt] Kevin will known which

- [Matt] Updating builders with tmpfs
  - Could add it to docker runtime
    - But then couldn’t run docker builds on the builder
  - Needs more testing in staging, with jenkins pipeline
  - For now, just tag one box as the docker builder. In the future it
  won’t be an issue once everything is using containers
  - Every step should run inside a container

- Guillaume - looking to convert 3 more jobs to pipeline

