Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1D273D91
	for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162491; cv=pass; b=LOZsuqFYkl+VvMjWlsdQj5Q+6ID+NAYwbbuWKvKN1BniOrMwj1poF9+kpRvqitkm6EHPkGF0o4T7E3EHqGlP3XhF2l1viMKX1t7pc8F99N2VHN6uuyFqhQetttBsl5mvI75z4dUHB6IT0BS40IoQo0kN52P71AhtLrT8DQEsFIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162491; c=relaxed/simple;
	bh=RuLTk2dDHXv1IKP7GqJczcAMz/+n+oQ6wkPWjSo7Mvc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Q4fl4xEX4RspTgnkS00JOzOcl4duBHFvjB/qdWYmaX6P/0FMnOJ0nXO+16sPgRcRz/NBIFCmMQyqESL4uc8mL+eF5BeD19OQUGqhfYsO/rc2w+FSNJc1hjFuDzYFeu3FIcIhWSYDg3xtp2vA0meoeyWpM/ZXtBSdeYcowNblHb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=H24TixiI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="H24TixiI"
ARC-Seal: i=1; a=rsa-sha256; t=1752162486; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fXQqEMbVALc5OYZvJYHzA5w5iULf85ftQdtsUrCWIqykg5sQZaquWGLpxBplFXTPF2xcDmmMpmXI8TZcZD+zQA3Ldt/EWZwYYkttHfohvfc1EJN79kH5a8o59/cJ46WtHW+ZpOkeFUYAnHwyClPKSqvkwJR5BAoMRZDnFYk/CDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752162486; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sLUi6Lk9WRyQ8U2TM1Z8U02cZWUDYx/pR/9/QqVkmNA=; 
	b=lI5ctche8srVtupVl/VjLHhbjKZkftJQ2NutluLCKIozp/kWTEzgjktLBagHBQkvbysgkV0tEkfJ+P1t/08VPTrXmTW2BnqarSNZf5vjIzmQUBpLyDkSOfduV0TiIa3PR0zuIvOSKbqvNpCi0c0AXyD6XYq/dzBiYQF6hozCuS8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752162486;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sLUi6Lk9WRyQ8U2TM1Z8U02cZWUDYx/pR/9/QqVkmNA=;
	b=H24TixiIzzQSM0D8/1A2pOBsGkHwMX7+v57O102jHiaP6dJ0YpB6l51Qzn+wzbY/
	vITBO9hK6Hqz0+nDtwHQrI087+cz0jmFUXyJ6aN/GLKg3xer3lQ9BLtHkRx8paHbRvg
	/Lq3XKV860bPJ8aXE8EulSZg50hrSSJXdLJcV/bk=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752162473510592.3475194422218; Thu, 10 Jul 2025 08:47:53 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:47:53 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "helpdesk" <helpdesk@kernel.org>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Message-ID: <197f5059619.67381650261123.8906384152523459318@collabora.com>
In-Reply-To: <197f4fc4468.7d520309253626.7085799435648700480@collabora.com>
References: <197f4fc4468.7d520309253626.7085799435648700480@collabora.com>
Subject: Re: kernel.org email account for KernelCI
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




---- On Thu, 10 Jul 2025 12:37:42 -0300 Gustavo Padovan <gus@collabora.com> wrote ---

 > Hello, 
 >  
 > At KernelCI we are currently struggling with the Gmail API and plain-text. 
 > Our recipients keep getting emails with line wraps and we can't figure out 
 > why. Both myself and AI dived into it and no luck so far. End of the day 
 > Gmail is really for HTML based emails. 
 >  
 > We received a feedback from the linux-next folks[2] that the fact that 
 > log excerpts shared in the regression report has line wraps makes it 
 > harder for them to read it. (examples [2}). 
 >  
 > Would it be possible to setup ci@kernel.org or kernelci@kernel.org for 
 > KernelCI to send its reports from there? That could be a great solution 
 > to our problem if you can serve emails for us. 

I was just informed that linux.dev is an option too. And the process
is through helpdesk, so leaving this here for you evaluation and answer.

 >  
 > Best, 
 >  
 > - Gus 
 >  
 > [1] https://lore.kernel.org/kernelci/197e685ded3.e673ce7447423.785163730221310361@collabora.com/T/#t 
 > [2] https://groups.io/g/kernelci-results/message/58934 
 >  
 >  
 > -- 
 > Gustavo Padovan 
 >  
 > Collabora Ltd. 
 >  
 > 

