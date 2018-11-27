MIME-Version: 1.0
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Tue, 27 Nov 2018 07:23:45 -0800
Message-ID: <CAOi56cX4sV=jD0ctuQROh3r8JtcL4285i-g8k7Ew3knnD3v8Ww@mail.gmail.com>
Subject: failing ARC builds in kernelCI
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: kernelci@groups.io

Hi Alexey,

You may have noticed that some defconfigs are failing to build
upstream for ARC.  For example, on mainline, both allnoconfig and
tinyconfig fail to build[1].

Do you guys have any plans to fix these, or should we disable them?
We currently build these for all the other arches.,

Kevin

[1] https://kernelci.org/build/mainline/branch/master/kernel/v4.20-rc4-7-gef78e5ec9214/
