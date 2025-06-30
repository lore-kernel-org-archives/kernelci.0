Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0728679D2
	for <kernelci@lists.linux.dev>; Mon, 30 Jun 2025 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751310396; cv=pass; b=sOSGp29AWxsO6Oflfdh9HYCcOZe4saq35fBIGoNADB+7FTONCO6s1f/ptinPwYgAkzrzxEG1lhJleXCNVzwD9CBnT4OJVUBSQPeAYCdRO7v4rx2jTdZtGLCicJ0TbQVL6wLYrXbzRh4oDpzk/oqT67VgAS1YP5kAIN5nhbwjayI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751310396; c=relaxed/simple;
	bh=67RZyiHzu7xVnTPsdEOCeP2ItJozr643km2SU2gA1i4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EjsSBqIS2/FP22Qsumz79FV+5i5vgs21kvNfpEp507sKxMurot1dXSI89HEigX4XR2USA7p5Mxu8vf0yyJ/2ZweqSu68b4neu5pGCt4OoCNcZpraXCz5+he2i0H2NQtxHeUSsUjWwrh8qxPmTWeB3HO46+bfCmNwcMC++0B+NKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=I5YiWU7b; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="I5YiWU7b"
ARC-Seal: i=1; a=rsa-sha256; t=1751310392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OwVX41nufhkrlwpdzIE18IpueVaeMjq+8i6Lz9Nx1xuFuVgdfKbIbOK6Tn+18sa+LjavjXwku8yUzRVvrPIE165tFU9H6OVmw8rRXO9UmqBleLSU/SpKb0JG0c/vWBqUWLX2tn5yrf9HvTDiFrNEajwVdjPtUv2pjdNJzYSEChE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751310392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z1OuIOliTEpQDYaOXQGPlPhWIbkGuutOeTwNo81r3mU=; 
	b=XC71drABt5zN1TU/9umsX309crJLrgbcisgz9yRPYHKBpw9e8aGNqWypA8NIDkCdxx1LdmXxe1e0/f06FcBmbjk42tfrWToVcfgAhpuJ+fQmAPLnmjENLHyJrwKLKbahTcMLxZQTA+K6jvWbC37N184U60QzyPmxN13D6W8xRE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751310392;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z1OuIOliTEpQDYaOXQGPlPhWIbkGuutOeTwNo81r3mU=;
	b=I5YiWU7bn4uSDbZB/q2BqNdY/Vd/MqvTwBASjIcpRrkgJ7h2FWHesh5/vWjFStQs
	cG3PqWNGI+ggY3ULfnYjG2WoXFQXOaye4AnMFjKrHgAB6hTQu6WuQwdCm6qaynRlww+
	t9O/CO/fvljoXxmwT8bsvkngypMMBj3d+hx0Avx8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1751310390581678.8117541847291; Mon, 30 Jun 2025 12:06:30 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:06:30 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Guillaume Tucker" <gtucker@gtucker.io>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"KernelCI Members" <kernelci-members@groups.io>
Message-ID: <197c23bd516.bfcf8d2d1396970.6608184766492335649@collabora.com>
In-Reply-To: <14e8ec3c-3006-484f-bc38-ca858d73fe26@gtucker.io>
References: <1973207707f.12474557a4721197.2962489771298840013@collabora.com> <14e8ec3c-3006-484f-bc38-ca858d73fe26@gtucker.io>
Subject: Re: KernelCI TSC Reset
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




---- On Fri, 27 Jun 2025 06:46:20 -0300 Guillaume Tucker <gtucker@gtucker.i=
o> wrote ---

 > Hello,=20
 > =20
 > On 02/06/2025 9:03 pm, Gustavo Padovan wrote:=20
 > > Hello everyone,=20
 > >=20
 > > Recently, we have been discussion the current state of the Technical S=
teering Committee(TSC)=20
 > > in KernelCI. Over time, a disconnect emerged between the members of th=
e TSC and the current=20
 > > active contributors to the KernelCI community and we didn't act in tim=
e to correct course. That's=20
 > > part of the pains of a growing community.=20
 > >=20
 > > On the flip side, it opens the door for us to rethink the TSC structur=
e from scratch - something the=20
 > > KernelCI Project Advisory Board jumped on and took a proposal for feed=
back to the weekly=20
 > > community meeting last week. Now, we want to share it with the wide co=
mmunity to discuss any=20
 > > feedback people may have before we take this to final stages.=20
 > >=20
 > > Of course, just having a new structure is not the solution to all prob=
lems. It=20
 > > will require engagement and commitment from TSC members to help the co=
mmunity grow,=20
 > > keep an open collaborative space, seek alignment of technical roadmap =
