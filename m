From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Hourly, daily, weekly monitoring
Message-ID: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
Date: Mon, 4 Mar 2019 13:20:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Linus Walleij <linus.walleij@linaro.org>

Hello,

All the branches currently build on kernelci.org are monitored
for new changes every hour.  While this has shown over time to be
a good frequency for mainline branches, some subsystem ones may
be updated a lot more often.  Monitoring them every hour would
cause a lot of unnecessary builds and tests.  This topic was
recently brought up again[1] around the addition of the GPIO
branches, which Linus Walleij said could be monitored once a day
instead.

So it seems like it would be beneficial to add some parameters to
the YAML build configuration to be able to tell how often each
branch needs to be checked for new commits.  There should also be
some command line option in kci_build to help implementing that
in an automated build system such as Jenkins Pipeline (say, to
know the time when a branch needs to be checked again...).

I'm not entirely sure how much flexibility Jenkins can offer in
that respect, but at least having 3 versions of the monitor job
that runs every hour, every day and every week should cover all
the cases.  If possible, we may be able to implement something
that dynamically schedules the next check for each branch.

How does that sound?

Best wishes,
Guillaume

[1] https://groups.io/g/kernelci/topic/adding_tree_to_kernelci/29605396
