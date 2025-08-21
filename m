Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977763054E4
	for <kernelci@lists.linux.dev>; Thu, 21 Aug 2025 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797556; cv=pass; b=I+Pr5Ehji/R+j4xXWjC4tzAq1dD6EGMG/L7Qo2CH5EI4jXxcGbgNmsMRxHCAPBfxGzIBBZAbRIkaZ1cmk7WimDZez0AQ5nnwuZ/WexZ+mo2PTPT8HuMhAeq9l8kJJwDxVMv8SJSyaYbOzI3H05r680gcIiFOlMvwd01mU5HmJTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797556; c=relaxed/simple;
	bh=ljAaO/s3ZM4xjKIQSPqnnjSFpN/joTJRTKLTEigccTc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Bd1jWSp3DQjH7l6PITXCtkG6cpL3U/+/M7XRVEz7szFgp1590IuMsO+F1sfYYNdADiP+k863FgDc8uPWElo3whIJJOeJSZxzbHQPIXvA3P6+0SEtvu0EYDGFzIOIbhERPzGpvqzA+HHCeK0W9ajGe+cZ7h4HYJeKanj+SMWDuus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=Cqt9xc9s; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="Cqt9xc9s"
ARC-Seal: i=1; a=rsa-sha256; t=1755797545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IWlW79SqT7rBGNsSTzhGhYEf4G5r48eiVM4sZvOmXvmD1NKv40Wm4ZIqH9efx9NrzDAHXvn/MXVtXxksVWhyWBtnyaLGjOm+qNPVxGW1BmaxieHcZKvISWgkU1ow1ZNYsWa5biU1Lct3YPJTJiC0xfzsXoxJoJBn+mA941mwcZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755797545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t5a/MuGgAXGRJz5fMITkXfoiXGJyb+VCGeF9sd/HHC4=; 
	b=Aqc7zLT1rAQWm0UmKu2ZSwEPkFbXKRj5a9LYrUhxufrnUX4CeiKN7ir093BRKL4uKsaYTqkRTNw0hYwGVjpQgXKqe/i+EBxZJfMPpsHh/u4xDB5dLM5T/VFhSpHBDlTO3ht/tVzu1SfEjdiCtNqF/7kSFSCMfN3MO8YCVU6Wn9w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755797545;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t5a/MuGgAXGRJz5fMITkXfoiXGJyb+VCGeF9sd/HHC4=;
	b=Cqt9xc9sETOSlFDSjPvLe6is5IGUOflFJK4RgJBCZ37a7rRvjBIuj1c4+deiRkp1
	XMIpgyEx27qdQTYODynM/yb2tyma6XZoX6a89kYCgXkpyUgqJi3Pk+alWfA1PfMl8mY
	sQhUSD+6V0Q4aUoae2jqRNuD/d7BubmNdZVyr+tU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1755797543262682.3683859568998; Thu, 21 Aug 2025 10:32:23 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:32:23 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Gustavo Padovan" <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Automated Testing" <automated-testing@lists.yoctoproject.org>,
	"KernelCI Members" <kernelci-members@groups.io>,
	"kernelci-hw-vendors" <kernelci-hw-vendors@groups.io>
Message-ID: <198cdb05900.390510884659603.8671527595926972481@collabora.com>
In-Reply-To: <1987a1851a3.360c6270521972.8904361685319295839@collabora.com>
References: <19809426904.3c4822be1251531.2628638964882412232@collabora.com> <1987a1851a3.360c6270521972.8904361685319295839@collabora.com>
Subject: Re: KernelCI Workshop in Amsterdam on Aug 28th
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

Hello,=20

We are one week away from the KernelCI workshop! So let=E2=80=99s dive deep=
er into the content we want for the workshop.

The workshop will run from 9am to 5pm (Amsterdam time) on August 28th. If y=
ou want to be there in person please register through:=20

https://forms.gle/SwanWMQnwg6F6UAx9=20

We will also open a Zoom conference call for remote attendees. See details =
at the bottom of this email.

## Content

The gathering will be informal and driven by the interest of the participan=
ts. We will start the day with=20
a quick overview of KernelCI by Gustavo Padovan to bring everyone to the sa=
me page and then discuss which topics we want to focus during the day.=20

So now it is the time for you to place your suggestions! Please bring in di=
scussions you want to see or topics you want to present.

