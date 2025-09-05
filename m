Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802F22836C
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098039; cv=none; b=BCKdCzW37whnpiuyCPeJQGpXLiG9VNdXpXuuDhX5CtbjU/NmUyMO9antabAeWLdDYI5sWsCxIMELevhqwxsb0uU8K4beEB4tLql1KETdUNsvcXZuSvlv3ZFaR+QtdzTVBJ1TQR1Hmhq/N39efJKdzvgfTF3xxg0FbsR8z/TyjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098039; c=relaxed/simple;
	bh=20e7HPgRHLBye7NevZnGaj4ZygnYYOiLHmzPUA+TFhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WXe/2coXAjSELyTOlZpr0jdKGYgzJW95gJCwPWubXqsWBfkQS/wSHVzH9TiGFarYYSl7DeRDSLMW/g2+OVNZxFwAMVzhbnPu6uz5fPA7NJZsv9kqwhCiImi3YE/I1Ivh0ApGX/OTevdRVmWhuczSg/vRFTp8czbcp/moZ7gdjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n/KYSavU; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n/KYSavU"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585IlCo03314284;
	Fri, 5 Sep 2025 13:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757098032;
	bh=vPq7Bd9GyPFWNionWzN/sky+5hiKST9q20WxBuyeW8E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n/KYSavUVoMpPkna/pGy1ikUtya8jfWqWfEKQKrxysKa6EMdUIn+hS5qmELshd9XT
	 FN5mNnmYzz5vfAzJ5CUlpvlVq7Iqk/idlqu9T/LklIqKHHBz3seE37i7tWFQDflfCm
	 2jbMeuGfR3hW17dYtvqEbYnW85kKHF7Bq9fgX8bM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585IlCxq1090001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 13:47:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 13:47:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 13:47:12 -0500
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585IlCdk1164707;
	Fri, 5 Sep 2025 13:47:12 -0500
Message-ID: <19a887a9-c859-fbe9-6d4f-d607d85de69b@ti.com>
Date: Fri, 5 Sep 2025 13:47:12 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: KernelCI TSC nomination request
To: Donald Zickus <dzickus@redhat.com>, "Sheraw, Barry" <bsheraw@ti.com>
CC: kernelci <kernelci@lists.linux.dev>,
        Gustavo Padovan
	<gustavo.padovan@collabora.com>,
        mwaqar <mwaqar@linuxfoundation.org>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <CAK18DXYv-eEirpb07c3LB7mr_VUXA+BHnwF=G_KA+rybaMQPCg@mail.gmail.com>
 <270ee39772be4b268952f764e54e2c9b@ti.com>
 <CAK18DXZFbdh9+qX6e6onp1=S_GE_FybBVvo_JGO2rv_rEdGZ1g@mail.gmail.com>
Content-Language: en-US
From: Minas Hambardzumyan <minas@ti.com>
In-Reply-To: <CAK18DXZFbdh9+qX6e6onp1=S_GE_FybBVvo_JGO2rv_rEdGZ1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Don,

On 9/5/25 12:27, Donald Zickus wrote:
> Hi Minas,
> 
> On Wed, Sep 3, 2025 at 5:45 PM Sheraw, Barry <bsheraw@ti.com 
> <mailto:bsheraw@ti.com>> wrote:
> 
>     Hello,____
> 
>     __ __
> 
>     I would like to nominate Minas Hambardzumyan (CC’d).
> 
> 
> Do you accept this nomination?

Yes, I accept the nomination.

Thanks,
Minas


> 
> Cheers,
> Don
> 
>     ____
> 
>     __ __
> 
>     Barry____
> 
>     __ __
> 
>     *From:*Donald Zickus <dzickus@redhat.com <mailto:dzickus@redhat.com>>
>     *Sent:* Wednesday, September 3, 2025 9:58 AM
>     *To:* kernelci <kernelci@lists.linux.dev
>     <mailto:kernelci@lists.linux.dev>>
>     *Cc:* Gustavo Padovan <gustavo.padovan@collabora.com
>     <mailto:gustavo.padovan@collabora.com>>; mwaqar
>     <mwaqar@linuxfoundation.org <mailto:mwaqar@linuxfoundation.org>>
>     *Subject:* [EXTERNAL] Re: KernelCI TSC nomination request____
> 
>     __ __
> 
>     Hi, On Tue, Sep 2, 2025 at 3: 24 PM Donald Zickus <dzickus@ redhat.
>      com> wrote: > > (resending text/plain) > > Hello KernelCI
>     community! > > We have recently revised the KernelCI TSC charter[0]
>     to establish a > more effective____
> 
>     ZjQcmQRYFpfptBannerStart____
> 
>     *This message was sent from outside of Texas Instruments. ____*
> 
>     Do not click links or open attachments unless you recognize the
>     source of this email and know the content is safe. ____
> 
>     *  Report Suspicious *
>     <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczjvV2OWJy6nln0o9Cb63ohME3-SeZJzDvOe-rheYoYGV8-d1RVNChzguAAWQLwW0DZZo7mx9ZulHAXPJUm5YPjvtoIHUUb2w1MO0-aKSUDHkbhLQH0$>  ‌ ____
> 
>     ZjQcmQRYFpfptBannerEnd____
> 
>     Hi,____
> 
>     __ __
> 
>     On Tue, Sep 2, 2025 at 3:24 PM Donald Zickus <dzickus@redhat.com
>     <mailto:dzickus@redhat.com>> wrote:____
> 
>     >__ __
> 
>     > (resending text/plain)____
> 
>     >__ __
> 
>     > Hello KernelCI community!____
> 
>     >__ __
> 
>     > We have recently revised the KernelCI TSC charter[0] to establish a____
> 
>     > more effective approach for our future work. The TSC will continue to____
> 
>     > monitor and provide technical direction for all activities and____
> 
>     > services related to KernelCI. Additionally, with the inception of the____
> 
>     > Infrastructure Working Group, the TSC will serve as the primary____
> 
>     > interface between the KernelCI community and our key users (kernel____
> 
>     > maintainers and developers, hardware/cloud vendors, etc.), translating____
> 
>     > user needs to the Infrastructure WG.____
> 
>     >__ __
> 
>     > The updated charter requires a new committee to be elected, consisting____
> 
>     > of no more than four members, each serving a one-year term, with only____
> 
>     > one member per company.____
> 
>     >__ __
> 
>     > If you would like to nominate yourself for a committee position on the____
> 
>     > TSC, please reply to this email with your nomination request.____
> 
>     __ __
> 
>     I forgot to add, we would like to finalize the nominations by Friday____
> 
>     September 12th.____
> 
>     __ __
> 
>     Cheers,____
> 
>     Don____
> 
>     __ __
> 
>     >__ __
> 
>     > Cheers,____
> 
>     > Don Zickus - Chair KernelCI Board____
> 
>     __ __
> 
>     __ __
> 

