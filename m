Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC222135A63
	for <kernelci@lists.linux.dev>; Fri, 27 Dec 2024 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290764; cv=pass; b=JEsQ3zRp97JnR+k/GmmuyeUtSgnWiCHx7QaFrynmSwuEv45vZ/IFfYiFdHZiNvA9Bs5D8Nkn50njZSiyqswYwRtIOThrl0Lm37FEb4j+ZW6xGDhqssT4TKw4ta8TezRmAvi55LWbN6hN0+O5NVEg0vloGFr+DsXzoQB0HptRYFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290764; c=relaxed/simple;
	bh=tO48ecLqMK2LRdqMOJwA8XEiRWUc9UNY3Ks37czslOY=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=pFJbBfbkiPo07hjW+TBQQhHrlvrRE6SgLSe9Qv203vmC5S9ChaSRLqoWk0DUkNa35DYpmmD578O18/EgzTp2xC5v0U5b+bV7Eqv+JbgQH6IMt8czm4DrGNb7sNB+KjwYP7XOfJ0ED4CIoaXKVeS18K2R891fAfTX70iKAj2aFLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=jkfHv7dS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="jkfHv7dS"
ARC-Seal: i=1; a=rsa-sha256; t=1735290760; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YCWQhit0occhi9q1eseFKJ1yincn2XJppC0jMDEvalZrO1RnYDnkOYf8lVQGqyP3vqwh2JGarET57gAEu6Lmy97OZQLGrLLpRKFeT0M4eyyWOJ0K5g7L88P0jq43SvpCtc78vYJ35JwjtptFbB5PsmOL03c4IyAwVk2cd0w4inA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735290760; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=2zYpeG4iL8JKZNpI3E11byoxox9ZJj/ilK3ngfIdN5I=; 
	b=MRa5O0H38ICoaGuueItKXBwCM+GHTZhcaEg2DcEo7zkw2X5Gn42AFB1J0Xh5Tdaoe+sjyypGLQt036fUIJVruFv34456Ukt2SCiAyDPh7VwkeRe8Y2OJnit0F2QFfhrMQEorQwCL93iHYW/vmmZnbmypy7wG5k2Bf0oUW7PId6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735290760;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=2zYpeG4iL8JKZNpI3E11byoxox9ZJj/ilK3ngfIdN5I=;
	b=jkfHv7dS6OoMz9gIpiB+RicAFKpWj9Gwj3zY7UlPViwUrLH750ib/BarGw4rgWN6
	pR12NGyPqgT79Owxd5AmjlgOAQWFD3cCtEf9UnljOz/120e7A12nsBTsPxeUlIYvk0V
	ELGsD0s5gh11k33NCulnlEFlxVgeExno1A5oxvp8=
Received: by mx.zohomail.com with SMTPS id 1735290758591649.5935326469371;
	Fri, 27 Dec 2024 01:12:38 -0800 (PST)
Message-ID: <d74d76ed6e0e896b9833869776bddfb1c91a6459.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 52)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Fri, 27 Dec 2024 11:12:35 +0200
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

As the holiday season begins, activity on the KernelCI project has
slowed down. However, we still have some updates to share with you.
This is also the final newsletter of the year, so we would like to take
this opportunity to wish you all a Merry Christmas and a Happy New
Year!

**Milestone Reached: 10GB of Data in Production**

On Friday, December 20th, the KernelCI production environment reached a
significant milestone: 10GB of data stored in its database. This
demonstrates the substantial amount of information being collected and
maintained by the project. It might not sound like much in the era of
terabyte and petabyte storage, but for a project like KernelCI, this is
a notable achievement.

This achievement also marks a critical moment to assess our data
management strategy. The database currently holds approximately 6-7
months of data. As the data grows, we must address how to handle this
expansion effectively to ensure long-term sustainability.

Here are a few considerations:

- **Storage Limitations:**
  With the current production environment running on a Kubernetes (k8s)
cluster comprising three nodes (each with 16GB of RAM and 4 CPU cores),
crossing the 10GB threshold will require additional resources. This
will inevitably increase project costs.

- **Data Retention Strategy:**
  Do we need real-time access to more than six months of data? Or can
older data be archived to a cheaper storage solution? Determining the
balance between accessibility and cost efficiency will be crucial.

- **Archival Solutions:**
  Legacy KernelCI data is already archived. If anyone requires access
to this archived data, please reach out. We aim to ensure that critical
data remains available while managing storage constraints.

**Planning for Efficient Data Storage**

Another important aspect is transitioning from the Legacy KernelCI
production VM, where some data is still stored. This VM is scheduled
for decommissioning soon, prompting the need for a more efficient,
scalable, and sustainable storage solution.

Here are some potential actions:

- **Archiving Older Data:**
  Moving older datasets to long-term, low-cost storage solutions (such
as object storage or dedicated archival systems) to reduce the load on
the production cluster.

- **Data Optimization:**
  Implementing compression techniques, reducing data redundancy, or
adopting more efficient database schemas to minimize storage
requirements.

- **Infrastructure Upgrades:**
  Evaluating the cost-effectiveness of scaling the current cluster
versus adopting a hybrid approach that leverages both on-premise and
cloud-based solutions.

We welcome any input or suggestions regarding these plans. Your
feedback is invaluable as we plan for the future growth of KernelCI.

---

Thank you for being part of the KernelCI community throughout the year.
Let=E2=80=99s continue to work together to improve the project in 2024. Wis=
hing
you a wonderful holiday season and a prosperous New Year!


