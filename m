From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kernelci.org update - 2020-06-26 #minutes
Message-ID: <da3474b1-03cc-701d-1b5f-87e2ffb4c222@collabora.com>
Date: Fri, 26 Jun 2020 17:14:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Technical Steering Committee minutes - 2020-06-23
=================================================

The whole meeting was dedicated to tuxbuild and tuxmake with Antonio and Dan
from Linaro.  Tuxbuild is a closed service provided by Linaro to build kernels,
using open-source components.  Tuxmake is a new tool, the main open-source
component used by tuxbuild to produce the kernel builds in a portable way.


Some links:
* Email thread: https://groups.io/g/kernelci/topic/kci_build_proposal/73153442
* Gitlab repo: https://gitlab.com/Linaro/tuxmake (kernel build tool)
* Gitlab repo for the cli: https://gitlab.com/Linaro/tuxbuild
* See also: https://pypi.org/project/tuxbuild/ (kernel build service)

Key facts:
* tuxbuild used by LKFT for 6 months, 1000s builds in parallel in cloud
* tuxmake is a replacement for kci_build which LKFT had been using until now
* "thinner" wrapper for plain kernel builds, with no other integration
* portable, reproducible build environment for any kernel developer
* easier to add arbitrary make targets

Some questions:
* How does that compare with k8s? (being used by KernelCI now)
  -> In short, k8s is fine for kernelci since it's already integrated
  -> tuxbuild has its own implementation, buy similar type of technology
* How can we avoid nested Docker, by not calling Docker in tuxmake?
  -> Docker is optional, mostly a convenience for developers
  -> Other runtimes can be added (k8s...)
* Can we have a tuxbuild token please? :)
  -> considering individual tokens for gtucker, khilman, broonie

Discussions:
* Sharing containers in some common repo (kernel.org linked?)
  -> Having a "canonical" repository with Dockerfiles for building upstream
     kernels would be very useful and well aligned with the tuxmake idea.
* Container versioning
  -> Can be done with refined containers for specific toolchain variants
  -> Docker image tags
  -> There are issues with versioning not just toolchain but also other tools
     like binutils that get used during the build.
* Follow-up suggestion about modernizing the TuxML build infrastructure
  -> kernelci k8s, tuxbuild, other build system using tuxmake or kci_build?
* kci_build could use tuxmake as a common kernel build solution with LKFT
* Moving tuxmake to a neutral place, currently in gitlab.com/Linaro
  -> general agreement that it has some advantages, details to be discussed


Advisory Board minutes - 2020-06-24
===================================

* Reviewing survey results
* Agreed to publish survey results next week


Summary of changes going into production
========================================

* Enable lab-cip with initial subset of online devices
* Drop lab-free-electrons as confirmed with Bootlin, it is offline
* Remove all the boot views on frontend to complete the deprecation process
* Align tooltips and page titles on frontend to improve user experience


Best wishes,
Guillaume
