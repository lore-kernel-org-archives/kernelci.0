MIME-Version: 1.0
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Tue, 27 Nov 2018 15:45:54 +0000
Message-ID: <CAH+k93FBXe0hvJYEgm=BkjRD=Wr9fqeZ6aJO1RsLR7iD+HYT_g@mail.gmail.com>
Subject: Backend troubles - temporarily refusing to accept test results
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

The kernelci API has been struggling since last week, to the point
that the celery service grinds to a halt and stops processing some
requests. This causes the website to hang, the API to start timing
out, and general failures in the service.

For reasons we (Guillaume and I) have not yet been able to fully
understand, the importing of test results takes much longer than other
tasks and causes the highest load. We are now running more test jobs
than before and the data structures will likely need tuning in the
future.

As the service failures are becoming more and more frequent, in an
attempt to keep the core service up and running, we have decided to
make a quick patch to production to temporarily stop processing test
results, until such time as the problem is better understood.

Matt
