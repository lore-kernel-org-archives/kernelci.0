Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61F2E092A
	for <kernelci@lists.linux.dev>; Tue, 23 Sep 2025 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758644013; cv=pass; b=cfgONqnUcKGow8+y3CrnHcMT3tzbn/KwjM137PGRFNOM/nt4F/jeYYA4Ng51+ta/cJhU5UBVooZNDSIQ4etEFGjagwcCM7i90HkkXO4ngFyr9g7F3+2Rk6r4Xlc+juRVckx24ti9k9QCueCo/iQXbWirfSRI+wxtgzQXGDlsUUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758644013; c=relaxed/simple;
	bh=V0dzCNMh8RhB02a6QkpVR6f5JiZXbugDlYnrhhOcH3c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Ouh9zIclk55AgNpkybnv0jJJ7nXITu95qPG3//vxO40Y/K2olcNQmZq68cagufZvMzeWVXRdXmSaczzVKuB5hGKbflivAo5X31oiy5cXbNQ+vGa8OAvDpo+xHPyGeW/Km9DdLaksBSBMYbh+8/lkM+Jik/E7SqcSBr+0a8FcoM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=acN+NWrI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="acN+NWrI"
ARC-Seal: i=1; a=rsa-sha256; t=1758644010; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PS4dZEQiS07v32jZO+z2zh9vAHq9oBA8vYrqGYNi4tkwfvrXCyTxJeP3b6muyJQ+rDWy5b0p7PyhmdqngQvK2SKfYnGGqWEQuKhTCbxoegTwQreuCQR2Qc0AS/Rswna3JEVj1BZmiCBHS3EiHC1FGqZjfHWVIjmfkASjrzqqM4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758644010; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tom6xYHPVuGMW1720t7q/SgYjgr64AxoHA9FzaFXYr8=; 
	b=Hf80DYOJyGxWubzLdQOOU+0AskUxBJmmwMmIiyf6lmeP+nH2kSiDA1nri43wwlrhrUEyr4gZroj6+xli7UHRIdjx3IylJUBhpbhrlJLZ/D02WKgb5z/cTbvy96UPirUAFp4nyt20RgAaikPFH1+xyQKeOia8i4ZPZBhAEPTtYh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758644010;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Tom6xYHPVuGMW1720t7q/SgYjgr64AxoHA9FzaFXYr8=;
	b=acN+NWrIyian26+7KDaLHPB7/fflr1ByEmTsShc7nJwDVQrGve9ZYRO3VtzqrYlJ
	kBToeSAcpMfOGsWEyXnAk/MO1iKDNonn8NPCkyRn1MjRHT4B+sLrfovwXDK6/91RCOR
	6nREYjwPxKuCJDW9kAP1/u2ID/KedRWiG20bq4Cw=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1758644008841460.2693910619648; Tue, 23 Sep 2025 09:13:28 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:13:28 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Fabian Pflug" <f.pflug@pengutronix.de>
Cc: "kernelci" <kernelci@lists.linux.dev>
Message-ID: <1997759f778.277bc6fd385850.1744448937818209331@collabora.com>
In-Reply-To: <8558dd0f24dc76633cf02f5835c4b1e234f1ca43.camel@pengutronix.de>
References: <8558dd0f24dc76633cf02f5835c4b1e234f1ca43.camel@pengutronix.de>
Subject: Re: Grafana Dashboard issue
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

Hi Fabian,


---- On Tue, 23 Sep 2025 12:23:49 -0300 Fabian Pflug <f.pflug@pengutronix.de> wrote ---

 > Hey, 
 >  
 > Not sure if this is the right place to file the issue, but when checking out the grafana dashboard today, I noticed, 
 > that "Infra issues analysis" is only showing entries from before 2025-09-08 and not after that. 
 >  
 > https://grafana.kernelci.org/d/maestro-boot-stats/infra-issues-analysis?from=now-30d&to=now&timezone=browser&var-database=edquppk2ghfcwc&var-path=boot&var-runtime=$__all&var-tree=$__all&var-origin=maestro 
 >  
 > I don't think that is intended behaviour. 

Not really. But this is a side effect of the DB changes we made recently.  We will bring this back soon. Sorry for the unavailability.

Best,

- Gus
