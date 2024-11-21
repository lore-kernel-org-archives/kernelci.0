Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E70158D79
	for <kernelci@lists.linux.dev>; Thu, 21 Nov 2024 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732177972; cv=pass; b=Jg+l7iJQ349Orons0+2LApAkBwvWUV86aTcu4Re2swXRI9lFD/tZbykR84z6gWwOWu5/Zvuz+JCugwywhLcCItuD61i1FmnFs62Jls/lhxIEdBVAwTrVnxf+oUparfemoZK9gV0NTOWGNhloTVn6c0peunKV8vfcfuR91FW0RCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732177972; c=relaxed/simple;
	bh=oJSW9iDP+wEs+4wVN9RNMtIm2gA1oAXOcquHYruz1Uw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TtHNdDzsaPpbFP05n1IMmXeDn94edP8Cb4rUGZ7/VrOUE52ITimwzCO8j7sX/JSu5SgaKTReIEA2NWCTFgCLijFRELO6G5Bg3fSgN5hkqdXsvdBZwelPOSlvF+CRpsfed/xwPRDHNVtSkQ+K1wO8z2klfdCtSo8vLYsJZVKXPh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=W46LA7lo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="W46LA7lo"
ARC-Seal: i=1; a=rsa-sha256; t=1732177969; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RKIkWvUwFu8UHs81SHo70iIbqpjgbQB+j85xqtsDJzoKfXbTYf+uRNjJe1aPQGhfAkxhlssowuuVqreSFeGrosq3ktiNdJq4nJGKGAhHIm6aXNvAB8K5VErdxc6BWI/ceIbBCOLgZlebm1TaeWzQEox/SlIdukpW51uBeG1KtdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732177969; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sImbmu9UBj+wCPLqCoSOhdTCNmCAiL/PcNzoOoYtk6M=; 
	b=BnyTJm3zRlPdwZPR8/oZaxY+PvsAPjTS/rBxcRy/x/T5j3TAle/ksFkB1TdCdz230gVzlCtON1ZATyIEQ2cTg101H77TdhhNEoVDY7tXR1O7YOerKEo/40cndLN2xZGsMZ9FiIvjWQqMDbZqE3WnCwFmP3CDox1/BnZkLjYL/C8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732177968;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sImbmu9UBj+wCPLqCoSOhdTCNmCAiL/PcNzoOoYtk6M=;
	b=W46LA7loWNHj3QInXAfsA0Qj1OkpB9TUo+zUzaQ0sOhFY4U/WRouB0YaHinEAp5O
	jXd9UbjzKpQGXqqvfMjpbmUIZPC9H/sYlPqAgB17Lcm8GPvIuQ5Qiyt1Fn37I8qmEc8
	rURVRaevW60iyYgVzmP74Dd8pkJoDGy9AbpnwZ/I=
Received: by mx.zohomail.com with SMTPS id 173217796612055.59346655047966;
	Thu, 21 Nov 2024 00:32:46 -0800 (PST)
Message-ID: <afdbca60-3cbf-46b6-9cb5-28a71e61ec87@collabora.com>
Date: Thu, 21 Nov 2024 13:32:42 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, kernelci@lists.linux.dev
Subject: Re: The kernelci branch has disappeared
To: Peter Zijlstra <peterz@infradead.org>
References: <06ae426f-7a43-43c5-8474-8605c0092588@collabora.com>
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
In-Reply-To: <06ae426f-7a43-43c5-8474-8605c0092588@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Reminder
On 11/15/24 3:19 PM, Muhammad Usama Anjum wrote:
> Hi Peter,
> 
> We had enabled kernelci branch from your tree in kernelci [1]
> which has disappeared. We are removing this branch from the kernelci.
> Do you want us to enable some branch(s) in Kernelci in its place?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git

-- 
BR,
Muhammad Usama Anjum

