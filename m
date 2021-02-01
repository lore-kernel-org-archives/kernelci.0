From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2021-02-01 #minutes
Message-ID: <fc134bc4-938f-bd10-52d6-26c5f2fcff60@collabora.com>
Date: Mon, 1 Feb 2021 21:44:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>, kernelci-members@groups.io

Summary of changes going into production
========================================

* use kmsg for baseline to avoid issues with kernel messages on serial console
* enable stable linux-5.10.y as well as corresponding Android kernel branches
* enable i386 Clang builds on mainline and linux-next
* enable ltp-mm tests


Technical Steering Committee minutes - 2020-12-15 ~ 2021-01-26
==============================================================

* Clang
  * Next architectures to build would be s390 and powerpc
  * Considering build variants with CC=clang, LLVM=1 and LLVM_IAS=1
    (currently only doing LLVM=1 in production, with LLVM_IAS=1 for riscv)

* KernelCI Project
  * Discussing TSC roles
  * Assigning maintainers to different parts of the project
  * New GitHub repo kernelci-project to document how the project works

* KCIDB
  * Gentoo's GKernelCI v2 is now submitting data to KCIDB (mainline x86_64)
  * Started sending the KCIDB engagement reports to kernelci@groups.io
  * Discussing submitting Yocto reults with Richard Purdie
  * On-going progress with email notification system

* Tekton
  * New Kubernetes cluster in Azure for development with 10 VMs spot instances
  * Tim's local experiments with Kubernetes cluster of Raspberry Pis
    https://raspbernetes.github.io/docs/installation/
  * On-going experiments, new sandbox repository "kernelci-tekton" on GitHub
  * Investigating how to keep data to avoid cloning kernel trees in each job
  * Considered Jenkins X, not an obvious fit but has Jenkinsfile support

* kernelci-core
  * Moving all Jenkins related files from kernelci-core to kernelci-jenkins
  * Restructuring the configuration files, one step closer to a separate repo
  * Reworking kci_build with separate build steps

* kernelci-backend
  * Refactoring LAVA callback handling to make the code more modular
  * Should help with taking it out of the backend code into client-side
  * Makes it easier to fix corner-case bugs with log line numbers in particular

* kernelci-frontend
  * still some issues with SoC tab, results take too long to appear
  * all the indexes should have been created, this will need a closer look

* perf
  * Still on the roadmap to build it with KernelCI
  * This should become easier once the kci_build rework gets used in production

* kselftest
  * Starting running "collections" of tests, to have smaller jobs


Advisory Board minutes - 2021-01-20
===================================

* Voted new Advisory Board, with new treasurer and new Chair
  (planning blog post soon with all the details)
* Reviewing objectives for 2021
* Reviewing achievements in 2020
* Discussing how to better report results, replying to stable release emails


Best wishes,
Guillaume
