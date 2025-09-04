Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7B1DF97F
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997664; cv=none; b=q/SHvqyjnG8RKIv41aP3tD854VupwdyD2DNXnW3DNHHe6n0Z0HGgyePFXipdl8HKyWHOruYZGS8d+FebKNDFRXAqBY1VLQqF9RYxhNBiQjHKTYOjcNHoljvRfjL3/a72ctHJQxXJp3eF7gyj8HLbcNoXt/9bb5vs5lo/2k+fIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997664; c=relaxed/simple;
	bh=pign03+7nwIK7KxJivuJseB1fR19Ti01tfBpH453BLQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VteeEGGpUVcLLbX5CD/27Zoa/KI3XmSv7DsCnalR1vmXVPefl+75aiR2dJGuRIQEV8zDbNkbtna4A6LeQXQKdaCwDHunKXh20NJ0+rCqZSIjSxo9YR20Mur9wtdneGTRpWoyqxGUGZaZbaxHAqy0o7Kei6cmxK/z8igdOnnH690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <cfi@pengutronix.de>)
	id 1uuBLt-0003FD-CR; Thu, 04 Sep 2025 16:54:18 +0200
Message-ID: <c6581b53fb9f58a2117dd4b04a4ef6237f245e1e.camel@pengutronix.de>
Subject: Re: KernelCI Labs Working Group
From: Chris Fiege <cfi@pengutronix.de>
To: Gustavo Padovan <gus@collabora.com>, "kernelci lists.linux.dev"
	 <kernelci@lists.linux.dev>
Cc: "chris.paterson2" <chris.paterson2@renesas.com>, "ben.copeland"
	 <ben.copeland@linaro.org>, broonie <broonie@kernel.org>, sjoerd
	 <sjoerd@collabora.com>, khilman <khilman@baylibre.com>, "f.pflug"
	 <f.pflug@pengutronix.de>, =?UTF-8?Q?=22Pawe=C5=82?= "Wieczorek\""
	 <pawiecz@collabora.com>, Tim Orling <tim.orling@konsulko.com>
Date: Thu, 04 Sep 2025 16:54:10 +0200
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: cfi@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernelci@lists.linux.dev

Hi Gus,

On Mon, 2025-09-01 at 19:54 -0300, Gustavo Padovan wrote:
> The Labs WG will work closely with the Infrastructure Working Group and T=
echnical
> Steering Committee to ensure our efforts align with KernelCI's overall ar=
chitecture and goals.
>=20
> Based on the interest during the workshop, we=E2=80=99d need to cover the=
 West Coast timezone
> as well. So an initial proposal for these meetings is starting next week =
on Thursday,
> September 11 at 7:30am PDT/4:30pm CEST.

thanks for setting up the meeting. The time should usually work for Fabian =
or
me.=C2=A0
I don't think that we will make it to every meeting. But we want to try to =
stay
in the loop with developments.

Cheers,
Chris
