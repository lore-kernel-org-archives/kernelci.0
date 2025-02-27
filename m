Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF73270053
	for <kernelci@lists.linux.dev>; Thu, 27 Feb 2025 18:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681143; cv=none; b=lpitoIrbKpSbZfGTO3ZW0n4e+y41AgHdnfjC8S6G0PfK4DCsSKPkB4Jih/FxcJ9fP705W2XdWCzEkHZxHV1RMiXuqZ5oxd3D1Vhmg4mdd10OeM+GS1jR/IjczcnuMs7D+kFCt6GUJ3drofcjuJ/YSmJel8mfv368+oxCXiKHl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681143; c=relaxed/simple;
	bh=wRLOckcMeu6jqRGPQQW9ZxrBMROa8ABXSfXI/MtIIYQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=UqTxMwaPOnlRZleJnkLRYnEUKhg6B02rHyB0b2xRHl2s4IcQyoxvzhz/kg5VgLf1zGGouOnlUpMedwGw0snOwTyub4lcp0USb666m2tt62cp+lfH5aK5wt59X7+AvrJYH06ZypYFdDpwQtpfs3YdkSyrPSi+2mxOFycHAc2lGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ+q/+/M; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ+q/+/M"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54529e15643so2238854e87.1
        for <kernelci@lists.linux.dev>; Thu, 27 Feb 2025 10:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740681139; x=1741285939; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fykOFMNAHp6RHlKeBOZZIiXTfDJlttAQ8HVD/PU+SkA=;
        b=dQ+q/+/M0yQD8EHchv1UUU+6e5EhBw50nCn7XwV+I09rm7w8chQjf2TKloM4v5HFTo
         vS5F9BMldG1f37ADUa5v0HmesHhNYhR/rnhHRTlH/8X4JURAgKK32gdiOhoF+Tpb5UTg
         PCXEveNVJoCCLXkLp3xoUSwIohmTQMZSLNrTGxmlGcwrdopSfxhp+4IyO5lpTDoe8wy1
         IYju0MWFGObqL+4xjEgBKCBNXQGibUrvnIe4vk7hWyv9kyxfFWYkjAk6DP+DnwQW+JQq
         XuZ5e4T4V4/YY6ZKEhTA63YFP3Fy+1SNgTX9rHrjkVV4u2ghuZUHNPn20Kl3pdmNocQI
         AiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740681139; x=1741285939;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fykOFMNAHp6RHlKeBOZZIiXTfDJlttAQ8HVD/PU+SkA=;
        b=ruxjcbVVaUh9uk+7evW432zEwhUb1zKpuJTldQ0m7xxiDu+LS11sV8tMq3KmxJoP8c
         XshBPQSUBjRr3Pd9ME+WduUclzTQgpTpDEBlmwAym+txxRpVHLbG2bPUqJWjfCfU1p1i
         BMdb5TyXHffsHWjvBXh4mQvcQMJZ8o+Go6esWGV/++H0MH+CmF/HP4pTG8I/XbmDGYlb
         sTq8H0XXpHZivI+gh5R5oOLOcO0Hy3EiiZ0+teIgblAt/6+HtfKsobm1k8RY0uls0w0Y
         MqYYIKq5MrmV0v6Eg1NuQu0iGSphlLdW0HI503hWe/3SR1PpyrkDUxuEQfzgz0SCiq1T
         iuEA==
X-Forwarded-Encrypted: i=1; AJvYcCVx5rIivvV0c/be5duzDgfm2ctYN2y2ubJLQxpb14ZtEyXkCDiyNZieNDNwDmR1w/u1NkZvXt9+rw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5blwyIa7nA6/bdFvg6mGznnkTgAZk2Rv5aMmJUipZFP2+aEe0
	4tM1dA7de9+1EZ3ZxpIJUxhamFY4m1cHBbVRyFwJ6dznbo52LRjc
X-Gm-Gg: ASbGncsJREGhxC3r+doe201HAXqu/Yba+erd+0x8sdRKxw6Ft9lE0btLfiqTsUUPm7x
	zB+P11RcEYEP4IY9GW7UKazsNk4DvVz2PcLxhiXWsGKs0B3larwLWoAsJrf74Vzz2Zs5CiB3vvx
	kpSP2JYKeFhGHRSCZiv6mzVUMu0Fl/7yQvj5e2qpSDbYRC6jT1VPnM+GOXaqfcQeohqNpklBs/o
	GftJWkH5kEUPLiwhzAOWxAMxyXPJ0Z+HxLDig1h4XdV5WxGiiSF8BUoI2AE6mFvL8xSYPpvj3qI
	Nt6F1sO8Q/kIc4GUWZoAYye46u5xDnM5oMzm0Y6Mkcpa4xH8GLsDNQl+9jvWUg==
X-Google-Smtp-Source: AGHT+IGfGBI2bhIGxJfDhAghduP19p1Z3SOL7VAqxCPkzOUYURjDVhnv7yt/yVcWAkUUEoPTpTTl1A==
X-Received: by 2002:a05:6512:3b83:b0:545:240:55ba with SMTP id 2adb3069b0e04-5494c3758f6mr174939e87.26.1740681138635;
        Thu, 27 Feb 2025 10:32:18 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cca1asm226317e87.223.2025.02.27.10.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 10:32:17 -0800 (PST)
