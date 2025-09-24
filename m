Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7D256C8D
	for <kernelci@lists.linux.dev>; Wed, 24 Sep 2025 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699613; cv=none; b=L6/EtC7SDo+Y5IsJCAYQ4JGHSeQVHjxAYn9WTLL6C0oGmaUi9YgbtXP1Frc7V1IKw/oe98HkW/TvQUTGaUFSGiJJ0f6NtzVLAiGPQ4S+zaqWw2CNhb/6pI88NekakBInLkLmzvJy4b/j8sL3mqu/ANJc8ovx0mQDi2BYYja3hxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699613; c=relaxed/simple;
	bh=Vh1/n0u0bOxmL/iFNPKfHsOg+CWWF9I451a0Iw4gUkw=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=QjeeGSJ5zXobe0P7VAcRfYus5RYBR224R/nJ91qfAaM6HjyrwuW1XWDRZIUdBCDWMHnBkCONf7RFmDtcaZ8oxEGcnQkOxTWTwyI8YiPuyfKQHaZnKWm14OVoNNFs4lTeOXcTe7jCQ+w8ZQ8TonOGBcLW3vK6kW1MTjXyOPTkdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1v1K6g-0003PM-Gg
	for kernelci@lists.linux.dev; Wed, 24 Sep 2025 09:40:06 +0200
Message-ID: <94b3130350b5c5d9ee7593986e36ec009033f34f.camel@pengutronix.de>
Subject: Reactivate Pengutronix Lab
From: Fabian Pflug <f.pflug@pengutronix.de>
To: kernelci <kernelci@lists.linux.dev>
Date: Wed, 24 Sep 2025 09:40:06 +0200
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

Hello guys,

I'm writing to the list, because I don't know whom to write directly. I'm c=
urrently trying to get to the reason, why the
pengutronix lab is not in the kernelci dashboard.

I see, that our lab gets a lot of jobs from kernel-ci(-staging), but don't =
see anything in the dashboard.

See for example:
https://lava.pengutronix.de/scheduler/device/imx6dl-riotboard-0

If I would follow https://docs.kernelci.org/components/maestro/pipeline/con=
necting-lab/ then the token setup step is
completed and there is a token for kernel-ci. (last letter of the secret is=
 an "a") But I also see, that the secret has
not been used since 2019...

Pengutronix is in the pipeline file:
https://github.com/kernelci/kernelci-pipeline/blob/96d69e2484903e427289058c=
971308494891f0dc/config/pipeline.yaml#L153

I'm now currently confused about the KernelCI configuration file.
https://docs.kernelci.org/components/maestro/pipeline/connecting-lab/#kerne=
lci-configuration-toml-file
this should be done on Kernel-CI side, or should it not?

The next step also seems to be done:
https://github.com/kernelci/kernelci-pipeline/blob/96d69e2484903e427289058c=
971308494891f0dc/docker-compose.yaml#L88

And jobs and devices specific to the lab are also there (for example):
https://github.com/kernelci/kernelci-pipeline/blob/96d69e2484903e427289058c=
971308494891f0dc/config/scheduler.yaml#L109

So what is missing, for our devices to be visible in the KernelCI dashboard=
?

Kind regards
Fabian Pflug
