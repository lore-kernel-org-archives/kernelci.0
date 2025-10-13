Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96909270EDF
	for <kernelci@lists.linux.dev>; Mon, 13 Oct 2025 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389299; cv=none; b=tnh9TS/rMy6S35rrq6kQGolGZ3oIxKddDRcV2Uiel40GHilrMO23MYJMn4Y+bm3xp81Y47Px1rUF5+vdrYIHb2vwFp7ZuWAAUpxa1fZ395ZKb08MvSAzXlT8pNysKsG/87pB3KMY7eYPQ46NHnje+SARuhZ2mQIG/lXl3hAxGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389299; c=relaxed/simple;
	bh=K9ryyT7ikY85dS7Rk05rxN+3CR4ZOWzoLKVJNWUW2HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uG2Irbtpo15M6RQtOhn5IIwMg7gSiGr9eTendNpSfCBxp9ZhqEThzqzHm2/IP8iabLb38hXmdYkYxqad+cQE1mb+nGvvYJozXcbOonMV3LDzqJjAN9xSYTXaV7+OxWWQT2va5+loh1+HOY9Ja+nVfyLdXRpvRDmoix8wKTYdifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nuq61ulQ; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nuq61ulQ"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DL1Y8b907422;
	Mon, 13 Oct 2025 16:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760389294;
	bh=ixnh3eyD8FZN0gwziYI3ptmLZc8ekEJuK78fvVWWPZw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nuq61ulQauXu9eSdBIg3Hw9TqOqVIa/ko39AFsFqMnvoZnVCpVK2hm8Yfoc6sEyE4
	 8VHH/XHbSSIna6wR1/BrPcn66JGUOXlB3nwzbTJEVLDWqsazHvYTysIvsQTcK6bLt+
	 SCUl29Hjfg6HLgWNmI4l+GRiJpptJ6W2oM/k+6Yg=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DL1Y0W3444968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 16:01:34 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 16:01:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 16:01:34 -0500
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DL1YpF2680977;
	Mon, 13 Oct 2025 16:01:34 -0500
Message-ID: <43bed489-93d0-ec48-dd28-601317ec2e79@ti.com>
Date: Mon, 13 Oct 2025 16:01:34 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Hardware registry schema proposal
To: =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
CC: "Menon, Nishanth" <nm@ti.com>, "Sheraw, Barry" <bsheraw@ti.com>
References: <4e471946538c47cd9d000fa7ba31044e@ti.com>
 <2c821447e222e825b36bcc19917e6527d8358e8f.camel@pengutronix.de>
Content-Language: en-US
From: Minas Hambardzumyan <minas@ti.com>
In-Reply-To: <2c821447e222e825b36bcc19917e6527d8358e8f.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/9/25 04:58, Jan Lübbe wrote:
> On Wed, 2025-10-08 at 21:20 +0000, Hambardzumyan, Minas wrote:
>> Hello,
>>
>> I signed up a couple of weeks ago to propose a schema for organizing information about the hardware tested in Kernel-CI labs.
>>
>> Please review and share your comments on a proposed schema here:
>> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry_schema.yaml
>>
>> along with an example yaml file here:
>> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry.yaml
>>
>> In summary, the schema defines following main sections with cross references:
>>
>> * silicon_vendors: A collection of silicon vendors (processors, SOCs)
>> * platform_vendors: A collection of platform vendors (servers, laptops, boards, etc.)
>> * processors: A collection of processors used on tested platforms
>> * system_modules: A collection of system modules (SoMs, SiPs)
>> * platforms: A collection of platforms tested in labs
> 
> You have an `id` property which seems to always match the mapping entry name.
> Can they be different? If not, it seems redundant and the property could be
> removed.

Yes I have set id and yaml key name the same. Intention was include the 
hardware name in each yaml section, such that functions taking it as an 
argument would have access to the name without having to pass an extra 
parameter. I agree this does create a possibility for the two being 
different by mistake.

I think keeping the id would make it easier to use, but I have no 
problem removing it if there is a strong opinion to remove it.

> 
> Regards,
> Jan

