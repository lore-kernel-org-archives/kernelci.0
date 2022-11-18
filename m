Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74529B2
	for <kernelci@lists.linux.dev>; Fri, 18 Nov 2022 10:04:23 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:b9e6:fe69:975c:4daa] (unknown [IPv6:2001:861:4a40:8620:b9e6:fe69:975c:4daa])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 765F5660298A;
	Fri, 18 Nov 2022 10:04:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668765858;
	bh=+X2HesLuNx/XcsV+kQj6nTueD62I5CklkgUzhL/BTq4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=N+u677kkNbMrnu6Bpd4772kJDnmAEIARYcuB1m0lcgTbjKoCtzF5UnS90DUPQ+FsH
	 o1zD8eN14kGqceiuksCHC0AoBeSE4crqxWJgCcgC5LdWYB2hnFrRt2qwt12VsTePfS
	 XWn5unwE0fZMIBJ6PYUjLCHY78BZWCzfv1fYW9pbidD4u2rOCIdW+/OofPgZmUoYA0
	 B5ZLm0oRNB+ABwn2MikCu7pQbFTMsKYUYfT4ZBvIdgraM71cqLcCUrAep1A6NKNdXb
	 x4Ls3nN/+IdkKJEmGQ8h0jb8h9B/IgvxQU0wvNdiunpvSGfamYFEHQOp53sL8Xsb02
	 14I6K8n7P8fmQ==
Message-ID: <58297219-2f76-66b6-fc00-b2e85d1ca051@collabora.com>
Date: Fri, 18 Nov 2022 11:04:40 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: KernelCI at lists.linux.dev
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: kernelci@lists.linux.dev
Cc: helpdesk@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <2c3efbf6-d102-af2f-9a1d-a8f39853047a@collabora.com>
 <20220714145125.nmrdwwuswnip2suc@meerkat.local>
 <2ffe18c0-59cd-698c-93b8-974762ef27d1@collabora.com>
 <1706552EEFF7A8A6.5263@groups.io>
In-Reply-To: <1706552EEFF7A8A6.5263@groups.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2022 17:06, Guillaume Tucker wrote:
> On 15/07/2022 07:12, Guillaume Tucker wrote:
>> On 14/07/2022 16:51, Konstantin Ryabitsev wrote:
>>> On Thu, Jul 14, 2022 at 10:26:57AM +0200, Guillaume Tucker wrote:
>>>> Hello,
>>>>
>>>> The KernelCI community has been using kernelci@groups.io for a
>>>> few years, however it's less than ideal as messages have to be
>>>> moderated for all non-members.  Also we've been getting closer to
>>>> the kernel community over the years and it isn't a great fit for
>>>> that.  Would it be possible to create a kernelci@lists.linux.dev
>>>> mailing list so we would then transition away from groups.io?
>>>
>>> For sure, I don't see why not. We can even import groups.io archives once the
>>> migration is decided. If you do decide to move, just follow the procedure
>>> described on
>>> https://subspace.kernel.org/lists.linux.dev.html#requesting-list-hosting
>>
>> Thank you, I've just done that now.
> 
> As we would like to move to the new list and stop using
> groups.io, it would seem useful to also import the list of
> subscribers from groups.io.  Please let me know if you don't want
> to be subscribed to the new list by the end of next week (Aug 5).

The new mailing list has now been set up and is ready to be used!
Many thanks to Konstantin for taking care of this.  All the
subscribers of kernelci@groups.io have been automatically added
and all the email archives have been imported.

The new mailing list address is kernelci@lists.linux.dev and you
should already have received a welcome email.  The new archives
are available on https://lore.kernel.org/kernelci/.  See
https://subspace.kernel.org/lists.linux.dev.html for more
details about how to subscribe / unsubscribe etc.

The old group is now obsolete so please don't send emails to it
any more.  I've updated the home page with details about this:
https://groups.io/g/kernelci

It can't be locked but after a while we can remove all the
members and change the permissions so nobody can post to it any
more.  We should wait for a little while before doing that to
ensure a smooth transition, probably until January.

Please let us know if you have any questions or comments.  Enjoy
the new mailing list!

Best wishes,
Guillaume
