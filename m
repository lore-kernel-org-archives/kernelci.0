Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E2517996
	for <kernelci@lists.linux.dev>; Sat,  6 Sep 2025 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757187400; cv=none; b=pgyJdUgepzA66jhsybEeVSOoBVUbfzewgIWktbUbFRXRwqhkg1ImC2BRNnU0IQ2xRg8EtIUUMExIhGEfEDtUnM89yrxvSl43VKwCzfm1yYwdfQvraY2XyXjOaR5A+SSETuHHfEfwFiNHjYlIXN5KzT0i3Zfttv4prBAgVXioR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757187400; c=relaxed/simple;
	bh=qBoGBvOYcJ0KimEBJyRTp3SZfg7q0FnFZBTZ1CrkVWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5iVtWisoD6DoTnghukMtAMXvSq3K4tQiZ8n2LzsNVQvscPuzlXoMaBEUuiCIuSNC6eY8lVOn+16ms+Exip/kWQO5z3aeuN1lZnb53ttQx+tA/izGLoqyxzW2m1K1wzLTfk9Cy5m+HvouN5VUVdb1GJcbqLWyN2Ak2VC8/jBRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OnKZ6yyH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OnKZ6yyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2AEC4CEE7;
	Sat,  6 Sep 2025 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757187400;
	bh=qBoGBvOYcJ0KimEBJyRTp3SZfg7q0FnFZBTZ1CrkVWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnKZ6yyH8rMxrAc+Y13GezqIe+yvBz55wZceobOIwlvDrqPUVo7XkaQQZ6BMLbyV+
	 G+HDYxFkIjypDa5d7nQERwQcVaofP60YLWh9on0wUeSXuTjonQkc7Wrq9g1wTIkX8t
	 BOf1fnX9ODlirs+N7by+9YDw0319Zn4G9CfxpAbs=
Date: Sat, 6 Sep 2025 21:36:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	mwaqar <mwaqar@linuxfoundation.org>
Subject: Re: KernelCI TSC nomination request
Message-ID: <2025090637-aversion-ninetieth-0481@gregkh>
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
 <2025090409-regally-shock-45cc@gregkh>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025090409-regally-shock-45cc@gregkh>

On Thu, Sep 04, 2025 at 05:35:22PM +0200, Greg KH wrote:
> On Tue, Sep 02, 2025 at 03:24:13PM -0400, Donald Zickus wrote:
> > (resending text/plain)
> > 
> > Hello KernelCI community!
> > 
> > We have recently revised the KernelCI TSC charter[0] to establish a
> > more effective approach for our future work. The TSC will continue to
> > monitor and provide technical direction for all activities and
> > services related to KernelCI. Additionally, with the inception of the
> > Infrastructure Working Group, the TSC will serve as the primary
> > interface between the KernelCI community and our key users (kernel
> > maintainers and developers, hardware/cloud vendors, etc.), translating
> > user needs to the Infrastructure WG.
> > 
> > The updated charter requires a new committee to be elected, consisting
> > of no more than four members, each serving a one-year term, with only
> > one member per company.
> > 
> > If you would like to nominate yourself for a committee position on the
> > TSC, please reply to this email with your nomination request.
> 
> I would like to nominate myself.

As for an introduction:
  I am only a kernel developer and maintainer, I do not work on
  kernelci, but I want to rely on it for my development efforts for both
  patch review of stuff submitted to my subsystem, as well as the stable
  kernel releases.  Kernel developers shouldn't be getting multiple
  emails from different CI systems, we should only need 1 common place
  for this work to happen, and that's what I want to help make kernelci
  become.

thanks,

greg k-h
