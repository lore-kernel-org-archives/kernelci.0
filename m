Return-Path: <dan.rue@linaro.org>
Date: Tue, 11 Sep 2018 10:29:44 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-09-10
Message-ID: <20180911152944.pydunaeeczcs52u5@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Ana, Matt, Milosz, Dan, Mark, Kevin

- Milosz
  - Test storing/reporting use cases:
    - report on regressions
    - compare results across branches and boards
    - provide test description (what is the goal/intention of the test)
    - provide steps to reproduce (how to run the test)
    - provide test log (pretty hard to do with Lava)
    - ignore unstable tests (aka false regressions) - using either
      ‘known issues’ or ‘skip lists’
    - track test/suite versions
    - test bisection
    - email report variants for different audiences:
      - All tests per kernel revision (what we're currently doing)
      - Results across trees per test plan (kernel sub-system)
      - Per device type (platform support)

- Guillaume: (not attending)
  - test groups in the backend
     https://github.com/kernelci/kernelci-backend/pull/75 Tested
    locally, now fixing unit tests and documentation. This will also
    require some slight changes in the frontend to keep current
    functionality.

- Ana:
  - renaming x86 architectures
     https://github.com/kernelci/lava-ci/issues/123
  - Debian file system Groovy library
      https://github.com/kernelci/kernelci-build-staging/pull/55
  - merging kernelci-build and lava-ci into kernelci-core
    https://groups.io/g/kernelci/message/83

- Kevin:
  - Open source summit. LF Energy project announced, motion picture
    industry project, and kernelci announced.
  - Lots of interest from other companies

- Matt
  - Moving builds into docker; I/O bottleneck when starting many builds
    at the same time, due to filesystem/storage driver
    - Azure Kubernetes:
      https://azure.microsoft.com/en-gb/services/kubernetes-service/
    - AWS: https://aws.amazon.com/eks/

