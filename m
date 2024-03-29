Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E890101D0
	for <kernelci@lists.linux.dev>; Fri, 29 Mar 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716885; cv=none; b=s3w4bfOSdmgDE2xMt8TNo7zg0FGXsWdygNiZrdK/TSvyEOdExqkr0DnDQ/K1rW7XUcLxKh04Xx1ZzBRMlbbNDHmIhXG8TfU397LgyT8y3XZz1k91KIb1ZgmxVXAC9EKIQmkT9hy530wJz6jZvwh7RwMnH/6aZuLrBG+6L3y2W/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716885; c=relaxed/simple;
	bh=c+C4JGpehygGFVXDEEHuN+iaXShS+Ztd1fnoLdiK0O8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=SLMK/4xJoGwL1yxZf5x/iD1PITptqaAyyGDOKPVTNrbsYj8j1yhX89PEm3Umxjf5EwusbulR9B76ZDLKJZWtw9mgzrPFDlSaBbxpgmZcOZWnClncNDtD3+iUUmpjY0VEk2ZvIU7RpSCqM8fdUDRxYZjmTsw/H9SORR6vlnT/mmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NphDHVle; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NphDHVle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711716881;
	bh=c+C4JGpehygGFVXDEEHuN+iaXShS+Ztd1fnoLdiK0O8=;
	h=Date:To:From:Subject:From;
	b=NphDHVlevL3AvtvOLzCUzc3nhkgf6cxtS70pdegt+VDakJHk32JgFcJuYGnEJoQGA
	 yIG5xxnZyNfE3h+rVbb4GJ24HI5GL8iMqkyJKtcVHgT3QLTtpCQhcJnZYBee4H3Bn/
	 /NOWoDunQChrDV4i8ZPIEv+9aXZsqmM2nhaCK4TnxmI2HwqV97rkA1eifaipYOrDZu
	 ip5Xc/XSMTCAEd75kCKkPis/aNZ72Dys/wRom04g5X7h5kM1FdLC+X3ojOQz79WtyT
	 GWN0PZ+mAGhqeHiHXcXlsDbhPaRLXglDH5Du+FxcY7p/ppB+64weq/OjewPRNgYhdL
	 cCT5OlCWEya4w==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6E6C37811D4
	for <kernelci@lists.linux.dev>; Fri, 29 Mar 2024 12:54:40 +0000 (UTC)
Message-ID: <ce129464-bdbf-3fb1-8491-9dcf2eb34e20@collabora.com>
Date: Fri, 29 Mar 2024 09:54:38 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Gustavo Padovan <gus@collabora.com>
Subject: Exciting KernelCI TSC updates
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

During our last TSC meeting, on March 14th, we had two votes that 
brought new winds to our community:

**Shuah Khan joins the TSC**

Shuah, Kernel Maintainer & Linux Fellow at The Linux Foundation, has 
been elected a new member of the TSC. We believe Shuah's experience will 
help the KernelCI project expand it kernel community engagement efforts, 
taking testing and CI to more parts of the upstream kernel. Welcome, Shuah!

**Nikolai Kondrashov elected as the new TSC Chair**

Nikolai has been a longstanding contributor under the KernelCI umbrella 
and the person behind KCIDB. At Red Hat he also contributes to the 
kernel integration technology. His knowledge around the problems 
KernelCI needs to solve will help the project greatly. His role will be 
effective on April 1st. All the best to Nikolai in his new role!

While at it, we thank Guillaume for his tenure as TSC Chair of the project!

The detail of the motions which were voted can be found on the website:

https://kernelci.org/docs/org/tsc/votes/#2024-03-14

Best regards,

- Gus
KernelCI Project Manager

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

