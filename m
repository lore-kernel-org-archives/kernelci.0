Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0772DECA7
	for <kernelci@lists.linux.dev>; Tue,  2 Sep 2025 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827021; cv=none; b=TMdO5al5sGUEI6kKBe203N3IE52ALPMLWChcKIhBT82RFE2Q9/e/oJtDPg78WXWSbRt2b7X8htUdpc7f4omJDu8QpKeFlb6NtiiSz/qpDGOWDjC+aETlO2AjU7KoAPkdeQi56eyqGn//MrKn5an+wlEIQLiLN1Zps/Fh+HNT4yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827021; c=relaxed/simple;
	bh=LIpXmUXAlW4I9DmFBYpNCZ96w0FYN7dHmPgO3QUTw/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UVUoZMoZvn6+AKDULETBl+ErlKwl+VaA4e77QFU2ztjryTLZ+wmqoorMc1oiE7ev3I21U35eTgzMHovOU6QSZ7JBNQeKnig4X+cnf0G8yr+uiEc33btiu2cRfjXLNV65WSfGlat424UIrhj9s71VbPiEaDLQb05VhKl7Veefotw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VM/IrH47; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VM/IrH47"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582FUALR3014542;
	Tue, 2 Sep 2025 10:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756827010;
	bh=ieoUcqbqKb7IimAui1gaoJkRkJRbcEPc8JjiPousVVY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VM/IrH47KbATiej7QBXVrlQWy6q6Ic4QzhjPe6exkH6VpbKD+YMKfrLTPeK96o07e
	 slpD1TLSy31YQ2JFMkFqBHQQo/HILxmZA5AXjS8y8sksmtH2qcPtpindTwPB67AZ8V
	 qdDStepxgG0NmXYjfZBQhYuM8ah0fYnZzr/2FeNc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582FUAJA2835070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 10:30:10 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 10:30:10 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Tue, 2 Sep
 2025 10:30:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 10:30:09 -0500
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582FU9Sl101562;
	Tue, 2 Sep 2025 10:30:09 -0500
Message-ID: <58ac950d-a253-a85a-4e50-6d758181232d@ti.com>
Date: Tue, 2 Sep 2025 10:30:09 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: KernelCI Labs Working Group
To: Gustavo Padovan <gus@collabora.com>,
        "kernelci lists.linux.dev"
	<kernelci@lists.linux.dev>
CC: "chris.paterson2" <chris.paterson2@renesas.com>,
        "ben.copeland"
	<ben.copeland@linaro.org>, cfi <cfi@pengutronix.de>,
        broonie
	<broonie@kernel.org>, sjoerd <sjoerd@collabora.com>,
        khilman
	<khilman@baylibre.com>, "f.pflug" <f.pflug@pengutronix.de>,
        =?UTF-8?Q?Pawe=c5=82_Wieczorek?= <pawiecz@collabora.com>,
        Tim Orling
	<tim.orling@konsulko.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Content-Language: en-US
From: Minas Hambardzumyan <minas@ti.com>
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Gus,

On 9/1/25 17:54, Gustavo Padovan wrote:
> Following discussions at the KernelCI Workshop 2025 in Amsterdam, we're establishing
> a Labs Working Group to address the challenges of executing testing through hardware
> labs in KernelCI.
> 
> ## Working Group Scope
> 
> The Labs WG will focus on improving how KernelCI integrates with and manages
> hardware testing laboratories. Currently, we support only LAVA, but there's growing
> interest in expanding backend support and addressing various infrastructure challenges.
> 
> 
> ## Key Areas of Focus
> 
> - Labgrid Integration: Design and implement labgrid backend support alongside existing
> LAVA integration
> - CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.) through improved
> events API and shared rootfs images.
> - Alternative Backends: Explore integration with other lab management systems like Tuxtest
> for virtualized testing
> - Lab Health Dashboard: Develop tools to monitor lab status and infrastructure issues
> - Failure Classification: Improve detection and reporting of infrastructure failures vs. actual
> test failures
> - Lab Admin Guidelines: Create standards for lab administrators on device type differentiation
> and configuration facilitating accessing the same hardware across multiple labs.
> - Job Prioritization: Implement smarter job scheduling
> - Dependency Management: Avoid running dependent tests when prerequisites fail (e.g.,
> skip NFS-dependent tests if NFS boot fails)
> 
> The Labs WG will work closely with the Infrastructure Working Group and Technical
> Steering Committee to ensure our efforts align with KernelCI's overall architecture and goals.
> 
> Based on the interest during the workshop, we’d need to cover the West Coast timezone
> as well. So an initial proposal for these meetings is starting next week on Thursday,
> September 11 at 7:30am PDT/4:30pm CEST.

Thanks for setting this up. This time should work for me.

Regards,
Minas.

> 
> We invite all interested community members, especially those running or managing
> hardware labs, to participate in this working group. Please reply to this thread if
> you're interested in contributing or have specific use cases and requirements to discuss.
> 
> Best,
> 
> - Gus
> 
> --
> Gustavo Padovan
> 
> Collabora Ltd.
> 
> 

