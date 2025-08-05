Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1421B9FD
	for <kernelci@lists.linux.dev>; Tue,  5 Aug 2025 11:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754395077; cv=pass; b=SR3LLk+08IC/qxMfz76EgUrc+C4unVwX17rgW98J463x+PUtIJupacuDetzVvPqO7RbzhFLysYaLYcIGgl4yAVzY07/OzL3wzMxhaqJwcc2JzAf7L6xwDWLdFHt4VTEuK3d3Fz/duHzmCKa/rzhzyUMvob7xRO8OwygeUp7w8BA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754395077; c=relaxed/simple;
	bh=65K5x7AKDJBTZ/bCh0d1bjYyqhnN1iLxRVPM6dBAOYY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PET7R8gXNRpA3lQQhTqvB3lSNjc7cODXOwsAORgWYreLnaJDHTB7Ns7KhOUrNI85jNkQ56D5EggVySZJ1OK2yLdR9ebWfsEAdrji/TWZyr/XN+DsRorASsNfj+tXUcLaWDaAE8UBuwjmO8Kx80T1o00mRoe+ORVV3NAKhsNMd2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=B8ocZJDr; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="B8ocZJDr"
ARC-Seal: i=1; a=rsa-sha256; t=1754395073; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aSNXulgLaZO3Yu3U1OZpJ6DLrFWtJ5aGkRPDo8RM24jb0Yg8vsfMP/kUc956dAH1nWOAbfn/SC1hvlWc6WkjGJ/l+/sbGa3IV6HGfQj5LAmBM/ftwQTHs+DAm/MCJFaC2sNI1w+Ow29WYTOyD7FgMi4S7bgTte21VvjAsxFw8rI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754395073; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bbC1UM+/ObBKIKo4+zqaBJV81QPy3lX/MU16lfAyiqw=; 
	b=XyDh71oRgh/qOjnDTYRgS10tWaVFQ09aWzZRoPd8cqBDxaZFkYEab6DbIGovGibaPwh+AbjLaUBqB8oShZb2SKV+pv8wMCw0d8Ga1zCIDXUQe+cfStW+SG3oKncLU1wwSvlbtyLvzhq29kCJoBdh7TI+BhEbPQsnliiOdl3/5Cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754395073;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bbC1UM+/ObBKIKo4+zqaBJV81QPy3lX/MU16lfAyiqw=;
	b=B8ocZJDrV1UIimDB9DJ2ckfPmtOaWNZfxX4Ggl4CXTFB5388s65CQ/Twx0vthi14
	/hva7a1PL4YwdL7NxdwctLi5yH+c68A32o8fD1lMn952P6mqOiOV6OrZJUH76gdWfen
	aV/768m7nyRFbxZVeuv6LlrtU4bCcBh64gbHduJ8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1754395070906378.45960490973084; Tue, 5 Aug 2025 04:57:50 -0700 (PDT)
Date: Tue, 05 Aug 2025 08:57:50 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Gustavo Padovan" <gus@collabora.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Automated Testing" <automated-testing@lists.yoctoproject.org>,
	"KernelCI Members" <kernelci-members@groups.io>,
	"kernelci-hw-vendors" <kernelci-hw-vendors@groups.io>
Message-ID: <1987a1851a3.360c6270521972.8904361685319295839@collabora.com>
In-Reply-To: <19809426904.3c4822be1251531.2628638964882412232@collabora.com>
References: <19809426904.3c4822be1251531.2628638964882412232@collabora.com>
Subject: Re: KernelCI Workshop in Amsterdam on Aug 28th
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

Thanks to everyone who subscribed already! 

This is reminder for those who want to join the workshop. Follow the link on the message below to subscribe.

And let us know of any topics you might want to discuss.

Best,

- Gus

--
Gustavo Padovan

Collabora Ltd.



---- On Mon, 14 Jul 2025 11:06:43 -0300 Gustavo Padovan <gus@collabora.com> wrote ---

 > Hello everyone, 
 >  
 > We will run a KernelCI Workshop on August 28th right after Open Source Summit Europe(OSSEU) in Amsterdam. The location is not too far from the main OSSEU venue. 
 >  
 > The goal of the workshop is to discuss the current architecture and roadmap of the project and refine our directions forward as a community. The workshop will run as an un-conference style with agenda discussed and decided at the beginning of workshop. 
 >  
 > If you want to take part, please manifest your interest at: 
 >  https://forms.gle/SwanWMQnwg6F6UAx9 
 >  
 > For any questions don't hesitate to reach out to me. 
 >  
 > - The KernelCI team 
 >  
 > -- 
 > Gustavo Padovan 
 >  
 > Collabora Ltd. 
 >  
 >  
 > 

