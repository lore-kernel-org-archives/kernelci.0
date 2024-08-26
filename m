Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4CC1940BC
	for <kernelci@lists.linux.dev>; Mon, 26 Aug 2024 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724688107; cv=none; b=lJ0RXUwRiJGrcNO4wQpQsM5VWuYHR3qZ6xlQ7hWdbGMcDCMET32YkCCxSOR5Dl5lno0pgfO5JPr6Y8MP3xTsqzsUmdjQoujLXtkkXzJqyttqWqP/RjMq6748ykd8CWdLaO3sserAZtoYIQin3FrVnTfFUMtgK7rtTEXCkXRYSnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724688107; c=relaxed/simple;
	bh=6E7KeRV5hzgAg7lLx+s84+mu3cSeg2VpU1iXplNP1jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph7mlzuaKo2d29FGQHvIRlr1RT0V80NgLq3WfmvE2OE1pcnz35ze6RT+SLafqHDdgAE46hBuWkWnbznqdLx0GcmzTXt+nngcYeNdJRm9kCOiASWL5PsQZd/6hPkuP71W0IINQCa2abvUUyd0FknqIblrSY77MVwppg+jUKr4XH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXOHqmF5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXOHqmF5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95355C4E68F;
	Mon, 26 Aug 2024 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724688106;
	bh=6E7KeRV5hzgAg7lLx+s84+mu3cSeg2VpU1iXplNP1jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXOHqmF5buula/wVU+bROWXnhYbyjKQkEsxYqFpFIWf3WLOGtgwdDD4CTiSb1M/DR
	 uc3IxQWttsk3QBF4XB5gtErFC9zqsrLKWOj1hi+5yinIdg6WtyovTN+dZtxP117HJ9
	 3dVGmXAAX7XaDSrDd363z0MvDMDnY6x9r6SukNdhdkQEwpcl3NOp/bpj68CKU5xYSd
	 DMe/5Ry9FIJTlW+Md66goasv+Wh6AoCzeDcoufI6UtcU5Sg/WzDiLrRbF/9jYCPrAf
	 0iInL6B1FXz69A7EtRLLrB85qmpXr7L6URIlmhJEIPyFO/4d3yNCkCCGNUt1dxSMb2
	 Slht0tqL2eVmA==
Date: Mon, 26 Aug 2024 11:01:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@lists.linux.dev
Subject: Re: Kcidb access request
Message-ID: <4fqub2pii3v6lwasvuzbyyviqgv76aycwhbfcgvxbgjk5h6qdc@25jqm7ubkqyg>
References: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb>
 <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>

On Thu, Aug 08, 2024 at 08:56:12PM GMT, Nikolai Kondrashov wrote:
> Hi Bjorn,
> 
> On 8/7/24 6:49 PM, Bjorn Andersson wrote:
> > I'm using api.kernelci.org for reporting test results from my kernelci
> > lab, as well as scraping test reports for Qualcomm boards for local
> > aggregation and presentation.
> > 
> > As part of the transition to the new KernelCI APIs, I would like access
> > to KCIDB.
> > 
> > 
> > My (custom) test reporting tool today uses the LAVA callback interface,
> > and thereby follows this schema for the report, groups and cases. I can
> > continue to follow this schema, or change the schema as you prefer.
> > Please let me know.
> 
> Sorry for the delay with the answer!
> 
> Sure, you can get the access to the KCIDB database.
> 
> However, we don't have APIs, just the direct access to PostgreSQL, which keeps
> six months of data. See the attached (abbreviated) schema dump. It largely
> mirrors the JSON I/O schema, which you can see here:
> 
> https://github.com/kernelci/kcidb-io/blob/main/kcidb_io/schema/v04_03.py
> 

The guide talks about PubSub interface, perhaps I'm misunderstanding
this portion?

No real concern with the direct SQL interface.

> Here's some more human-oriented introductory docs:
> 
> https://kernelci.org/docs/kcidb/submitter_guide/
> 

Thank you (and thanks Gustavo for the updated link).

> Note, that at the moment we have no way to query for "Qualcomm boards", but we
> have a schema change proposal being discussed to address that.
> 

How do you associate device-specific tests (or any test that pass/fail
due to device-specific regressions) with a particular device then?

> Also, when fetching your data you will need to be considerate of traffic and load.
> 

Understood. No concerns here.

> You can explore the data on the dashboard (to be improved soon):
> https://kcidb.kernelci.org/
> 
> If none of the above stops you, I can give you credentials and permissions for
> querying.
> 

That would be great, and would allow me to make an attempt to tie this
into my local dashboard...

Regards,
Bjorn
