From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: HTML test email reports
Message-ID: <e093b4cd-c5e9-88c1-1974-3fbc927e64e4@collabora.com>
Date: Mon, 7 Jan 2019 17:23:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Part of the work I'm doing to complete test case regressions
tracking is to update the email report format accordingly.  I
found that the current HTML version isn't in a very good shape,
it's not sent to anyone and I believe it's not adding much value.
So I made this PR to drop support for HTML test email reports
rather than spend time to maintain it in its half-broken state:

    https://github.com/kernelci/kernelci-backend/pull/102

This was also discussed on IRC and in today's meeting; it seems
to be the general consensus that concise plain text email reports
are all we need to notify kernel developers of regressions in the
code.  This PR #102 is only for test results, but if we all agree
then we may also drop HTML emails for builds and boots.

If we need anything more fancy showing tables, graphs and more
information, a web-based dashboard with a search feature or some
kind of dedicated application would seem more appropriate.  Maybe
an HTML email report could be sent periodically with a summary of
all the test cases on a given platform, but I think that would be
serving a different purpose and addressing a different audience.

So, please shout if you really care about regular test regression
email reports in HTML format - and if you do then it would also
be great to also help by fixing them.  If I don't hear anything
in favour of them by Friday then I guess the PR will get merged!

Guillaume
