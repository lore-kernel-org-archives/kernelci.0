Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030E21C9E5
	for <kernelci@lists.linux.dev>; Fri, 27 Jun 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017591; cv=none; b=RhmyEgOX3mh7MUWRN1OjVL7ci0DtdnV1DmN5SUOUfYiD9XIpmMJal7IZS/JJ0hvdk/IQfhxKDudxDdyCL9EDiyyOsst519PhVWjh2xRTOSxr9qZui5dPOE1xEPkEqJfAeyUupwJb+BcXqLz0SDyRT5pPm5tK8tVHKjr+6Jmrh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017591; c=relaxed/simple;
	bh=a+bZLnnid55k5p3Jw89Mr2OfAiy6OFj/gF3M29bjNF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDzF2p2w5V5xsFHpaheeN/BZqT+yl6QG3O6bvy+nmSDwvWZa63puS19J3zXGKThXiukcRrrV2RnUyyMW4yGtFRrs9046n7+T9cfNZO+H4m7IL7FEp9y1M5semIAErDhJYTe24NKF7pEv/rPECUM1ai2NkWRZe1Qq+tu2CbbItdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Ty0k88ey; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Ty0k88ey"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E190541C93;
	Fri, 27 Jun 2025 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1751017581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNkdD1J8IeKXiofIBxvUtKc+e6RSFdWofYrzT6TOHGE=;
	b=Ty0k88ey7gLjzs3QwdMDB/0Hfmysd1GYFEj9nGSPWrfjnIRYuSeGYGvAXPzNOWknn9W0nc
	LrORmk2VtzODtjGcE5Ca2X8J2hkisXyBgaCJyKoSwLc0AmvxKp88rKgtZ6xd+nNOmLw79Z
	m1os5zGVil7S2JMDRM8hrPRpOEMWs3EC3eSeFwmMRtOr/NVzsc4Mh5sguDdzIZWqKTOv3N
	2uTmRnr1yJ3+h7wvVWQ2Bj1B3m7uXydfa5K7neI1+vLseAI1PrxmEU79EIqMbhwy+Wcyu+
	zlDcpbzfnzvnUH+b4IjcIOW2HmCIHgm+5Fq//EbQ4EDBgppJPzcX3f4VApI74A==
Message-ID: <14e8ec3c-3006-484f-bc38-ca858d73fe26@gtucker.io>
Date: Fri, 27 Jun 2025 11:46:20 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI TSC Reset
To: Gustavo Padovan <gus@collabora.com>,
 "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: KernelCI Members <kernelci-members@groups.io>
References: <1973207707f.12474557a4721197.2962489771298840013@collabora.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <1973207707f.12474557a4721197.2962489771298840013@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeetjeehteeghfduiedtvedukeefueeuleefhfeguddvueekveetgffgjeeutefgffenucffohhmrghinhepkhgvrhhnvghltghirdhorhhgnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemjeekrggsmeekfhekudemvdekledumeegsggvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemjeekrggsmeekfhekudemvdekledumeegsggvgedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgegrgedtmeekiedvtdemjeekrggsmeekfhekudemvdekledumeegsggvgegnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhnsggprhgtphhtthhopeefpdhrtghpthhtohepghhushestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehkvghrnhgvlhgtiheslhhishhtshdrlhhinhhugidruggvv
 hdprhgtphhtthhopehkvghrnhgvlhgtihdqmhgvmhgsvghrshesghhrohhuphhsrdhioh
X-GND-Sasl: gtucker@gtucker.io

Hello,

On 02/06/2025 9:03 pm, Gustavo Padovan wrote:
> Hello everyone,
> 
> Recently, we have been discussion the current state of the Technical Steering Committee(TSC)
> in KernelCI. Over time, a disconnect emerged between the members of the TSC and the current
> active contributors to the KernelCI community and we didn't act in time to correct course. That's
> part of the pains of a growing community.
> 
> On the flip side, it opens the door for us to rethink the TSC structure from scratch - something the
> KernelCI Project Advisory Board jumped on and took a proposal for feedback to the weekly
> community meeting last week. Now, we want to share it with the wide community to discuss any
> feedback people may have before we take this to final stages.
> 
> Of course, just having a new structure is not the solution to all problems. It
> will require engagement and commitment from TSC members to help the community grow,
> keep an open collaborative space, seek alignment of technical roadmap to our main goals and
> mediate key strategic decisions.

