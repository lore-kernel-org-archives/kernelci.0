Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977E1878
	for <kernelci@lists.linux.dev>; Wed, 17 Jul 2024 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721213652; cv=none; b=D3Fdm3sqn0iHvOrcBoYzwIDhmnPOqxteVaB5iFiiqbtbGo7b9GqB0Kg3JdV8ieS2U6K9ZOrVS8dGBNZtXJum2VPM0lTB1bB47+dEi6ZnFtI+hYLFbR8Gt8b/7aSef2Ru+L4H7mTPHIH7Ikkx/0SFeAjAdkZ+GYXQWHgS9CfzVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721213652; c=relaxed/simple;
	bh=Vpk4k2/xR/b8neVpk94cfe8q3WoYSdIWaCr72+cVTD8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NKdRomPqRkNHBsdVmBRe4U6YvveeNCIw6qPgY3H8tzaRLaQM/NMDdFievn04pL5ibUIlnMDP97IrVkgTulqMDebCjSUNAN9AVJCA09az/e8ElJHWKtElDvUI/hBIgq55HpbjtEVZXVAVFcpmuPKYv2Owk3uTPkX161e7Mp8zbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I6yrMh3a; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I6yrMh3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721213649;
	bh=Vpk4k2/xR/b8neVpk94cfe8q3WoYSdIWaCr72+cVTD8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=I6yrMh3algQi3uXDJWPq7qgqtuuy0JPqaU1Asayr3yjPHpUA3LGoVByO4Dx6ru6/1
	 LlobSe9QoQRYpBhM/6u3h2isJXUQZmVyKOPsUGk9PpTMw+TCPhJStWkULxg5SVj489
	 FvvDN4jMy6kHD6Nr/0CohXXX7L9urQnqonCuLQeUXr2K8n1ZiCvhWzCw3oDYkv7QE7
	 opR3zMKHdmcxHOUMNmjyH452a6UQm2G07cBK5t/jGYxFMnf0CES9gKdCZ7n7dFM0G7
	 Mh6gYwe6GrMJ7/tqgtKaIsjm6CJSdPLSZHUOiAvxJ8EQ6X29lrTPmHbwVjmi4skBmP
	 YMkWAdtypdtRg==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5C8383780BC9;
	Wed, 17 Jul 2024 10:54:05 +0000 (UTC)
Message-ID: <592bc672-ea3d-4e57-9db9-a952957bfef8@collabora.com>
Date: Wed, 17 Jul 2024 15:54:00 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev,
 Viktor Martensson <vmartensson@google.com>, Betty Zhou
 <bettyzhou@google.com>, Denys Fedoryshchenko <denys.f@collabora.com>,
 Gustavo Padovan <gus@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: Re: new branch + more recent gcc?
To: Todd Kjos <tkjos@google.com>
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
 <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
 <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
 <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
 <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
 <CAHRSSEz_=hs_p=u4XCuGx2xpd36rkycOof7sOh0e1cXtnRXODA@mail.gmail.com>
 <ddbb549e-7964-4f55-8a7e-69140134b9c6@collabora.com>
 <CAHRSSExNqUG8fTi=A2BNjqmxP=NicRqF5z1_sQNR5-BEW31=RQ@mail.gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <CAHRSSExNqUG8fTi=A2BNjqmxP=NicRqF5z1_sQNR5-BEW31=RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Todd,

All android build configurations have been enabled in new KernelCI. We have
also enabled boot testing on some configurations. We have already started
getting results. We have the grafana dashboard:

https://grafana.kernelci.org/d/OKXc44EIz/wip3a-koike?orgId=1&var-origin=maestro&var-tree=android&var-branch=All&var-test_path_regex=%25&var-platform=%25&var-config=%25&var-datasource=cdmoe4lcafu2od

It is still WIP, but you can see some results data there. We also have a
supplier in the KernelCI Foundation implementing our new Web Dashboard. We
will have a first version by LPC.

We are eager to get feedback from the community. I added Shreeya and Helen
to the CC. Shreeya is overlooking the quality of the data and cataloging
things we need to improve on. And Helen has been driving the implementation
of this grafana based dashboards and improving how we can create issues to
track failures. We would be happy to hear feedback from you or even jump in
a call to present things more in depth.

Thanks,
Usama

On 7/16/24 8:18 PM, Todd Kjos wrote:
> On Tue, Jul 16, 2024 at 2:40 AM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
>>
>> Hi Todd,
>>
>> It seems like some branches in android repository have been deprecated. We
>> are thinking of removing them from the KernelCI. Is it okay to do so? Or do
>> you want us to continually running tests on these deprecated branches for a
>> little while? I'm not sure about the deprecation schedule for these.
>>
>> android_4.9-p, android_4.9-q-release, android_4.14-p,
>> android_4.14-q-release, android_4.14-stable, android_4.19-q-release
> 
> Yes, all of these can be removed. android-4.14-stable too.
I've removed all of these.

> 
>>
>> Thanks,
>> Usama
>>

-- 
BR,
Muhammad Usama Anjum
