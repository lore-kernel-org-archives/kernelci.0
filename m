MIME-Version: 1.0
From: milosz.wasilewski@linaro.org
Date: Fri, 17 Aug 2018 09:57:41 +0100
Message-ID: <CAJrz+7KhcFVn9ocWctmPveGogeQ8wpxGaQyOxCrdg_cXPNckjA@mail.gmail.com>
Subject: presenting kerneci test data in SQUAD
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

As we agreed 2 weeks ago I tried to import test data from kernelci and
present it in SQUAD (aka qa-reports). I probably didn't import all the
data as it was pretty slow due to this bug:
https://github.com/kernelci/kernelci-backend/issues/69

Anyway, some data is there and you can see it here:
https://staging-qa-reports.linaro.org/kernelci/

The data models in kernelci and squad don't match so I had to do some
mapping. It is as follows:
 - project name in squad consists of kernelci job name + branch name
 - build version in squad corresponds to 'kernel' in kernelci schema
(which I think is output of git describe)
 - test suite and test names are mapped directly
 - environment name in squad consists of architecture name +
defconfig_full + board name

This mapping is just an example and can be done differently if needed.
Any comments are much appreciated. I'll add it to agenda for Monday
meeting.

milosz
