From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 20190322 #minutes
Message-ID: <48b4c2bc-4012-e6e3-2ae8-a0f3a33fc573@collabora.com>
Date: Fri, 22 Mar 2019 08:45:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production on kernelci.org:

* stretch-igt: fix due to test that was renamed upstream
* kernelci.configs: docstrings for build configurations
* README: updated to match current state of the repository
* cleanup: remove stale scripts
* build-configs: add linux-5.0.y branch in stable and stable-rc

A kernelci-20190321 tag was created at today's revision in
kernelci-core.


This is the first release that is not using the
kernelci-core-staging repository which has now been archived:

  https://github.com/kernelci/kernelci-core-staging

All the PRs in that repository have either been merged or closed,
and all open issues moved to kernelci-core which is now the main
repository for development:

  https://github.com/kernelci/kernelci-core

The code used in production can now be found on the kernelci.org
branch in that repository, and the staging.kernelci.org branch is
used on staging.kernelci.org.

The Workflow wiki page has been updated accordingly with the
steps to update production code on kernelci.org, there is some
on-going work to automate parts of this now:

  https://github.com/kernelci/kernelci-doc/wiki/Workflow

There are no changes in kernelci-backend or kernelci-frontend
going into production today.

Best wishes,
Guillaume
