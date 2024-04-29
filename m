Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297313AA5D
	for <kernelci@lists.linux.dev>; Mon, 29 Apr 2024 21:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424991; cv=none; b=XIovul+5mKhDY0RA2IOnh2Fx3VezgEfVpcmwF2Jj7721OfR4dWOhvjbxkRljHvX/6TcL3kwzq152OmwcrU8WUgWx8AMyqZZ70CUbZNKTlCTiKm04y4sbgPFrzUXFlLAYJ0Apyfzp2Wo2egGPr0zA2qN9nNwSNxaVnKQ9nYlO/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424991; c=relaxed/simple;
	bh=dZK/GB2KkqiU8PGfFUCPSXUeXyridVYoFAsjXdPOWwc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uur+dnbtafHeFyw2MdXtnbHZLz42q+AZLxMFaM2LBHqlRzuUOL+HdnAGaLuhKWzWZ9JnLWdvpQLGIQvNjf70VPMtWHnfLaWuoWfywoCO3VqUF7pcj13J6yHiA7/ETdItsZB7tLVzA5djj+3Y+buO05HyzsZD4WCTLDCP15eVkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GkhvPvck; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GkhvPvck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714424988;
	bh=dZK/GB2KkqiU8PGfFUCPSXUeXyridVYoFAsjXdPOWwc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GkhvPvckrzDEpnFJWPbx1PvqwLK4hU5lZezsEXZoAw/kl7qx3kpTQi7NaFH7oPfe0
	 p4u3dnQe6mkZvvLxlj53hNqA0fv3NDYFcIwFtSumVRHmYIpa6ISqzLY+KMSkA5xFCA
	 XmNPIZQ9JkW0fHsKheJH/Yp5AHX+0gY5XrLVf5lCZBFtEmu2+ThlxCtfsyjpOkBfvB
	 3pkNzFLz3uuR3PM83SZkLR17ubgz6BeepCTrG8UDfjvilwhZYo1Fx7+NThAB0kaNLg
	 tP8ergvKtx0mV6Xso9wjrwygRPcw6zK440mNKKi2DWnZpTSRyyFQTj5BXQV4paJgHk
	 mF0rrBTwbvMSA==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5C1E937821DF;
	Mon, 29 Apr 2024 21:09:47 +0000 (UTC)
Message-ID: <d46595e5-a701-5896-0137-0ec8197bcaf6@collabora.com>
Date: Mon, 29 Apr 2024 17:09:46 -0400
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Kernelci Job Start Delays
Content-Language: en-US
From: Gustavo Padovan <gus@collabora.com>
To: Joseph Salisbury <joseph.salisbury@canonical.com>
Cc: kernelci@lists.linux.dev, lgoncalv@redhat.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
References: <9cce38df-de93-486c-bee6-1a866f8ac696@canonical.com>
 <3deb2b-66195880-7f-7ed64100@24373438>
In-Reply-To: <3deb2b-66195880-7f-7ed64100@24373438>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joseph,

Just following up on this to check if you want to initiate the 
transition of rt tests to our new system. Let us know.

Regards,

Gustavo

On 4/12/24 11:50, Gustavo Padovan wrote:
> Hi Joseph,
>
> I am glad that you reached out. It seems you are pointing out yet another aging sign of our legacy system. For broad context on that, check our recent blog post[1].
>
> The best way of solving your issues would be to move your testing to the new system. The best plan for the legacy system right now is to shut it down in the coming months. As we said in the blog post, we are starting small in number of tests and scaling it step by step, but always with community engagement to evaluate the results. If you want to come on board with the rt testing, we would be happy to start a plan to make that happen.
>
> Let me know if that is an avenue you would like to explore. If yes, I'd be interested in knowing which tests you are running.
>
> Best,
>
> - Gus
>
> [1] https://kernelci.org/blog/posts/2024/strategic-updates/
>

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

