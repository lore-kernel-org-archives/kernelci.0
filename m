Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E8AD4B
	for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669745738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOReu+sNtdBWRfYpAK0v05RfJCbt2DZjpudnobqU750=;
	b=AE+kjBfZGoQbmI0nh+iU4vy3WKRVQvAlv8iWIaZ11XAk9VKT+xi7/OJCBkzJep+XC6KgfO
	yzBt75BnQIq1ANR7PPE3l1735CYb2oPHIViRgDLOZnz09pE5pmDeyEyHhnR2BOq5GaeGiK
	J4dJN5jhNRG3T/j765dXtrNcvgplRRA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-NnMOdFhBMM-TxBtiTGIyXg-1; Tue, 29 Nov 2022 13:15:37 -0500
X-MC-Unique: NnMOdFhBMM-TxBtiTGIyXg-1
Received: by mail-wm1-f69.google.com with SMTP id c10-20020a7bc84a000000b003cf81c2d3efso5040566wml.7
        for <kernelci@lists.linux.dev>; Tue, 29 Nov 2022 10:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOReu+sNtdBWRfYpAK0v05RfJCbt2DZjpudnobqU750=;
        b=UvLFt50TjVsFcIHQkJiwQGVrJgV0NV6Czgi918QBjzGXRHclttkPveNIbTK6uq1lql
         iB993GsA2we6wEeIKUYDh7dMNZcyKoKjXZEaasvSS8MczcO8QeUVELDko2i0DvSoAoTu
         P2MHUFWqPeZTan4dheHIJg2vZO+XYrMnMR1Rixh+6YvGZyyD9yf+bNMm99u0Rft7itXm
         byXrWKeTIdN4tKcaDmFRslfwB0AY/vPH58EG8AV+6hj61f/fOx6Vx//St0LlBFchKxYN
         w79V4VzubNoq4n70oiQKVKA3S213vDncfLTPmnhTIGKrglfc+WCWoedTU5lj10XOn3cq
         sFTg==
X-Gm-Message-State: ANoB5pkBuc8tdua9jneew7rAxz5ipHQGsWUo8il4ZBwBHa3lMuh5VJF0
	v/8tkURl9H1lHDpP3wOBMpSSMsi3zKhUG4QOCKkM8flccNyv8GO/Wuo5rUi6qwFOle2NWVaxCOp
	jMEg188IOP0kHa/bKrnBZVyPpgrrQ+7D/VLvz4BUiqBrXVFlNKyhSvneH3AgBMlVCbv8boWZP3Z
	fZtqlueZJz
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id bg14-20020a05600c3c8e00b003d069f4d3d0mr2438623wmb.93.1669745735911;
        Tue, 29 Nov 2022 10:15:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54fHzdc95y8aH/XXeb5tlHwe3rOSWGpgvtkg9WV4JH5gKDv9lNu4Dxmtg4v9BTXwPZL1H07g==
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id bg14-20020a05600c3c8e00b003d069f4d3d0mr2438595wmb.93.1669745735522;
        Tue, 29 Nov 2022 10:15:35 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c3b0900b003cf47556f21sm3411395wms.2.2022.11.29.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 10:15:35 -0800 (PST)
Message-ID: <a6e14738-b1b2-7a10-a8ee-787a2059b924@redhat.com>
Date: Tue, 29 Nov 2022 20:15:33 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: KCIDB schema for known issues
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: kernelci@lists.linux.dev, Veronika Kabatova <vkabatov@redhat.com>,
 Andrzej Szczepaniak <aszczepa@redhat.com>, Dmitry Vyukov
 <dvyukov@google.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 automated-testing@lists.yoctoproject.org, Tim Bird <Tim.Bird@sony.com>
References: <182b43fa-0261-11b7-2edb-f379a669bc28@redhat.com>
In-Reply-To: <182b43fa-0261-11b7-2edb-f379a669bc28@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/22 21:10, Nikolai Kondrashov wrote:
 > Since this is getting rather long (and it's getting rather late here in
 > Finland), I'll withhold any further examples. Most of the readers would
 > already be familiar with the KCIDB schema, the new schema is quite similar,
 > and I would provide more examples on request.
 >
 > However, I'm attaching two mocked-up examples: one for syzbot and one for CKI
 > - the two perhaps most-advanced CI systems out there, *issue-wise*.

I'll elaborate on these two examples a bit to help explain how the schema is
supposed to work.

SYZBOT

