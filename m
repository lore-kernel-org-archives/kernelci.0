Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E49282E1
	for <kernelci@lists.linux.dev>; Fri, 14 Jun 2024 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718380211; cv=none; b=lKGW1khIh1dTSsFQ82eaQ0yytmd3tEuBQJyB5E0rWs3buUMLT2brI5Tdlf2mTFp27qhYXV23q3b9BATOnqwvlae9uG+6WOX5nyFwEfnnmKNeb+c5AzkD+S6iTYmNLOKB5QJDUkfJqhUJYTHxnWSAU3n6+r1dH89aaEog2pUQk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718380211; c=relaxed/simple;
	bh=snPICQw6eZRfCY7LbBj29P1BEQFQCJSwMgjIJXm4fiE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ka3EujsbAg530Ol8U38xXGQ3g2qir1jii2xX7Qkn3lgMLdOcVl/mydANTYkjXH/XAcBQSM1FXHLCqTt5iLZ1zkOUG20w/34t3DHWmZHDEeav8EV0i1pENWaKyA8lK4X2DGImSxPqHFIddRU1zmxYwV8IniKPxeLSLffWhuoW0s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ItHFSPXB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ItHFSPXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718380207;
	bh=snPICQw6eZRfCY7LbBj29P1BEQFQCJSwMgjIJXm4fiE=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=ItHFSPXBuGR9Xc8rvT5JtBQFkwmqBxo7thCfl2YRirecc0di9ksrN2hVYqvsoCpqe
	 4Jit56XGm4sQn6B7HW5Kc5D9D9LI+jXBR0fWXfJaO9rEHa4vhoKYmZ3s/bD1oLAfkA
	 amXoSPw41uzCrbut5ssASmM0WTYN/dwgvNJDjZ6rU/zK7mvcH3J+gQGzM0AzkmMbAx
	 n7gGIVLFuUvQMXEBEwCBIxYNl77tCA3M+elyw2MMqtYgLlU2rvApavDFcg8dNftlBn
	 PKuTojF+z1uJsSwO+sPpV9w5vyd3tpTunoQdGfzCsusEtStHMcVEWf6WV8I2PhSN3Z
	 hl9DErq25Jn0A==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9BF95378107D
	for <kernelci@lists.linux.dev>; Fri, 14 Jun 2024 15:50:07 +0000 (UTC)
Message-ID: <14faf511fcb4ce729172bfd499ed69afaa2a32b2.camel@collabora.com>
Subject: Re: DNS Misconfiguration Affecting Certain Hostnames
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Date: Fri, 14 Jun 2024 18:50:05 +0300
In-Reply-To: <317c51c9c0dfd8b37ef7af6c55b89212cacad2a9.camel@collabora.com>
References: <317c51c9c0dfd8b37ef7af6c55b89212cacad2a9.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi All,

We are pleased to inform you that the DNS misconfiguration issue
affecting the reachability of the hostnames within the kernelci.org
domain has been resolved.

The affected hostnames were:

    api.chromeos.kernelci.org
    api.kernelci.org
    bot.kernelci.org
    chromeos.kernelci.org
    cip.kernelci.org
    linux.kernelci.org
    storage.chromeos.kernelci.org
    storage.kernelci.org

Please note that while the situation is resolved, it might take some
time for the changes to propagate fully. Some recursive DNS servers may
cache the previous entries for a few hours.

We appreciate your patience and understanding during this time. If you
continue to experience issues or have any questions, please do not
hesitate to contact us.