I=E2=80=99ll start by listing a few discussion topics here to warm up:
* Maintainer=E2=80=99s usecases: discuss and prioritize key usecases and un=
derstand the steps to implement them.
* stable-rc: How to create and deliver unified reports to the stable mainta=
iners in a timely manner
* quality of test results - we run many thousands of tests everyday, but th=
e confidence level is not where we want it to be. Some tests and platforms =
are unstable, but currently we have no tracking of that.
* What=E2=80=99s the sweet spot for email notifications? It is known that b=
ots send too many emails. We don=E2=80=99t want to repeat that with KernelC=
I. Our notifications infra is still PoC, so let=E2=80=99s discuss the next =
steps.
* Web Dashboard: what are we missing? What are the next steps?
* Defining Hardware/Platform information: Today hw info in pretty much inex=
istent in KernelCI and a big limitation for showing results filtered by hw =
capabilities.
* KCIDB-ng and Dashboard DB roadmap: we have been revamping how we store te=
st results sent to KCIDB, so this is a pretty good discussion topic as well=
.
* Testing patches from the mailing list. What to look for in this testing?
* Listening to test events in the Maestro API: current limitations and wish=
list to improve support the CI ecosystem that want to test jobs generated b=
y Maestro
* kci-dev: requesting ad-hoc test execution to test patches against regress=
ions, bisections, etc.
* bisection support: how to do it?
* Labs in Maestro: What can we improve there?
* Test results retention policy: for how long should we retain results? Whi=
ch summary info should we keep?
* KernelCI sysadmin policies
* =E2=80=A6add yours here

=20
## Prep material

If you want to dive into some material ahead of time to be more prepared fo=
r the discusssons, we highly recommend you to:

* study our architecture and key concepts in our docs[1]
* look at our non-comprehensive wishlist in the KernelCI Roadmap doc[2]
* try out our command line tooling kci-dev[3]
* navigate through our dashboard[4]
* look at our email reports [5]

[1] https://docs.kernelci.org/=20
[2] https://docs.google.com/document/d/1q7g5LLCFL0Sr6V5Y3wHWWVQjIQuLjhmvmzH=
bjgnmG8M/edit?tab=3Dt.0
[3] https://kci.dev/=20
[4] https://dashboard.kernelci.org/=20
[5] https://groups.io/g/kernelci-results


## Virtual Conference details

Join from PC, Mac, iPad, or Android https://zoom-lfx.platform.linuxfoundati=
on.org/meeting/94738189901?password=3D6279f2f6-9dad-4187-8294-8cfd474a6704=
=20

Or join via audio One tap mobile: US (iOS): +12532158782,,94738189901#,,,,*=
162525# or +13462487799,,94738189901#,,,,*162525# US (Android): +1253215878=
2;94738189901#;162525# or +13462487799;94738189901#;162525# Or dial: US: +1=
 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 or +1 301 715 8592 or +=
1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (Toll Free) or 855 880 12=
46 (Toll Free) Canada: +1 647 374 4685 or +1 647 558 0588 or +1 778 907 207=
1 or +1 204 272 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 8985 =
(Toll Free) Meeting ID: 94738189901 Meeting Passcode: 162525 International =
numbers: https://zoom.us/u/alwnPIaVT


Looking forward to meeting you in the workshop!

Best,

- Gus


--
Gustavo Padovan

Collabora Ltd.



---- On Tue, 05 Aug 2025 08:57:50 -0300 Gustavo Padovan <gus@collabora.com>=
 wrote ---

 > Hello,=20
 > =20
 > Thanks to everyone who subscribed already!=20
 > =20
 > This is reminder for those who want to join the workshop. Follow the lin=
k on the message below to subscribe.=20
 > =20
 > And let us know of any topics you might want to discuss.=20
 > =20
 > Best,=20
 > =20
 > - Gus=20
 > =20
 > --=20
 > Gustavo Padovan=20
 > =20
 > Collabora Ltd.=20
 > =20
 > =20
 > =20
 > ---- On Mon, 14 Jul 2025 11:06:43 -0300 Gustavo Padovan <gus@collabora.c=
om> wrote ---=20
 > =20
 >  > Hello everyone,=20
 >  >=20
 >  > We will run a KernelCI Workshop on August 28th right after Open Sourc=
e Summit Europe(OSSEU) in Amsterdam. The location is not too far from the m=
ain OSSEU venue.=20
 >  >=20
 >  > The goal of the workshop is to discuss the current architecture and r=
oadmap of the project and refine our directions forward as a community. The=
 workshop will run as an un-conference style with agenda discussed and deci=
ded at the beginning of workshop.=20
 >  >=20
 >  > If you want to take part, please manifest your interest at:=20
 >  > https://forms.gle/SwanWMQnwg6F6UAx9=20
 >  >=20
 >  > For any questions don't hesitate to reach out to me.=20
 >  >=20
 >  > - The KernelCI team=20
 >  >=20
 >  > --=20
 >  > Gustavo Padovan=20
 >  >=20
 >  > Collabora Ltd.=20
 >  >=20
 >  >=20
 >  >=20
 > =20
 > =20
 >=20

