Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Branch renames
In-Reply-To: <CAHRSSEyAgc0FYLtn9ahgFz41nSiM9Dp0e4ZXfK=zPRvCwTTiog@mail.gmail.com>
References: <CAHRSSEyAgc0FYLtn9ahgFz41nSiM9Dp0e4ZXfK=zPRvCwTTiog@mail.gmail.com>
Date: Mon, 13 Jul 2020 10:27:17 -0700
Message-ID: <7heepfqqa2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com, kernelci@groups.io

"Todd Kjos via groups.io" <tkjos=google.com@groups.io> writes:

> We renamed a couple of Android kernel branches, so the old names
> should be removed from kernelci and the new ones added (the old names
> still work, but will go away in a few weeks). Also, the android-4.19
> branch is deprecated (other android-4.19-* branches should still be
> tested):
>
> Repo: repo: https://android.googlesource.com/kernel/common
> Remove: android-5.4, android-5.4-stable, android-4.19
> Add: android11-5.4, android12-5.4

Pull request created: https://github.com/kernelci/kernelci-core/pull/429

Kevin
