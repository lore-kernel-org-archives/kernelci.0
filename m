Return-Path: <dan.rue@linaro.org>
Date: Mon, 20 Aug 2018 11:28:51 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Meeting Minutes for 2018-08-20
Message-ID: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark

- Guillaume
  - Dealing with test results:
    - We currently have test suites/sets/cases, but test sets aren’t
      used and their implementation is broken.  They are mostly a side
      effect of parsing LAVA callback data, they are not meaningful from
      a user point of view.
    - Suggestion: Remove test sets to simplify things.  If we need a
      better backend solution, we should consider SQUAD and rethink this
      from a global point of view.
    - If some test suites need to be broken down, then we can have
      several smaller test plans.  We could also consider running
      several test plans in a row with a single LAVA job. Example:
      https://lava.collabora.co.uk/results/1240317
      - [drue/Mark] - In LKFT we run LTP across several test runs, and
        they end up getting called “suite” LTP-subsetA, LTP-subsetB,
        etc, because squad doesn’t support sets.
        - [broonie] The goal here is to both get faster runs when
          there’s multiple boards and to improve robustness against test
          runs crashing and losing a lot of results on larger
          testsuites.
      - [ana] I would like to remove it because what we currently have
        doesn’t work and we don’t use it
      - [matt] this was all designed a while ago. A test set is supposed
        to be a part of a bigger test suite. If it’s not useful now, we
        can scrap it. There are performance issues too that you can see
        when viewing the test data. +1 remove
    - Decision: No objections to removing test sets
  - Reshaping test configurations:
    - YAML-based description now being tested
    - In the process of adding all the devices and test plans to achieve
      same test coverage as we currently have with the “device_map”
    - Removing dead LAVA v1 code
    - Aiming at eventually merging kernelci-build and lava-ci.
    - Looking for feedback on
      https://github.com/kernelci/lava-ci-staging/pull/96
  - Multiple bisections run for single regression: investigating...

- Ana
  - Reporting test suite results:
    - Sent v2 of mail reports last week
      https://github.com/kernelci/kernelci-backend/pull/70 Comments
      welcome. This is a first step to start getting the results of the
      test suites by mail.
    - Sent small PR fixing a problem with the template for sending
      duplicate mails
  - Start reporting on regressions: this is blocked by the point
    mentioned above about test suites/sets/cases. I would like to send a
    PR to the backend for tracking and reporting test suites regressions
    in the test suites but If we want to use test sets, some code needs
    to be added to fix its usage in the backend.
  - Documentations update
    - Added 2 new pages documenting the test suites (on-going) and the
      rootfs images used by the test suites.
    - http://wiki.kernelci.org now tell readers about the github wiki.
    - Help welcome savaging the useful parts from wiki.kci.o
    - Diagrams and other graphics can be added in the github wiki via
      git : git@github.com:kernelci/kernelci-doc.wiki.git
    - [drue] it looks like you can’t host a github wiki at its own url,
      can you? I looked.
      - [ana] no, but it’s stored in markdown in a git repo and we could
        use something else to render and host it in the future.
    - Github permissions - right now I can’t ask people to review
      kernelci related pull requests
      - [matt] https://github.com/orgs/kernelci/teams exists but needs
        to be made better

- Milosz
  - Kernelci testing data presentation in SQUAD:
    https://staging-qa-reports.linaro.org/kernelci/
  - [ana] can results be filtered by date?
    - [milosz] you can use the API to get that. In the UI it’s sorted by
      date, but you can’t filter by date
  - [matt] it looks better than kernelci’s views. Some of the sorting
    and mapping can be improved
    - https://staging-qa-reports.linaro.org/kernelci/ shows it by
      branch, but what if someone wants to see it by board or by
      architecture/defconfig
    - [milosz] i’m working on filtering by environment (architecture,
      board), so that users can view results by board, or by config
      - [milosz] I’m currently working on
        https://github.com/Linaro/squad/issues/245
    - [guill] custom views would be really nice so that an individual
      could have a search for what they’re interested in that could be
      saved in a link, and shared that way
      - [milosz] this is a nice idea
      - [matt] here’s an example of a multi-field search in kernelci
        https://kernelci.org/boot/?apq8016-sbc%20lab-mhart%20master%20next
        - lava/squad doesn’t do that because of django’s default filter
          implementation
