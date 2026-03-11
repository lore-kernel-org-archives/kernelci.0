Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828AB35D5F8
	for <kernelci@lists.linux.dev>; Wed, 11 Mar 2026 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263220; cv=none; b=ixQPSCU6IzHKKskx4D0ECHeKWGMsNMRZqpE4n5wOCPsgOoPvShdg2esg8iuICRknTWZQELx/oJvaWdXmXgMunVIU0SfXcwQdanPYk9QCwvXJsSrUfkLnO49FoFEYJNQIhOKAzsEZuCrc05pysj3bhm00tCjOQOG9JBFmBBH3nT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263220; c=relaxed/simple;
	bh=ouXs2qsCrMXIhn4lRs6EJ+6IgsHzRzUuapk5VL5/BFY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qJhiV8dPxRJGRzw92pKHgXMms5W/aF4S82qAcSnjmPy6Esx0yWWgwPH+s1QOZLhcdSXEFmf9cHeRf163nsz5p/xweuMaO+MiVUQ9bypmi3fVOCNVR3Xw6w26PDv7Zan1lrIce3EggWpoL44dXZVdnd1fXiY+fH5gqhmQgAXE/xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=K35Ttjmb; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="K35Ttjmb"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 78BA058236B
	for <kernelci@lists.linux.dev>; Wed, 11 Mar 2026 21:01:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95FC344326;
	Wed, 11 Mar 2026 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1773262870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84Sl8+URoPaPeYJLV5bRzvBSah0ETNTWT6qV36K1Trg=;
	b=K35Ttjmb7cpwL++5cpDt1xoqzBQ2Pz+9Vk5UPtIb/DkMdN08pcJCZ/+a0hTItywOIqWrJh
	DsMi8VfIYugpMJQaR6z6739i75W7LIxeeS9kEP+iF3n/0Pj3WDc9yn2PBIJ2/YVB7Srql+
	gkx0tB44kO/qXYIt6iS5CZMFKieoZopKz8SaIm6F7V1mtqZEb2kIYTmWN+rpT1qoiYF537
	CemWq0fqLucsSWZR2PZRxb+lI+HezAu+e3Wp5+ISTAifhaVoRkNMEEVp0OGbjQIDLv3tWz
	HhHRslN0BFzJ1+lNl+iHW+j+Qavv5hdLYUOshzwm/DYsCPzONzpPxthuCLD9Cg==
Message-ID: <060dfaa0-4686-48da-8995-b03823b6d97d@gtucker.io>
Date: Wed, 11 Mar 2026 22:01:08 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Meeting proposal for KernelCI Bisection
From: Guillaume Tucker <gtucker@gtucker.io>
To: Ben Copeland <ben.copeland@linaro.org>,
 "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io>
Content-Language: en-US
In-Reply-To: <dc1c30c3-823d-4feb-b381-82260f0db6f4@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeegleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepkedvkeejtedtgfdvffeltdduvdfggeefgfefffejtefhkeegieettddvueeuheeunecuffhomhgrihhnpehgthhutghkvghrrdhiohenucfkphepkedtrddvudehrdeliedrudejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeektddrvdduhedrleeirddujedupdhhvghloheplgduledvrdduieekrdduheejrdeigegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeelhefhveefgeegfedviedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsggvnhdrtghophgvlhgrnhgusehlihhnrghrohdrohhrghdprhgtphhtthhopehkvghrnhgvlhgtiheslhhishhtshdrlhhinhhugidruggvvh
X-GND-State: clean
X-GND-Score: -100

Hello,

