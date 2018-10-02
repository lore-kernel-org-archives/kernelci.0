MIME-Version: 1.0
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Tue, 2 Oct 2018 17:37:43 +0100
Message-ID: <CAH+k93HMWWgyUe0aZYvHBC=eykHPT_EZpFeMPT=u0hQjcrdS7A@mail.gmail.com>
Subject: Rolling out the docker builds
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

As the garage builders seem to be down again, and we weren't really
sure they were running the latest ansible changes anyway, I'm planning
to spend tomorrow..

- updating our ansible config to just install and configure docker
- adding a patch to staging to split x86 and x64
- merging the staging kernelci-core so that production can start using docker

This will allow me to move all the Azure builders to production, and
remove any concerns that any builder hasn't been configured recently.

A side effect will mean bumping the GCC versions for x86, arm and
arm64 to at least GCC-7. If anyone thinks we should be using GCC-8,
let me know.
Otherwise, please speak up if you don't want me to do any of this.

Cheers!
