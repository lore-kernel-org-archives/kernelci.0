Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBA7258D
	for <kernelci@lists.linux.dev>; Tue, 28 Nov 2023 04:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gxmLYXsT"
Received: from [100.100.149.248] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BF536606F5E;
	Tue, 28 Nov 2023 04:43:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701146610;
	bh=AnpXknAnVdeRTMdXS1SET8Y9y6X99ZM/jbffA4YRCNk=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=gxmLYXsTE8JZFO6rjftcPTPo52kRcUSkO5+nzbFavvf4DCykdWJnsH9k0LwqZI5Fg
	 WHYUTklTXqxBJic+lsrSgAdSORSDv5oBLyuJ3sNXBJ72f094FEbHNOFwUReFuMq+2Y
	 59A4U8dQkUtkh/Z65jOTjihXSIeDtIaAop3x670ZIlq0Y0XKToeNaPE+17/dke47Nb
	 kA7tTKaG01DSAOdwNkhGhwSTfLbbDhWOSQAGKhpPSu3SOoH4zthW9bjsD6PMygRmZ2
	 wg4miVK6w5ydKnqfB+3vTyYYOOLiLVrLJeuzaz5Vu+su3XvsQA4dAVzOvuzgQIoekG
	 LShhG7CN3t6zQ==
Message-ID: <9820b359-cfc0-45b6-9edc-722b50e533c7@collabora.com>
Date: Tue, 28 Nov 2023 10:13:22 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Local Instance docs have missing/outdated info
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <7ee32af8-341f-429b-96c1-ca407cb17f0d@baylibre.com>
Cc: kernelci@lists.linux.dev
From: Jeny Sheth <jeny.sadadia@collabora.com>
In-Reply-To: <7ee32af8-341f-429b-96c1-ca407cb17f0d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Trevor,

Thanks for reporting the issue. Due to recent API updates on user 
management side, a few endpoints have been redesigned and renamed. 
Endpoint to get access tokens has been renamed to `/user/login`.

We have updated documentation accordingly and updates have been 
rolled-out to https://kernelci.org/docs/api. You can continue referring 
to the same link. Sorry for the hurdles you had to face.

Thank you, Jeny


On 14/11/23 3:13 am, Trevor Gamblin wrote:
> Hello,
>
> While following https://kernelci.org/docs/api/local-instance/, I have 
> run into an issue when trying to generate an admin API token:
>
> [tgamblin@homunculus ~]$ curl -X 'POST' \
>   'http://localhost:8001/latest/token' \
>   -H 'accept: application/json' \
>   -H 'Content-Type: application/x-www-form-urlencoded' \
>   -d 'grant_type=&username=admin&password=hello&scope=admin users'
> {"detail":"Not Found"}[tgamblin@homunculus ~]$
>
> The previous steps to start the instance and confirm API availability 
> work fine, but the "token" endpoint doesn't appear to be up, and I 
> can't continue without it.
>
> Is there a newer set of documentation that can be followed, or can 
> someone point me at what I've missed?
>
> Thanks,
>
> - Trevor
>
>
