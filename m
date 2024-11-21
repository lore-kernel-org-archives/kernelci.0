Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADAF19CC0E
	for <kernelci@lists.linux.dev>; Thu, 21 Nov 2024 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732210629; cv=pass; b=ETcjg5zyCrq4Sw36CjUc62NDJjcAmsIhH98rIDrMuNvGAN9fnRXsoIh8/meA3twyi+VOeQztKoLv04o4REOKkp2RKswbPwrzf+ipPC9kXsmEarcNLZ9YzIEzwWroOSNrzSPPhCrCrTKAXwMeimztK81XuJYHqrDtRr2XFr2U68Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732210629; c=relaxed/simple;
	bh=PJBtpknym/Sa1i0A17V6orPOLTqTIz8VfjOMnh0Mlz0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=riEXjwoFpmgELKx2BqIpYq8eOq/RZyjNrps7cCZ5ZfKGeKg1iIBFkfur/4LmEgppoHIxPKvhPIywd8fbpANot24wBJKYOIZkLxc1QXq9MHjdXBayInlFjMI1LPN0z1yysKuzqh55A0+zX/0ETPW9f0DlCXnxAgI5u8qHWMcRz3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=I6QY9cOT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="I6QY9cOT"
ARC-Seal: i=1; a=rsa-sha256; t=1732210624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=atgF/s9SAO83LMOdZZn4ti5U1g+cL2W0PO3fp/ClQ5JAhfDvNnjK3f+W8Xooz8UW5erc54AzI85mwwjsthceVS5zrrXPGoPlUfwwaLY42ZiIJCCjMwAJAWczabtviy/N9A46ixOPvd6oxNx5jr/J7V7gnJ09FvYaZpxP+/iJJvk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732210624; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YfT+LNMa5qjzO5sZYQ/y6Z8EspxojSrZV0c9pndflT4=; 
	b=ZNqnkj6yte1539MYApRtk3BGg3FfCbf9GgZ8uaTH20Bb3eATEyFo2crZttSZjynlZX3m+Bxy8LZHJs4tPNPOyeJAnPv/YrbRhry2dId89AWCQvBlb59qtaNFq5aGREu62z3dIFSFz45DyZAbFJ/BnTD2lsYK9NWqzb/v/X/ZlTE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732210624;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YfT+LNMa5qjzO5sZYQ/y6Z8EspxojSrZV0c9pndflT4=;
	b=I6QY9cOTCN83MSM16HgJbq2kAY4cyPgjatc0TgmWiFvqLb7BaSBlLf9WTQwUFrQE
	aN+/ALVVvGnYezZnmtJ3c2uVCeZ3gguquSbZzxLXtAiM3jx1eWWGBmpeUbd2G4miAEb
	dtDRXcBCb4EkyVFIEhgyqY1STEz7+8JbLLcIvuQw=
Received: by mx.zohomail.com with SMTPS id 1732210621791446.0224965094186;
	Thu, 21 Nov 2024 09:37:01 -0800 (PST)
Message-ID: <f0a493d65e3c762fedf67726da93f9d04195e18f.camel@collabora.com>
Subject: Final Stages of Sunsetting the Legacy KernelCI Service
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-tsc@groups.io
Date: Thu, 21 Nov 2024 19:36:58 +0200
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

Dear Community

We are pleased to inform you that we have entered the final stages of
sunsetting the legacy KernelCI service. Over the past months, we=E2=80=99ve
successfully transitioned to the new KernelCI service, and the time has
come to conclude the shutdown process for the legacy system.

Here=E2=80=99s the planned timeline for the remaining steps:

    Tomorrow: The scheduler and workers of the legacy KernelCI service
will be shut down. This means no new tests or builds will be scheduled
moving forward.
    Next Week: The web interface and API of the legacy KernelCI service
will be taken offline. Following this, we will begin archiving the
legacy data.

We appreciate your patience as we worked through this extended
transition. Your support has been invaluable in ensuring a smooth
migration to the new service.

If you have any questions or need assistance, please don=E2=80=99t hesitate=
 to
reach out us over maillist or chat (IRC/Discord).

Thank you for being a part of this journey as we continue to enhance
the KernelCI ecosystem.

Best regards,
Denys Fedoryshchenko