That sounds great, and very much on point about engagement and
commitment.  The TSC has grown organically from the early team of
contributors and the hope when joining the LF was that member
companies and kernel developers would take it to the next level.
While part of this did happen with Collabora being a driving
force along with Red Hat, there hasn't been the fresh influx of
engineers anticipated.  That would have naturally provided a path
for keeping the TSC healthy in the long run with a renewal of
active contributors.  So now seems like a good time to try again.

> # Proposal for the new KernelCI TSC
> 
> The current proposal was build taking inspiration from how other TSC (eg ELISA, Zephyr, Yocto)
> are structured today. It has two main spaces:
> * the TSC itself
> * the KernelCI Infrastructure Working Group(Infra WG)
> 
> In a nutshell, the Infra WG is responsible for the core infra of the project (Maestro, KCIDB, Storage,
> Web Dashboard) and the TSC drives the engament with the Linux kernel community, bridging the
> gap between the user needs and infra roadmap development.
> 
> 
> ## TSC
> 
> *  5 members total
>      -> 4 by community vote with 1 year term
>      -> plus the KernelCI Infrastructure WG Lead
> *  Most voted person elected TSC Chair for a 1 year term
> *  Max of two employees from the same company
> *  Any of the community members listed below are eligible to vote and be voted to the KernelCI TSC:
>     -> Contributors to KernelCI git repositories
>     -> Technical members of CI systems and labs connected to KernelCI
>     -> Upstream Linux kernel maintainer who interacts with KernelCI results and/or give public feedback to the project
> 
> 
> ## KernelCI Infrastructure WG
> 
> * Responsible for the software projects deployed as KernelCI services
>     ->Maestro, KCIDB, Storage, Web Dashboard
> * Manages the Sysadmin team. With the creation of the Infrastructure WG, the Sysadmin WG becomes a
>    team inside the Infrastructure WG with some people getting access to the sysadmin secrets.
> * Initial member selection is based on key contributions and ownership
> * WG can vote new members in and out at any time
> * Members who haven’t contributed to the KernelCI projects for over 6 months are automatically removed from the WG
> * WG Lead shall preside for two years
> * Voting members for WG Lead include the WG members and TSC members

That sounds like a refresh of the Sysadmin WG we used to have,
it's great to see it come back and with a stronger structure.

Out of interest, are there any plans for other Working Groups?

> ### Additional TSC responsibilities
> 
> Beyond what is already listed in the Charter, the TSC should be responsible for:
> 
> * Seeking feedback from the Linux kernel community and company members as driving the
>   creation of processes for improving the feedback process over time;
> * Setting up a process (e.g. RFC, PEP, …) for decision making around important architectural
> decisions in the project. Such a process should be used whenever consensus is not achieved
> trivially.

One important aspect to add here would be transparency, with
public TSC meetings and public votes.  This is something that has
been discussed for a while as most other projects operate this
way, so now seems like a good time to make it happen too.

> ###  Final thoughts
> 
> For reference, today's the current TSC structure is described in the project charter[1] and any
> modification we will make to the TSC structure will require voting by the Advisory Board.

In addition to the Charter created with the LF, a number of rules
have been voted over time by the TSC to clarify certain aspects
and make things easier in practice:

   https://docs.kernelci.org/org/tsc/#rules

It would seem worth going through these and consolidating things
into the new Charter document, for example to remove ambiguity
around votes (email vs meeting, quorum when some members abstain
etc).

Even if everything ends up being perfectly well described in the
new Charter, keeping some documentation section about the TSC
rules always helps in particular for people who want to learn
about the project.

> In the next steps, once we collect extra pieces of feedback here, the board will evaluate and
> hold a voting for changing the charter. Once that happens an election process can start.
> 
> Let us know your thoughts,

My 2¢, hope this helps.

Looking forward to the next KernelCI chapter!

Best wishes,
Guillaume

> [1] https://docs.kernelci.org/files/KernelCI_Project_Technical_Charter_20181107.pdf
