Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892E1A2C32
	for <kernelci@lists.linux.dev>; Mon, 14 Oct 2024 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903971; cv=none; b=gCNjhttDY8VoYfUapp5NdnDt602/h2y8H06e30Ok79iy/Sx6Far0MLgDxNgVO16E6nvyUToUZn/gOOZApKC1ZUH1ALpuZBQKwr3PNmcuRMcyICh1GQx1jIrTC9rpNZr4H23JlTizJ3WIvIHzCeg2jfdO1IXV+yb3T45n+5sXXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903971; c=relaxed/simple;
	bh=4vSAaHaZMSlPO4ln9oe4oTDIMdHo6v31ogD6Cgc0VEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTTo1UehiS3zcQ24xudowWjHsP/eA+5IOvnQME87qyHXjHp9ngj4/ndEbUrDb0LN1eiy9wZl4Uoc5qXZVnnz17qtMkMGZp+38T4z7bN2/RENjyvBNyJroE5bddzLnCjM8zZj5P5xaCnMZE5xQnoYFFWHQEeMcbApWuRQA1dyOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68C5D240009;
	Mon, 14 Oct 2024 11:06:00 +0000 (UTC)
Message-ID: <578c7c03-1252-47e5-996b-73048383dfc2@ghiti.fr>
Date: Mon, 14 Oct 2024 13:05:58 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V
Content-Language: en-US
To: Donald Zickus <dzickus@redhat.com>, Gustavo Padovan <gus@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>, Rafael Sene <rafael@riscv.org>,
 Helen koike <helen.koike@collabora.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
References: <82421990-2826-4efc-adbe-8b256e7b4b12@ghiti.fr>
 <19248df3764.c59f50b81776107.1655937717841580625@collabora.com>
 <CAK18DXbgQcBhia8na9Nn8taTuXtJkJ1d2AvnXO_hELk9wMUSqw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAK18DXbgQcBhia8na9Nn8taTuXtJkJ1d2AvnXO_hELk9wMUSqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr

Hi Gustavo, Donald,

On 01/10/2024 18:36, Donald Zickus wrote:
> Hi Alexandre,
>
> On Tue, Oct 1, 2024 at 12:31 PM Gustavo Padovan <gus@collabora.com> wrote:
>>
>> Hi Alexandre,
>>
>> ---- On Tue, 01 Oct 2024 12:21:49 -0300 Alexandre Ghiti  wrote ---
>>
>>   > Hi everyone,
>>   >
>>   > We (the RISC-V community) are looking for improving our CIs that are
>>   > currently spread over all the RISC-V companies, mostly private and very
>>   > incomplete.
>>
>> That is great to hear!  We have other hardware vendors coming to KernelCI with the same wishes of improving CI overall.
>>
>>   >
>>   > I only found one RISC-V build in kernelci, can I do something to help
>>   > adding a better RISC-V support?
>>
>> YES!
>>
>> First of all, we can enable more kernel trees and kernel configs in the maestro system.
>> That would give you wider build coverage. If you have a list of configs we can work on adding these.
>> - https://docs.kernelci.org/kernel-community/
>>
>> Then, we have to look at running these kernel on actual RISC-V devices. We can get RISC-V devices in KernelCI through a maestro lab, either through some of the existing labs or setting up a dedicated lab. Cc'ing Rafael from RISC-V as we discussed that already.
>> - https://docs.kernelci.org/labs/
>>
>> Another way, that could be relatively easy if you have a CI setup already, is to get the results of the current CIs in the RISC-V ecosystem into KCIDB (as long as you area running fully Open Source software in those tests).
>> - https://docs.kernelci.org/kcidb/
>>
>> Let us know how does that sound to you. We would happy to learn more about the ways we can make this work and chat more with you.
> In addition to everything Gustavo mentioned above, Red Hat's Fedora
> project can be another path as it uses CKI to do some CI testing and
> submit results to the same KCIDB mentioned above.  I believe Red Hat
> already has folks in the RISC-V community working on getting the
> hardware enabled on Fedora and possibly RHEL.  Just another option.
> Either way works or both!
>
> Cheers,
> Don
>
>> Best,
>>
>> - Gus
>>
>>

Sorry for the late answer! Bjorn and I have been talking with Rafael and 
we'll soon come up with a plan to integrate RISC-V in KernelCI, I'll 
keep you posted :)

Thanks again for your quick answers,

Alex


