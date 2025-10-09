Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DB24634F
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015210; cv=none; b=hlPZzsegoTGFIwpmbmNtibf5BoBnXNQ0eI4m/QC6aYGvW2zWhGs9N3XCOSrZeflIVB0H2vPY2fDezRpEndjEis4kMCxBtP8HpnAOdL3mptpgexW5DD4szLxhnI4KTEqQe9hsjitI70BpvLLosRZkDXEnOLvTsEIiDUKsBAaTyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015210; c=relaxed/simple;
	bh=QbiOn5PNVqryULKQ8Izd2G5OdE12jQBX9xhimo9b4eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae0v1/14T2aQPsPnaNEhRYT7bAhZY++uFavY0Jw2ER69/+PJHA1OUbWhxNrX7Ab9WGI00wcoHwtxzGkv3PfeD7h3WwZBmcl2Pv54kRMc9quKifSrGPWpVIj3y21phktIuD60Yfb420xQY62ubfF5qW5n1yL4tChyldn3h3b2ciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f9r8MmjK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f9r8MmjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A246EC4CEE7;
	Thu,  9 Oct 2025 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760015210;
	bh=QbiOn5PNVqryULKQ8Izd2G5OdE12jQBX9xhimo9b4eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9r8MmjKFRgRakf9Pw8KB93CpcpdCUM4K+1kpYSZ7VSkMCqs4tIpTN/oWF2/f6nPw
	 km4c2kJE7FEHQvjFz6ZcPn/rd7XSi/0nVhLCQxApxAgfVmVCEsSfn7hJVvIKCrSJkr
	 0FCnkzN0DWha7Of6PJ7NxaskBnBFZ+cHEY47BGkc=
Date: Thu, 9 Oct 2025 15:06:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Arisu Tachibana <arisu.tachibana@miraclelinux.com>,
	kernelci <kernelci@lists.linux.dev>
Subject: Re: CRA compliance
Message-ID: <2025100944-spinning-clicker-4c03@gregkh>
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
 <2025100911-unloaded-showbiz-4639@gregkh>
 <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com>

On Thu, Oct 09, 2025 at 09:51:44AM -0300, Gustavo Padovan wrote:
> Hi Greg,
> 
> ---- On Thu, 09 Oct 2025 07:48:45 -0300 Greg KH <gregkh@linuxfoundation.org> wrote ---
> 
>  > On Thu, Oct 09, 2025 at 07:43:08PM +0900, Arisu Tachibana wrote: 
>  > > Hello everyone, 
>  > > 
>  > > as per the discussion of last week, 
>  > > for moving on with the CRA compliance topic. 
>  > > I propose to create a private mailing-list called 
>  > > security@kernelci.org or security-kernelci@lists.linux.dev 
>  > > 
>  > > any objection ? or suggestion? 
>  >  
>  > Why is this needed?  Kernel.ci isn't going to be a "steward" of anything 
>  > used in a commercial offering, is it?  If not, what would it be for? 
> 
> Indeed. Although KernelCI offer free testing services to the community, we are not offering any
> products or commercial engagements. So we don't need CRA per se.  However, on a related front
> we are working with LF Legal to protect the testing services surfaces as stuff that KernelCI creates
> gets to run in internal networks across the industry.

That's great, but that has nothing to do with the CRA :)

> Then for security breaches in KernelCI, it would be a best practice to create kernelci-security@
> mailing list for people to report issues and for us to community privately with parties running 
> KernelCI infra too.

"communicate privately" == "private communication channels" which opens
up a TON of legal issues, as I am want to talk at length with :)

Be VERY VERY VERY careful with this, there's a whole boatload of
problems that you can get into when doing this as you are taking a
public project's communications private to specific companies/entities.

Anyway, having a security@ address is great to REPORT bugs to, but
please refrain from using that to attempt to coordinate security fix
rollouts.  That way lies a death by a thousand paper cuts and
potentially talking to government entities when you least expect it.

I can go into much more detail if people really want.

thanks,

greg k-h
