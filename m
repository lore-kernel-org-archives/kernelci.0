Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0214F123
	for <kernelci@lists.linux.dev>; Fri,  9 Aug 2024 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723227740; cv=pass; b=DUTpFxk4z72Ln45sNqmkio9mws/yo/+uzNLfWeKlpteAPI26AirUJQckO7/kSLCDyJ4Ih9Q4314ay81wuNrAXzawhWBgAGStdPpzDAEeN+ZU7ToyiInG5eSnVVodTtRpWKdyhW+fFzlqgLyFL1xVEg+LLrqFPuCtKHCiP+6d0JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723227740; c=relaxed/simple;
	bh=aNceWuoVt36BpDXVLYQYt8j4IT3fXQ+LIfHmpMw+UxU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=uP6JNpqvpyAxB54ebx4YFyx0rgLXietXub1DNr3RCBV0lykgXVmt9rC02+WlrW6WErIr/pzdHRY6I4Bx9h4glqq+749aJxNMfg+qG+r0z4LYOIhFAUGrjLIxFOLEI0beH7rcjNdsVagPSXSV3bq7hYJBUU7ZvD7Rr90dmkcrMig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=TDgtifz2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="TDgtifz2"
ARC-Seal: i=1; a=rsa-sha256; t=1723227737; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nU4Wkb48/HzCtFeXp32XLu3ZF+47mlflacQddpaT3jVv9sxjr+LuyxwQ3nrZgpocjt9KvePt4SReCaMbFtUVmOj2XhjDx8Qd2luSN4wUgxX+ns2rr0lM/c8WYpKUXVIxF/smrglihoHeBRDLK5CxUdba4sEksMyvgwcIWwjERqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723227737; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aNceWuoVt36BpDXVLYQYt8j4IT3fXQ+LIfHmpMw+UxU=; 
	b=KfaA3vVhVN+QI6JPGZHXNCNR4vDGR3sBNO6ss1ZQp5bLan7RtnVpCVnHhTV2MhEjRmn2SdE7fTX24QKoU9YB5QeOqOffoTBX0x69DIeKKP/Wdy9CEvGqW+Ybum5lkg4SctYavPj0EfFRTSj0JvdJtMfjAr4cM/+JfKvEUPLVfck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723227737;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aNceWuoVt36BpDXVLYQYt8j4IT3fXQ+LIfHmpMw+UxU=;
	b=TDgtifz2OvqF6LBCLofh0o8EW0qaXtThIAYdpoQsp3rSsrC04fJCr47G9MvwzYuU
	TLi8gs613kj6Q8rzCtoR1E8LySbm3MNkD4isABS/u9LypIQLejM2F+QKGKYj8YdrAD2
	yzRJzuR6yVFsrv3flj4eubfq8IwWogCNrNTKGxlU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1723227735824979.1926033982243; Fri, 9 Aug 2024 11:22:15 -0700 (PDT)
Date: Fri, 09 Aug 2024 15:22:15 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "x86" <x86@kernel.org>, "mingo" <mingo@kernel.org>
Cc: "Kernelci" <kernelci@lists.linux.dev>,
	"Helen koike" <helen.koike@collabora.com>
Message-ID: <191386086cb.f3ae820a1725913.2785576254532847776@collabora.com>
In-Reply-To: 
Subject: tip tree testing on KernelCI
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

Hi Ingo,

Last year, you requested improvements to the reports sent by KernelCI[1].=
=20
Those reports were from our legacy KernelCI system. Since then we put
together the new KernelCI infra and trialed it with a small set of trees an=
d
tests. Now we want to loop in more trees and tests. As part of that process=
,
we are enabling the tip tree now.

We are also resetting our reporting process, so this is an opportunity to c=
reate
something that will fulfill your needs. I propose we take it in steps and u=
se your
feedback to evolve the report in a way it doesn't overwhelm you. Eg, we cou=
ld
start just with build reports and then trying to bring history or higher le=
vel
information such as new issues that arises.

Feel free to suggest an initial format too, then we can discuss how to make
it happen.

We are picking a handful of tree/maintainers to spearhead the development
of more useful and can improve your workflow. We will be happy to work
with you here.

Regards,

- Gus


[1]=C2=A0https://lore.kernel.org/kernelci/ZR1TDeD1gizPw3Ip@gmail.com/T/#t

--
Gustavo Padovan
Kernel Lead=20

Collabora Ltd.=20
Platinum Building, St John's Innovation Park=20
Cambridge CB4 0DS, UK=20
Registered in England & Wales, no. 5513718



