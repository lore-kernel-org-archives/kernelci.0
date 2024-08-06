Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCF3A8CB
	for <kernelci@lists.linux.dev>; Tue,  6 Aug 2024 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722960228; cv=pass; b=q7pB2cPZ2SststO+IkgTReyLH9VMbJ76csqgSLIuH8vvoc5wNB5n8UNRdrmrfoiV3V0IJ7TMmTvWiCQ80ziutOlrUR1Bdu3UXQYK4q66LBfh0WBjN++5E3snNuMuy5t+IEd+TRQUj3qgDF0SPynjQnJ12OU9xyTmJgThMWZenII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722960228; c=relaxed/simple;
	bh=TBNTPY3VjiW47UZ02LRpebSb9A2uFtdaxpUX2DEAF7k=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RQ+oAdmwt7Cc37ryJWsliIsx/3qa/YvKLt7F+HBTeuPprfLcuf5em/xmdNFX5qZvWdHJuOUMRyOGalbZYHA4FXWPRcjfVq8kO8eWhWuB495MLOldJzSNOTxwFIcg6KdQEKJdK2lMsnKV4BEYKDS888A1pM7fc6XNHlplsw6jI/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=A4V/ptJ5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="A4V/ptJ5"
ARC-Seal: i=1; a=rsa-sha256; t=1722960224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nxQhLGSfQ50+Bcr7OGMe+seMBVQ40FGixN6G0vj9ki6JTKt4SCvw6WmTF9c26rq2K820abVFhbUBGDVciFpqj+CYLeoPux3hSzelKqmqyA4obvRGYNWAkt57XIx8gqY0c5tTAcPRx+t/5XeWqtOTnjS/DHGLrD1lMYqdO8SlcPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722960224; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1JM+29xBqicdLLOyfDHDfpzMbBdP+ZI1SXEiIHoC6Mg=; 
	b=d7Xse2V2ECz68K7mnV8BBP4mPYi4DqV1+3hhin+XXPnbrJPaP4koX+/WgnjqJtOlFme26M3j0mtQQfnnHSD16eiIBmXem9Z7v5FbE+Dwd4hRRd2UP59oc6lgsOJa7wsf5ilF2sgmH8E3WR8MuLYIBSdVX6rBPkoYJW8WKg/4Bgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722960224;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1JM+29xBqicdLLOyfDHDfpzMbBdP+ZI1SXEiIHoC6Mg=;
	b=A4V/ptJ55mAjsLvlmVjT19QP22yhzgh6LySqJGEEH1kIBQo4D1h7BJwAoh8x6jGW
	V/LoTYs1AEixPafj6KVme1tC+AKwtgIY28vA21vGWUk241BBH3/7fYnJ00Ck22+86AP
	gjhsAbxGZ1EWkkhOBea09NNPblKEirP974iGcu6s=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 172296022300956.568660208461324; Tue, 6 Aug 2024 09:03:43 -0700 (PDT)
Date: Tue, 06 Aug 2024 13:03:42 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Nikolai Kondrashov" <spbnick@gmail.com>
Cc: "kernelci-results-staging" <kernelci-results-staging@groups.io>,
	"Jeny Sheth" <jeny.sadadia@collabora.com>, "bot" <bot@kernelci.org>,
	"shreeya.patel" <shreeya.patel@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Message-ID: <191286e9b09.f4f1c6a4526882.2185642814129237428@collabora.com>
In-Reply-To: <e3f0fbd1-34f2-4b0b-b1f1-6158b6773dab@gmail.com>
References: <66ae1e21.050a0220.1c5959.0148@mx.google.com>
 <1911838cd2e.ddb71f5356531.3914011082698955929@collabora.com>
 <19122d7a43d.dde9a53983019.6953377593724593632@collabora.com>
 <19122fc3d66.11f5a856693778.1637642610124539898@collabora.com>
 <17E91B8D1664855A.28314@groups.io> <e3f0fbd1-34f2-4b0b-b1f1-6158b6773dab@gmail.com>
Subject: Re: KernelCI report for stable-rc: v5.15.164
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



---- On Tue, 06 Aug 2024 07:06:00 -0300 Nikolai Kondrashov  wrote ---

 > On 8/6/24 1:03 PM, Nikolai Kondrashov via groups.io wrote: 
 > > On 8/5/24 5:40 PM, Gustavo Padovan via groups.io wrote: 
 > >>  > > Why does this have kernelci, syzbot and tuxsuite. Let's remove it for now. 
 > >>  > 
 > >>  > It lists all the CI systems the report has been aggregated with. Although 
 > > only maestro and broonie reported failures, we included 
 > >>  > builds and test stats from all the 5 CI systems. 
 > >> 
 > >> I see.  Although, we can't really guarantee the quality of data coming from 
 > >> the other origins, hence my request to use only maestro and broonie for the 
 > >> time being. We need a high quality report, not a report with as much results 
 > >> as possible. 
 > > 
 > > This is alright for a PoC. However, I'd like you guys to mention to Greg that 
 > > we have more data from other origins, when you engage him with this, and that 
 > > they're available on the dashboards. Or perhaps better just put that into the 
 > > notification message itself. 
 > > 
 > > Finally, as we've discussed before, if a maintainer has requirements for 
 > > particular result quality, it's best to directly apply them to data, where 
 > > possible (e.g. check that log_excerpt is there), instead of simply selecting 
 > > origins. That could be the next step, once we define what "good quality" 
 > > means exactly. 
 >  
 > This is what all the CI systems signed up for, after all: reaching out to 
 > maintainers. And we would be breaking our promise, if we make these decisions 
 > for them, or discriminate by origin. 

Not exactly. That would be the perfectionist take.  We are investing a lot in the test
and results data quality so we can be sure we can be sure we are showing good,
high quality data to maintainers we are engaging actively. 

That's exactly the case of the stable-rc report. Greg has said to us already that just
throwing data at him wouldn't help much. We have to make sure that data can actually 
help him. This has been our goal since we started the current stable-rc report process
since LPC. The Collabora team has invested dozens and dozens of ours into evaluating
and improving the quality of the data.

In summary, we are not breaking any promises. We can really throw any data we have into
maintainers and expect that would be helping them.

Best,

- Gus





