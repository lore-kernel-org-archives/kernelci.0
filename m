Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F83BF69A
	for <kernelci@lists.linux.dev>; Fri,  4 Sep 2026 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788498935; cv=pass; b=aSszp+P0UklNAnT5N2K8zrHLbb2Lms9/2tz96NnSnY8YqAZEZZICJ34LdwslsvEArG5rTqu0ZHZkiHfDfky+Rt9WUYs8zqmni85Y/a4VtOfNWqtFc6uHxsf4G2GmUCKe0nd1Y3ez1l7xgy2io7feesVj02+ti6kihY0UMOM7Hjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788498935; c=relaxed/simple;
	bh=4PCXdO58tStxC64MxSQXQ7PR7sUH1c+t1w+yurkrvN0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=lpHvan8LUypy02jhyVbMGYhYgM+R+24rfTPBGMjzCcmS5B+JcWaqgp9WuhXqsnOB/XKNlN0+GNs0KKyYaLeRaFkATGLliORxWk4MtfWGROHAgByAeQw3ZXfRz/ANnCjOMFGhXmmLcS8v9baSAC+4ADZ8UlnnCmo9VTC3iIIE6AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=d24fw+Hc; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="d24fw+Hc"
ARC-Seal: i=1; a=rsa-sha256; t=1788498913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SUbWSSJvLkpv7BrO6lBKGYhU49dILh1Nn9MQbFJ5B92jXNrY7eHrxSIhf+OUXLb9kd2jew8a98I2Ufwr3R4RQtajc+9OPgbgE3itRsi5zdK0tROb/OKdN1RXP1quWKdqTXdDG+koZn4Id80Ay00EqHo9A3pzswXBVkS1CExNWEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788498913; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IVukEI8c97Z2lalOWXTxJx9fTrUGkJrnGNUAriPtoVM=; 
	b=PA5foIYMeb4R+5wJ0u5Fflwp51mL2VAv3SIrQRlofHwRMtZIyr7XKy+ct4uLcpI05CgIPd4mYqyVQSoBysx02a+2kqdN1DpSyRBxzsfs1On02Rg7kcBKaXdiJo6PiY2oaLwGsHJayUiIp3D4QaEyzD77DNGVsIHkonr+6DFWIOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788498913;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IVukEI8c97Z2lalOWXTxJx9fTrUGkJrnGNUAriPtoVM=;
	b=d24fw+HcoRr4xSPAvdAmyz5YBd/hu8raY07wQSZmWwEDvZIUEUfSV02fxXSD/ivD
	mNBsPb80/ukMxmMt2oMFCnB58JF+JCOa+DSb2Ibh7TeM4D6FkdEIVphYVhrW3nTpKyf
	JNkkiXwoxnzDgwHxiRu0lvVb9zysbfPZydCWxucg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1788498913757907.1455710579577; Thu, 3 Sep 2026 22:15:13 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1788498912723316.0873006710558; Thu, 3 Sep 2026 22:15:12 -0700 (PDT)
Date: Fri, 04 Sep 2026 08:15:12 +0300
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "Alan Zanoni Peixinho" <alan.peixinho@profusion.mobi>
Cc: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
	"kernelci" <kernelci@lists.linux.dev>,
	"kernelci-webdashboard" <kernelci-webdashboard@groups.io>,
	"John Ogness" <john.ogness@linutronix.de>
Message-ID: <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
In-Reply-To: <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
References: <20260903154354.rXZZL6F9@linutronix.de> <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
Subject: Re: kernelci test results
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Sebastian, Alan

The system currently creates a short log extract only when a build or boot =
test is marked as failed. This job completed successfully, including the bo=
ot and cyclictest, so the log was stored but not automatically analyzed for=
 an extract.
The kernel warning is present in the full log and our analyzer can recogniz=
e it, but it was missed because the overall job passed. This is a limitatio=
n in the current reporting flow.
We initially chose to create log extracts only for failed builds or boot te=
sts because successful boots often contain harmless or known warnings, such=
 as spurious IRQ messages. Reporting every warning as an issue could create=
 substantial noise that kernel developers may not find actionable.
We could review this policy and maintain an ignore list for known, non-acti=
onable messages. That would let us highlight new or unexpected warnings wit=
hout creating unnecessary noise for kernel developers.

From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
To: "Sebastian Andrzej Siewior"<bigeasy@linutronix.de>
Cc: <kernelci@lists.linux.dev>, <kernelci-webdashboard@groups.io>, "John Og=
ness"<john.ogness@linutronix.de>
Date: Thu, 03 Sep 2026 21:37:09 +0300
Subject: Re: kernelci test results

 > Hi Sebastian, I work with the dashboard team, so I hope I am able to hel=
