Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974E13E41A
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006929; cv=none; b=dAQMrqbu8YPN9dZ5iK7e2nFWVRwJj4wWnY8S690nHztmEs3i83PeYOG6gNfr0trXml5WABemCbY4anFx+KN9iVgpE6otDz48/C9wAhj3EN2PEh3xT+NfzZNAmr/xi9/WykGEqdjxhIT5RP0kY/0VoAuyMrRLKAQWMk3zM25nWN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006929; c=relaxed/simple;
	bh=jOyKyuR6WROCEaZTGeyW9U61WUFHcitxWnV5c/49KcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhLnVn+HBZaeuAxuT39Z9zN9kBD53l96bQJf7uVhY7fggJ59tHUERGXJeSKsYnARa8p+J0oHFl45bgB7ckc3bI8f5dmkNsL4WSOFig9+HM69xQgbYRDVQtwIHmtjvoEkR5OYWYxKV2aupWUTUiKybJEGuUmdx/bv5olxvFXseyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rjBsJ9kn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rjBsJ9kn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CEFC4CEF5;
	Thu,  9 Oct 2025 10:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760006928;
	bh=jOyKyuR6WROCEaZTGeyW9U61WUFHcitxWnV5c/49KcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjBsJ9kngNzernpwi1mq7u5k1lRx0RBXVsQ5fXM7tCL1ohSzl8TuFEiIcLiTgDeNK
	 On3EewohZ4JQg504LyRSaGh/cNO4BAaqAuFuIhsK3gRdwzgWYXUQRPLlAktvzAbfrg
	 tZDtWMviFUqnLr3BCdZiF7Ai8DTnAvw9OjrIJWUk=
Date: Thu, 9 Oct 2025 12:48:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Cc: kernelci@lists.linux.dev, gustavo.padovan@collabora.com
Subject: Re: CRA compliance
Message-ID: <2025100911-unloaded-showbiz-4639@gregkh>
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>

On Thu, Oct 09, 2025 at 07:43:08PM +0900, Arisu Tachibana wrote:
> Hello everyone,
> 
> as per the discussion of last week,
> for moving on with the CRA compliance topic.
> I propose to create a private mailing-list called
> security@kernelci.org or security-kernelci@lists.linux.dev
> 
> any objection ? or suggestion?

Why is this needed?  Kernel.ci isn't going to be a "steward" of anything
used in a commercial offering, is it?  If not, what would it be for?

thanks,

greg k-h
