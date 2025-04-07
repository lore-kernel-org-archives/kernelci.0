Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D742405F1
	for <kernelci@lists.linux.dev>; Mon,  7 Apr 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031466; cv=pass; b=BJEAWxLeBRSTB7ucNU9rsk36LoweCqn4SPJOfyTVfMhkB/Go5VgDGRAt1EGP2wzz9tdL27J0JSszUQDwfPpxp1QAoyj66q+Y2cEaNz/s5C7stNZIcMyo01WlA5a44qSkNPPhrx8K8JeAc/iqLNhQnBQ+ULoTS93y2JxbUjO4p3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031466; c=relaxed/simple;
	bh=yNTgnfvapcEUdSnaMzNa/7O1X/QpAWw5doVs5yhsMBY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jQUwTJmN4t974txvHaOO/RROx2CDnYYDRMiM3r5NaDVN4W5UcodIDWCwb9nBVlG379h9IxTF1IZvryGpV1IGG2TPT2UZePjydPHUCJ/RYaPHB46AdCkQ4Q3G4mV9yTzkP6W3xKVE92hsBCMRkcwS87b1329jSkXG/14t5tbt3o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=R0hDq+JB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="R0hDq+JB"
ARC-Seal: i=1; a=rsa-sha256; t=1744031460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c9BLPYgFMJWe7ub63jg5ixEW1IIhwvBscVEvls/nIaAPJod8SmPV5YgPfIBGKZriuUGHz3DudeXLuw+BC5+cHTQWd6b0+YWhleRJHGTvfS7Kzp+INTG0Y6IyD3B6fVNg3h62fU8SP5lCnw9JjL+ck9hO7GrcUEpCGi+KNuX+V4U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744031460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dGnEkuUBnBAhDUc3BpISMIURerdzDo//aE5mWQ6eXAE=; 
	b=huW45QdWK/KdVRzgW+gRBsBMOxxi39ug7HuAY3yHzlsuQG4JVATrcT+EdozUkj2OA1Ny84UA01s3+jpZG6ymBaayEMYq2VDUPNdtFFB/AEbmtdfQ3ekp4vGVkRO156FHaSwl3F1pY3y8pUZsbWkftdtx7wB5+qeEcC1yW1xiPx4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744031460;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dGnEkuUBnBAhDUc3BpISMIURerdzDo//aE5mWQ6eXAE=;
	b=R0hDq+JBMQCYyiV/Wq9s2OzQ1ed1ele84JmXhM8pu0j18BxBJacOpeHI7afvdxld
	dTZYCdMCBokKXPL2NKh4Ff+LMocXvFhMjH1EfRcVOYCIlLC8t6qOacsCi6xU6zooS1L
	o8jfa+bDxYITfGRIVA9OGYryGnCmpCA22tsPKHNU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 174403145760686.60057829199411; Mon, 7 Apr 2025 06:10:57 -0700 (PDT)
Date: Mon, 07 Apr 2025 10:10:57 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Adrian Johnston" <adrian3@gmail.com>
Cc: "kernelci" <kernelci@lists.linux.dev>
Message-ID: <196106020ef.100bde02d1159169.8565902668879223474@collabora.com>
In-Reply-To: <CAMtebm+miDTOR-PcJrJbzfSS=1eNLQJ8CGQf1E3+NpcLh+mYKQ@mail.gmail.com>
References: <CAMtebm+miDTOR-PcJrJbzfSS=1eNLQJ8CGQf1E3+NpcLh+mYKQ@mail.gmail.com>
Subject: Re: ref_tracker
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

Hello Adrian,

Thank you for you email.

---- On Fri, 04 Apr 2025 18:44:55 -0300 Adrian Johnston  wrote ---

 > Hello kernelci, 
 >  
 > I have exciting news. We have a reoccurring class of dangerous bugs in 
 > the kernel that could be identified during a CI run. 

That sounds good.

 >  
 > The kernel comes with a reference count debugger called ref_tracker. 
 > And yet, every minor release of the kernel seems to fix another 
 > reference counting bug.  Often kernel releases fix 3 or more. 
 > Meanwhile, the folks over on linux-debuggers aren't even sure anyone 
 > is using this reference counting debugger that often. 
 >  
 > Is anyone willing to flip the switch on this debugger on your staging 
 > machine?  This seems like the kind of thing Linus should know about 20 
 > minutes after merging a patch. 

What does flip the switch means here? Is there a kernel config option that people should add to their CI kernel builds?

Best,

- Gus

