MIME-Version: 1.0
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 24 Aug 2018 15:20:33 +0100
Message-ID: <CAH1_8nAr9PK=BCXZsH4NVm7=2xn5ZAx-xQWA6MKfWwTL-ROEdw@mail.gmail.com>
Subject: Weekly meeting agenda items + reschedule to Thursday?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

Monday 27th August being a national holiday in the UK, can we
move this meeting to Thursday 7pm BST (UTC+1)?  Ana and myself
can make that time, and it should also hopefully be easier for
Kevin and Guenter to join then.

Agenda items from Collabora:

* YAML test configuration

  https://github.com/kernelci/lava-ci-staging/pull/96
  Tested on staging, polishing documentation now.


* Test results backend refactoring

  Based on the outcome of past discussions, we suggest that we
  replace the current backend test models implementation (suite,
  sets, cases) with more flexible ones (group, cases) in order to
  allow more flexibility in terms of hierarchy.  This would seem
  like a starting point with the minimal changes required to be
  able to store test results from any test suite.


Best wishes,
Guillaume
