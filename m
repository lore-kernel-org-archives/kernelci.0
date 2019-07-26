From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org update - 2019-07-26
Message-ID: <9fc7078a-0667-c441-53d6-ce9cc01c9468@collabora.com>
Date: Fri, 26 Jul 2019 16:01:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Summary of changes going into production today:

kernelci-core
-------------

* add more boards in lab-clabbe

* add console_msg_format to kernel cmdline to use syslog format (on U-Boot and
  Depthcharge only for now)


kernelci-backend
----------------

* fixed "alliwinnder" typo in stored results in the database, when the SoC name
  should have been "allwinner"
  (per-SoC results can be seen here: https://kernelci.org/soc/)


Best wishes,
Guillaume
