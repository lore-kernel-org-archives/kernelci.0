From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-07-05
Message-ID: <d7aabd95-b3df-958a-1fe1-144e165b1c56@collabora.com>
Date: Fri, 5 Jul 2019 13:40:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* fix USB test plan (was missing "diff" in Buster rootfs)

* remove android-4.4 branch as it's now deprecated

* fix the ARC image type and get hsdk board to boot

* enable sending email reports for the kernelci tree to a small list of
  recipients for testing purposes


Best wishes,
Guillaume
