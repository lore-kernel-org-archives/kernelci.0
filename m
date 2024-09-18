Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461D17332C
	for <kernelci@lists.linux.dev>; Wed, 18 Sep 2024 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651915; cv=pass; b=NuEao1shHierwAZSg7mYABR7B1tBtvOCQy/GBNW10sOIUBpt1vTtSk4Ty6ZVr6lf/ccfmSg1gVgB3CUXLZLH9p55xsFU1lIjiNYizDltVf1f0DU5sevKJdSZCi6K2ImTCyHK756SiLOqfib3zMGPP+PR+Y3N7QzuskU6ymvCoQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651915; c=relaxed/simple;
	bh=+6bYDy+UqI4lofOq0zVPz8R31zAMwgOGw/kyIpIf6Oo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OhjH7r/ITYahTTRnvrrYkuePYAW9WEmLi2oXX1ZSfQo4+TE5bDbDiXRE28/QI+2GhTUFYDtT8PNLUZSJXaiZ3UGlGETKlBOBSjla4AG4fmJoRNvTdlSNnFCX6wc8iujBJWWxnLM5y8b9neQUnWZVo9LJ4sceFqXAq6URoKMuCYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=Qdsv7Fe5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="Qdsv7Fe5"
ARC-Seal: i=1; a=rsa-sha256; t=1726651911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jVhDSNQYo0E+hox8UkaztG225RmBTn1oYyFicltyBSNozvLGxYLzuLvphGnX4ye8D7FFUCdiKRQ4KlZct3MVIXnbs3UDeg2OGj+GyoNgqYVVunmI4xKkpkodcZtAriTRgVUOZye7vDohM7soFqHM+MaC7t4PQswS6kw3Y6Ohc20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726651911; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=pEw2nw1wdWCY3x3aMQpNkpc2vx8yugwA1DTNXvWZ4bg=; 
	b=m1EbvyfxUo+K0RikN1PFUVhTNLzhol+dAORZUWFqfr/H6OScf5/pcypOIWs4/WGlIAWHO5taULIZ4MfmiqR1sI2PRdny6g6mzyOR9DpvSlWBJcjwoMxFIY73XcetkpzwhDB2ZOZS6t0FqtROwtpjhNWKtMJkVEj1vuEDIJ5n598=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726651911;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=pEw2nw1wdWCY3x3aMQpNkpc2vx8yugwA1DTNXvWZ4bg=;
	b=Qdsv7Fe5WzXxQppOCV/G3JLs+/SHrpip2FWY5BKkZAft+4SXawV7YfGbInshVrng
	xwGHH7+JUNN/ruWsX3VZF0A/j8OyLBPibvJ5Rq5mhAppw8gGqOrwNUv8J8PR8nJBtXS
	3AOZC46rr/Pbv13sQwNxwB8JL3AHXT14sEmh1GlY=
Received: by mx.zohomail.com with SMTPS id 1726651909740619.5467255647811;
	Wed, 18 Sep 2024 02:31:49 -0700 (PDT)
Message-ID: <6088c70c-4573-45aa-88bc-af9b043055ff@collabora.com>
Date: Wed, 18 Sep 2024 14:31:45 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Subject: Subscribe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


-- 
BR,
Muhammad Usama Anjum
