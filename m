Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46C30B522
	for <kernelci@lists.linux.dev>; Mon,  8 Sep 2025 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338749; cv=none; b=qVv1bge/xEYrh5ISi2wlVhAcnSwhz6GqapWIZZpKwKFKCIQZ6oRi6ZLZnomM4zJP2EM85v7leN6RcJ5E7h7azbjJT9wPksL94EWxoYEt3Z8fBYDJzFsLrzUbIPc5Z2ZcEcQvIIj56Ia8wSCsuS/1wfEunDyX6/0xSq3//UEXAOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338749; c=relaxed/simple;
	bh=eDcLbXu+Qesk/FmMfwg90pz15iE1PMZaNMZYsRgf+AI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=WLDd22ksUnb4KUMamtZypPzja8ccMjkxxDqgIulE7syiFAFVS//pXRWHA+7QQJ+oW5ZbVM+TSFxRCeoh52MGur8TrE3FCxKlEF6irH7eCAP2LazE32O0OqgF5skak8+6xV4BTbZ6lxQvjZsKeFV2zh+ty76gQIjI1btvm/VHWz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wrvzRMXX; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wrvzRMXX"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Dd3Pn3800368;
	Mon, 8 Sep 2025 08:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757338743;
	bh=jAroqXnAArD4PrAal8u5tI/YGAWKxUOCfcurSGJWBcc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=wrvzRMXXzAaguvj8lGP1AcdWfzOx8NWc+4qFW3QNpviW7wYBOAmqw+Sp+7mSoGWAs
	 +DmhduVHrnsDUm3zlfWq5CF8mjY18R2mZD+rt5Bw3XQ8ppry7ebxOyO6lQzs0w8lyu
	 16OEtJvYwdWTNIfyujMHNhg5+WKx1FqHVodH6e18=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Dd30f3036174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 08:39:03 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 08:39:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 08:39:02 -0500
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Dd2Gm974675;
	Mon, 8 Sep 2025 08:39:02 -0500
Message-ID: <4fd5c4e1-b599-b678-472e-2c75607f6a81@ti.com>
Date: Mon, 8 Sep 2025 08:39:02 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: KernelCI TSC nomination request
Content-Language: en-US
From: Minas Hambardzumyan <minas@ti.com>
To: Donald Zickus <dzickus@redhat.com>, "Sheraw, Barry" <bsheraw@ti.com>
CC: kernelci <kernelci@lists.linux.dev>,
        Gustavo Padovan
	<gustavo.padovan@collabora.com>,
        mwaqar <mwaqar@linuxfoundation.org>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <CAK18DXYv-eEirpb07c3LB7mr_VUXA+BHnwF=G_KA+rybaMQPCg@mail.gmail.com>
 <270ee39772be4b268952f764e54e2c9b@ti.com>
 <CAK18DXZFbdh9+qX6e6onp1=S_GE_FybBVvo_JGO2rv_rEdGZ1g@mail.gmail.com>
 <19a887a9-c859-fbe9-6d4f-d607d85de69b@ti.com>
In-Reply-To: <19a887a9-c859-fbe9-6d4f-d607d85de69b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 9/5/25 13:47, Minas Hambardzumyan wrote:
> Hi Don,
> 
> On 9/5/25 12:27, Donald Zickus wrote:
>> Hi Minas,
>>
>> On Wed, Sep 3, 2025 at 5:45 PM Sheraw, Barry <bsheraw@ti.com 
>> <mailto:bsheraw@ti.com>> wrote:
>>
>>     Hello,____
>>
>>     __ __
>>
>>     I would like to nominate Minas Hambardzumyan (CC’d).
>>
>>
>> Do you accept this nomination?
> 
> Yes, I accept the nomination.

As for introduction:

I have been involved with Kernel CI since 2023, while I was working on 
publishing of test results for TI platforms using KCI legacy APIs. I was 
actively involved in definition of the publisher/subscriber flow for 
enabling external test labs using Maestro APIs, which TI transitioned to 
earlier this year.

