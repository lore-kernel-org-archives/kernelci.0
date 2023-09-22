Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E6A179B6
	for <kernelci@lists.linux.dev>; Fri, 22 Sep 2023 07:24:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rsc@pengutronix.de>)
	id 1qjaWd-0006ds-Eh; Fri, 22 Sep 2023 09:24:31 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rsc@pengutronix.de>)
	id 1qjaWc-0086x2-10; Fri, 22 Sep 2023 09:24:30 +0200
Received: from rsc by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <rsc@pengutronix.de>)
	id 1qjaWb-00E2mo-MZ; Fri, 22 Sep 2023 09:24:29 +0200
Date: Fri, 22 Sep 2023 09:24:29 +0200
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: Tim Bird <tim.bird@sony.com>
Cc: Mark Brown <broonie@kernel.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>
Subject: Re: [Automated-testing] kci command line poll: Click or Typer?
Message-ID: <ZQ1BLUfYiuXUicf2@pengutronix.de>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
 <b6743bf5808d43a48e9cc78ea0871fd8f23e1f6f.camel@linuxfoundation.org>
 <d5161b00-6688-4632-b878-90aa755a95dc@sirena.org.uk>
 <BYAPR13MB2503C20593F85F7F641E42D1FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR13MB2503C20593F85F7F641E42D1FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rsc@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernelci@lists.linux.dev

Hi,

On Thu, Sep 21, 2023 at 09:46:02PM +0000, Tim Bird wrote:
> Actually, I need to state that I actually like Python a lot, and it's
> my preferred choice for scripting languages. The main command line
> tool (and most of the other utility tools) in Fuego are in Python, and
> I've worked with it for many years. As Mark correctly says, it's the
> module ecosystem that drives me nuts, not the language itself, or the
> core libraries.

I feel your pain. I'm maintaining ptxintranet (our internal business
software for timesheets, invoices etc), a python+django codebase that
has seen almost 15 years of maintenance, and the whole "people change
stuff all the time" drives me crazy. One of the Linux key features for
me as an automation guy was always POSIX, that made it possible to move
away from proprietary microcontrollers to a standard interface, making
it possible to maintain critical control codebases over decades, which
is the timespan that the machine building & automation industry things
of.

However, these days one has to decide: Either for the fancy new world of
hipster code & languages (which all have their own packaging eco-
systems). Or for minimal environments such as POSIX+C or python-without-
the-packaging-ecosystem etc. Both have their advantages and disadvan-
tages, and you can't have it at the same time. With the hipster
languages, you can solve complex problems in a few lines of code. With
the low level variant, you have to invent-here all the standard things
the cool guys have with a handfull lines of code with a lot of effort,
and you have to maintain it over the time.

One thing I personally have learned is: If you use an ecosystem, use it
the way the original authors use it. Don't use it the way you think it
should be used. I tried to build ptxintranet on top of debian packets
for a while, and it was a desaster. Python developers don't care about
Debian, and Debian developers don't care about Python.

These days, my python stuff has a modern pyproject.toml based build
system with the usual pypy dependency mechanics, on top of *only* the
right python core version, using nothing else from the distribution. It
uses a sophisticated pytest testsuite with carefully maintained
coverage, and we follow the Django releases closely, with all the burden
of reading and understanding release notes, fixing test fails etc.

So I made my choice to follow the upstream way of life. It results in
quite some maintenance work, but at least for me, it doesn't feel like a
total desaster.

rsc
-- 
Pengutronix e.K.                           | Dipl.-Ing. Robert Schwebel  |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
