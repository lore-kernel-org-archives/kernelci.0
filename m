Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B5242D6C
	for <kernelci@lists.linux.dev>; Tue, 23 Sep 2025 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758641038; cv=none; b=LkAKKKkjVncAAvwIn0652zXvP5N/0xDjGlfrgmQxSwjDckFSwyDkfCqFul+mnYL09+zbA9uNK68OR0iHiHrV5BdMGnJ8Dfcf7cRe+vsNYxux9RsoGxBUxnQennzm/Svk8qW9ts+sq2nVTeiw+VlwgAztIuC6AHJtkE8wwGYvOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758641038; c=relaxed/simple;
	bh=It4UYPZc+w0a69rurXLvw2s9pdWu2agzMzlwrwR2KYs=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=T+c6sxTYzMLS6OexD4dj7B9cq7EK90fIXCM2Qs19k7k/ohzhm7oiHYcCx5RQlqHcJ6NAj57q3VVEd788JjZH6slzleP6dnoou4XYkxwnsflQv+t3ayMhHrMN6ekSeSEL0YDHTRK6cTupVLu6kXPaItzehM2AMZCih7UUvfq7Us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1v14ru-0000A3-3u
	for kernelci@lists.linux.dev; Tue, 23 Sep 2025 17:23:50 +0200
Message-ID: <8558dd0f24dc76633cf02f5835c4b1e234f1ca43.camel@pengutronix.de>
Subject: Grafana Dashboard issue
From: Fabian Pflug <f.pflug@pengutronix.de>
To: kernelci@lists.linux.dev
Date: Tue, 23 Sep 2025 17:23:49 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernelci@lists.linux.dev

Hey,

Not sure if this is the right place to file the issue, but when checking ou=
t the grafana dashboard today, I noticed,
that "Infra issues analysis" is only showing entries from before 2025-09-08=
 and not after that.

https://grafana.kernelci.org/d/maestro-boot-stats/infra-issues-analysis?fro=
m=3Dnow-30d&to=3Dnow&timezone=3Dbrowser&var-database=3Dedquppk2ghfcwc&var-p=
ath=3Dboot&var-runtime=3D$__all&var-tree=3D$__all&var-origin=3Dmaestro

I don't think that is intended behaviour.

Kind regards
Fabian Pflug
