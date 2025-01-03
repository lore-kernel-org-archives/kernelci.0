Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CF157A67
	for <kernelci@lists.linux.dev>; Fri,  3 Jan 2025 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889966; cv=pass; b=lEoUwTYXkDJSnHGmOWefH7C38Yqo4osbguNTjvdlAQpyVD0INPj8N5YMEgf52ZREZFek4YCWZdgkjDm3zVr5uFM8RelV/hTc5uPpDcxKT4UbJqqsI40HIkOCWJxUsnPDxxnoNY5eYo/6Fdw1IKibW4kThtNNME2d7bClss4jnoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889966; c=relaxed/simple;
	bh=oBiAEek3WiyH76F6b4FEAYHumRN+CMgM67pAE1A4zkM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=ATEg339iXaHuoFaRU2Cchww5MVFL8jjyUx8fNSg21k08qW8uwZciKEjcacTxKanUZ1fxhcIVOq98qWo2GeaG/D/6BDzz5bcUTjDCHY0wmqSC+SVHgZDMsXCqyN3GM8W9xj+dSHKkcIcu3WiKFb96hLl9m8EDd6dyB6KffQyQMqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=MWldmDKs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="MWldmDKs"
ARC-Seal: i=1; a=rsa-sha256; t=1735889962; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cpl4693yGsinEa5FiWrCz0/DSQdtByZU2qUKjZPEwMSX4TkfWzkHUQ6Glg4Y7GlozqPC/nHl/RcZ3oT8U1U7j/EBord+/n8oUDiD0SPd1s9ptLMhc4RPQXx2XM8ENXP3MAStWFtWvm/Z0DWR4pamHEfyH7s4LgKVEWRLLSWuM20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735889962; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=oBiAEek3WiyH76F6b4FEAYHumRN+CMgM67pAE1A4zkM=; 
	b=Xcu2C6hmThJRIDW4Id8X4qWBlksdy55LJfnlmLhDM+YtvEmFcUSXuJ0qXNgUYw+jvHM/AO3+3shyQmqu/XXOQq7KipkXiYhDzuDcDBkUejS72SXEyRpKWv4pdxKbZM2iCLCGE3MuqbGtxIscZ29ZKhb+B8oFCcUxznpLBVefnro=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735889962;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=oBiAEek3WiyH76F6b4FEAYHumRN+CMgM67pAE1A4zkM=;
	b=MWldmDKsIA0tKZTksuwFrIpB+7XtLlzIKereLz2yUETjeYPNV714nI6FdIe5Ol/y
	Jg1XRsffZ4CLXalnED+kWejPz/Zus5823SkYj43/V+vpxHB1EPvEM0fREshlf7WKLmw
	/ifDSrljFg+/hAJ64iCbbHc+RA9lxT5m499Te5w8=
Received: by mx.zohomail.com with SMTPS id 1735889959910209.57577842480214;
	Thu, 2 Jan 2025 23:39:19 -0800 (PST)
Message-ID: <ea1d18727e090033155644806fbf7424bb826b7d.camel@collabora.com>
Subject: **KernelCI Weekly Newsletter (Week 1)**
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Fri, 03 Jan 2025 09:39:16 +0200
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

**Summary**

Welcome to the first issue of the KernelCI Weekly Newsletter for 2024.
Happy New Year once again to the entire KernelCI community!

This week, we have several updates to share. The KernelCI team has been
working on a new storage backend, which is now live on the staging
environment. This backend is built using Rust, Axum, and Azure Blob (a
big thanks to Microsoft for providing the storage). The new system is
designed to be more reliable and scalable than the previous setup. The
team is currently focusing on migrating the production backend to this
improved system.

The new backend has already helped uncover some issues within the
KernelCI infrastructure. One notable issue involves certain log
analysis tools repeatedly attempting to download the same log file=E2=80=94=
over
40 times=E2=80=94resulting in excessive egress traffic. Thanks to the enhan=
ced
visibility and flexibility provided by the new backend, the team is now
working to resolve this issue. This includes identifying the root
cause, fixing it, and, in some cases, redirecting these requests to a
more cost-effective egress path.

**New Backend Deployment Plan**

The deployment of the new backend will proceed in the following stages:

1. Create an `A` record for `files.kernelci.org` to point to the new
backend. =20
2. Take a final snapshot of the legacy production server. =20
3. Develop a new Ansible playbook for deploying the backend and attach
the old backend's block device to the new system. =20
4. Deploy the new backend on staging. =20
5. Configure `nginx` to proxy requests to the new backend while
providing access to static website docs.kernelci.org and temporary
access to the old storage.

**Important Note** =20
If you have any valuable data stored at `storage.kernelci.org`, please
inform the team. They can take a snapshot of the data before the
migration and propose a method to move it to the new backend.

