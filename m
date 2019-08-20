Return-Path: <dan.rue@linaro.org>
Date: Tue, 20 Aug 2019 13:16:45 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-08-20 #minutes
Message-ID: <20190820181645.agwgvpx3mpu5hy7u@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Daniel, Kevin, Mark, Anders, Dan, Guillaume, Nick

- Matt (off ill today)
  - Should we look at running KUnit and/or KTF
    - [gtucker] KUnit discussed in July (short answer is “yes”):
      https://groups.io/g/kernelci/message/465 

- [drue] DHCP issue in lkft linaro lab on x15
  - Sounds like it may be a u-boot bug. Per Milosz, a lease is issued
    from dhcpd but the client does not accept it. If the client runs
    dhcp twice, it always accepts it on the second try, as a workaround.
    It started happening on one particular board after a u-boot upgrade.
    Montjoie in #kernelci has seen similar on pine64.
    - Workaround is running “dhcp;dhcp”, implemented in the device-type
      definition
    - Dan will follow up with linaro lab and see if they’re willing to
      implement the workaround.

- clang vs. big-endian
  - workaround that removes host gcc is necessary but not sufficient to
    fix the problem
    - [gtucker] there’s a special function to generate the kselftest
      fragment already in kci_build, this can remain unchanged while we
      use a new Python implementation to enable/disable extra configs
      for all the other cases (until we need kselftest with clang)

