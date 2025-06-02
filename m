Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1629B0
	for <kernelci@lists.linux.dev>; Mon,  2 Jun 2025 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891043; cv=pass; b=MRPI76bB4UIWGP5J/ZWW+KsnG/FgqVVJYIoLJnGCPAtPdQYqVzYs6WHU8ZXit71uFiOIuJOu+YTt3Iq/LMkhh0PAoT302JuloRNfrJNnC9BfEbNM5d8PyzcA9uhKFCI5T5DZsPA2icHYtinTd1bIrCm1qggL9Oln12ayKDLGGnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891043; c=relaxed/simple;
	bh=qr+P7IU4F8WjakjamenGonIgHOk+nReRFS1C9iZC/qM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=dzHjfsPLZE7kQTDWbhYvYiiOyK7hoz+OwzA7KvDkDy05H56MUjYccy5nXRG8yf6l/OXIgrzzAgRmNuHTRwGC8r0iSwxgXpTeVRSaJLhehwHszF0dvP7b76W8DlVJK+s4/UMARMLseLllUX/nDagaVwDAR5lL6s8Pbvo2GqUq7IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=ENFWEbdY; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="ENFWEbdY"
ARC-Seal: i=1; a=rsa-sha256; t=1748891040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=COlyZruLKw1JN7u8hlEl3chfx7gncaJTifcjhSIfxjRt7p+mL7iiMVR1jhcsLwHG1Jtzgkh2J0d2cV6dC6l2XPI9rTpfdi0RXnL1ldjUcL8Dwkfpqr9M45Q1LRhw0nh45I/EOifzHjp8wXwZ0eUnyfz2/GsX1H47bO4dEuCGXv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748891040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3DnuoqKAc96sgZ6Xltm28sakgCoJBDCBpU3WeIodQDw=; 
	b=J9VwM0CVORWHK0OZL7A2aXMPnHNrmWeByKbEIIWtZpjo6wKMwJbkZWWq0Gomt+BDree+sWWUOFUVTff6PEPNbXlmhRz7ij6gD5kGT8V0nFVuNvR1ws0k+Q/hh+tK5ZzWaTAQ3fBPUWKBH6rVl24br8HssOgA7ZV9PUqXiAGgj+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748891040;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3DnuoqKAc96sgZ6Xltm28sakgCoJBDCBpU3WeIodQDw=;
	b=ENFWEbdYg9okuhx1NB6jaGuyMWzLCT0knKlY7YSU6DOzPDD4QR8TQbsXaPCEVa7I
	6fO5if/2IVY1eNXsQ9kh4oTQDgZjQufo67wCYUzMXxJiQNH5PiQUGIC4k4jhSsI9Xxt
	JTXYVjNmMX6pH3fxfjQd1iLXRh631z5+bCzgIxdc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1748891037900947.6328206456622; Mon, 2 Jun 2025 12:03:57 -0700 (PDT)
Date: Mon, 02 Jun 2025 16:03:57 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "KernelCI Members" <kernelci-members@groups.io>
Message-ID: <1973207707f.12474557a4721197.2962489771298840013@collabora.com>
In-Reply-To: 
Subject: KernelCI TSC Reset
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

Hello everyone,

Recently, we have been discussion the current state of the Technical Steeri=
ng Committee(TSC)
in KernelCI. Over time, a disconnect emerged between the members of the TSC=
 and the current
active contributors to the KernelCI community and we didn't act in time to =
correct course. That's
part of the pains of a growing community.

On the flip side, it opens the door for us to rethink the TSC structure fro=
m scratch - something the
KernelCI Project Advisory Board jumped on and took a proposal for feedback =
to the weekly
community meeting last week. Now, we want to share it with the wide communi=
ty to discuss any
feedback people may have before we take this to final stages.

Of course, just having a new structure is not the solution to all problems.=
 It
will require engagement and commitment from TSC members to help the communi=
ty grow,
keep an open collaborative space, seek alignment of technical roadmap to ou=
r main goals and
mediate key strategic decisions.


# Proposal for the new KernelCI TSC

The current proposal was build taking inspiration from how other TSC (eg EL=
ISA, Zephyr, Yocto)=20
are structured today. It has two main spaces:=20
* the TSC itself
* the KernelCI Infrastructure Working Group(Infra WG)

In a nutshell, the Infra WG is responsible for the core infra of the projec=
t (Maestro, KCIDB, Storage,
Web Dashboard) and the TSC drives the engament with the Linux kernel commun=
ity, bridging the
gap between the user needs and infra roadmap development.


## TSC=20

*  5 members total
    -> 4 by community vote with 1 year term
    -> plus the KernelCI Infrastructure WG Lead
*  Most voted person elected TSC Chair for a 1 year term
*  Max of two employees from the same company
*  Any of the community members listed below are eligible to vote and be vo=
ted to the KernelCI TSC:
   -> Contributors to KernelCI git repositories
   -> Technical members of CI systems and labs connected to KernelCI
   -> Upstream Linux kernel maintainer who interacts with KernelCI results =
and/or give public feedback to the project=20


## KernelCI Infrastructure WG

* Responsible for the software projects deployed as KernelCI services
   ->Maestro, KCIDB, Storage, Web Dashboard
* Manages the Sysadmin team. With the creation of the Infrastructure WG, th=
e Sysadmin WG becomes a
  team inside the Infrastructure WG with some people getting access to the =
sysadmin secrets.
* Initial member selection is based on key contributions and ownership
* WG can vote new members in and out at any time
* Members who haven=E2=80=99t contributed to the KernelCI projects for over=
 6 months are automatically removed from the WG
* WG Lead shall preside for two years
* Voting members for WG Lead include the WG members and TSC members


### Additional TSC responsibilities

Beyond what is already listed in the Charter, the TSC should be responsible=
 for:

* Seeking feedback from the Linux kernel community and company members as d=
riving the
 creation of processes for improving the feedback process over time;
* Setting up a process (e.g. RFC, PEP, =E2=80=A6) for decision making aroun=
d important architectural
decisions in the project. Such a process should be used whenever consensus =
is not achieved
trivially.

###  Final thoughts

For reference, today's the current TSC structure is described in the projec=
t charter[1] and any
modification we will make to the TSC structure will require voting by the A=
dvisory Board.

In the next steps, once we collect extra pieces of feedback here, the board=
 will evaluate and
hold a voting for changing the charter. Once that happens an election proce=
ss can start.

Let us know your thoughts,

Best,

- gus

[1] https://docs.kernelci.org/files/KernelCI_Project_Technical_Charter_2018=
1107.pdf


--
Gustavo Padovan

Collabora Ltd.

