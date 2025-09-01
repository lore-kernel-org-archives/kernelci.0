Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73025285079
	for <kernelci@lists.linux.dev>; Mon,  1 Sep 2025 22:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756767307; cv=pass; b=E4Mo94+PQybb9A5bkJkFtVN9m/6FxdgN/rjKO8mWa7QbFnLN7pX+C5bos8DFT792mpTnW52d7aDTx2jHi7i6EK+dZt44lLB2eh/77EZ1f9fWB5oujICLeYqrHhtQyYK79E+B1Wz1yoNExnNCAomzhcaqZrO9Bo09qjMxu8CiNgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756767307; c=relaxed/simple;
	bh=JbQEhEsKREVxDX+ml2fqW+dwAhyjvN1DNr7wGaznEsM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Q+cEybc1/gGu9ZAzxaI2CTvsG0LZMZMQ6k/5q42pp/2ecQLc601P0GAv/9/MVxIuu7G4cKW7vTWMfFD0P7vFu0mDdEIqfG9+mSpwDfJAlRbVYjLGCSBLv/v8GZLIVY5xXvlp5QV+CptRv4psq0jgouFkHrMo+6doyv03uCTNzgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=UctRHniw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="UctRHniw"
ARC-Seal: i=1; a=rsa-sha256; t=1756767299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gt/g0l7nbY6QppD/5N9hlZ9FjNeIu6aTlk12TDMXgZveimVsZo8TwEROrkP350fvnc0JoUBlwjmXqcBk0P+wqg6PqGoxyBV8QXZRWs3k8U6FtFiSNXphIzNDMQnYtqqKCWfxzQ3AkTBZEdskAPxOyGvi00dpRAKHrtEBG6l0zbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756767299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JbQEhEsKREVxDX+ml2fqW+dwAhyjvN1DNr7wGaznEsM=; 
	b=IQKKza3TZkie7Rjr6WwSfgOs8Ny3q14Je6N+VbMS119hprUWLxBZ3R5jFqwrXU/gN1iEsFEOzSAgM51ckDYuguAraNIrj2KG8OLcFcZ60zfMkjBQb4UNK3q9s4TV/1n86czd/O+PTsMRUi8z9HLM8NABsEPZBV5J7h/qLTP3ttw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756767299;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JbQEhEsKREVxDX+ml2fqW+dwAhyjvN1DNr7wGaznEsM=;
	b=UctRHniwsxsdeqXEKTVHOFb1ihkWSgpiVTMDTx6pySB6G6ZOolqsJSsWrnBQnXby
	1jjHiFUnuE2XIzqAnaKgDiKgRUH8zBy+FneKRWv798x24lsEFnSZeVFx0gLrIeLDApA
	RQJ57ymOK9kmnAZCw0/qVToAxpETwQjJprr70PCc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1756767297564274.49128985908874; Mon, 1 Sep 2025 15:54:57 -0700 (PDT)
Date: Mon, 01 Sep 2025 19:54:57 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "chris.paterson2" <chris.paterson2@renesas.com>,
	"ben.copeland" <ben.copeland@linaro.org>, "cfi" <cfi@pengutronix.de>,
	"broonie" <broonie@kernel.org>, "sjoerd" <sjoerd@collabora.com>,
	"khilman" <khilman@baylibre.com>, "f.pflug" <f.pflug@pengutronix.de>,
	=?UTF-8?Q?=22Pawe=C5=82_Wieczorek=22?= <pawiecz@collabora.com>,
	"Tim Orling" <tim.orling@konsulko.com>
Message-ID: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
In-Reply-To: 
Subject: KernelCI Labs Working Group
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

Following discussions at the KernelCI Workshop 2025 in Amsterdam, we're est=
ablishing
a Labs Working Group to address the challenges of executing testing through=
 hardware
labs in KernelCI.

## Working Group Scope

The Labs WG will focus on improving how KernelCI integrates with and manage=
s=20
hardware testing laboratories. Currently, we support only LAVA, but there's=
 growing
interest in expanding backend support and addressing various infrastructure=
 challenges.


## Key Areas of Focus

- Labgrid Integration: Design and implement labgrid backend support alongsi=
de existing
LAVA integration
- CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.) th=
rough improved
events API and shared rootfs images.
- Alternative Backends: Explore integration with other lab management syste=
ms like Tuxtest
for virtualized testing
- Lab Health Dashboard: Develop tools to monitor lab status and infrastruct=
ure issues
- Failure Classification: Improve detection and reporting of infrastructure=
 failures vs. actual
test failures
- Lab Admin Guidelines: Create standards for lab administrators on device t=
ype differentiation
and configuration facilitating accessing the same hardware across multiple =
labs.
- Job Prioritization: Implement smarter job scheduling
- Dependency Management: Avoid running dependent tests when prerequisites f=
ail (e.g.,
skip NFS-dependent tests if NFS boot fails)

The Labs WG will work closely with the Infrastructure Working Group and Tec=
hnical
Steering Committee to ensure our efforts align with KernelCI's overall arch=
itecture and goals.

Based on the interest during the workshop, we=E2=80=99d need to cover the W=
est Coast timezone
as well. So an initial proposal for these meetings is starting next week on=
 Thursday,
September 11 at 7:30am PDT/4:30pm CEST.

We invite all interested community members, especially those running or man=
aging
hardware labs, to participate in this working group. Please reply to this t=
hread if
you're interested in contributing or have specific use cases and requiremen=
ts to discuss.

Best,

- Gus

--
Gustavo Padovan

Collabora Ltd.

