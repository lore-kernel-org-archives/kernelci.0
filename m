Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA62D12F6
	for <kernelci@lists.linux.dev>; Fri, 11 Jul 2025 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239696; cv=pass; b=IGvlFx1hkaifczpOv3VoC86neqD6ihlF3dQSCP7T/P6qywZ0c4ZPF1iHDYDNC3OUMZRrVMFUHKHS4NiWuWjWYcg/zLxSPsO0JUcAiyA1O+GmdCvboIdKW0lfOA81RRh0Za6mk2GbMAZotaG8ZcioPm7Qvh9xwcKdFbHXVTgFS9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239696; c=relaxed/simple;
	bh=J+5PbDQK00m0HP+pzi4xiJybDhpxKGBdwdRpD1qk/TY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=W+pBFZ5wV9ehKEUnXGCPczgw6izyZj3oFUJt3+D1zlL0mqPo4oo+/96VTJgTKepjcmPVgYrXjyduE6WOuzp+Up/PGxR0AvhRk2oFpAIcP7/FGE6iE8uq8Fh1uq628vE+1tnPuded3AVgjAbTzyjgns/bxtitGGVsyqkY2dCJtis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=PPC1/tEu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="PPC1/tEu"
ARC-Seal: i=1; a=rsa-sha256; t=1752239691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NsS0xMg/5TXb8vRUw+3wMOqgmq7O+wpQ8inf01QrTVHujdp4sKoq8Ep7c6zA4AZqe28kSoSwzO7psp5Y7ViLvZQEH/cI/+LFr1AIua3j2ld7jiuOK1YSipCVzhRy7V01uUDJ7nqE6lcu1RLsfeeT016BrFPhEpBUbMUGlfwsFBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752239691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TeSEZZZCKqLvpn8CKAyJjL5AABWYf8hU/YMfCtqcntk=; 
	b=DuMtg9LuHVqb2nCDazljxcXP8NJ9Xvpc17WLocgeeTanwUnoN386gfZU/+jJmYscT+eo6qV4cqADktfymuvM+8PIeAzzhl1MTNgF+986WYrQh1zFoJq0NXMP/C3Pg0Ir11eyz+Su3A5I8KV7p/Z26QFHVkluzRxqPG32Al+IIss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752239691;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TeSEZZZCKqLvpn8CKAyJjL5AABWYf8hU/YMfCtqcntk=;
	b=PPC1/tEu6gjOkBVABxn6rScB1ZJNns8zLoOaM1gqxWViDOa1LAxpGT/O0b8thKty
	j8cjFscTr4FPNj2hFRSN/kTQHaBRhER1FBmQL6CN5AkBe+mZ7KVg2Iz4+8D/hqVquih
	AGFoJdFE1Pq/krs+eYEzNR88MN6SZFMhDXpVluAY=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752239688337976.3901746377177; Fri, 11 Jul 2025 06:14:48 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:14:48 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Christopher Hoy Poy" <choypoy@linuxfoundation.org>
Cc: "helpdesk" <helpdesk@kernel.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Message-ID: <197f99fca47.3adfcd18249548.8197390288143155741@collabora.com>
In-Reply-To: <CAKkv+gwwWNUq5skPg81nH50axGVYqf8Gg0snCmEb9SMNexn_xQ@mail.gmail.com>
References: <197f4fc4468.7d520309253626.7085799435648700480@collabora.com> <197f5059619.67381650261123.8906384152523459318@collabora.com> <CAKkv+gwwWNUq5skPg81nH50axGVYqf8Gg0snCmEb9SMNexn_xQ@mail.gmail.com>
Subject: Re: kernel.org email account for KernelCI
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




---- On Thu, 10 Jul 2025 21:55:54 -0300 Christopher Hoy Poy <choypoy@linuxf=
oundation.org> wrote ---

 > G'day
 >=20
 > Yes, seems a clear fit for linux.dev as listed at:
 >=20
 > https://korg.docs.kernel.org/linuxdev.html
 >=20
 > Please follow the application instructions there and we can sort that pr=
etty quickly.

Okay. Thank you. We'll send a request in private.

 >=20
 > Cheers=20
 >=20
 > Chris Hoy Poy
 >=20
 > Senior Systems Engineer
 > IT Core Systems
 > The Linux Foundation
 > Perth, Western Australia
 > On Thu, 10 July 2025, 11:49=E2=80=AFpm Gustavo Padovan, <gus@collabora.c=
om> wrote:
 >=20
 >=20
 >=20
 >=20
 > ---- On Thu, 10 Jul 2025 12:37:42 -0300 Gustavo Padovan <gus@collabora.c=
om> wrote ---
 > =20
 >   > Hello,=20
 >   > =20
 >   > At KernelCI we are currently struggling with the Gmail API and plain=
-text.=20
 >   > Our recipients keep getting emails with line wraps and we can't figu=
re out=20
 >   > why. Both myself and AI dived into it and no luck so far. End of the=
 day=20
 >   > Gmail is really for HTML based emails.=20
 >   > =20
 >   > We received a feedback from the linux-next folks[2] that the fact th=
at=20
 >   > log excerpts shared in the regression report has line wraps makes it=
=20
 >   > harder for them to read it. (examples [2}).=20
 >   > =20
 >   > Would it be possible to setup ci@kernel.org or kernelci@kernel.org f=
or=20
 >   > KernelCI to send its reports from there? That could be a great solut=
ion=20
 >   > to our problem if you can serve emails for us.=20
 > =20
 >  I was just informed that linux.dev is an option too. And the process
 >  is through helpdesk, so leaving this here for you evaluation and answer=
.
 > =20
 >   > =20
 >   > Best,=20
 >   > =20
 >   > - Gus=20
 >   > =20
 >   > [1] https://lore.kernel.org/kernelci/197e685ded3.e673ce7447423.78516=
3730221310361@collabora.com/T/#t=20
 >   > [2] https://groups.io/g/kernelci-results/message/58934=20
 >   > =20
 >   > =20
 >   > --=20
 >   > Gustavo Padovan=20
 >   > =20
 >   > Collabora Ltd.=20
 >   > =20
 >   >=20
 > =20
 > =20
 >=20

