Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF31ADC69
	for <kernelci@lists.linux.dev>; Wed, 25 Jun 2025 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873771; cv=pass; b=aum9AqN0u/43zTVQ6zbZIY0RXJVOa/5MmlkyFbplEJBIY2lqs7DnodUv5QiUisJWbIEKgXaLRNiN/SHZtwRZz/j4tz8RpkYuEOgzCsqBq8t91A1iPKyPt/jN/8mF2SCOLbUDm/U9eze/ozpoMGbxQtFwvX+4GWLMXlwkDoS3SP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873771; c=relaxed/simple;
	bh=zv+GwhUU+9mIXJTM0eOSZGktyNnSWH8lIZS/WX80L/8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=tmDib9u/DtU90538YSgSLmyuYuik6ONlGOlkLktGOGcqowHMFNrtuK7bG2lCopoj2NRCJ7bfm7Mbt+LnyNHynmwNcHtN7UO44kEs5HjBXymVezpittPAnSrekIJe5WUSLrfr2MKoKSfSLlZipB7zn/maO2WYHCujTOw84CeCKQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=a6hb6qDH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="a6hb6qDH"
ARC-Seal: i=1; a=rsa-sha256; t=1750873767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zuy7E3zkFrHFVoSsDug/ws66z2ip9OO4yEt/y82AsFGG0nkTpyESB4qEpP2kgXwLEAAlx4DuF0S55uZOtq1rjIFrETwfZMknqUPf4sooOqNf8YphlmsbxyfTh0OtohQ616thbZVgzkNQDb7B7W3JKpj1JnY45I4F9MVY3VkuX08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750873767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zv+GwhUU+9mIXJTM0eOSZGktyNnSWH8lIZS/WX80L/8=; 
	b=BZHBmlLuuUmke9Jtn8tHIFkEGtgV5/AggIVTfV5dsJndE/oiwwbbuAmmy75xDJQqaUsb/cwmr9sDFcYOzVYUty+4OnZJifxsVNXMNmEoKaszqUGn20+PsJ+00i6ddE2AAF1/aTrn30/x1hB5QRxW0EXRO5fVj00Lo3JDg18n4a0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750873767;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zv+GwhUU+9mIXJTM0eOSZGktyNnSWH8lIZS/WX80L/8=;
	b=a6hb6qDHKIz0gUtJdlvmrefXkK6lW0FXaCh8B7PD60hw0XcuUUFmHOqWzuHhe7HS
	jM0FEPZnqttmUwTKWpyWwFyJ1LmbDaU08PGIIunZIjttBjRu90IGAjjmXHpgxtReVZP
	PPyu3r9ObBVoGJNGn99BhIViHheVQ9hoUFDgguV4=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750873765921996.707194332755; Wed, 25 Jun 2025 10:49:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:49:25 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "Automated Testing" <automated-testing@lists.yoctoproject.org>
Message-ID: <197a83577ce.fb5005392601800.6025227257574935348@collabora.com>
In-Reply-To: 
Subject: KernelCI - June 2025 updates
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

We just publish another blog post with updates about the project:

https://kernelci.org/blog/2025/06/23/june-2025-updates-linaro-and-elisa-joined-kernelci/

There you will find many technical updates and also the announcement of our two new
members of the KernelCI Project: Linaro and ELISA. We welcome them and look forward
for a great collaboration on upstream kernel validation!

Enjoy the reading!

Best,

The KernelCI team

--
Gustavo Padovan

Collabora Ltd.

