Message-ID: <5fd1a35c-f84e-1c6a-4a3a-be76dda97ca3@collabora.com>
Date: Wed, 2 Feb 2022 13:32:31 +0000
MIME-Version: 1.0
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Subject: kselftest tree on kernelci.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Collabora Kernel ML <kernel@collabora.com>

Hi Shuah,

I've made this PR to start monitoring the "fixes" branch from the
kselftest tree on kernelci.org:

  https://github.com/kernelci/kernelci-core/pull/998

While kselftest changes eventually land in linux-next, monitoring
your tree directly means we can test it earlier and potentially
enable more build variants or experimental tests.  Since
kernelci.org also builds and runs some kselftests we're regularly
finding issues and people are sending fixes for them.  See this
recent story for example:

  https://twitter.com/kernelci/status/1488831497259921409

Keeping an eye on kselftest patches with kernelci.org means we
can verify that fixes do what they're supposed to do with a much
larger test coverage than what individual developers can do.
We've been applying kselftest fixes on a branch managed by
kernelci.org to verify them in the past, but having the actual
kselftest tree part of the workflow would seem much better.

There are several branches in your tree, while "fixes" seemed
like the most useful one to pick I see there is also a "kernelci"
branch too but it hasn't been updated for a while, reviving it
could give you the possibility to test patches through
kernelci.org before applying them on other branches that get
pulled into linux-next and mainline.

Many things could potentially be done with arbitrary builds and
tests etc.  These are some initial suggestions.  How does this
sound?

Best wishes,
Guillaume
