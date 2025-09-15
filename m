Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51EE23D7C8
	for <kernelci@lists.linux.dev>; Mon, 15 Sep 2025 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950328; cv=pass; b=AUKNx4zNjODHhhXh3HkUa4vN65K7Kg42o0MLO0uMZI+69TFb19bzTTAV+KI8bparmGneoS2jxmapSPvP+cCuzpvwYFx8Omh8KVwI5HVlJZvhT/uOcY/WFwklc2A06UF4Hcrn8Qv34UGiDfnQWfFFEe6hLxYRu3+kG5wkIcsfsQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950328; c=relaxed/simple;
	bh=dysDtX4ZD51OmA0ZDOxS7NaZTalZp+UpFglDHD87m1c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EhL87KziBlGtfaVIw9SQdDG7/a27KkDGHiFoIj2mK63boV8qjCxwY1NPPYxemcKwpBOY1F4aAYh4nnhB1bdwQVlAUWBbPZuiljRWDnKZjxnU+g4krRLvDRnUN9NCgMv/2EfqSixPNDlaVC74odyL4zKAJ87zHyKufde6kt203OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=UHeAp4AU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="UHeAp4AU"
ARC-Seal: i=1; a=rsa-sha256; t=1757950313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gX2ydFyy25HhBelf3SprjGImQ3pTvrvw/luCyZV/bI8iMURD87bEQUndxA/Rs8NBDhKtt015t345+E9c2KWJLZklNsdzK+H88yShize/7Smp9UuPJY0Np9NFRhqIEgRXS6CljnnKFe5TBkY/haB+nrN4r9LQiz5UbAZhR+97gIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757950313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k5c1EyN9hEX7ClXJPVZV+q747Wu+2XG0X5wfnf6xIes=; 
	b=JZCBMaGbALYmCpQsxxYTzn1kC8KVnud1BVv0mRC0tZ78iIn9ou2rZYStg5FwMAyxsS2OvMIuWOanEpjx0RGajBKtHOgdZW/TMpE3pkVxcKjvlt1I1ptbVWOuLgahhgTOrewB8H9gQvs9X3AO1yec882vooZDqYR9GEewNHmiSIc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757950313;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k5c1EyN9hEX7ClXJPVZV+q747Wu+2XG0X5wfnf6xIes=;
	b=UHeAp4AUb9lROKaTcxjGgskWSAYK2Q9gkUr+amfNey75Czl4VaHk08TA564AA+bo
	IRg3vUKxxbsjO7WV+xDRLnNi97sj4nWvmvJ/I8fwP2VKZ3wrdubPhefnZmpWSGeGT7v
	txTiLhXDnRP0DvleHx+dbzG1Wgn3wQSsC4rVkN+U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1757950312034981.5217678179714; Mon, 15 Sep 2025 08:31:52 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:31:52 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Gustavo Padovan" <gus@collabora.com>
Cc: "Kevin Hilman" <khilman@baylibre.com>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"chris.paterson2" <chris.paterson2@renesas.com>,
	"ben.copeland" <ben.copeland@linaro.org>, "cfi" <cfi@pengutronix.de>,
	"broonie" <broonie@kernel.org>, "sjoerd" <sjoerd@collabora.com>,
	"f.pflug" <f.pflug@pengutronix.de>,
	=?UTF-8?Q?=22Pawe=C5=82_Wieczorek=22?= <pawiecz@collabora.com>,
	"Tim Orling" <tim.orling@konsulko.com>
Message-ID: <1994e00fe45.84bd1bd7184502.4638627030258549915@collabora.com>
In-Reply-To: <1993ea3bbde.627334c2425860.7853970427232369784@collabora.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com> <CAOi56cVoV4GoidU=yP8w=p6KXL_8msye3mtmtxJnQFOzcmC6Rg@mail.gmail.com> <19929cf8b8c.280b13d3500933.1530159640283422004@collabora.com> <1993ea3bbde.627334c2425860.7853970427232369784@collabora.com>
Subject: Re: KernelCI Labs Working Group
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

