Return-Path: <dan.rue@linaro.org>
Date: Tue, 8 Oct 2019 14:40:44 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-10-08 #minutes
Message-ID: <20191008194044.z6ofjedw3yyedn4p@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Dan, Guillaume, Kevin, Mark, Michał, Nikolai, Daniel

- Project Launch (Oct)
  - What should be on the launch website?
    - historical stats  “and counting…”
    - consolidation of existing project (links)
    - quotes from participants

- Skiplists

- Grafana
  - Kevin has someone on his team doing experiments
  - will also share some BQ keys for accessing shared db

- Nikolai
  - Experimenting with connecting to common reporting

- kcidb / schema discussions
  - Ability to compare results at any level: test suites or individual
    cases
    - Each test result has a field called “path”, which contains a path
      in the canonical test classification tree, e.g. “ltplite.kmsg01”
      for a particular LTPLite test, or “ltplite” for LTPLite as a
      whole, or “” for all test suites for a particular build.
  - Waived test cases as part of the schema to be able to compare
    between CI systems
  - we will also need a “test” that summarizes all test suties for a
    particular build (for a given CI system)
    - One way to do this is to walk the set of tests being submitted,
      ignoring waived tests, take each test’s classification path, and
      store the worst status (see below) for each parent node, up to and
      including the root (“”). After that is done, synthesize entries
      for the new nodes and submit them alongside the actual results.
      This shouldn’t be done by kcidb, since it has to accept partial
      results of testing in progress, and won’t know if summaries are
      coming from the client, and if a particular classification node
      would have more children at next submission within the same test
      run. However some separate library/routine could be implemented
      for this.
  - The possible test statuses could be arranged by priority (highest
    first): ERROR, FAIL, PASS, DONE, SKIP. See the I/O schema
    documentation for details on particular statuses. When summarizing a
    test run, a test’s status could be compared with e.g. a suite’s
    status and bump the priority up, if it’s higher. E.g. for a suite
    with two tests with various statuses, there would be the following
    suite status:
    - DONE, DONE -> DONE
    - SKIP, SKIP -> SKIP
    - PASS, PASS -> PASS
    - FAIL, PASS -> FAIL
    - ERROR, FAIL -> ERROR
    - ERROR, SKIP -> ERROR
    - DONE, SKIP -> DONE
  - Ultimately, it is up to the submitting CI system to summarize their
    runs the way they see fit, as well as to explain it to developers.
    However, if we want to have our dataset easier to use for reporting
    and statistics, we have to do summarizing before storing the
    results.

- Guillaume
  - Working on connecting kernelci-backend to BQ
  - Rewriting LAVA job submission with kci_test and Jenkins Pipeline
  - Adding measurements to test reports (i.e. number of kernel log
    errors…)
  - Alex is rebasing AGL’s kernelci-frontend patches to fix Tests view

