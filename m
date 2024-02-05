Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C310A01
	for <kernelci@lists.linux.dev>; Mon,  5 Feb 2024 06:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113035; cv=none; b=p0aMfAO9aeZAnN9iSLbrwns/pTmSDbheWmhjJSi4HHh+G0B9LRe86B/ofagDz+MKPx9KyY62+HSIiL6ygvodzTtCUkrO17Yc0RZXMeBf16WtY6JBRXDGueg+wk/tzvPV6SL6G3EP0bsy57Z9Jt+qLaXETJWS9faFsf0N6OoIlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113035; c=relaxed/simple;
	bh=CEaizMW8sKDX3T35FO2P23jjweW4DpXKNulUTVoNi/w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LXdKmU9WktVWQXZIvYu4A8pyrgRV5dtCfRPUC81XIalifwy6lQfP8DVlYUimrUZihrYYuxg0FgzQnMLoBihyn2UdfmPmkX2Lj9S+PMLoPNo1z4ZPw5pIRZkJOkWVW2ICNrJzsJtA6fqRb0Mj5n3OcHwvOAYAwN0I2gn+6/fzThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hDHYP+ju; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hDHYP+ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707113026;
	bh=CEaizMW8sKDX3T35FO2P23jjweW4DpXKNulUTVoNi/w=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=hDHYP+juZnEk/X85a03o8gvGin/URQzooDoblxsBfkaJK+Le/cEkwmYy22CQ7Aozf
	 XikqxwC+svKtRHYBbRVeH3wLRrDb/APNbKHvQUMAFt/3kDkiKicuOWZMFmIjlLHQ82
	 KVs/BFCee60gf2/bohvIyiihJOB81O8zsTt9VlBw17wbmrtzxADVaKC2/+9smpmyNA
	 DSleCl6gKzraz6/MfSjuX0hkTNg9jYVnysFADuLdFjNw7GbEQiQCs34gV07EfqKpMr
	 EsnUEBD9UJUYjXRi7kjir4w0OeNxaobSTzEFl1evep4niY3974G6zkQnSjA1NDuELy
	 EnwdPW7RJvP2g==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C65203781360;
	Mon,  5 Feb 2024 06:03:45 +0000 (UTC)
Message-ID: <9f58d16701b61a5fd05db7839f21cb8f0bf15013.camel@collabora.com>
Subject: Re: Please add new Android branches
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, kernelci@lists.linux.dev
Date: Mon, 05 Feb 2024 08:03:44 +0200
In-Reply-To: <CAHRSSEyev9rcYpbe2VtALc9-4zR_Bz6=24yitFTa4U5X8N+S0A@mail.gmail.com>
References: 
	<CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
	 <CAHRSSEyev9rcYpbe2VtALc9-4zR_Bz6=24yitFTa4U5X8N+S0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Todd,

PR created https://github.com/kernelci/kernelci-core/pull/2345
It will be merged and included in today's production release.

Thanks!

On Sat, 2024-02-03 at 10:43 -0800, Todd Kjos wrote:
> Please add the following new Android branch to kernelci testing.
> 
> repo: https://android.googlesource.com/kernel/common
> branch:
> - android15-6.6
> 
> Thanks,
> 
> -Todd
> 
> On Mon, Jul 10, 2023 at 3:41 PM Todd Kjos <tkjos@google.com> wrote:
> > 
> > Please add the following new Android branches to kernelci testing.
> > 
> > repo: https://android.googlesource.com/kernel/common
> > branches:
> > - android15-6.1
> > - android14-6.1-lts
> > - android14-5.15-lts
> > 
> > Thanks,
> > 
> > -Todd
> 


