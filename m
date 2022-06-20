Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <bc640cc0-5db8-28fe-0d86-48a0c341ffb8@redhat.com>
Date: Mon, 20 Jun 2022 15:48:45 +0300
MIME-Version: 1.0
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB engagement report
Reply-To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, automated-testing@lists.yoctoproject.org

Hi everyone,

Below is the monthly* report on KCIDB** engagement. It lists various CI
systems and their status of engagement with KCIDB, as well as developer
engagement.

Lines with updates are marked with "!".

Microsoft's Liz Zhang left the team and has handed her work to Johnson George.
He has started experimenting with KCIDB and looking at the database schema.

I implemented a dashboard summarizing data for a particular (sub)test on 
request from Daniel Stone. Here's an example:

https://kcidb.kernelci.org/d/test-node/test-node?orgId=1&var-test_path=igt-gpu-panfrost

The tests (and links to this dashboard) are now also visible from the Grafana 
home page.

I've successfully managed to remove BigQuery from our notification-generation 
workflow, switching to PostgreSQL instead, and now our Google Cloud costs are 
in check. The long-term data is still stored in BigQuery and is used for the 
dashboard (the latter might change eventually).

Now I'm mostly done with smaller pending issues and will switch back to 
working on handling known issues.

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
         Full commit hashes are currently not available, are spoofed, and don't
         match the ones reported by others. There's ongoing switch to using a
         KernelCI instance setup, which should fix this.
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

     Microsoft
         I provided Liz Zhang with instructions and credentials for submitting
!       Penguinator data to KCIDB. Johnson George took over from Liz.

Please respond with corrections or suggestions of other CI systems to contact.

Thank you!
Nick

*More-or-less :)

**KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
   Foundation's KernelCI project:
   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

