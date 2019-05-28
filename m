Return-Path: <dan.rue@linaro.org>
Date: Tue, 28 May 2019 11:36:13 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-05-28 #minutes
Message-ID: <20190528163613.fkjpnkb4kqkfq3o6@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Mark, Michal, Nick, Kevin, Guillaume, Dan, Charles, Daniel
- Guillaume
  - Baseline test plan: added to the email reports on staging
  - Fixed handling of test plans with multiple test suites in backend
  - Still waiting for some PRs to be reviewed in andersson/bootrr
    - [drue] How can we handle different kernel revisions? (newer
      kernels will have more drivers...)
- Kevin
  - backend: email report requests: can the “test plan” argument be
    optional?
    - it used to be optional
    - should also be able to take a list of test plans
  - began some experiments with Charles’ ELK stack (kcing)
