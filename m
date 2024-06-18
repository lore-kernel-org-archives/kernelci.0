Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094114C62
	for <kernelci@lists.linux.dev>; Tue, 18 Jun 2024 12:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713934; cv=none; b=VZ2rAppcnPy1ecU48zjvHklEA8BwemrgmV78gPrv9foJF4WLMcLBif4sFodrwtUJ1d2OvXCQHulR236VgSeviORakgtAWwJlRgJbh3tgVS9k7WKh+VTPB2bfYI2EP5RKdkgvP26QeMWiilIeU9Su3AjULCBlwz15x20oZRbxjA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713934; c=relaxed/simple;
	bh=VrO11/WBWNrvs1ZmzDM63enlU/pEwaPNOZKiWOmmUng=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nTTsc4q1Vn8QFkRhIRAx1Vzqv1xlc/cMIBZkSMQw4LTBPujzc12os3WNN7aW1VKBNrwRPTX4kFDGkmfiYU/SzfjLxKhTjlpF7ivdMRBBDtKnG1EHlHlL68c6l2OidiEih8PAZ0s5Uq/TfeMUdmZmqwnRxEYzhbZkde92MAo05Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tqGieAoX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tqGieAoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718713931;
	bh=VrO11/WBWNrvs1ZmzDM63enlU/pEwaPNOZKiWOmmUng=;
	h=Date:To:From:Subject:From;
	b=tqGieAoXsAO6X1VscYEDNv0yTej3Rl4OWaP8QJxUjnAwX5cuYqzFZOEKJZFkD6jzj
	 XdRNxN+JKsBHEquoVZDa4yWIkMqpmJU6MOMs/6XsTOn6zkD/5cyg5ZBP2Zxj6yIICQ
	 wt5XBEL/8t1pue87RGWBRnCMDYJgxH6TCupr3YT2VU+dcPXB8wHW4Y2EMmfY+zMqh7
	 QPVCSpT30bRDTIk3uMkkVelF670VidBB/+GfcJcq6FCKl1b3TwcuCgqV3Q2/l1/jwC
	 2L8e7VkC+j/eV3JyjqrSONHYhP7G0/afrTgKPVHoZWxYaXIl22nh67sdOlViYqyVyw
	 w53RjEVWVF2ZQ==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E90563780BDB
	for <kernelci@lists.linux.dev>; Tue, 18 Jun 2024 12:32:10 +0000 (UTC)
Message-ID: <068625e4-7e6e-d91f-038c-52dc5978497f@collabora.com>
Date: Tue, 18 Jun 2024 09:32:08 -0300
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
Subject: Texas Instruments joins KernelCI as Premier member
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

We are pleased to announce that Texas Instruments(TI) joined KernelCI as 
Premier member.
TI wants to bring the embedded testing expertise to KernelCI to 
collaborate on the creation
of open and upstream standards for embedded kernel testing.

See the full announcement at:

https://kernelci.org/news/2024/06/17/welcoming-texas-instruments-to-kernelci/

Thank you TI for bringing your upstream leadership to KernelCI.

Best,

- Gus

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

