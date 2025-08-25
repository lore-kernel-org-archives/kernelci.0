Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B44296BD7;
	Mon, 25 Aug 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756107469; cv=none; b=s+zoRfoc7tlzf08KvvpIM42nSeS1Z9xnrYrLVY8yH3/myr5UvjU3UXcfspUyE76YjHubyiUWwfMkbDxrlHduA4MGW5poecyU8Z/9kIoKp50UeXtxlmCK3x5Knx1lhqq+fhZ5h8wR9Vqy0H7CxVagkzrKFm4TsD7HTxjuASzvlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756107469; c=relaxed/simple;
	bh=187ERiLH87/sMPaJkXvD1yd1kkOHpt20/d+sFFXVLQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUZiAy1f5ZzDR05vI89pfUAnSYt0cB2HvJGc3lNbn2toSwFoJev8SEnj+p5vRTYJlLl/IPG/OmGBYvFN/HOQnN4hgPIDlWBLK9jT1jGp67ccLg3NC/WOGpgai5TWSlxL5m2rjGzcJ5ZfoOMS5/l043FBLYrbLaZjkNmfDhagcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VujFmtgM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VujFmtgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF4FC4CEED;
	Mon, 25 Aug 2025 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756107468;
	bh=187ERiLH87/sMPaJkXvD1yd1kkOHpt20/d+sFFXVLQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VujFmtgMutMRL+ez1VIzMOnlY1QVcjKIWrH5EWT7Zq+s2WaNCLyy8YT+7ALIPvMzU
	 cyFBXlNAhAG39VMw2zo0y9oHzXO20emgsNrVtGREJSyXiw8q+sXN6bjqqEJMCt4CgG
	 Wi4Iy1qjJ3xFeQt6y1ppDgddv8vbY5ql3cnjvK20=
Date: Mon, 25 Aug 2025 09:37:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io, gus@collabora.com, stable@vger.kernel.org
Subject: Re: [REGRESSION] =?utf-8?Q?stable-rc=2Flin?=
 =?utf-8?B?dXgtNS4xMC55OiAoYnVpbGQpIOKAmHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI=?=
 =?utf-8?B?4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYcmVtb3ZlX25ld+KAmQ==?=
 =?utf-8?Q?=3B?= did you...
Message-ID: <2025082529-stowaway-preaching-96ae@gregkh>
References: <175602954397.567.6885813720011678446@16ad3c994827>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175602954397.567.6885813720011678446@16ad3c994827>

On Sun, Aug 24, 2025 at 09:59:04AM -0000, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on stable-rc/linux-5.10.y:
> 
> ---
>  ‘struct platform_driver’ has no member named ‘remove_new’; did you mean ‘remove’? in drivers/usb/musb/omap2430.o (drivers/usb/musb/omap2430.c) [logspec:kbuild,kbuild.compiler.error]
> ---

Nice, I had missed this!  Now fixed up for here and 5.4.y.
