Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D735CB60
	for <kernelci@lists.linux.dev>; Thu, 22 Jan 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077557; cv=none; b=DUMzdRTVZ3UEzaDguEaOFJ94R/BCKLJsAZZo4c3ncEk1VNCcD+8jg9emCleiJPItzI0Q/7UhSy3ea7URkXmdGP76MpKvlYDH5cdxc1zvIkdfypzDBlxYyHgkBkMxQj2qs3KN4RYIJVNwRRt9j9sb4TsAI8Fdq/YdyBwfdifMEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077557; c=relaxed/simple;
	bh=kZdo81mRV9AU7Nj/Qg5gdxzZCENGfGj5jcYnlR6S16k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSVv2bjFs+seVKpKbvI6tI/N/8h0Sc9D8fbHmTH92uSA7irO4pJ2oul+eHTkcQtOsGZaLxAng4tMGmEC1UbF9Bgg0jrn7ugrCIh9Ty8KrriiIee8rRRAtvTOFoinfOXi3m+G50MyP+8AvZb2lsJh/2aEWWuORDZk5r/FbXMaDmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1virsn-0000tJ-PZ; Thu, 22 Jan 2026 11:25:45 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1virsn-001uGB-1q;
	Thu, 22 Jan 2026 11:25:44 +0100
Received: from localhost ([127.0.0.1] helo=[IPv6:::1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1virsm-0000000DCZT-3F6g;
	Thu, 22 Jan 2026 11:25:44 +0100
Message-ID: <6ae01abe5a0b8f3342733d844b8916430e1d312a.camel@pengutronix.de>
Subject: Re: KernelCI Dashboard - Hardware Listing Behavior
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Gustavo Flores <gustavo.flores@profusion.mobi>, kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Date: Thu, 22 Jan 2026 11:25:44 +0100
In-Reply-To: <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
References: 
	<CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernelci@lists.linux.dev

On Wed, 2026-01-21 at 15:58 -0300, Gustavo Flores wrote:
> We are working on some improvements on the dashboard and would like to
> hear your opinion.
>=20
> Currently, the hardware listing and details pages on the dashboard
> only show hardware that has tests in the latest checkout of each tree.
> As a result, some hardware ends up being effectively "hidden" from the
> views.

This is https://dashboard.kernelci.org/hardware-new , right?

> We discussed this internally and see two possible approaches:
>=20
> 1. Show all tests within the selected time frame (e.g. last 5/15/30
> days), regardless of checkout.
> 2. Show tests from the most recent checkout in which each specific
> hardware was tested, even if it's not the latest checkout of a tree.
>=20
> With the first approach, the number of displayed tests would likely
> increase for larger time windows, since we would no longer be
> filtering by checkout, but this shouldn't be a problem.
>=20
> Since this would change the current behavior of these pages, we=E2=80=99d=
 like
> your feedback: which approach do you think better fits your needs?

From the perspective of someone interested in the state of a given board, 2=
.
seems more useful. With that approach, you could compare the number of test=
s to
similar hardware, even if the checkout is not identical.

With 2., perhaps it would be useful to somehow indicate that the displayed
results are "outdated", if the age exceeds some threshold?

Regards,
Jan
