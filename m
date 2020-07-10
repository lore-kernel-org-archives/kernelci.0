MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Fri, 10 Jul 2020 10:58:40 -0700
Message-ID: <CAHRSSEyAgc0FYLtn9ahgFz41nSiM9Dp0e4ZXfK=zPRvCwTTiog@mail.gmail.com>
Subject: Branch renames
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

We renamed a couple of Android kernel branches, so the old names
should be removed from kernelci and the new ones added (the old names
still work, but will go away in a few weeks). Also, the android-4.19
branch is deprecated (other android-4.19-* branches should still be
tested):

Repo: repo: https://android.googlesource.com/kernel/common
Remove: android-5.4, android-5.4-stable, android-4.19
Add: android11-5.4, android12-5.4

-Todd
