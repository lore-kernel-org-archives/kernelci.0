Return-Path: <dan.rue@linaro.org>
Date: Tue, 30 Apr 2019 12:42:38 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-04-30 #minutes
Message-ID: <20190430174238.7cchz7enqzan3x5u@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Amro, Charles, Daniel, Gullaume, Jan-Simon, Kevin, Matt,
  Michal, Milosz, Dan

- Anders
  - How can I get a read only token to be able to generate testplan with
    LTP for instance.
    - [gtucker] There’s also an option to point the script to a local
      json file (see jenkins/bisect.jpl for concrete example)

- Matt
  - Just want to make sure my ARM64 Clang 8 builds to production steps
    are acceptable
    - 1) Fix build emails that currently only show 1 compiler per arch,
      so wrong compiler gets blamed
      - https://github.com/kernelci/kernelci-backend/pull/129
    - 2) Add build configs to next
      - https://github.com/kernelci/kernelci-core/pull/49
      - Allmodconfig - matt would prefer to enable it on clang/next.
        - [gtucker] lots of warnings and error messages. We just want to
          make a conscious decision
        - [kevin] should wait to enable it until we know who cares about
          it upstream. Will be super noisy. Similar to what we did for
          gcc
        - [matt] google guys are interested. They care about
          allmodconfig.
          - [kevin] that’s fine then
          - [matt] if it doesn’t improve we can reserve the right to
            turn it off if it is too noisy for too long.
          - Guillaume nods :)

- Charles
  - Kci & elk demo:
    - https://github.com/chaws/kcing
    - Can select by build/board/kernel
    - Click on failed boots to see them by clicking on pie chart
    - Click on failed builds in pie chart to see them
    - Build log failure errors implemented
    - Boot log implemented
    - Currently it’s scraping json files from storage. Where are we with
      using callbacks directly?
      - [milosz] should we pull data from api or from lava callback?
        What about builds? Build system would have to implement a
        callback, which was implemented in a pull request
    - Lava callback and kernelci api data are not the same, due to post
      processing by back end.
    - Can you look at raw logs in kibana interface, rather than linking
      to LAVA?
      - ‘View surrounding documents’ link
      - It can show them, but the interface looks a little awkward
      - Can’t go from boot to log lines directly
      - Is it possible?
        - Yes
      - Correlating lava logs with tests is difficult depending on the
        test parsing implementation - if it’s post processed then the
        logs won’t be correlated
    - [charles] Looking for help to continue pushing this forward at
      this point. So far it’s been a research project
      - [kevin] why?
        - [milosz] resource/priority problem
      - [matt] we should roll it out as it is
        - [kevin] needs live data ingestion
      - [charles] current implementation using 15GB of storage, small
        server
        - Elasticsearch can snapshot/restore existing data to somewhere
          else to avoid re-fetching and re-indexing the files
      - Index size
        - One index created per day per type - boot/test/build/log
        - Typical boot index ~1-10mb. ~300mb/day for log data.
        - Seems like aggregated size is around 13Gb..roughly so far
    - Kernelci core multiple callback support
      - [charles] Not sure it’s the right architecture (to have N labs
        make M callbacks)
        - [kevin] if M is 2, it’s OK
      - [drue] sounds to me like a pub/sub architecture
        - https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern
        - https://cloud.google.com/pubsub/architecture
        - https://aws.amazon.com/pub-sub-messaging/
    - IGT regression Fosdem Video
      https://mirrors.dotsrc.org/fosdem/2019/K.4.401/igt_ci.mp4
      - https://fosdem.org/2019/schedule/event/igt_tools/

- Guillaume
  - Sample commands to run kci_build:
    https://github.com/kernelci/kernelci-core/pull/46
  - Also tested on staging, looks like it’s working fine based on build
    and test results

- Kevin
  - lava-lxc-mocker: experiments for android/fastboot devices
  - kernelci-core: generating jobs that support android/fastboot
    devices.
    - needs new templates

- Misc
  - https://groups.io/g/kernelci/topic/lab_token_request/31342059?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,31342059
    - [gtucker] I can run the kernelci-admin command
  - gcc-8 migration ?

