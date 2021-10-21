Return-Path: <Nikolai.Kondrashov@redhat.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Reply-To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Message-ID: <ef074ace-e5ed-47d1-5b0b-778f23d2df7b@redhat.com>
Date: Thu, 21 Oct 2021 15:33:44 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>

Hi everyone,

Below is the monthly* report on KCIDB* engagement. It lists various CI systems
and their status of engagement with KCIDB, as well as developer engagement.

This report doesn't have engagement news, as we're fully concentrating on
getting the next release out, so that we can start reaching out to developers.

Right now we have test streams working taking in both the old and the new
schemas and generating notifications, and are working on upgrading our Grafana
dashboards to the new schema as well. Expect the release this Autumn.

Additionally, we're processing contributions from Outreachy internship
candidates and we've got resources for three interns the round starting in
December.

There's one small bit of engagement news, though: ARM is working on switching
to using a KernelCI instance internally, which should fix the faked commit
hashes.

CI Engagement Status

     KernelCI native
         Sending (a lot of) production build and test results.
         https://kcidb.kernelci.org/?var-origin=kernelci

     Red Hat CKI
         Sending production results.
         https://kcidb.kernelci.org/?var-origin=redhat

     Google Syzbot
         Sending a subset of production results (failures only).
         https://kcidb.kernelci.org/?var-origin=syzbot

     ARM
         Sending production results.
!       Full commit hashes are currently not available, are spoofed, and don't
!       match the ones reported by others. There's ongoing switch to using a
!       KernelCI instance setup, which should fix this.
         https://kcidb.kernelci.org/?var-origin=arm

     Sony Fuego
         Internal design in progress.

     Gentoo GKernelCI
         Sending production results.
         Only builds (a few architectures), no configs, no logs, and no tests
         for now, but working on growing contributions.
         https://kcidb.kernelci.org/?var-origin=gkernelci

     Intel 0day
         Initial conversation concluded, general interest expressed,
         no contact since.

     Linaro
         Sending (a lot of) Tuxsuite build results to "production" KCIDB.
         https://kcidb.kernelci.org/?var-origin=tuxsuite

     TuxML
         Initial contact in response to a report.
         There's a plan to approach us and start work in the coming months.

     Yocto Project
         Initial contact in response to a report.
         Would like to start sending build and test results, particularly for
         older kernels. Would like to separate upstream commits from project
         patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196

     Huawei Compass CI
         Sent a message to Fengguang Wu, who was presenting it at LVC 2021.
         No response so far.

Please respond with corrections or suggestions of other CI systems to contact.

Nick

*Sorry, skipped last month update due to Linux Plumbers!

*KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
  Foundation's KernelCI project:
  https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/






