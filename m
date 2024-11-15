Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5E1922FB
	for <kernelci@lists.linux.dev>; Fri, 15 Nov 2024 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731665961; cv=pass; b=eJnzqHjruqB6PZRMvk5cDXiCwcX+oa6caHnntFCz/hMYGaeruSwTs6SfAEDxO5zcNMHFHJK5SGeQAsdU3n47ouh1wa1CMOl1fLX6wQi8djImYqyidiHpqbh1hCKiIdXbDJTPEzq0K82ENcLBoxC33wRtYXcs1O6djPinnIxKtmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731665961; c=relaxed/simple;
	bh=wG4PMmVoK2F+Rsnao+2smEaC4hvO+IKu9prVdf2f2bQ=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=tDePIesLZKkV54ZgqyDZU/U9QMr96kEuS8xU89TCtdOTxQK93fmhfS8Ck+P1jnAoBPy+C4nX3AM8bX6Bnl/6FiWmcjvCloyvO6UAdeai4UrrnY8DgCxxmT8ccFnjLOrmbU0xdAhvWeUM+V2csRhsCwtgegXueZYtSf8FT8MvyxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=AQt5SmIL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="AQt5SmIL"
ARC-Seal: i=1; a=rsa-sha256; t=1731665958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y5K8aVvCc4QhQBEYFNvh2wveh9BdlepQsfD72t2uBH/rqV4cjbt9ufpdSTA1ZdsBMWonA3ZlX+O95W4W7mJrXXL1t2C3rP5ozHULnApSJRTri6TR8VjIl/3+nc0ekBuV/wOw6oTEUsVg5Uezzs+yo4Z6GapdO3YgNdHMlE3Q6fQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731665958; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z0tkj4Rs5WKOQ4PuSQeDo3Yzan6tyhjMz9qm/SWr95I=; 
	b=lUFpmyURzbGlusqZpKdyCtaj9c20IRsjcbsxzJj16278FlES/wgegm6bckYXuic1dqZuojarmp09X462iHDSHRXVAUWs1JZ6IHDcDUAnnhTl0rLuH1kgwFfOQjyb08q1+byYu7P/01rNjW2CsTfcCZuBQjD438p8iSdmMjJZWUc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731665958;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z0tkj4Rs5WKOQ4PuSQeDo3Yzan6tyhjMz9qm/SWr95I=;
	b=AQt5SmILs6Wo9iFsculOX2dV4oDFcFsyRSKaC/yg5bYbhe5BKN5DRpG0Z2SFqter
	pZ/DNg4pNTpJSaWlu6iPswFOT465FycK67TULlJ4c1UGL8AohgLMzXN/NILdatpc4fL
	FMCIiu4fBDbyE5BIQeHhN0QweX4ojFP02zUo145s=
Received: by mx.zohomail.com with SMTPS id 1731665956401271.7866265187507;
	Fri, 15 Nov 2024 02:19:16 -0800 (PST)
Message-ID: <06ae426f-7a43-43c5-8474-8605c0092588@collabora.com>
Date: Fri, 15 Nov 2024 15:19:13 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, kernelci@lists.linux.dev
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Subject: The kernelci branch has disappeared
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Peter,

We had enabled kernelci branch from your tree in kernelci [1]
which has disappeared. We are removing this branch from the kernelci.
Do you want us to enable some branch(s) in Kernelci in its place?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
-- 
BR,
Muhammad Usama Anjum
