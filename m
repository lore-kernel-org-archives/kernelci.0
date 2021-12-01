Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <a707847a-73a3-af9a-96d1-070cd294dbe8@redhat.com>
Date: Wed, 1 Dec 2021 20:01:17 +0200
MIME-Version: 1.0
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB v9 release
Reply-To: Nikolai.Kondrashov@redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io, Vishal Bhoj <vishal.bhoj@linaro.org>, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>

Hello everyone,

I'm proud to announce the release and deployment of KCIDB v9.

Please see the detailed list of changes at
https://github.com/kernelci/kcidb/releases/tag/v9

Most important changes are listed below.

* Switch to using the new v4 I/O Schema, with following changes:
     * rename "revisions" to "checkouts",
       use origin-generated IDs for them, similar to other objects;
     * add "patchset_hash" field to checkouts,
       remove "publishing_time" field, and
       rename "patch_mboxes" to "patchset_files";
     * rename "description" fields to "comment" everywhere;
     * add "log_url" field to tests;
     * add "log_excerpt" field to all objects;
   See complete schema at
       https://github.com/kernelci/kcidb-io/releases/download/v3/kcidb.v4.schema.json

* Reimplement the ORM, subscription, and notification systems to provide more
   compact notifications with concise summaries for revisions, builds and tests
   across all submitting CI systems. Add flexibility to quickly implement new
   aggregations and custom, subscription-specific notifications.
   Examples:
     https://groups.io/g/kernelci-results-staging/message/8607
     https://groups.io/g/kernelci-results-staging/message/8639
     https://groups.io/g/kernelci-results-staging/message/8626
   (notifications are sent on first failures, and don't contain later data)

* Add following features to dashboards:
     * Differentiate revisions and checkouts
       E.g. see the three separate checkouts for this revision:
         https://kcidb.kernelci.org/d/revision/revision?var-git_commit_hash=58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
     * Show all tests aggregated for revisions and checkouts, and
       allow browsing the test tree and filtering by test tree nodes.
       E.g. display just the LTP results for a revision:
         https://kcidb.kernelci.org/d/revision/revision?var-git_commit_hash=5f53fa508db05246c7b460829a667ffc9a0bb0c4&var-test_path=ltp
       or see all executions of LTP's chdir01a test case:
         https://kcidb.kernelci.org/d/revision/revision?var-git_commit_hash=5f53fa508db05246c7b460829a667ffc9a0bb0c4&var-test_path=ltp.chdir01a
       (you'll have to scroll down for both of these)
     * Display log excerpts for builds and tests directly on their dashboards
       (pending actual excerpt submissions from CI systems)

* Rename the submission queue topic for production from "kernelci_new" to
   "kcidb_new", and for playground from "playground_kernelci_new" to
   "playground_kcidb_new". This is done to unify KCIDB namespace inside Google
   Cloud and to help automate deployments. The old names will keep working
   until Dec 31.

* Name the new production dataset "kcidb_01", and playground dataset
   "playground_kcidb_01". New submissions are arriving there since yesterday,
   and the data from the old dataset should finish migration in a few hours.

* Publish KCIDB documentation on the kernelci.org website:
     https://kernelci.org/docs/kcidb/
   Feedback and contributions welcome!

ATTENTION CI SYSTEMS!

* It's strongly recommended to upgrade to the v4 schema, if you're testing and
   sending revisions more than once (from the same or different repositories).
   It uses origin-generated checkout IDs, which allows each checkout to be
   differentiated, and every one's data preserved.
* Remember to set the checkout's "patchset_hash" field to empty string when
   using schema v4, if you're not applying any patches on top of the commits.
   If you do apply patches, put their hash there. Otherwise your results might
   not appear in notifications and dashboards.
* Remember to switch to the new submission topics (above) by Dec 31!

WHAT'S NEXT

This release cycle was way too long, mostly due to rework of ORM,
subscription, and notification systems. After this release we'll focus on
making faster and smaller releases, and we already started work on automating
our deployment, improving CI, and adding CD, which should help with that.

Apart from that, our main target will be adding support for registering and
masking known failures and regressions, so developers and maintainers could
receive reports only about new failures.

However, even without support for that, we're prepared to use our flexible
subscription and notification system to tailor our messages and minimize noise
in what we send to our subscribers.

Don't hesitate to reach out, provide your requirements, and get subscribed to
our email notifications. We need your feedback to improve! We'll be contacting
potentially interested maintainers in the coming weeks ourselves, as well.

Nick

P.S. Thank you for making it through this long announcement :)

