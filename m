Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E8188012
	for <kernelci@lists.linux.dev>; Fri, 15 Nov 2024 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731665828; cv=pass; b=p6rehOfW1/8JIFGUvXlciJN4SQBS6NJBb71YrOykeGzd+11VrwQHKGRNvZgOFHgoSb+R/bXQDeCyK7oiQjLmvEMYPz0DiIyGTvs070BIn8oWKOzk6i7ITtCXGJISi0Sud8RYTA8XsNV3cnWCXgFdK4b+1RublJ83jd5No/f9+rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731665828; c=relaxed/simple;
	bh=rjuHFilZPQGRFJRqSZoTo04IWzDd8p1/x7je9qbaSUs=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=cg/JIEOyEJyMdjTlddBgv92CaNTPnozEKZOJ/KGq9UPH0xtOHdtgb7KRwQ0jNubqiUnDYPXFpacdlyV9y2mIFrosxTO9Sn3fCGGjT4+445fn30NhPL0RTOv6QRCeBU41VECxB52yynZSq0lxj0bhKbgbsIVJJUW4OF+BQ14fRn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=Gqybbj+P; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="Gqybbj+P"
ARC-Seal: i=1; a=rsa-sha256; t=1731665826; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MrvXwgzstdtN/pqaDaa9Kbkp/1gJ1fmiFH6Qyl1TadkO95s77yDFfm+nrxd5Keupn81zeAyAO4NjHUhCKAaTlAwrnVdhaxgGEF52Ns3B19k6iT8whskk+qRIvA5hJNcAQdPSgY6R9hj/eoWyKt8WmfvsWHONhOKayACyVCdOO14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731665826; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mZRRN3jxAIJF/aLakAmYKguQxVHN7KFTXNrss1cBuXY=; 
	b=FxD0tl0Yrh1hiSaGO+Z76NIC9YR47mEP9AEYa0VtSOra2H9yg9qQKKzGKQL2WVAdWvSOcqx/8YShmjk+510WrRRN7qtPW4DYEZdN0iYjzb0zRwTKQEKydglF0W435BrB7GWuce9PZZm1cHeTNqHZQhAzU1+4dM+ok4NqTZGcHq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731665826;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mZRRN3jxAIJF/aLakAmYKguQxVHN7KFTXNrss1cBuXY=;
	b=Gqybbj+P1q10xwtl7l+L5ZHXxZGw0fdLZozBN8CTWowQbdSs1euD19uPUUoVS2T8
	btTFBlwWRj1x+WC+NZb0Ak4Va1njjPIwe2OCUf1TMORbF6Yc2IsK8qbcAAvKdsfIKVj
	VSmKC2H6JWESvyErGe0tQbMwyp5jT87W4c6cS8sA=
Received: by mx.zohomail.com with SMTPS id 1731665823379619.8499906196142;
	Fri, 15 Nov 2024 02:17:03 -0800 (PST)
Message-ID: <8a380b8c-3f09-4179-8cad-9aae51b098af@collabora.com>
Date: Fri, 15 Nov 2024 15:16:57 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, kernelci@lists.linux.dev
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Subject: The integ branch disappeared
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Neil,

We had enabled for-next and integ branches from your tree[1] in KernelCI.
The integ branch has disappeared. I just wanted to check with you if we
should enable some other branch in place of integ in KernelCI.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
-- 
BR,
Muhammad Usama Anjum