Message-ID: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
Date: Thu, 27 Feb 2025 20:32:15 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: v5.0 - backwards-incompatible changes
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again, everyone (potentially) involved with sending data to KCIDB,

We've accumulated a bunch of schema change needs, which would break backwards
compatibility, and so it's time for another major update: v5.0.

First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/95

This will be followed by a DB/ORM update, once we agree on something. I'll go
over each proposed change below, linking to corresponding commits in the PR so
far. Please review and respond if you have any objections, comments or
requests (here, or in the PR).

I'll merge this next Friday, March 7, if there are no objections by that time.


DROP "contacts" FROM "checkouts"
--------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/a29e115ac3b28781d9d82090b320c82e8559aec2

Remove the "contacts" field from checkout objects. It was added to support
extracting email addresses from patches so that notifications could be sent to
people concerned with them. Since then we've focused on subscription-based
system to minimize negative effect of sending false positives/negatives to
people who didn't ask for them.

Here's an example of a checkout with the field about to be removed:

    {
        "origin": "microsoft",
        "id": "microsoft:89bf6209cad6",
        "comment": "Merge tag 'devicetree-fixes-for-6.5-2' of git://git.kernel.org/pub/scm/linux/ker \bnel/git/robh/linux",
        "contacts": [
            "torvalds@linux-foundation.org"
        ],
        "git_commit_hash": "89bf6209cad66214d3774dac86b6bbf2aec6a30d",
        "git_commit_name": "v6.5-rc7-18-g89bf6209cad6",
        "git_repository_branch": "master",
        "git_repository_url": "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git",
        "start_time": "2023-08-23T15:09:13.791021+00:00",
        "valid": true
    }


DROP "build_valid"/"test_status" FROM "issues"
----------------------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/99ea3dfa1f8ed02949b58c180b13d86c77d14138

Drop the "build_valid" and "test_status" fields from issue objects.

The idea for these fields was to let submitters rectify results they sent
earlier, so that reports could be corrected. However, it seems that we're
shifting our attention to notifying about issues themselves, rather than
particular test and build results, so these fields wouldn't be needed, and
their absence would make things simpler.

Here are two issue examples with the fields to be removed:

    {
        "id": "maestro:b93384a5a9d06e5f3422c15569364f45f598bd2c",
        "version": 1,
        "origin": "maestro",
        "culprit": {
            "code": true,
            "tool": false,
            "harness": false
        },
        "build_valid": false,
        "comment": " use of undeclared identifier 'MIGRATE_CMA'; did you mean 'MIGRATE_SYNC'? in mm/page_alloc.o (mm/page_alloc.c) [logspec:kbuild,kbuild.compiler.error]",
    },
    {
        "id": "maestro:f627e08f767a688209f3f9a2d41c6b4c260897b0",
        "version": 0,
        "origin": "maestro",
        "test_status": "FAIL",
        "comment": "[logspec:generic_linux_boot] linux.kernel.null_pointer_dereference NULL pointer dereference at virtual address 00000000000000d0",
    }


REPLACE "valid" WITH "status" IN "builds"
-----------------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/635b0695807ac366c3d52853b1056bed2052d80b

At the moment builds can only have two outcomes: pass and fail, encoded in the
boolean "valid" field. However, builds tend to have all the similar issues as
tests do, and at least two CI systems were missing support for that. So, I'd
like to replace the "valid" field with the same "status" field that tests use.

E.g. this:

    {
        "id": "redhat:1177148648-s390x-kernel",
        "valid": true,
        "origin": "redhat",
        "command": "make CC=clang -j24 INSTALL_MOD_STRIP=1 targz-pkg",
        "comment": "CKI build of mainline.kernel.org-clang",
        "compiler": "clang version 17.0.6 (Fedora 17.0.6-6.fc40)",
        "checkout_id": "redhat:1177148648",
        "config_name": "olddefconfig",
        "architecture": "s390x",
    }

becomes this:

    {
        "id": "redhat:1177148648-s390x-kernel",
        "status": "PASS",
        "origin": "redhat",
        "command": "make CC=clang -j24 INSTALL_MOD_STRIP=1 targz-pkg",
        "comment": "CKI build of mainline.kernel.org-clang",
        "compiler": "clang version 17.0.6 (Fedora 17.0.6-6.fc40)",
        "checkout_id": "redhat:1177148648",
        "config_name": "olddefconfig",
        "architecture": "s390x",
    }


BE STRICTER ABOUT TEST PATHS
----------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/fa9ec752a5d7c84b2391132815a136d5aabf0332

Test "paths" were defined rather loosely in the schema so far, and some corner
cases the current pattern permits are hard to make meaning of on the
dashboards and notifications. So I'd like to prohibit paths with leading,
trailing, and repeating dots. So something like "ltp.memcpy01" would still be
valid, but e.g. "ltp..memcpy01" or ".ltp.memcpy01", or "ltp.memcpy01." will
not.

