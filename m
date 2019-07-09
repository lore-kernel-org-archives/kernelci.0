MIME-Version: 1.0
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Tue, 9 Jul 2019 16:11:00 +0530
Message-ID: <CAP245DXSaoGJ4STssCqa-Fr3eGE7Qu=BGGyNFgZnz+z0gAVXNw@mail.gmail.com>
Subject: New experimental branch for Linaro Qualcomm Landing Team
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: info <info@kernelci.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>

Hi,

I'd like to request a new branch to be tracked by kernelci.org to
allow more experimental patches that could use much wider testing
across boards and architectures.

We currently use our 'integration' branch[1] for this but that causes
disruption for people who depend on this branch to keep working.

This experimental branch shouldn't see too many updates and would
likely only be used to get better testing for experimental series.
Would you be ok to pick up such a branch[2] into kernelci?

Regards,
Amit
[1] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git
integration-linux-qcomlt
[2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git
integration-experimental
