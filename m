Return-Path: <spbnick@gmail.com>
Message-ID: <54539125-b4fe-c219-cad9-e511e6271875@gmail.com>
Date: Fri, 1 Jul 2022 15:41:51 +0300
MIME-Version: 1.0
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Subject: #KCIDB: Publishing known issues
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Alice Ferrazzi <alicef@gentoo.org>, automated-testing@lists.yoctoproject.org, Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Johnson George <Johnson.George@microsoft.com>, Veronika Kabatova <vkabatov@redhat.com>, Guillaume Tucker <guillaume.tucker@collabora.com>

Hello everyone (potentially) involved with sending data to KCIDB,

I've finally started working on receiving and handling "known issues" in 
KCIDB. There's plenty of problems to solve, and lots of work to do, but 
there's one thing in the future protocol I'd like to discuss.

First of all a few base ideas to fill you in:

* KCIDB will accept issue objects describing things like test names, statuses, 
architectures, compilers, execution environments, commit/revision ranges, 
output regexes, and so on, matching particular incidents in build and test 
results, and linking them to bug reports.
* KCIDB will triage submitted data in order to find issues, and either 
suppress notifications of known issues, or trigger notifications for new 
issues. Issues from *each* submitter will be used to triage data from *all* 
submitters.
* KCIDB will allow submitters to modify their issues, e.g. to correct regular 
expressions, add or remove bug reports, and modify matching conditions in general.

And it's the last point I'd like to talk about.

The KCIDB protocol doesn't allow modifying object fields, only adding their 
values. That is, for example, you can submit a description of a test without a 
status, when starting it, and then when it's finished, you can submit this 
same test (using the same ID), but only containing the resulting status (and 
perhaps links to logs).

If you submit different field values for the same object, it will be 
impossible to say which one would be used. So don't do that :) It's OK to 
submit the same object with the same field values multiple times, though. This 
gives us space to implement a distributed database without having a single 
synchronization point (BigQuery is one such database we're using). This also 
allows submitters to e.g. just send the same revision (checkout) data with 
every build result, making interfacing easier.

Unfortunately, this protocol leaves us without a direct way of *editing* 
objects, such as the issues we want to introduce. I.e. you can't just send a 
new version of an issue, with other field values, because the result would be 
unpredictable.

So, in a way, instead of accepting "issues", KCIDB will be accepting "issue 
*versions*" (as once suggested by Guillaume in a somewhat different context). 
That is, each issue would have a "version" field containing an integer, which 
would be a part of its unique ID, along with the regular submitter-supplied ID 
(as done for checkouts/builds/tests right now). Something like this:

{
     "version": {"major": 5, "minor": 0},
     "issues": [
         {
             "origin": "syzbot",
             "id": "syzbot:264b703d22effb171549375ad8aa17704033f1ae",
             "version": 3,
             "comment": "WARNING in cfg80211_ch_switch_notify",
             ...
         }
     ]
}

Every time a submitter needs to change an issue in KCIDB they would need to 
send it again, but with a bigger version number (it doesn't have to be 
continuous). KCIDB would always use the highest-numbered version for triaging.

In practice, submitters storing their issues in a database, would need to have 
a field incremented each time an update is done, and would need to put that 
field into the issue's version when submitting to KCIDB.

Submitters storing issues in a git repository could instead send e.g. the 
output of "git log --oneline | wc -l" for the commit containing the submitted 
issue(s).

In a pinch, just an integer representing precise-enough timestamp  of the last 
issue change would be enough. And if two successive edits ever get the same 
timestamp, it would be enough to just "touch" and resubmit the issue to recover.

There's obviously lots and lots more to think about and discuss regarding 
"known issues", but please tell me what you think about this particular 
aspect. Everything else is welcome too, of course :)

Thank you!
Nick
