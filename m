Return-Path: <dan.rue@linaro.org>
Date: Mon, 7 Jan 2019 08:55:13 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Weekly Meeting 2019-01-07 #minutes
Message-ID: <20190107145513.4oosoppkjwchcman@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

- Attendees: Charles Oliveira, Daniel Díaz, Guenter Roeck, Guillaume
  Tucker, Dan Rue, Mark Brown, Amro Hassaan, Matt Hart

- [gtucker]
  - Problem with MIPS docker image: the gcc-7.0 and 6.3.0 versions
    aren’t interchangeable as they have different CROSS_COMPILE values,
    causing build.py to fail.  See this reverted commit:
    https://github.com/kernelci/kernelci-core/commit/1ed700609331331a8b7ba003696a11ef240f8089
    [gtucker] check with khilman which MIPS variant is required to be
    built to boot test
  - Does anyone still want test report emails in HTML format?  See this
    PR: https://github.com/kernelci/kernelci-backend/pull/102 [gtucker]
    will send an email to the list to ask
  - Working on tracking test case regressions and reporting them, next
    step is to bisect them.

- [matt]
  - Assuming multiple compiler lands soon, what trees do we want built
    with what compilers?
    - [broonie] Suggest -next with tip clang and all the GCC versions
    - [matt] first steps will be: linux-next - gcc 7, gcc 8, and clang
      LLVM.org snapshot