IIRC, syzbot collects kernel crashes resulting from its fuzzing, extracts
identifying information from them automatically, and then collects similar
crashes into "buckets", which are basically "bugs" and are tracked similarly.
Those bugs can be closed automatically, if crashes stop reproducing for a
while, and they can also be manipulated via an email interface:

 
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#communication-with-syzbot

The example submission lists three such bugs, referred to using the
"report_url" fields, in each of the three "issues":

     "report_url": "https://syzkaller.appspot.com/bug?extid=3e3c2f8ca188e30b1427",
     "report_url": "https://syzkaller.appspot.com/bug?extid=fade8a8e2bdc29b3a90b",
     "report_url": "https://syzkaller.appspot.com/bug?extid=f275cebe321308c38cc1",

There are five "incidents", two of which link the first issue (and bug) to two
tests, and three others - to the second issue (and bug).

The workflow for Syzbot could be to send the issue description first time it
sees a crash and creates a bug for it, and then send both a test object and an
incident object pointing to this issue every time it reproduces the same
crash. Syzbot could use its "external IDs" (the value of the "extid" URL
parameter above) for identifying the issues. The build and checkout objects
would need to be sent as well, as is currently done.

Previously Syzbot was only sending one crash per bug to avoid flooding the
developers with failures, now it can start sending *all* crashes, as long as
it links them to the corresponding issues (bugs) correctly.

Now, if a developer is subscribed to, say, all new issues for their kernel
branch, they will only get one notification for each Syzbot "issue" arriving
into the database, linked to a commit appearing in their branch (through the
issue -> incident -> test -> build -> checkout -> git_commit_hash chain).

They could also go to the KCIDB Grafana dashboards to see which bugs have been
reproduced recently (or within a particular period) for their branch.

There's no notion of bugs being "open" or "closed" in KCIDB at this moment
(contrary to Syzbot), only records of where they appeared (or didn't), in the
form of "incidents". This is mostly because KCIDB doesn't do triaging by
itself yet.

CKI

The CKI system detects new test failures in its runs, alerts maintainers, and
allows linking them to existing "issues", or creating and linking new ones.
Each issue can be assigned a report URL and a pattern matching builds or tests
exhibiting the problem.

Here's an issue with a pattern ("Regex") matching a kernel bug:

     https://datawarehouse.cki-project.org/issue/1367

Here's one matching a case of unstable test:

     https://datawarehouse.cki-project.org/issue/984

And another one matching an infrastructure problem:

     https://datawarehouse.cki-project.org/issue/972

These would correspond to "code", "tool", and "harness" culprits in KCIDB
parlance, respectively.

CKI could continue sending checkouts, builds, and tests in the same way, and
could start sending "issue" objects whenever a new issue is created, or an old
one is updated. It would need to maintain an update counter and send it as the
"version" number, or at least send a precise-enough update timestamp instead.

To make use of those issues it would also need to start sending "incidents"
whenever a build or test result is manually linked to an issue, or when
triaging results are available.

The CKI's example JSON (attached to my previous message) contains four
mocked-up issues: one for a "tool" (a test, setting its status to "ERROR"),
and three for "code" (the kernel code). Each links to a bug report in
Bugzilla. There are four incidents linking the four issues to three test runs.

Use cases for Syzbot's issues and incidents described above would also apply
to CKI data. However, CKI data could also be used to alert test maintainers of
test bugs (by selecting "tool" culprit), as there are plenty of those in CKI's
Data Warehouse, including for upstream tests. CKI would also be able to hide
any of its own infrastructure-induced failures by using the "harness" culprit.

PLANS

As mentioned in the previous message our next step after we agree on this one
would be implementing the triager, using matching data attached to issues.
There will be a lot of work needed to start hosting artifacts for triaging,
implementing matching various parameters and artifacts, and not least of all,
reasoning correctly about revision history.

I've submitted a talk to FOSDEM trying to raise attention of the Graph
database community, to help our revision-tracking needs, and will see if we
can get an intern during GSoC 2023 to help with anything. I would, of course,
be happy to fill in anybody wishing to help on the details of the project.
Some documentation improvements would probably come along too.

In the end I hope we would be able to use issue triaging data from each CI
system on data from all CI systems (provided necessary alignment in formats,
and so on), to get higher signal-to-noise ratio in our notifications, and
would finally have more kernel developer attention to make KCIDB a more
exciting, and faster-moving effort.

Nick

