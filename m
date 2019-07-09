Return-Path: <dan.rue@linaro.org>
Date: Tue, 9 Jul 2019 13:51:49 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-07-09 #minutes
Message-ID: <20190709185149.bafily25pf4yvzbs@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Guillaume, Mark, Michał, Daniel

- Guillaume
  - Updated igt tests, with igt_drm_kms test plan
  - Updated test email report format, any thoughts?
    https://github.com/kernelci/kernelci-backend/pull/144
    - Would be good to have smaller email reports with just regressions
      (new ones, fixed ones) and offload the details to the web
      front-end
  - Gradually fine tuning build configurations, adding support for regex
    filters Looks like we should stop building some arches with older
    kernels
  - Thoughts on adding the QCom landing team tree? It sounds like we
    should have some guidelines regarding branches we want to be part of
    kernelci.org
    - We can add this tree because it’s not going to be updated very
      often.
  - Should we envisage running unit tests such as KUnit?
    https://www.phoronix.com/scan.php?page=news_item&px=KUnit-Linux-Kernel-V1
    https://lwn.net/Articles/791279/
    - Yes, it would take some work to get the infra in place (run on
      Jenkins builders, VMs in LAVA…) but it makes sense to add it to
      kernelci.org

- Michal
  - Test API current status
    - All the changes and updated unit tests are in the PR.
    - E2E test in preparation if it produces sensible results, PR can be
      merged.
  - Check test API changes with Kevin if he joins the meeting

- Kevin
  - OoO this week
  - multinode jobs: how to handle in the backend
    - e.g. there is one callback, but multiple logs (one for each
      sub-job)
    - [gtucker] The test results database hierarchy should be able to
      handle that quite easily, with each job contributing different
      sub-groups
    - [gtucker] For logs, they would need to be saved in separate files
      with top-level groups pointing at them.  It’s a bit more messy at
      the moment. Having log fragments associated with each test result
      would make it easier to manage as they would become attributes of
      test results.
