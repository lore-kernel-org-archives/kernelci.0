Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289210E4
	for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 07:11:42 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:fcef:69b2:fccd:bd45] (unknown [IPv6:2001:861:4a40:8620:fcef:69b2:fccd:bd45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3070966072FA;
	Mon, 25 Sep 2023 08:11:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695625895;
	bh=GIRTteuks6FjLK2TY5F8gfwE5JlEfLkf/u65LcvE6hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IFmzjjfphP1QySh6Q19UiOK4j8npyEcVQZFsKMd1BZmciMEnrBuCs6/5R4KywIeI/
	 fQQDDotFZcoZA3hUyTEp24zX+k4brXxmt3AQaZKam1FYUzEIgARUNl3hMKAPfrzF7E
	 5qGtsOaC10DzbmY6QQUUQuhyeoY/WHWw2t/e40yiID8nP7scp54ArBz+nr1G33TaXI
	 jAE2jR/HcHM5YjcqwDS8AYIKH+ngT4a3dEvB5p2sHwyXWl1VCIwkRB/YT/znmXm7Zk
	 ZdvyCJr5ruX1xN7sgWb6YLFuX87unzEW4A3VOF+kRvpGswVkODMcyzfP3JBWYgN4m5
	 fkw/smWbOmI4w==
Message-ID: <74940498-9b74-bfb7-1438-39164793e352@collabora.com>
Date: Mon, 25 Sep 2023 09:12:51 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: kci command line poll: Click or Typer?
Content-Language: en-US
To: "Bird, Tim" <Tim.Bird@sony.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tim,

On 21/09/2023 21:41, Bird, Tim wrote:
>> -----Original Message-----
>> From: automated-testing@lists.yoctoproject.org <automated-testing@lists.yoctoproject.org> On Behalf Of Guillaume Tucker via
>> Alongside the new KernelCI API we're also working on the new
>> command-line tool "kci".  One of the key decisions to make is the
>> framework to use for its implementation.  The legacy KernelCI
>> tools use the standard argparse, now we may consider using Click
>> or Typer as they are popular Python alternatives.
>>
>> Here's a small poll with extra context to help people make up
>> their mind and vote for their favourite choice:
>>
>>   https://github.com/kernelci/kernelci-project/discussions/258
>>
>> If you don't have a GitHub account, you can also reply to this
>> email to vote instead.  Feel free to also bring up any discussion
>> topics here or with GitHub comments of course.
>>
>> We'll look at the results at the end of the month so there's a
>> bit more than a week left to answer the poll.
> 
> Ok - sorry about this, but here goes...
> <rant on>
> 
> I see exactly 0% of the people saying to stay with argparse, but that would be my recommendation.
> The rationale for this is that argparse is old and unlikely to be changed in an incompatible way in
> some future version of Python.

OK, I see there's 1 vote now.  If that wasn't you then do you
want to get your vote counted from the mailing list?

> My own rather unfortunate experience with Python is that it used to be a reliable, stable, robust
> language with backwards compatibility, but that is no longer the case.   Python keeps altering modules
> in incompatible ways, introducing new syntax that is not compatible with previous versions of the language,
> and deprecating modules that are in wide use.  Just this past year, the powers-that-be
> in Python decided to deprecate the 'cgi' module, and remove it from the core python libraries. I have several
> (admittedly, very old) python-based cgi scripts that use this module.  I'll likely have to rework these scripts
> in the future, just to keep them from breaking, as newer versions of Python are distributed with Ubuntu and Debian.
> A similar thing has happened with other modules, such as urlparse and openpyxl.  Both of these modules
> were refactored by their authors in a non-backwards-compatible way, which caused breakage and requiring
> refactoring of my own python programs.  I can attest that keeping python programs running unmodified
> for longer than 10 years is a real chore.  The same is not true of Linux programs and C libraries, where
> backwards compatibility has been a priority for the upstream developers.
> 
> The fact that there are now additional argument-parsing options available
> for Python, that one needs to choose between, kind of underscores my point.  Which one will Python stick with?
> Will python drop support for argparse, chasing some new "module-of-the-month" for argument parsing?
> The future of long-term support by the Python community for any of argparse, Click or Typer is, IMHO, very
> much in doubt.
> 
> If you do stay with argparse, I would pull a current copy of the module into your own repository, so
> you are not dependent on updates or external repositories.

Yes, and I was actually wondering whether we should be doing this
even if we chose to use Click.  We can't do this with all the
other dependencies but the CLI framework is quite important as it
faces users directly.

> For my own projects, I have my own argument parsing functions written in native python, so I am reliant
> on as few core python modules as possible. (So my answer, for my own projects, to the question of which
> external python  module to use for argument parsing is "none of the above".)
> The python community just cannot be trusted not to break the language or the core modules in a
> backwards-incompatible way.

OK so I'm inclined to favour the option of having a first
implementation in Click as that's the easiest to write by far, so
we can deliver the feature according to our current timeline, and
then consider a pure Python one to be immune to breaking changes
in modules.

> If the python community cared about backwards (and forwards) compatibility, they would not need
> the whole mess that is virtual environments.
> <rant off>

Fair point.  In fact KernelCI provides Docker images with all the
dependencies installed etc. so in practice I don't think anyone
relies on a venv at the moment (either native install or Docker).

> Just my 2 cents.
>    -- Tim

Very valuable ones :)  I was wondering whether users would prefer
the old-school style of Click or the more flashy Typer (as
they're both way better than argparse for implementing lots of
subcommands) but it turns out that users on this thread care more
about Python dependencies management than direct user experience
on the command line.

Thanks,
Guillaume
