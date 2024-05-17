Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34903629E6
	for <kernelci@lists.linux.dev>; Fri, 17 May 2024 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715953269; cv=none; b=OopbCs2kBL4yqvSajbHSPxp1iJaDP9Wh1hv+PtJKtISKRb0mf20n09ZBEFArkNGMTucJokdqz8FyrZZlVaD5Tt33StkZwBKkQLzay4BVGPstfq32/EO0NPaKwHBjo0nBPieZusVDXm5IdmOR27itkF3/1lgJx21R+b7HMF8AO1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715953269; c=relaxed/simple;
	bh=+jxDhrDV06nBBbuYu08nUZ7TChAPAufZsUInOK5IJCQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=a9WhXgOPDLJobm8FN4oIKr0yUKVqmyI5ZzaZ6bUaGEJmvWMw/Lv8GuxlusCZa2w2Ibuqs74Oh0RKcKX/UoDnGvB4GseX7TfE2XZVxk23dA3+wJUWKjmiVIu5CgH3Rs07PbOx8aOIfVxNYv3qLWSSgpQ5nl1s/Sk2OPlrRpBoK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LUu9vZSE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LUu9vZSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715953266;
	bh=+jxDhrDV06nBBbuYu08nUZ7TChAPAufZsUInOK5IJCQ=;
	h=Date:To:Cc:From:Subject:From;
	b=LUu9vZSEtRQ1sNc03jps+fPI2C9ZQ32DWY55SmjLWz+f/fkPXnWJQjEu3XtLEBEFA
	 /Qrm/Um19or+rCUYIagq3G+zQXEw7vjzfWieVnmps8/RG8NphhjiXJHo6A3P0JVEOZ
	 l9nHAyYLt19OP29GSnmR3nI7zAx1lXoqRdJWXv9ziYzApx82qOwQE+oUfb6Xa/D/Kf
	 ggyL6eNK6nitRUWW8tnUNqhu1ljP49goD5UWybEU539OJy/S2lC7uJpWwkHWvfZTFG
	 di1Ha+0xiRrV9FtIsIKr6U+YxBOo9UPlTCEO/TCjDkJeuobpfufmBHK0bzNs4jOuYK
	 W/5/cPLc5pwYQ==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C8BC737821BF;
	Fri, 17 May 2024 13:41:05 +0000 (UTC)
Message-ID: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
Date: Fri, 17 May 2024 09:41:04 -0400
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: linuxtv-ci@linuxtv.org
Content-Language: en-US
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Denys Fedoryshchenko <denys.f@collabora.com>
From: Gustavo Padovan <gus@collabora.com>
Subject: linux-media checkout failing for KernelCI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Media maintainers,

We are struggling to use the media tree, in the same way we usually 
virtually all other trees in KernelCI. The following commands gives 
KernelCI a fatal error.

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
git remote add media https://git.linuxtv.org/media_tree.git
git remote update media
git fetch --tags https://git.linuxtv.org/media_tree.git
fatal: Couldn't find remote ref HEAD

We are in the process of enabling a lot of testing for media using 
fluster/gst and the ChromeOS Tast PlatformDecoder tests. I am not a git 
behavior expert, so we want to start this thread to discuss possible 
solutions as the media tree is for some reason deviating from some tacit 
standard.

Thoughts?

Best,

- Gus

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

