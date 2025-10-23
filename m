Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DDC3148CD
	for <kernelci@lists.linux.dev>; Thu, 23 Oct 2025 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224313; cv=pass; b=p0yRpRN24CxHyN7eJDEfkyAOndGxkmZy9IcRKFPyXO4cCIM+nx6qKelnDy5PgH4pFd5w3VpkNP/uJLfBefKUGhvqcyO/p+iwaqjHkRQ1gQN9fbyUADSm11lbeWJxj1rz74PgwtkygSTIjeyt7JEAdasy3Qn7tCc8Qo51+UN6VvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224313; c=relaxed/simple;
	bh=tp1nwqayorec1PSfuYXLqdI+9PDRNMGNYJa1ecneC1c=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=LqdubNrngpf8TA9Y33h5V9oU0p6Wt0QLcF42Uqdd8ugaL+6mrLBeMg68N2hloXCqMrckcZdmUHr83pJFbOhxxIp7Vne/ieH7rvKpBEOEt9elgzt/hJMxMLn1/6+W3cQxGi/kUJP6JU8iWe6cN07IiNouFuBt+q2BpyF8voJAWpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=LKzyMkZq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="LKzyMkZq"
ARC-Seal: i=1; a=rsa-sha256; t=1761224309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TL9iXSK/JvvtKVNK1OAHBRPaSuEMKBi1PR/V+D72jDmBE3eKH7v/wssBBvQk+Wbez+vaeHUpCkVQ6gM/4/g1VJKztnUQeUQJ+PgB4S8kOMEYRlrzjZ3h/sUdIBoCLRCczf/ZvDTZm1HNhRRyv+yvM+wOixjVLkrNf3jzqlbk3rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761224309; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=sweoNLEx4YOryALTv2m6Yc8gK8nfE9R1fAgxakdUeFc=; 
	b=L2IHAwpfvkRNHUspByCEdyXfvXPLKs23NAAfIJUXjlwIifLuM1T2FgwINcC5HfLJ0rxVaVLsUbx9gkzBld8lcGFpLGu7khKd0+PKoRUYAnYRmH55WEhpqJTfuw+rh4o+A1+4BWCFakkjMQGAtGg+ihi7zFABKw9xlHYXlthiOdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761224309;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=sweoNLEx4YOryALTv2m6Yc8gK8nfE9R1fAgxakdUeFc=;
	b=LKzyMkZq1XKxXvIEdvcgD41WivpU8oEznCWuhHe2U5ZuK3ARW2/Qemqkj9d8wsFp
	5MUdxyEEuLuw9fYxO/z/OgslMmEMQeni1y/eMGD0oVZNU7dPGPW4LFJ0m1hGIjGeyBl
	eljOChkx+tiQt3YD1dHGGcCjtvf5XA/hhcHyr+bQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1761224306744420.4326183128454; Thu, 23 Oct 2025 05:58:26 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:58:26 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Message-ID: <19a11262ff5.17cec6684679195.2854257421151138524@collabora.com>
In-Reply-To: 
Subject: 2025.Q3 updates
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

 We just released a blog post with the recent updates from the project. Che=
ck it out:

https://kernelci.org/blog/2025/10/23/kernelci-2025-q3-updates/

The KernelCI community has made significant progress in the past quarter.  =
We've completed the critical transition from legacy KCIDB to Rust-based KCI=
DB-ng and Dashboard DB for better performance and cloud flexibility, while =
infrastructure improvements reduced deployment times from hours to under on=
e minute. Two Labs WG launched developing pull-mode architecture for secure=
 lab connections, and Dashboard WG started bi-weekly calls focusing plannin=
g features and roadmap. The kci-dev CLI has evolved with Debian/RPM packagi=
ng, regression detection, and code coverage analysis, plus a new Hardware I=
nformation Registry schema is under review to standardize platform naming. =
Thanks to the entire community=E2=80=94join us at #kernelci on Libera.chat,=
 or Discord[1]!

Regards,

- Gus
(On behalf of the KernelCI community)


[1] https://kernelci.org/community-contact/

--
Gustavo Padovan

Collabora Ltd.

