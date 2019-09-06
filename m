From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-09-06
Message-ID: <77deb59c-76ca-e16e-5254-8bc49c7200c0@collabora.com>
Date: Fri, 6 Sep 2019 20:45:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* v4l2: upgrade test file system to Debian Buster

* fix error propagation from merge_config.sh which makes the clang arm64
  big-endian build failures clearly appear in the build reports (until a fix
  for merging config fragments is made)

* code refactoring in preparation of adding the new kci_test command line tool


Best wishes,
Guillaume
