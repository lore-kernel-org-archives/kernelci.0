Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF320323
	for <kernelci@lists.linux.dev>; Tue, 17 Sep 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726568090; cv=pass; b=uUnJs7Pnh/z7vEzWy6o+iYDnD2Mjrikuz02mpvZye2bGLUsgJJ4glbcoZgmYedDoFXEnBVfaM9pq5Idu+xPZeVrn09amZARuIB/ECX7R/ZlAz/zkamFnAmszwT5VEQGnf4OBc0nSBYqPZcWYtV4eeNj4Fjr3akpY9jy0LjZJ6lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726568090; c=relaxed/simple;
	bh=vFVQYurx2tNOVl0UrnGT75ROcxXcyPDMD4L8GONLdZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVhgaRjT63P9AdkhCEDZ+oNxzIaV4qwU3eXe/nFsj4sD0/MTipZlRL/B0678qrjzewsZoFiXSAooN6DczX/011jWLsSVTkC4997NKlf1UN7D/QOLFdT4zyxUDH/R9LAyZVXbHSAExovZ9+DS/gBnNURu3x06Aaqs/BDJRc7rIJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=laura.nao@collabora.com header.b=TEhkVw6n; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=laura.nao@collabora.com header.b="TEhkVw6n"
ARC-Seal: i=1; a=rsa-sha256; t=1726568084; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I1bp/2fYt51Fw9FoZ8s2ImIY4g9Br8dCAQ8Kmfh4WXRZsp7RW8uxnVo1Uf05AhHU1to15OYmRvon+YmEPmwJgZDKaiCkfzSo6wJkXphhambfTgT53CsMfXD1PIpCi5Mr1Jyi5PS2LrKoOQfUX9QW3xw+gpRaCjacgfybPkGeu5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726568084; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FxpmNUGUnXs9mBTv9Jjh2uupQbS3XD7oRvl5oWTt5Kw=; 
	b=Cqz66MUMVN+dOve+G/q0/IIfCQMlUq1zKNcqhOeelTJrW5TCr9k8xrjzFM/ulqxaSKGraCCBhJbAZRnFJ3QQQAsheuf1QOqKzF/rNkCY5BMAKbIZpZtyhvW0KbDNDTKghDkXAewqYhHLjLDy6UUkFgP0aGFD2EZWlSbV8v9u7qs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=laura.nao@collabora.com;
	dmarc=pass header.from=<laura.nao@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726568084;
	s=zohomail; d=collabora.com; i=laura.nao@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FxpmNUGUnXs9mBTv9Jjh2uupQbS3XD7oRvl5oWTt5Kw=;
	b=TEhkVw6nE1arrzxyfZIM0Mah6ByxcJVq3whYd2gOsb6S9pIMrgOGccNHBxjvxDWe
	5F8AeJ9CbcWvotM9j9N6KGqbTsyFNmNR8HRkV08+o55PbsmDCIRpXTvUyS1VzqsJnbD
	AqSV3yShjJnuok+CKrT/R8j/dLVEOrYXBpfco0ew=
Received: by mx.zohomail.com with SMTPS id 1726568082905333.8731650082517;
	Tue, 17 Sep 2024 03:14:42 -0700 (PDT)
Message-ID: <6edcd2a2-4e09-4f41-a4f5-5595fefecf75@collabora.com>
Date: Tue, 17 Sep 2024 12:15:25 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Test catalog
To: Donald Zickus <dzickus@redhat.com>,
 Nikolai Kondrashov <nkondras@redhat.com>
Cc: kernelci@lists.linux.dev, Gustavo Padovan <gustavo.padovan@collabora.com>
References: <CAK18DXZ9610pCm42m-D-gAKTrGQuh5TmEwaPyA6QHiB_80pK4Q@mail.gmail.com>
Content-Language: en-US
From: Laura Nao <laura.nao@collabora.com>
In-Reply-To: <CAK18DXZ9610pCm42m-D-gAKTrGQuh5TmEwaPyA6QHiB_80pK4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Don,

Sure, count me in! Thursday morning works for me. Looking forward to the 
discussion. I agree it's important to centralize info on available test 
suites and how to pick the right subset for each platform, focusing on 
maintainers' needs.

Best,

Laura

On 9/16/24 17:47, Donald Zickus wrote:
> Hi Laura,
> 
> I was talking with Gustavo and Nikolai about the test catalog idea that 
> has been floating around.  I think having a way for maintainers to 
> accurately describe their test and hardware needs to define what does 
> 'testing done' look like from a maintainers perspective, allows the 
> community to come together and work on filling the gaps.  I don't 
> believe a single CI system nor lab has enough resources to provide 
> everything a maintainer wants.  But as a community we can.
> 
> I would like to sit down with folks from Collabora, Red Hat and others 
> at LPC to discuss this more.  I see this as a 2025 roadmap.  Gustavo 
> thinks that Thursday morning somewhere might be an open time where folks 
> don't have talks.  I was hoping to chat for an hour.  This could help us 
> drive conversations with community members on how they could contribute 
> (mostly focused on hardware vendors).
> 
> All are welcome to chat.  Let me know if there is interest and I can 
> find a room and timeslot.
> 
> Cheers,
> Don

