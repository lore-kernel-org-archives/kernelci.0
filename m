From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB: Adding support main test log #KCIDB
Message-ID: <8b0a7c15-4a60-05b7-a213-88a5c6705e0a@redhat.com>
Date: Wed, 24 Feb 2021 15:50:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

Hi everyone,

To anyone involved/interested in contributing to KernelCI's KCIDB data
and code, I'd like to announce a small, but noticeable change to the
schema to let us develop result notifications further, and to move
closer to reaching developers with our data.

We'd like to add support for optional "log_url" and "log_excerpt" fields
for "tests".

Currently submitters use the "output_files" array in "test" objects to
specify test outputs and log files. However, the "log_url" field would
allow specifying the "main" output/log file. If there are multiple
outputs, that should be the one containing the highest-level overview of
test's operation. The file from which e.g. failure investigation could
start.

The "log_excerpt" field can then contain an excerpt from that file, that
is most relevant to the test's outcome. E.g. the "kernel BUG" line from
a kernel panic, a backtrace, or the failure message from a user-space
test.

This would help accommodate Intel's 0-Day with their log snippets, and
in general allow providing a summary of what happened with the test,
right in the notification message or the dashboard page.

The "log_excerpt" field is capped at an arbitrary 16KB, just to start
with something. We can adjust that later based on experience.

For example, this syzkaller test report:

     {
         "version": {
             "major": 3,
             "minor": 0
         },
         "tests": [
             {
                 "id": "syzbot:df827b4838ef76799a16",
                 "build_id": "syzbot:e4a93385a6bee61517eb1bbd18806a5023ecf21b",
                 "origin": "syzbot",
                 "path": "syzkaller",
                 "description": "kernel BUG in validate_xmit_skb",
                 "status": "FAIL",
                 "waived": false,
                 "start_time": "2021-02-10T04:03:05+00:00",
                 "output_files": [
                     {
                         "name": "report.txt",
                         "url": "https://syzkaller.appspot.com/x/report.txt?x=13e06c24d00000"
                     },
                     {
                         "name": "log.txt",
                         "url": "https://syzkaller.appspot.com/x/log.txt?x=15d35088d00000"
                     },
                     {
                         "name": "machine_info.txt",
                         "url": "https://syzkaller.appspot.com/x/minfo.txt?x=fd54728f33af8180"
                     }
                 ],
                 "misc": {
                     "origin_url": "https://syzkaller.appspot.com/bug?extid=df827b4838ef76799a16",
                     "reported_by": "syzbot+df827b4838ef76799a16@syzkaller.appspotmail.com"
                 }
             }
         ]
     }

Could have the "report.txt" file referenced by the "log_url" field, and could
have a few most important lines from it in the "log_excerpt" field:

     {
         "version": {
             "major": 4,
             "minor": 0
         },
         "tests": [
             {
                 "id": "syzbot:df827b4838ef76799a16",
                 "build_id": "syzbot:e4a93385a6bee61517eb1bbd18806a5023ecf21b",
                 "origin": "syzbot",
                 "path": "syzkaller",
                 "comment": "kernel BUG in validate_xmit_skb",
                 "status": "FAIL",
                 "waived": false,
                 "start_time": "2021-02-10T04:03:05+00:00",
                 "log_url": "https://syzkaller.appspot.com/x/report.txt?x=13e06c24d00000"
                 "log_excerpt": "kernel BUG at net/core/dev.c:2648!\ninvalid opcode: 0000 [#1] PREEMPT SMP KASAN\n",
                 "output_files": [
                     {
                         "name": "log.txt",
                         "url": "https://syzkaller.appspot.com/x/log.txt?x=15d35088d00000"
                     },
                     {
                         "name": "machine_info.txt",
                         "url": "https://syzkaller.appspot.com/x/minfo.txt?x=fd54728f33af8180"
                     }
                 ],
                 "misc": {
                     "origin_url": "https://syzkaller.appspot.com/bug?extid=df827b4838ef76799a16",
                     "reported_by": "syzbot+df827b4838ef76799a16@syzkaller.appspotmail.com"
                 }
             }
         ]
     }

If you'd like to switch to v4 schema (once it's deployed), but are not yet
able to start specifying the main output/log file or its excerpt, you would be
able to continue using just "output_files", but, of course, without the
benefits of the new fields.

The PR for the corresponding code change is up at:

     https://github.com/kernelci/kcidb-io/pull/27

Please don't hesitate to respond with any comments, objections, or
suggestions.

If there are no objections, I'll merge this change on Tuesday, Mar 2.

Nick

