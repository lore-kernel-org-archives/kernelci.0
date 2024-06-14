Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B44C85
	for <kernelci@lists.linux.dev>; Fri, 14 Jun 2024 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376528; cv=none; b=fKhfmVGb7vrk6Tq5gpDcgUaVsHwT2ZqBP4ZS+SPis7KkoCOtqgwniK68eG6AcnhSG6eeIoXAaQlOIMrVuLKQQhc8BBtr+YWIMcOYgH+wgXRGWj1KVNgLWAKjZ5OQSGWafCqmCq1flLRK7J3iaPRZuOTWgiUPjTWE/8EtsbX2+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376528; c=relaxed/simple;
	bh=WGedD2GovinYfiwU441Hv1bBEGuQrM+fsHVRUJVc80s=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=hhsOM2I2EcExvEEhmINMaqv6YjWanf4+b2eVHwof6QU69KGgBv3KqSEmXytlwISpqR7nyn5jjwVx2G9WMeule1kvw8knaZHuvCWwIE7XgUvETWY2fOT5Fug3Dqywgln7taZ3ZA1dQE0+/mVAEoLs5Ls4rt+iMwT4s3uh+I+SaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0XlGjL/2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0XlGjL/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718376521;
	bh=WGedD2GovinYfiwU441Hv1bBEGuQrM+fsHVRUJVc80s=;
	h=Subject:From:To:Cc:Date:From;
	b=0XlGjL/2R08l8xzamNxWQ3Fh5IVETq74Xq1ZCia5a6SDpwfjDnEqJtXI0wTlmdeVP
	 gftVIvimjv2Lrd+kZ/LmrOSKbK/EnaO1v7ZV2KeAz3D14wY+kZjMxQpwxcejEmWH0D
	 ndgGtJNMA+6SYDCZsqBK5PnG7aTXo5fAqZOuUDkTm+EaPayIPsi7mD7E8iIiGDqcNT
	 uI/jD8xNsirvCx2NNsQJseNeg79/FgVQOYtksSeCFviRTjST3R/yMz8lVwZSqn2Wdn
	 f6/Ddz1elQYMUG0ZDDY/AXJmzJmmL5YbclAJ53XIPsPMhfL2s2sAMEkxVlE6GTueUl
	 wCDgA0Jkje6IA==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9D1123782198;
	Fri, 14 Jun 2024 14:48:40 +0000 (UTC)
Message-ID: <317c51c9c0dfd8b37ef7af6c55b89212cacad2a9.camel@collabora.com>
Subject: DNS Misconfiguration Affecting Certain Hostnames
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Date: Fri, 14 Jun 2024 17:48:34 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi All,

We are writing to inform you of a current issue affecting the
reachability of certain hostnames due to a DNS misconfiguration. The
affected hostnames are listed below, all within the kernelci.org
domain:

    api.chromeos.kernelci.org
    api.kernelci.org
    bot.kernelci.org
    chromeos.kernelci.org
    cip.kernelci.org
    linux.kernelci.org
    storage.chromeos.kernelci.org
    storage.kernelci.org

Due to this misconfiguration, you may encounter warning messages
related to invalid certificates when attempting to access these
hostnames. Our team is actively working on resolving this issue by
updating the DNS configuration. We are awaiting the DNS changes to
propagate and will notify you as soon as the hostnames are fully
operational again.

We apologize for any inconvenience this may cause and appreciate your
patience and understanding.=C2=A0

If you have any questions or need further assistance, please do not
hesitate to contact us.
