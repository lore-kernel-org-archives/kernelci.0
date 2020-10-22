From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-10-22 #minutes
Message-ID: <065d07b8-74f0-2872-0660-265ba5948ce0@collabora.com>
Date: Thu, 22 Oct 2020 21:20:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production
========================================

* use clang-11 on linux-next
* add LTP test plan with IPC tests
* add preempt-rt test plan definition
* add Rob Herring's for-kernelci branch
* enable new devices and fix minor issues in bootrr
* add initial documentation on how to add test plans
* fix kselftest build errors with missing dependencies
* fix v4l-utils build in buster-v4l2
* fix performance issue with SoC view on frontend
* show number of regressions in test email reports
* fix login test case with LAVA 2020.03 onwards
* redesign pass/fail/unknown counts on kernelci.org frontend
* kcidb v8 release https://github.com/kernelci/kcidb/releases/tag/v8


Technical Steering Committee minutes - 2020-09-29
=================================================

* kcidb: Working with Dmitry Vyukov to start sending syzbot data
* Kubernetes: cleanup of completed but not removed jobs
  (mostly because jenkins fails to connect to k8s cluster)
* LTP: First LTP results on staging thanks to Laks
* Jenkins: random failures, need to look for alternatives
* staging.kernelci.org: considering rotation of mainline/stable/next
* Tekton experiments: https://github.com/threexc/yocto-tekton

Technical Steering Committee minutes - 2020-10-06
=================================================

* KUnit: works well locally, still needs some things to be adjusted
  https://github.com/kernelci/kernelci-core/pull/464
* kcidb: syzbot data is now live
  https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=syzbot&var-git_repository_url=All&var-dataset=kernelci04
* kcidb: Grafana dashboard updated to aggregate data better

Technical Steering Committee minutes - 2020-10-13
=================================================

* clang:
  * discussing new architectures to build and stable branches
  * missing build email reports from linux-next
* kcidb:
  * v8 released, with support for streaming JSON
  * issue with missing timezone information in kernelci-backend data
* LAVA: issue with auto-login-action renamed in 2020.03
* Tekton / Kubernetes:
  * making progress with experiments, should plan PoC after ELC-E week
  * see also useful text-mode control interface: https://k9scli.io/

Technical Steering Committee minutes - 2020-10-20
=================================================

* kernelci-backend:
  * fixed timestamp issue in kernelci-backend
  * adding missing Mongo DB indexes for SoC views
* kselftests: looking into fixing more build errors
* Tekton / Kubernetes:
  * still making progress with https://github.com/threexc/yocto-tekton
  * see also: https://kubevirt.io/user-guide/#/


Advisory Board minutes - 2020-09-30
===================================

* LPC blog post published
  https://foundation.kernelci.org/blog/2020/09/23/kernelci-notes-from-plumbers-2020/
* Discussing options for designing a new web dashboard / user experience

Advisory Board minutes - 2020-10-14
===================================

* Discuss upcoming talks for ELC-E, things to tweet about
* Planning a technical meeting to share maintenance work with more people


Best wishes,
Guillaume
