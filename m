Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18015B11F
	for <kernelci@lists.linux.dev>; Wed,  3 Jul 2024 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008628; cv=none; b=iBj/L1YSnjQr3td7L9FF5CaRrdDF9NgavLjeIbz6PLZTdpYDK2DSjKEnMOVz1oc8ag/jEQbSJW79F/hx0qnZDLJ5/2Va2dJHuOx/XnsknjHBpOaPNdBBvY1VXaYHmvhw4/IXs4htySeJWAP3ahABugMSom2b8TC3kxqEVFvdt18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008628; c=relaxed/simple;
	bh=6isdRhMlx3tNJhmb15r7pvZlRL/TmKa7iBxy1zX+omw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iK+sH5YYpBtEZ6QjE+D9+b/qv634g4hClZT1+y0hxZNTQtp+tjPMfIGDQPE12WZuluRH2RjYHBEjTli7HWlFY5GN/ZkmuMHS5eQHs5qw235+T8tObAH24JpgQ2FwjvH5TAqV0cDUtPI+AFLNzdIdZVDFBddZ6mLE8qAzMtxqI30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cHi5IDt7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cHi5IDt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720008622;
	bh=6isdRhMlx3tNJhmb15r7pvZlRL/TmKa7iBxy1zX+omw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cHi5IDt7Hz3jvuZtoq30LmuCNJH2IPOOpEf3da1GwnMypl4r7a8buon5rDz+lcUUL
	 xRCufmZoc2OR36TDAaPj3j1bIW5wvc1ly8hubZnMMm0eYjzf/UdN5zKBP8fA8ZKwFH
	 jUEjR2RRsH5DDiIJXWwG6wRxqpEoT/1IGn5f7BfecdQlCEQYxAKt95yyJ+ok8bL7yi
	 nv79wXlO/sSbk7Bh0kqJueJLhlDG7CvWbj2xgJgHaq6o4tY80e/66zfpP9MTsZsuy/
	 d8fIcP/rFTntbcFuQpIEak17cr4p2+U0klkp1vLau0XDGESQTUtk3PBa/ip57YcZAL
	 UEjce0fwBqq1w==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 61D0F3780029;
	Wed,  3 Jul 2024 12:10:21 +0000 (UTC)
Message-ID: <8a3b338f-5d5e-4aed-8362-04093a4f5b8e@collabora.com>
Date: Wed, 3 Jul 2024 09:10:18 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: subscribe kernelci
To: Yogesh Lal <quic_ylal@quicinc.com>, kernelci@lists.linux.dev
References: <0d424743-dfab-4d14-a077-1864f642bdda@quicinc.com>
Content-Language: en-US
From: Gustavo Padovan <gus@collabora.com>
In-Reply-To: <0d424743-dfab-4d14-a077-1864f642bdda@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Yogesh,

To subscribe you need to send an email to: 
kernelci+subscribe@lists.linux.dev

Best,

- Gus

On 7/3/24 2:44 AM, Yogesh Lal wrote:
> subscribe kernelci
>

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