p you.
 >=20
 > First of all, thanks for using the dashboard, and for taking time to
 > write this up. Scenarios like this one are exactly what help us find
 > the UX gaps for improvement.
 >=20
 > The dashboard is mostly organized around tree checkouts first.
 > If i understood it properly you might be able to achieve what you are
 > looking for via:
 > 1. Selecting a tree (ie stable-rt/v6.6-rt).
 > 2. Clicking on the filters button on the right. There we can apply
 > filters for configs (defconfig+preempt_rt, etc).
 > 3. We click on the tests tab (default tab is for builds).
 > 4. On the list of tests you can search for test paths (cyclictest,
 > rt-tests, etc).
 >=20
 > Link for the view:
 > https://dashboard.kernelci.org/tree/stable-rt/v6.6-rt/84925bb144f49eb0d5=
f4c5c29f690b4bbf84903b?df|c|defconfig%2Bpreempt_rt=3Dtrue&p=3Dt
 >=20
 > That list is for that checkout across hardware, so you do not have to
 > go board by board. (Unfortunately there is still no search for =E2=80=9C=
this
 > test on this device over time=E2=80=9D across all trees.)
 >=20
 > About the other questions.
 >=20
 > All the logs presented are the ones that have been submitted via KCI
 > submissions, so there might be some missing information when not
 > reported.
 >=20
 > On the topic of notifying on log errors, this is a feature on active
 > discussion, to automate notification for first for boots and later for
 > test failures as well. Today we only notify registered issues.
 >=20
 > We are actually looking for some feedback of dashboard users to help
 > us steer on the roadmap for new features, and your help would be much
 > appreciated.
 >=20
 > Att
 > Alan Peixinho
 > KernelCI Dashboard Team
 >=20
 > On Thu, Sep 3, 2026 at 2:36=E2=80=AFPM Sebastian Andrzej Siewior
 > <bigeasy@linutronix.de> wrote:
 > >
 > > Hi,
 > >
 > > I've been poking at the dashboard to see how rt-tests tests are doing.
 > > I tried to summarize my doing/ process and added questions while doing
 > > so. I might be doing things wrong, not the expected way or simply
 > > missing the obvious.
 > >
 > >
 > > On the dashboard, by clicking hardware, Tree=3Dmainline I see only
 > > kubernetes as platform. There I see on the bottom various builds. Ther=
e
 > > is a search bar where I can limit to "preempt_rt" and then builds are
 > > limited to "preempt_rt" configuration and it also includes "next".
 > >
 > > There I can click on the build-log (and later I get the build.log.gz)
 > > but it appears not to contain the build log of the kernel. I think the=
re
 > > is the "config merging" part and kselftest build but not the actual
 > > build of the kernel itself.
 > >
 > > Clicking on tests, I can also filter for preempt_rt but there is only
 > > kselftest. I can't see the results, there is always "No logs available=
".
 > > Based on the timestamp the results are from today so I wouldn't expect
 > > them to be deleted because of age.
 > >
 > > Going back to "trees" and selecting "stable-rt" and branch v6.6-rt
 > > there is more HW. Clicking on bcm2711-rpi-4-b since it has the most
 > > results here.
 > >
 > > Here I clicked on configs "defconfig+preempt_rt" and then one of tree
 > > that appeared is "mainline/master" but I did not see this earlier whil=
e
 > > I did select that tree.
 > >
 > > I did click on "tests" and then "rt-tests" appeared. Expanding it up, =
I
 > > found cyclictest results for that tree.
 > >
 > > Clicking on details I found a link to
 > >         https://lava.collabora.dev/scheduler/job/22810572
 > >
 > > where the complete log is available of what has been done on that
 > > hardware. In the bootlog I noticed
 > > | [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_doub=
le_dereference+0x128/0x130, CPU#0: swapper/0/0
 > >
 > > which is a warning that appeared during boot. Is this picked up
 > > somewhere? Is there a notification sent somewhere that this has been
 > > noticed?
 > >
 > > Later there is the cyclictest invocation, arguments and the result.
 > > There is no max-value set for the test so it passes. Would there be a
 > > notification if the test failed and if so, where?
 > >
 > > I noticed that on the lava page, by clicking on the device I can searc=
h
 > > for "rt-tests-cyclictest" and get the recent results for this device f=
or
 > > this test. Is something like this possible on the dashboard? I.e. look
 > > for the recent cyclictest results?
 > > Right now I have no idea how to do this without going device by device=
.
 > >
 > > Sebastian
 > >
 >=20
 >=20


