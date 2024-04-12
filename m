Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E241373
	for <kernelci@lists.linux.dev>; Fri, 12 Apr 2024 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712948006; cv=none; b=c/FHd3ukDkNkmXygBjoQJoqu75OTl1vTOTBtvYT9bBa2e7GKsZ8HrE9+dc95VC32RNP5dWeOwmdZQd5QI7vFknM+gQLGljb6Kb/RF3dkDGX76ZEhzoJwhd6e3xF54UyMStSGP7FHEcNqlrYgNXWB7nNzdd+dhA1HtVMV1wDU7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712948006; c=relaxed/simple;
	bh=Zmy8/faSRG7OiZ90StL+gfbVBS1D+L4Vyl6AwOvWua8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qNHaGJeamSVHy1S9fgyn/msLZFV9YheqPKo9yfD+slj8iyI6z9M5wp7plA9/6OL5CzTDlv8eSX8ly3vf6eJRj9TOBD1+KaEsdL4vQxUTyLZeBB4L+c4/C+dpdqJngOaiu/T9YRJKdlqFAjbgF2PyfdQeL/0ALQZ4+rEiqPCyDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WvYwRaGf; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WvYwRaGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712948002;
	bh=Zmy8/faSRG7OiZ90StL+gfbVBS1D+L4Vyl6AwOvWua8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=WvYwRaGfN5yVkcUL0LNgjXA5Ej96q4JpxKPgxUbiecvRMqm/oPXGZvX874vBGvKha
	 gfOzJlGs3H19xFFzb0GQrDrApfSzlRr/64ftH93aBc9/QIf3FHevbO+WoXjhBjNfIt
	 CC9Hlnobc6POFwWTJ3vAXL2ZeVH4DER6+VJCze1jdDc6SsC0Gl1+L0DkS806wcDJgV
	 6+XaV53tWFHFG46JeqIscmMY8NlhEhxfSSoG8dX1MK6o+Xur6awpFEwSVWuGBqzHlG
	 l/KmRpV2t8VqWRx7jSIuO8t6GSyN7/SOxyQroFIaGSsHEbKKmyf9AE/59os6lI8pRG
	 AIt0v/6E6yCMw==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1CF63782133
	for <kernelci@lists.linux.dev>; Fri, 12 Apr 2024 18:53:21 +0000 (UTC)
Message-ID: <2df803a1-aa81-0762-183a-0aefa527c587@collabora.com>
Date: Fri, 12 Apr 2024 14:53:20 -0400
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: KernelCI evening gathering at Open Source Summit @ Seattle
Content-Language: en-US
From: Gustavo Padovan <gus@collabora.com>
To: kernelci@lists.linux.dev
References: <3c0c9c-66170480-315-194ac52@36759582>
In-Reply-To: <3c0c9c-66170480-315-194ac52@36759582>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

We confirmed a location today. We will meeting on Tuesday 16th, 7pm at

Elysian Capitol Hill Brewery
1221 E Pike St
https://maps.app.goo.gl/K6G2XMVpHHzKjvV79

Which is a 25 min walk from the OSS venue or a short uber trip to the 
nice Capitol Hill area.

- Gus

On 4/10/24 17:27, Gustavo Padovan wrote:
> Hello everyone,
>
> If you are attending Open Source Summit or Embedded Open Source Summit next week in Seattle, we want to invite you to hang out to chat about all things KernelCI, kernel testing, solar eclipse, etc.
>
> We will meet on Tuesday starting at 7pm. The place is still TBD and I am trying to pencil this down asap. I'll update in this thread once we have location confirmed.
>
> Please send me a note if you are planning to come so I can plan the space properly.
>
> Looking forward to meet you! :)
>
> Best,
>
> - Gus
>

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

