Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3403137777
	for <kernelci@lists.linux.dev>; Tue,  9 Apr 2024 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712669381; cv=none; b=jpR0WnYTHWxSeVlC2N1iInV66xueSZ8UME0KxXnQ79AeCi7MDhST7huMY7hB6wLH1qfpvMe//vMZ2OUmneKYvSJz6UPjP8vu21YkQc/aihWXqVl1G2C7U4rxphvza+vnKlqjoOAowCOHV43VTaQPmv7C58lJOzRD8d4Lo9yagEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712669381; c=relaxed/simple;
	bh=BEGdJEV0afiOTZHa2st7D6Wq1bC7znPqAufWzbCwA+k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=i4K2ulPtnuSiVMCD2cRZ6i9SnefekIJ1WArU4XF/PCmBXvrnW5hZpWWsYoy0jKHYZQwmHJsPG4c/n/R9CCJGyN7rlU6uvXOfjtl0AKv5qDvua/sxzVGy2Hz/rNIyqsKJIOX84rCUm8VANY08sNldAWKWjUu0FeZBLWVHmGzYbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T6VzYLcZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T6VzYLcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712669282;
	bh=BEGdJEV0afiOTZHa2st7D6Wq1bC7znPqAufWzbCwA+k=;
	h=Date:From:Subject:To:From;
	b=T6VzYLcZ65LZHgWSEB4Cj4DYTpqA9M7rftpeQgjVmb5i/cvBDQp3cdHHPwoa6kETe
	 L2hK9r+fQnYDYufxL23NelJ6X2e5RR8TX8iFs8oz9wCqIfind19Rsna4XfoMmbm8Cc
	 SCvcMJkQRV9e3RoZF2ZHMxSfrXHIylQTJOn+87fvGO1Gh5Pq7yLNaRYumfy2vdi++6
	 jo8pxO89MV4yiPSlabUkJXEI1MHdz2W3RP1FxmqaDMlTHrIeV+RaXRlv6dTXEylY44
	 f4Kf6WhReVLK9OieglRAtRRQNdhQrtn0Yagw4OVV64uI2YYtOGp5x8+WeOVusWyfxi
	 GbnFbBu3Ls06g==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 78D1F3780480
	for <kernelci@lists.linux.dev>; Tue,  9 Apr 2024 13:28:02 +0000 (UTC)
Message-ID: <53f198b4-8179-fd06-a583-6ca42e2ece2c@collabora.com>
Date: Tue, 9 Apr 2024 09:28:00 -0400
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Gustavo Padovan <gus@collabora.com>
Subject: KernelCI project update
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

We just published an article on our website with an overview on 
everything that has been happening on the project in the past few 
months. You can read it at:

https://kernelci.org/blog/posts/2024/strategic-updates/

Don't hesitate to reach out with any questions and comments. Or just 
reply to this email thread.


Best regards,

- Gus

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

