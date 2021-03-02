From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: #KCIDB: Remove publishing_time from checkouts #KCIDB
Message-ID: <72d0d125-e168-5488-f033-e8a67361fc7b@redhat.com>
Date: Tue, 2 Mar 2021 14:31:34 +0200
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

We'd like to remove the "publishing_time" field from "checkout" objects in
the coming v4 schema.

The original intention for this field was to hold the timestamp of the
patchset, for patched revisions, or the time a commit was published in (pushed
to) a git branch where it was found.

However, nobody is using it as intended so far. Red Hat CKI is duplicating the
value of "discovery_time", and Syzbot is sending one of the commit's
timestamps, which is not the same as the intended "publishing time".

Therefore it seems better to remove this field to avoid confusion, and to add
one or two other, more-appropriately named fields when the need actually
arises.

For example, this v3 Syzbot report:

	{
		"revisions": [
			{
				"id": "2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b",
				"origin": "syzbot",
				"description": "Merge tag 'pwm/for-5.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm",
				"discovery_time": "2021-02-26T09:38:57Z",
				"publishing_time": "2021-02-25T20:23:49Z",
				"git_commit_hash": "2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b",
				"git_repository_branch": "master",
				"git_repository_url": "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git",
				"valid": true
			}
		],
		"version": {
			"major": 3,
			"minor": 0
		}
	}

Would need to have the "publishing_time" field dropped for v4:

	{
		"checkouts": [
			{
				"id": "syzbot:83e825e0740b99a18b39999686a8cb8db2629e0e3cd527c499b1843dba9567c7",
				"origin": "syzbot",
				"comment": "Merge tag 'pwm/for-5.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm",
				"start_time": "2021-02-26T09:38:57Z",
				"git_commit_hash": "2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b",
				"git_repository_branch": "master",
				"git_repository_url": "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git",
				"valid": true
			}
		],
		"version": {
			"major": 4,
			"minor": 0
		}
	}

As usual, KCIDB will convert data in older schema versions to new versions
automatically, and will drop the "publishing_time" field for you, so you can
keep sending the old data format until you're ready to upgrade.

The PR for the corresponding code change is up at:

     https://github.com/kernelci/kcidb-io/pull/29

Please don't hesitate to respond with any comments, objections, or
suggestions.

If there are no objections, I'll merge this change on Friday, Mar 5.

Nick

