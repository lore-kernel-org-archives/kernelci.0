Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64F37C
	for <kernelci@lists.linux.dev>; Thu, 13 Jun 2024 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258758; cv=none; b=gGs7YjM+yjpL6/a+oK2LECmDufRy7a7jcYHcProtu2iQXpoGfiFUDftEb8M+OnaUbZkJ+vFtdmizICqdBCuPWyQkcEapLPodR/c9fBIxM5+2+4e8i0HeWjZcUwY1gXAvBCjqzBZaYyWjGItD7iFL57slJWTAcd3ZSN8t0j0DxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258758; c=relaxed/simple;
	bh=gn5jcAanPaAhw2WtC7MoRsdDZSnHGb1GrYgIiJ3ep3U=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jIUHEpCgmBT1a0D1ZEIllQn+l2SzLrzo5CWDVzqsn42yFQGXUhzih+mlWlnAe+fLFNTZTc928G2Fztid35oBqdupBkfW5Rn6kTdTr+YkN3nFGe5EDBo9UgHw7cFCph/L969DGdlznMEUtEbm/tWZq3jaGmDczW24VbEfAxrvm9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I7ibYO0u; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I7ibYO0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718258755;
	bh=gn5jcAanPaAhw2WtC7MoRsdDZSnHGb1GrYgIiJ3ep3U=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=I7ibYO0u3hht67hlyc8PCoupMDLYPMk7D82ndpDj+9XAZI9OhYb7FojzsjHzOo2UM
	 IEurVrBi4y6GAHzr0Pdmc4ZaVEDjZEidodyNJHnDUq47PUeYIRAv+NjErKtaJfsPwy
	 UckwW9qAXDBnXVzQZcR8zk4MajFTKjsS+33GPokRT0qa9jf6Ku4aTHxVP3DUxAM/ep
	 Fv/eb7a9ezBKYzGG1MBbQIkDYF02D9zBE6whcUhPmXEO2J1xqWKLUfw+BWoNC1Y0E1
	 J8uFT1NlKyw+GxqQ/gLEstYXbSr7KPGCMS4jIUtwTQSSOi6Fj4OGsyV+0Kfb4LbS/G
	 /tTS/H+a43dwA==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ACD6537820CD;
	Thu, 13 Jun 2024 06:05:54 +0000 (UTC)
Message-ID: <7f692ecd0f55ab29baf68826114ec088376cda56.camel@collabora.com>
Subject: Re: [kernelci-tsc] New name for new "KernelCI"
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Gustavo Padovan <gus@collabora.com>, Nikolai Kondrashov
 <spbnick@gmail.com>,  kernelci-tsc@groups.io, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>
Date: Thu, 13 Jun 2024 09:05:53 +0300
In-Reply-To: <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
	 <17D6135FD5E0FC8F.2477@groups.io>
	 <7f9eca2b-e2e5-4288-a9c4-bd8be09f33fa@gmail.com>
	 <aba91233-6a98-a69c-0f27-955954e9e33d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-06-12 at 14:27 -0300, Gustavo Padovan wrote:
>=20
> Hello,
>=20
> On 6/12/24 11:56, Nikolai Kondrashov wrote:
> > On 6/5/24 12:00 PM, Nikolai Kondrashov via groups.io wrote:
> > > On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
> > > > As you know, we've been developing the new KernelCI API [1],
> > > > and the
> > > > kernelci-pipeline [2] based on it, for quite a while.
> > > >=20
> > > > However, by now it seems that too many things are being called
> > > > "KernelCI": the
> > > > project, pieces of the old system, pieces of the new system. We
> > > > would also
> > > > like to give the name of KernelCI the project a wider scope
> > > > than just a
> > > > particular CI system, and accommodate more packages/projects
> > > > under its name.
> > > >=20
> > > > So we would like to propose to call the new system "KernelCI
> > > > <Something>".
> > > >=20
> > > > And this message is about that "<Something>".
> > > Almost two weeks have passed from my original message, and we
> > > have collected a
> > > number of opinions and potential names. So I went ahead and
> > > created a poll to
> > > help us pick the new name:
> > >=20
> > > https://forms.gle/GY2uWw3yGLA6u5EbA
> > >=20
> > > The poll requires authenticating to Google to limit the number of
> > > votes, but
> > > if anyone has a problem with that, just post your response here
> > > (pick all the
> > > options you like), and I'll add it myself. We'll close the poll
> > > in a week.
> > The week has passed, and the poll is now closed. We've collected
> > ten
> > responses. An the clear winner is:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 "Maestro"
>=20
> Nice. So here comes Maestro!=C2=A0 This is a great step to clarify the ne=
w
> architecture.
> We should first patch that in the documentation together with the=20
> overdue update
> on the overall KernelCI architecture. I can look into a patch for
> that=20
> next week.
>=20
> Now, when it comes to actually renaming the git repos and other
> things=20
> we want
> to evaluate a proposal to bring kernelci-core, kernelci-api and=20
> kernelci-pipeline into
> a monorepo kci-maestro. But that would be post Plumbers possibly as
> our=20
> focus is
> super sharper on showing the new KernelCI there.
I believe renaming anything at this current moment would significantly
set us back. Additionally, until we eliminate the legacy systems,
renaming is technically unfeasible.

However, I would like to propose creating a new repository called kci-
maestro. This repository would consolidate various scattered components
of the project, such as new deployment scripts, maintenance tools, and
local development install scripts (currently residing in kernelci-
deploy and mixed with legacy items).

Rather than attempting to merge elements that cannot be easily
integrated, this new repository could serve as a true orchestrator for
all other components.
>=20
> I guess we should also start tagging the maestro data in KernelCI as=20
> 'kci-maestro' or
> something like that and not 'kernelci' anymore. Jeny, thoughts on
> this?
>=20
> Best,
>=20
> - Gus
>=20