On 05/03/2026 5:47 pm, Guillaume Tucker wrote:
> Hi Ben,
> 
> On 04/03/2026 6:28 pm, Ben Copeland wrote:
>> Hello all,
>>
>> On the KernelCI roadmap, I propose we start a discussion on adding
>> Automated Bisection into KernelCI.
>>
>> We have many options and have learnt many lessons from past
>> experiences. KernelCI today lacks the ability to do automated
>> bisection. So I would like to put the meeting together to cover
>>
>>   - What bisection in Kernelci should look like
>>   - How do we go about Bisection at an efficient computational cost
>>   - What are the options for automation
>>   - Put together actions list
>>
>> Bisection needs to fit into KernelCI V2 tooling (i.e., Kubernetes,
>> kci-dev). We also want to provide bisected results to the Maestro
>> mailing list.
>>
>> I have a list of people to include on a call. If you are interested,
>> please let me know, and I will add you to the meeting.
>>
>> I propose the meeting for Thursday, 19 March, at 15:00 UTC.
> 
> Many thanks for starting this thread.  I'm available to join the
> meeting and I would be happy to collaborate on this topic.
> 
> As some of you already know, I've independently made an automated
> bisection PoC[1] based on the lessons learnt from previous KernelCI
> implementations and community feedback.  This addresses several key
> issues that have been identified over the years.  I'm now working on
> a first stable release and a roadmap with extra features.  I can
> prepare a breakdown of how this may apply to KernelCI as it currently
> stands ahead of the meeting.
> 
> I believe this is related but not quite the same use case as enabling
> developers to run bisections locally while accessing hardware remote
> labs, which would seem like where kci-dev would help.  I'd be good if
> we could share some logic with a common library if applicable and
> coordinate these various efforts as much as we can in general.

Based on the humble experience I gathered over the years on this
topic, here's a high-level proposal for developing an automated
bisection feature in incremental steps within the KernelCI context:


Stage 1: the basics
-------------------

The first step is to implement the same kind of bisection as was
initially done in Jenkins but this time with Maestro:

* only for LAVA test regressions
* triggered once all the results for a particular revision are in
* removing duplicates with simple criteria
* optimising builder usage while waiting for runtime test results

The pipeline logic boils down to this:

1. look for base 'good' commit with reference branch (i.e. mainline)
2. check bad / good commits
3. iterate with git bisect
4. check found commit and revert in place to check it fixes the issue
5. send email report in reply to the original patch thread
    (or alternatively build a list of recipients from the commit)

It would be wise to send reports to a fixed audience initially for
moderation until it's deemed good enough for automated replies.


Stage 2: expanded coverage
--------------------------

Once this is in place, a number of options are available to go beyond
the basics.  Deciding which items to work on first would depend on
the priorities within the ecosystem.  Here are a few things to
consider:

* enable bisecting any results from Maestro, not just LAVA
* add support for running bisections with KCIDB, not just Maestro
* support arbitrary patches to verify fixes and isolate issues
* add primitive support for metrics-based results e.g. thresholds
* run the tests again with instrumented builds e.g. DEBUG and KASAN
* inspect the errors and automate typical debugging e.g. addr2line
* compare results with varying parameters e.g. toolchain, platform


Stage 3: advanced features
--------------------------

Using 'git bisect' has its own limitations.  It's great during
development but automated systems have different use cases.  A more
advanced algorithm can be implemented based on the early Scalpel PoC
using the Git history as a DAG and keeping track of statistics for
each test on each commit.  This allows bisecting performance issues
or any test producing absolute measurements and helps avoid false
positives by design.  It also makes it possible to run a tree of
bisections in parallel when new issues are found while bisecting.

Running bisections can then be integrated with the orchestration
logic, to initially run a smaller number of short-lived tests then
gradually allocate more resources when an issue has been identified.
It becomes part of what a dynamic orchestrator would do, to scan
broadly first and then focus on problems.


There are of course many other things that can be done beyond this,
for example to generate a fix and verify it automatically.  The
foundations need to be stable enough first as it takes a lot of
sustained effort to get this working well.  Each bisection is like a
little unique story of its own.  One key aspect is to provide high
quality information to developers as there is very low tolerance for
noisy automated emails in the kernel community in particular.  It's
also critical to get good regression data first before starting to
bisect, a typical thing maintainers want to know is whether the issue
is already present in the mainline revision from which they based
their tree (e.g. -rc2 tag).  Semi-automated bisections is also
something to explore, with a command line that 'git bisect' can run
on each iteration and the ability to trigger fully automated ones
manually.

So this is a bit of a brainstom or braindump exercise without
actually diving into anything in much detail.  It'll be interesting
to see how this combines with others' experience of automated
bisections in various environments.  Hope this helps!

Best wishes,
Guillaume


> [1] https://gtucker.io/posts/2026-02-02-vixi-and-renelick/

