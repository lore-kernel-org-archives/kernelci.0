Return-Path: <dan.rue@linaro.org>
Date: Tue, 22 Oct 2019 12:00:14 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-10-22 #minutes
Message-ID: <20191022170014.2zzmbl3j32ia5pia@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

2019-10-22
Attendees: Dan, Nikolai, Mark, Michał, Guillaume
Kevin: unable to attend (at AGL conference)

- Michał
  - Adding reference branches for bisections
    - https://github.com/kernelci/kernelci-core/pull/186
  - Enable staging celery and backend logs view over http(s)
    - https://github.com/kernelci/kernelci-backend/issues/171
  - Move Kernel source tarballs download from Jenkins pipeline to
    kci_build
    - Are there any other cases than HTTP errors when a download retry
      is needed?
    - https://github.com/kernelci/kernelci-core/pull/216
- Guillaume
  - Bug hunting: missing whitelist for lab-clabbe, missing filter checks
    for test plans causing more jobs than needed to be run
  - Upgrading kernelci.org server to Debian Buster (already done
    staging.kernelci.org)
  - Will be adding more fields to the kcidb data sent from backend later
    this week
- Dan
  - How do cki and kernelci plan on running kcidb importer?
  - Next steps for lkft to integrate with kcidb.. 
    - Get data into json based on schema.. Then what?
- broonie
  - Will’s branch?
    - [Guillaume] I’ll take care of that, already mentioned on irc

2019-10-15
Attendees: Matt, Nikolai, Mark, Kevin
- kcidb
  - adding git branch, git describe
  - how to properly update / evolve BQ schema?
    - allow inputs for several versions
    - update by dumping old, re-importing with new
    - handle multiple versions on the input side, but only latest
      version on the storage side
- log aggregation exploration (loki, etc)
- lab-baylibre: lots of issues with Kevin’s seattle worker
  - updated and back online

