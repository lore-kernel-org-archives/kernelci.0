Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565B1A00F8
	for <kernelci@lists.linux.dev>; Thu,  4 Jul 2024 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720073390; cv=none; b=D+0+AGHaVxzLfyNSe08Rg1LnhW7kmiQ3ozOpQqP37lheI8CUMAI7yWXcJnQcvoCPR4czHz6UXwIzKtJXQNCIFgIL3NsYRvd0AvsRpgNGSSHxZn83f6+P4+yM7vk7FEDivHDdObbV00fb3Hg/nyPXMamXa7P/yyAG7fXwpT+V6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720073390; c=relaxed/simple;
	bh=wg6lYrefoQwLcUYT5vXGiQsBgGefDz7Hki32pzDxQtM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rGGCHChE+wxFRoxVY6mneiKoIvQ7TmiRpBM/zcAFMkga1DMcq6Id/UOEG2Q3GwofmJuubG4qsM/r08PrXZOaQOaRXPOfX7WvZNk5rUfjadwHVRTlQxOq7vMT/CY6yTOPi+z7dflrC2a4qilBghfm/nkQlnL0pUqMrUek7T7c2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aSr5eHOL; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aSr5eHOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720073387;
	bh=wg6lYrefoQwLcUYT5vXGiQsBgGefDz7Hki32pzDxQtM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=aSr5eHOLYLNe9Oa3uxUcwaTZKSa9VUacewjKQzsTd+CbO5zvfQWEb28Sd6A8ZtK5P
	 x3+M4pytd4G28b5MTELGTcePuP7DlcSCJl4SeWpEA+8VT7E9Og7OdG9FPM2lyk7a09
	 xDWyyfqSCSIKdGA7s+mJFxxc3g5rrQWf5OkYAfTjbbx+Dal7/QH/6bMIeI6ASgNlCj
	 oLUIifyx0uJKBtcr2k+gbSenQ8HM0QNtdhtIWpMFYm3HaDIkb4oNwByJJQe6Bw3wGu
	 +nkIwNEMpmgYkMDUYrZAHfs+4I453pN8r63UWhgDX3F6YEChYhdH4qxcYHrre8zwNh
	 BaSyFbNxsZCMg==
Received: from [100.113.15.66] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AFA5E37810CD;
	Thu,  4 Jul 2024 06:09:45 +0000 (UTC)
Message-ID: <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
Date: Thu, 4 Jul 2024 11:09:43 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 kernelci@lists.linux.dev, Denys Fedoryshchenko <denys.f@collabora.com>,
 Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Subject: Re: new branch + more recent gcc?
To: Todd Kjos <tkjos@google.com>, Mark Brown <broonie@kernel.org>
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
 <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
 <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/24 8:45 PM, Todd Kjos wrote:
> On Tue, Jul 2, 2024 at 6:12 AM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
>>
>>> 1) use gcc-13 instead of gcc-10 for android kernel builds
>>
>> It sounds like you just need an upgrade here rather than specifically
>> GCC 13?  The reason I ask is that GCC 12 is the standard compiler in
>> Debian Bookworm so might be easier to update to quickly.
> 
> GCC 12 would be fine
> 
>>
>>> 2) add android15-6.6-lts branch to kernelci testing
>>
>> https://github.com/kernelci/kernelci-core/pull/2597
>>
>>> 3) discontinue all gki_defconfig builds
>>
>> https://github.com/kernelci/kernelci-core/pull/2598
>>
>> (not 100% sure I got that one right, have to see how it goes on staging.)
> 
> Thanks!

I've opened PR to enable android builds including android15-6.6-lts in new
kernelci:
https://github.com/kernelci/kernelci-pipeline/pull/667

> 

-- 
BR,
Muhammad Usama Anjum
