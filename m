Return-Path: <dan.rue@linaro.org>
Date: Tue, 11 Jun 2019 11:33:18 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-06-11 #minutes
Message-ID: <20190611163318.vax4odp7edvtydfc@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Milosz, Charles, Guenter, Amro, Kevin, Matt, Dan, Daniel

- Kevin
  - Kernel log level for kernel logs and parsing
    - Linux 5.0+ has support for better logging we could use
  - Need kernelci-core to support kernel command-line appends on a per
    tree/branch basis
  - I’ll look into this

- Dan
  - Lava alias support in 2019.05
    - They are database objects, available at
      https://<lava>/admin/lava_scheduler_app/alias/
      - Xmlrpc supported
      - Lavacli supported
      - Open merge request for ‘lava-server manage’ support @
        https://git.lavasoftware.org/lava/lava/merge_requests/586
    - Works as expected and solves kernelci’s problem