to our main goals and=20
 > > mediate key strategic decisions.=20
 > =20
 > That sounds great, and very much on point about engagement and=20
 > commitment.  The TSC has grown organically from the early team of=20
 > contributors and the hope when joining the LF was that member=20
 > companies and kernel developers would take it to the next level.=20
 > While part of this did happen with Collabora being a driving=20
 > force along with Red Hat, there hasn't been the fresh influx of=20
 > engineers anticipated.  That would have naturally provided a path=20
 > for keeping the TSC healthy in the long run with a renewal of=20
 > active contributors.  So now seems like a good time to try again.=20
 > =20
 > > # Proposal for the new KernelCI TSC=20
 > >=20
 > > The current proposal was build taking inspiration from how other TSC (=
eg ELISA, Zephyr, Yocto)=20
 > > are structured today. It has two main spaces:=20
 > > * the TSC itself=20
 > > * the KernelCI Infrastructure Working Group(Infra WG)=20
 > >=20
 > > In a nutshell, the Infra WG is responsible for the core infra of the p=
roject (Maestro, KCIDB, Storage,=20
 > > Web Dashboard) and the TSC drives the engament with the Linux kernel c=
ommunity, bridging the=20
 > > gap between the user needs and infra roadmap development.=20
 > >=20
 > >=20
 > > ## TSC=20
 > >=20
 > > *  5 members total=20
 > >      -> 4 by community vote with 1 year term=20
 > >      -> plus the KernelCI Infrastructure WG Lead=20
 > > *  Most voted person elected TSC Chair for a 1 year term=20
 > > *  Max of two employees from the same company=20
 > > *  Any of the community members listed below are eligible to vote and =
be voted to the KernelCI TSC:=20
 > >     -> Contributors to KernelCI git repositories=20
 > >     -> Technical members of CI systems and labs connected to KernelCI=
=20
 > >     -> Upstream Linux kernel maintainer who interacts with KernelCI re=
sults and/or give public feedback to the project=20
 > >=20
 > >=20
 > > ## KernelCI Infrastructure WG=20
 > >=20
 > > * Responsible for the software projects deployed as KernelCI services=
=20
 > >     ->Maestro, KCIDB, Storage, Web Dashboard=20
 > > * Manages the Sysadmin team. With the creation of the Infrastructure W=
G, the Sysadmin WG becomes a=20
 > >    team inside the Infrastructure WG with some people getting access t=
o the sysadmin secrets.=20
 > > * Initial member selection is based on key contributions and ownership=
=20
 > > * WG can vote new members in and out at any time=20
 > > * Members who haven=E2=80=99t contributed to the KernelCI projects for=
 over 6 months are automatically removed from the WG=20
 > > * WG Lead shall preside for two years=20
 > > * Voting members for WG Lead include the WG members and TSC members=20
 > =20
 > That sounds like a refresh of the Sysadmin WG we used to have,=20
 > it's great to see it come back and with a stronger structure.=20
 > =20
 > Out of interest, are there any plans for other Working Groups?=20

We are trying to keep it minimal for now and let the new TSC decide on thes=
e things.
The Web Dashboard working group would be a good candidate to continue in th=
at sense.

 > =20
 > > ### Additional TSC responsibilities=20
 > >=20
 > > Beyond what is already listed in the Charter, the TSC should be respon=
sible for:=20
 > >=20
 > > * Seeking feedback from the Linux kernel community and company members=
 as driving the=20
 > >   creation of processes for improving the feedback process over time;=
=20
 > > * Setting up a process (e.g. RFC, PEP, =E2=80=A6) for decision making =
around important architectural=20
 > > decisions in the project. Such a process should be used whenever conse=
nsus is not achieved=20
 > > trivially.=20
 > =20
 > One important aspect to add here would be transparency, with=20
 > public TSC meetings and public votes.  This is something that has=20
 > been discussed for a while as most other projects operate this=20
 > way, so now seems like a good time to make it happen too.=20
 > =20
 > > ###  Final thoughts=20
 > >=20
 > > For reference, today's the current TSC structure is described in the p=
roject charter[1] and any=20
 > > modification we will make to the TSC structure will require voting by =
the Advisory Board.=20
 > =20
 > In addition to the Charter created with the LF, a number of rules=20
 > have been voted over time by the TSC to clarify certain aspects=20
 > and make things easier in practice:=20
 > =20
 >  https://docs.kernelci.org/org/tsc/#rules=20
 > =20
 > It would seem worth going through these and consolidating things=20
 > into the new Charter document, for example to remove ambiguity=20
 > around votes (email vs meeting, quorum when some members abstain=20
 > etc).=20
 > =20
 > Even if everything ends up being perfectly well described in the=20
 > new Charter, keeping some documentation section about the TSC=20
 > rules always helps in particular for people who want to learn=20
 > about the project.=20

Okay. We will take a look in that docs section as well

 Best,

- Gus