Hello,



---- On Fri, 12 Sep 2025 12:55:41 -0300 Gustavo Padovan <gus@collabora.com>=
 wrote ---

 > Hey folks,=20
 > =20
 > Thanks to everyone who joined yesterday. See meeting notes and video rec=
ording at=20
 > =20
 > https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFo=
GfA0aM4/edit?pli=3D1&tab=3Dt.0#bookmark=3Did.kub168tpcpqb=20
 > =20
 > Remember this meeting is bi-weekly, so you are welcome to join the next =
one on Sep 25[1].=20
 > =20
 > The main action from yesterday was to set up a deep dive section to unde=
rstand some of the Maestro internals for lab integration and the possibilit=
ies for labgrid integration. Please answer the poll for us to settle on a t=
ime as quickly as possible:=20
 > =20
 > https://doodle.com/group-poll/participate/e17VrA3b=20


Wednesday seems to be a clear winner already. I sent an invite. Below are t=
he details if you didn't get any invite:


1. Join from PC, Mac, iPad, or Android
Join Meeting
If the button above does not work, paste this into your browser: https://zo=
om-lfx.platform.linuxfoundation.org/meeting/99980824166?password=3D2bce4530=
-30e1-4e5f-8eb2-7d4f57e369c3

2. Join via audio
One tap mobile:

US: +12532158782,,99980824166#,,,,*620797# or +13462487799,,99980824166#,,,=
,*620797#

Or dial:

US: +1 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 or +1 301 715 859=
2 or +1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (Toll Free) or 855 =
880 1246 (Toll Free)

Canada: +1 647 374 4685 or +1 647 558 0588 or +1 778 907 2071 or +1 204 272=
 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 8985 (Toll Free)

Meeting ID: 99980824166

Meeting Passcode: 620797


Best,

- Gus


 > =20
 > =20
 > Best,=20
 > =20
 > - Gus=20
 > =20
 > [1] https://lore.kernel.org/kernelci/010101992a9a3b51-fdf26386-9ac2-4716=
-9e5c-12cf21bd1800-000000@us-west-2.amazonses.com/T/#u=20
 > =20
 > P.S.: If you didn't join the kernelci mailing list yet, please do so.=20
 > =20
 > =20
 > --=20
 > Gustavo Padovan=20
 > =20
 > Collabora Ltd.=20
 > =20
 > =20
 > =20
 > ---- On Mon, 08 Sep 2025 11:51:31 -0300 Gustavo Padovan <gus@collabora.c=
om> wrote ---=20
 > =20
 >  >=20
 >  >=20
 >  >=20
 >  >=20
 >  > ---- On Thu, 04 Sep 2025 15:28:47 -0300 Kevin Hilman <khilman@baylibr=
e.com> wrote ---=20
 >  >=20
 >  >  > On Mon, Sep 1, 2025 at 3:55=E2=80=AFPM Gustavo Padovan <gus@collab=
ora.com> wrote:=20
 >  >  > >=20
 >  >  > > Based on the interest during the workshop, we=E2=80=99d need to =
cover the West Coast timezone=20
 >  >  > > as well. So an initial proposal for these meetings is starting n=
ext week on Thursday,=20
 >  >  > > September 11 at 7:30am PDT/4:30pm CEST.=20
 >  >  >=20
 >  >  > I'll miss the first one due to travel, but generally speaking this=
=20
 >  >  > slot works fine for me.=20
 >  >  >=20
 >  >  > Is the goal for this to be weekly?  bi-weekly?  monthly?=20
 >  >=20
 >  > Let's start with bi-weekly and see how it goes. We'll send out invite=
s today.=20
 >  >=20
 >  > Best,=20
 >  >=20
 >  > - Gus=20
 >  >=20
 >  >=20
 >  >=20
 > =20
 > =20
 >=20