NOTE: While the previous schema versions will validate these just fine, once
      the support for the new v5.0 schema is deployed, we'll start dropping
      submissions with those. You'll need to upgrade to this schema on the
      client side to catch these *before* sending them to KCIDB.


REPLACE "waived" field with an "incident"
-----------------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/b2b6cfaabdd0a0024456018df86fbc44942beba3

We've had "waived" field in tests right from the start, because that was what
CKI was using at the time. They still do, but I think we can perhaps move on
past it, which will simplify things a lot.

The field is intended for a CI system to signal that the test which has it set
to true is unstable, and shouldn't be taken into consideration when deciding
on a testing result. This is useful to temporary disable the test effect,
while keeping running it and collecting data about its performance.

However, since then we came up with an idea of "issues" and "incidents" which
allow to express this particular situation, as well as many others. We're also
forgoing the whole idea of reporting pure (and often unreliable) test results,
and reporting issues themselves instead.

As such I would like to drop support for the "waived" field and when
inheriting data containing it from the older schema versions replace it with a
global (constant-ID) issue and a test-specific incident linking the test to
it.

This will result in submissions like this:

    {
        "version": {"major": 4, "minor": 5},
        "tests": [
            {
                "id": "redhat:1691700431-aarch64-kernel-64k_upt_22",
                "origin": "redhat",
                "build_id": "redhat:1691700431-aarch64-kernel-64k",
                "comment": "Hardware - libevdev test",
                "duration": 67.0,
                "path": "libevdev",
                "start_time": "2025-02-27T17:00:29.000000+00:00",
                "status": "PASS",
                "waived": true
            }
        ]
    }

Being converted to this:

    {
        "version": {"major": 5, "minor": 0},
        "tests": [
            {
                "id": "redhat:1691700431-aarch64-kernel-64k_upt_22",
                "origin": "redhat",
                "build_id": "redhat:1691700431-aarch64-kernel-64k",
                "comment": "Hardware - libevdev test",
                "duration": 67.0,
                "path": "libevdev",
                "start_time": "2025-02-27T17:00:29.000000+00:00",
                "status": "PASS"
            }
        ],
        "issues": [
            {
                "id": "_:waived",
                "origin": "_",
                "version": 1,
                "comment": "Test waived as unreliable"
            }
        ],
        "incidents": [
            {
                "id": "_:waived:1:redhat:1691700431-aarch64-kernel-64k_upt_22",
                "origin": "_",
                "issue_id": "_:waived",
                "issue_version": 1,
                "test_id": "redhat:1691700431-aarch64-kernel-64k_upt_22",
                "present": true
            }
        ]
    }


PROHIBIT NULL CHARACTERS ('\0') IN STRINGS
------------------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/db36bc46b2c7ddb479eec7a5344e0ce28cb6c2de

JSON allows null characters ('\0') in strings, which is good for flexibility.
Unfortunately PostgreSQL, which we're using for our operational database
doesn't allow them in its TEXT columns. We've had a few cases when serial
console garbage ended up in log excerpts and failed to be loaded into the
database. So I'd like to prohibit null characters in all the strings of the
I/O schema to avoid such problems in the future.

NOTE: While the previous schema versions will validate these just fine, once
      the support for the new v5.0 schema is deployed, we'll start dropping
      submissions with those. You'll need to upgrade to this schema on the
      client side to catch these *before* sending them to KCIDB.


ONLY ALLOW HTTPS URLS FOR REPOS
-------------------------------

https://github.com/kernelci/kcidb-io/pull/95/commits/601157e5d3e140214656e69caf62fce9d7869737

We've supported both https:// and git:// URLs for "git_repository_url" field
from the early days. However, actually only one repository, tested by
KernelCI, required it. We no longer test that repository and it has been
deleted by the owner. Having only https:// URLs in JSON and the database would
make some things simpler, so I would like to drop support for git:// repos.

We last received a checkout with a git:// URL on July 17th last year, and that
was for the removed repo. Here it is, as an example of a checkout which would
fail validation and have the submission discarded:

    {
        "id": "_:kernelci:2cd7584b84b6e2732e9b87805f38b89b7b633cbf",
        "origin": "kernelci",
        "git_repository_url": "git://git.armlinux.org.uk/~rmk/linux-arm.git",
        "git_commit_hash": "2cd7584b84b6e2732e9b87805f38b89b7b633cbf",
        "git_commit_name": "v5.4-38-g2cd7584b84b6",
        "git_repository_branch": "to-build",
        "patchset_hash": "",
        "start_time": "2024-06-15T15:46:07.133000+00:00",
        "valid": true
    }


NOTE: While the previous schema versions will validate these just fine, once
      the support for the new v5.0 schema is deployed, we'll start dropping
      submissions with those. You'll need to upgrade to this schema on the
      client side to catch these *before* sending them to KCIDB.

---

And this is finally all for this schema update. Please respond if you disagree
with any of these changes, or would like to propose your own. Thank you for
reading all the way to here!

I'll merge this next Friday, March 7, if there are no objections by that time.

Nick
