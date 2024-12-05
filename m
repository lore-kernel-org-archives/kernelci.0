Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8A1D5CC2
	for <kernelci@lists.linux.dev>; Thu,  5 Dec 2024 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733393453; cv=pass; b=oUWzxG7OnX+Jqj0yc8/vJnFpIQXEdrNBMjecEXGYUHlWyTOCHgYaEVoanzXtnJH7Xfqr6ApE/2RbZHXUEysfP6ssC6piXUlK/qIqIIs5Yf6j8Gbl8KoEwExc2bP0q+ouzre9fkp0992FOTbCjuKDxzthJyNSCZlaBC6SUYj0OPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733393453; c=relaxed/simple;
	bh=1Va89NmtoVe2yiLOITk5uBYl+2OXo5SIUoNnl/q/+Ok=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=TRWCGA66CBMUxiUGok3tEC7SoA29IBGHrJuieg5SzVng1399vqz7/XsWxEpM3lByNy/grOSbykixJOx+Ci76ZCgy+NH4Wbe8Hd5TKms9VvJKghO0C2PHS9XArHKYS5FN46Jbjj9FfxUbxMLxac/ycyJqJFQsKUVPcpM+unHEymA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=g95YU9q0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="g95YU9q0"
ARC-Seal: i=1; a=rsa-sha256; t=1733393449; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I3axaze8GPH+bzfzteAq3sZ17tWpkAKqFwa1xqjvR6J6rKE//wL3131h1JT5rZwQ6nMJAdI3TjN9aMudeN36w/Nsg71+voMQhmPLuTiY32nX96uHsEcBFzHIP5xNNr3w28BAmcGDHuDII1YQqb/edNZTll1ew6BA3V4Rnr166Eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733393449; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=GMSIu7J9J26CCQE0w0snD9vRB/hb+3pasRLlER3JCbA=; 
	b=hdPIi67Ndz9tci7YJJsLSv32yWiSMq7cvbQX2pccmbdj3ziQ6dMgMACkde+Dv1cq/d0FTDb6pXwmI2WdkYILzDMLe1XTslvNHhTxjBhRNNjqpBMofOy1UmQ1RaXuiU7+VRkVo4ZCl4YWnAya/afVycN2jluc9Jo/iyxhIVnnvV0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733393449;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=GMSIu7J9J26CCQE0w0snD9vRB/hb+3pasRLlER3JCbA=;
	b=g95YU9q0mr8TOlIG8HCNba2sH6ooO1qRosnhEhmSYMja89tgTar7otAF6dO5dUiE
	8tCrKPqwG/r3Op2sO3GEwOli+1cMtSkIXEB2/74KM+i2CbXLJRasPazGgAzZ6J2khsT
	y1s+d9qe22i1HX1V2mcpSsc8+oeEzACODCUm0zfQ=
Received: by mx.zohomail.com with SMTPS id 1733393446926576.1469060969664;
	Thu, 5 Dec 2024 02:10:46 -0800 (PST)
Message-ID: <30f74795dad7fa3d8e6ca302ad77d86f72a68bf5.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 49)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Thu, 05 Dec 2024 12:10:44 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

**KernelCI Weekly Newsletter (Week 49)** =20

**Summary:** =20
This week, we are investigating an issue with KCIDB submissions. We
identified that the volume of tests being generated exceeds the
capacity that the KCIDB-Bridge can handle. Addressing this bottleneck
is a top priority, and we are actively working on a solution. In
parallel, we are implementing additional features to enhance the
functionality of the KernelCI Maestro. =20

As always, maintaining the reliability and stability of the KernelCI
service remains our highest priority, and we are treating this issue
with the utmost urgency. =20

**Known issues**
KCIDB submissions are currently experiencing a bottleneck due to the
volume of tests being generated. We are actively working on a solution
to address this issue.

### Key Updates: =20

- **Legacy Sunset:** =20
  Both instances of Jenkins have been fully decommissioned. These
instances were removed from staging and production scripts.
Additionally, the MongoDB database has been archived and shut down. =20

- **Production Updates:** =20
  Several critical production updates were deployed out of band this
week to address and resolve important issues swiftly. =20

- **Trees Updates:** =20
  The 4.9 stable tree has been removed from the list of supported trees
as it reaches its end-of-life (EOL). =20

- **Website Updates:** =20
  - The ELISA project is now listed on the KernelCI website as an
Associate Member. =20
  - Minor updates were made to improve the website and its deployment
scripts. =20

- **KCI Command:** =20
  A new command, `findfast`, has been added to the `kci` command-line
tool. This command leverages a new API endpoint to enable non-paginated
searches, enhancing efficiency. =20

- **API Enhancements:** =20
  A new safeguard has been added to the `/nodes/fast` API endpoint.
This ensures that long-running queries are limited to prevent the API
from being blocked by resource-intensive operations. =20

- **Tast Test Updates:** =20
  The `tast-ui` tests have been re-enabled to allow observation of
their results. =20

- **KCIDB Bridge Improvements:** =20
  The KCIDB-Bridge now ignores incomplete builds and checkouts, as
these are designed to be retried automatically. This reduces
unnecessary processing and improves throughput. =20

- **KCIDB updates:**
  Researching ways to unlock more query and ORM performance.
  Refactoring ORM caching to better handle issue-related queries, so we
can implement issue notifications.
  Fixing empty codec reports, But have we broken them more, instead?
Where are they?


### Planned Discussions for the KernelCI Weekly Meeting: =20

- **MongoDB Archive Management:** =20
  - Where should the archived MongoDB data (approximately 100GB of
compressed data) be stored? =20
  - How can access to this archive be provided to those who need it? =20

- **KCIDB**
  - Discussion: how to hide already-seen issues for result reviewers
(Usama and others)

