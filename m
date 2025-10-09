Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618892459F3
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760019157; cv=none; b=oVE7LHsXZlMAlZi4zzT9POcyIeHUBgAvz6iHJhAo82l5t4qGc5w6dRWISyuI70xzDVpT/uA9pNVRxdg1HWRARvfoSzZgoR8nhClxZ+rD2O/0fWySNEBTh/ZprAwcxWp5XX11zm7nup28Lt54P0iyZomB1gUczoDEkzAyB+yOD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760019157; c=relaxed/simple;
	bh=/zXmfRxzHF5qVGC5h3uKQRwLpGRppoBzxjO0q/iW5Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSJzfYW1ARkQXT/RZTweaxgiuhOTl/sAsugcwAvkRfXaw5UAvfjqEOx/AZSQgMRBri5+UnhSOzz12E9QTNBcyUJKB429HX9y01ub1oDdNil7kanQMgT4MPNg2BC4M6BkdI+QJq5UTLm9SacalsNfHo4t8zE+VPvTiHKaq3STo9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f9vrPDnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f9vrPDnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8264BC4CEE7;
	Thu,  9 Oct 2025 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760019156;
	bh=/zXmfRxzHF5qVGC5h3uKQRwLpGRppoBzxjO0q/iW5Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9vrPDnuRl+A7I4JsqcoBEiB0xy/+R38x32y88Y5gMIEoEvusw2TTiTxI7P7FMydb
	 Zc+fM0lxoJo3bTrXjIQtCDeH6YcIdyXhhAowE6LaxWjIviX1oNRZ8UIXT79I9W0nmb
	 nk6wHBZib7SY8PGF/Du+61fBcdIwk6tm6wpAkJiI=
Date: Thu, 9 Oct 2025 16:12:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
	kernelci <kernelci@lists.linux.dev>
Subject: Re: CRA compliance
Message-ID: <2025100938-coronary-bronco-8a2b@gregkh>
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
 <2025100911-unloaded-showbiz-4639@gregkh>
 <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com>
 <2025100944-spinning-clicker-4c03@gregkh>
 <CANgtXuNUm=5pyYwQ_Z1EfK_7oKkU7a-VhUkw8h_1Xg9=j8OVXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANgtXuNUm=5pyYwQ_Z1EfK_7oKkU7a-VhUkw8h_1Xg9=j8OVXg@mail.gmail.com>

On Thu, Oct 09, 2025 at 10:58:18PM +0900, Arisu Tachibana wrote:
> On Thu, Oct 9, 2025 at 10:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > Then for security breaches in KernelCI, it would be a best practice to create kernelci-security@
> > > mailing list for people to report issues and for us to community privately with parties running
> > > KernelCI infra too.
> >
> > "communicate privately" == "private communication channels" which opens
> > up a TON of legal issues, as I am want to talk at length with :)
> >
> > Be VERY VERY VERY careful with this, there's a whole boatload of
> > problems that you can get into when doing this as you are taking a
> > public project's communications private to specific companies/entities.
> >
> > Anyway, having a security@ address is great to REPORT bugs to, but
> > please refrain from using that to attempt to coordinate security fix
> > rollouts.  That way lies a death by a thousand paper cuts and
> > potentially talking to government entities when you least expect it.
> >
> > I can go into much more detail if people really want.
> >
> 
> Would be nice to have more detail on this topic in the future.

See my 2023 Kernel Recipies talk:
	https://www.youtube.com/watch?v=2TZe5EROFhE
around the 22:30 minute mark for more details.

thanks,

greg k-h
