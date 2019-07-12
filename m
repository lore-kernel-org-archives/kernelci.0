From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-07-12
Message-ID: <20df5b37-b8a3-a3a9-7348-d0be2f28e2f3@collabora.com>
Date: Fri, 12 Jul 2019 19:47:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add lab-clabbe

* improve i-g-t test results parsing, to group sub-tests and use the exit code
  to determine pass/fail/skip status

* rename igt to igt_drm_kms, so we can also have other igt_* test plans for
  GPUs (igt_i915, igt_panfrost...)

* add support for regular expressions in YAML config filters

* reduce number of builds for the linusw tree

* add qcom-lt/integration-experimental branch


kernelci-backend
----------------

* fix handling of LAVA mangling of test suite names with an underscore, such as
  igt_drm_kms

* improve clarity of test email reports, still showing a lot of information
  mostly to compensate for lack of good web dashboard


Best wishes,
Guillaume
