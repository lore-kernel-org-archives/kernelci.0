Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C708226F467
	for <kernelci@lists.linux.dev>; Thu, 27 Feb 2025 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684010; cv=pass; b=Jh1UANyK8kJvSBKBxXFoU0xCFRLiPRNV3ZDrrjH2KaAichM/5Zf8VRLuovNrizwyYd+hzjsgopFJmu9U+va0FhiGLGe2jlL+hQH6H/Ja3hAZb9v07uGDHpspFL+ApSjnMwQMeknCIf4HCmqXF9p3/ccWa3bSFoxPcSSU6W7vf9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684010; c=relaxed/simple;
	bh=jTnHktEmA/wKHChHyuWvlyS49lVQ5KDSdO/cNt2gWLU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Ky57AHhv4ZBJ0x+jOOKmwQT9RGTWYoxQf7/Nay0KKapXQNTKJFFGN768Q4NUBHR5HqheULAjVuxkXcIK5res1BQ++LSgCgx9t5BRqVmQZeRkg1OfJfEMbHYJ7N3yYFiBMiKTVPlsmmxAj4WLBK0fxjXlT2i7nrO9lpy6C1HsK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=gFhDZ+rY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="gFhDZ+rY"
ARC-Seal: i=1; a=rsa-sha256; t=1740683985; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h87FkdJp3ys4iIcOHhfOg3lvPx1PSFGzqhmcY/igPe0lEfu+SATV+9LX0PAEqWliVjGDt1jk14EedPIKQAfIcz7CgdGkBJX3qY52JgYJHXdhr/ZCxIQcPW1uEsbHld9gyMQd2qOvLho92Bc1Xgpp4BK9uHUGAiBPmmXHsMU+1ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740683985; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cOq03STdwkdsrku3Yp48otKKpHmTbEHT+JgnMwZIrK4=; 
	b=Et3g9OOge1YqlApwXWhncJHWYOE1cCGDHOEopiYGt2tQ7NwBhfVdlaC4F2z41M4zFC4gzBPQAoI1FQAFrcCbaS8hpc1n0TPQqZ6nUuEDp1M7nvfgs/WcIlH+ekWV2iCfsqbP/+vNUGPB2a3Ahsn613D3AMr8z7kb/G5sSdNchFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740683985;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cOq03STdwkdsrku3Yp48otKKpHmTbEHT+JgnMwZIrK4=;
	b=gFhDZ+rYAkqCuTofSNGpYonhR75A4CWH3ywAwuKXx5sq0fferzcjDl/9N+QU1QbC
	scNNkCjNCTGn/TxE6a38drKpY4BoJguhuKlii9VqlrLSHSr7aFfh5VJf/AiJYgtqblx
	nDLpbNDDXPcYp4zLG5ikQzsQ6fRs2yeU6It9OtwE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1740683983409296.823095741875; Thu, 27 Feb 2025 11:19:43 -0800 (PST)
Date: Thu, 27 Feb 2025 16:19:43 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci-webdashboard" <kernelci-webdashboard@groups.io>
Cc: "Nikolai Kondrashov via groups.io" <spbnick=gmail.com@groups.io>,
	"syzkaller" <syzkaller@googlegroups.com>,
	"Dmitry Vyukov" <dvyukov@google.com>,
	"Vishal Bhoj" <vishal.bhoj@linaro.org>,
	"Alice Ferrazzi" <alicef@gentoo.org>,
	"automated-testing" <automated-testing@lists.yoctoproject.org>,
	"Cristian Marussi" <cristian.marussi@arm.com>,
	"Johnson George" <Johnson.George@microsoft.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"Mark Brown" <broonie@kernel.org>, "Philip Li" <philip.li@intel.com>,
	"Denys Fedoryshchenko" <denys.f@collabora.com>,
	"Tales da Aparecida" <tdaapare@redhat.com>,
	"Aditya Nagesh" <adityanagesh@microsoft.com>,
	"Sachin Sant" <sachinp@linux.ibm.com>,
	"Benjamin Copeland" <Benjamin.Copeland@linaro.org>,
	"Manoj Kumar" <ManojKumar08@arm.com>,
	"Michael Hofmann" <mhofmann@redhat.com>,
	"marcelo.santos" <marcelo.santos@profusion.mobi>
Message-ID: <19548d9ba15.11c9d9e391104554.1795088792482951957@collabora.com>
In-Reply-To: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
References: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
Subject: Re: [kernelci-webdashboard] KCIDB: v5.0 - backwards-incompatible
 changes
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


---- On Thu, 27 Feb 2025 15:32:15 -0300 Nikolai Kondrashov via groups.io  wrote ---

 > Hello again, everyone (potentially) involved with sending data to KCIDB, 
 >  
 > We've accumulated a bunch of schema change needs, which would break backwards 
 > compatibility, and so it's time for another major update: v5.0. 
 >  
 > First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/95 
 >  
 > This will be followed by a DB/ORM update, once we agree on something. I'll go 
 > over each proposed change below, linking to corresponding commits in the PR so 
 > far. Please review and respond if you have any objections, comments or 
 > requests (here, or in the PR). 
 >  
 > I'll merge this next Friday, March 7, if there are no objections by that time. 

Ack from Maestro. We discussed these in today's daily and them all seems sensible to
us. In fact it was KernelCI Maestro that asked for some of these.

Thank you for the work!

Best,

- Gus