I have actively participated in number of Kernel CI round tables, few 
topics I brought up are now included in the key focus areas of the TSC.

> 
> Thanks,
> Minas
> 
> 
>>
>> Cheers,
>> Don
>>
>>     ____
>>
>>     __ __
>>
>>     Barry____
>>
>>     __ __
>>
>>     *From:*Donald Zickus <dzickus@redhat.com <mailto:dzickus@redhat.com>>
>>     *Sent:* Wednesday, September 3, 2025 9:58 AM
>>     *To:* kernelci <kernelci@lists.linux.dev
>>     <mailto:kernelci@lists.linux.dev>>
>>     *Cc:* Gustavo Padovan <gustavo.padovan@collabora.com
>>     <mailto:gustavo.padovan@collabora.com>>; mwaqar
>>     <mwaqar@linuxfoundation.org <mailto:mwaqar@linuxfoundation.org>>
>>     *Subject:* [EXTERNAL] Re: KernelCI TSC nomination request____
>>
>>     __ __
>>
>>     Hi, On Tue, Sep 2, 2025 at 3: 24 PM Donald Zickus <dzickus@ redhat.
>>      com> wrote: > > (resending text/plain) > > Hello KernelCI
>>     community! > > We have recently revised the KernelCI TSC charter[0]
>>     to establish a > more effective____
>>
>>     ZjQcmQRYFpfptBannerStart____
>>
>>     *This message was sent from outside of Texas Instruments. ____*
>>
>>     Do not click links or open attachments unless you recognize the
>>     source of this email and know the content is safe. ____
>>
>>     *  Report Suspicious *
>>     
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczjvV2OWJy6nln0o9Cb63ohME3-SeZJzDvOe-rheYoYGV8-d1RVNChzguAAWQLwW0DZZo7mx9ZulHAXPJUm5YPjvtoIHUUb2w1MO0-aKSUDHkbhLQH0$>  ‌ ____
>>
>>     ZjQcmQRYFpfptBannerEnd____
>>
>>     Hi,____
>>
>>     __ __
>>
>>     On Tue, Sep 2, 2025 at 3:24 PM Donald Zickus <dzickus@redhat.com
>>     <mailto:dzickus@redhat.com>> wrote:____
>>
>>     >__ __
>>
>>     > (resending text/plain)____
>>
>>     >__ __
>>
>>     > Hello KernelCI community!____
>>
>>     >__ __
>>
>>     > We have recently revised the KernelCI TSC charter[0] to 
>> establish a____
>>
>>     > more effective approach for our future work. The TSC will 
>> continue to____
>>
>>     > monitor and provide technical direction for all activities and____
>>
>>     > services related to KernelCI. Additionally, with the inception 
>> of the____
>>
>>     > Infrastructure Working Group, the TSC will serve as the primary____
>>
>>     > interface between the KernelCI community and our key users 
>> (kernel____
>>
>>     > maintainers and developers, hardware/cloud vendors, etc.), 
>> translating____
>>
>>     > user needs to the Infrastructure WG.____
>>
>>     >__ __
>>
>>     > The updated charter requires a new committee to be elected, 
>> consisting____
>>
>>     > of no more than four members, each serving a one-year term, with 
>> only____
>>
>>     > one member per company.____
>>
>>     >__ __
>>
>>     > If you would like to nominate yourself for a committee position 
>> on the____
>>
>>     > TSC, please reply to this email with your nomination request.____
>>
>>     __ __
>>
>>     I forgot to add, we would like to finalize the nominations by 
>> Friday____
>>
>>     September 12th.____
>>
>>     __ __
>>
>>     Cheers,____
>>
>>     Don____
>>
>>     __ __
>>
>>     >__ __
>>
>>     > Cheers,____
>>
>>     > Don Zickus - Chair KernelCI Board____
>>
>>     __ __
>>
>>     __ __
>>
> 
> 

