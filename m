Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76511274B4A
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000161; cv=none; b=HidMEPLHBNP8vhA1aqbHt8KqSzF8LQ6O06NU8MAxf5zGGggNKVutEkTrZEywpuPlebfl32JB6I5LdNpDgWppnUVqq1XqF/Q/zCBNDAYUEbuh1/hgCdwDb8LXTK30dTf+8YJl54ra5InWhn3CjJZHC3vXzpAYe7xtwUtWqyCv8Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000161; c=relaxed/simple;
	bh=WixPG+DBVoxuOedMG/lXPySEuXtFJQOW35/gksPqdz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh3DnjrEcvQdN2n2UAilScnKPOIDYGqhGDRFy6LwhBP9a5PL+viCgL7jTzbDs2lNE2sUv4N2f89kEI66kdy0WmNYAxfYcjMLLHMlPG9r41zG4NQPVSrAoMRCPRo/Bu7Y36/e4yYJG+Cah3LBRVjgoIkB4K1TLcuZNQIV4uhfpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yxLI8qXt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yxLI8qXt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A9BC4CEF0;
	Thu,  4 Sep 2025 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757000161;
	bh=WixPG+DBVoxuOedMG/lXPySEuXtFJQOW35/gksPqdz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yxLI8qXtnb0+qZOEmetoxRUFG7px8iRuJ7wTmLrtFYDIp4+HF1sW3lfcuLSHDEiRH
	 sv6j2M2pESwYAANuqMTknxbOFvXhsCkdn15lOY8rlQSHCqJddAHJZM/LFATOOhhAwK
	 rT3Y3iS7eLjIRBZiiyUFWJCxPJks9HjjvAfKojDQ=
Date: Thu, 4 Sep 2025 17:35:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	mwaqar <mwaqar@linuxfoundation.org>
Subject: Re: KernelCI TSC nomination request
Message-ID: <2025090409-regally-shock-45cc@gregkh>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>

On Tue, Sep 02, 2025 at 03:24:13PM -0400, Donald Zickus wrote:
> (resending text/plain)
> 
> Hello KernelCI community!
> 
> We have recently revised the KernelCI TSC charter[0] to establish a
> more effective approach for our future work. The TSC will continue to
> monitor and provide technical direction for all activities and
> services related to KernelCI. Additionally, with the inception of the
> Infrastructure Working Group, the TSC will serve as the primary
> interface between the KernelCI community and our key users (kernel
> maintainers and developers, hardware/cloud vendors, etc.), translating
> user needs to the Infrastructure WG.
> 
> The updated charter requires a new committee to be elected, consisting
> of no more than four members, each serving a one-year term, with only
> one member per company.
> 
> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.

I would like to nominate myself.

thanks,

greg k-h
