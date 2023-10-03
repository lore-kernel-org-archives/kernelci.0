Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9912FD533
	for <kernelci@lists.linux.dev>; Tue,  3 Oct 2023 08:17:41 +0000 (UTC)
Received: from [192.168.1.100] (176-169-236-103.abo.bbox.fr [176.169.236.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E3AC660087A;
	Tue,  3 Oct 2023 09:17:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696321060;
	bh=op0pw6O4S7g//AQyZYO2NKbryW1xU9RN9fjo1Zu9cv8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Wp1EZP0xxz+uP2b8Z280UODhIJIpSpNm41wWnRd0oIHtS502RAlWLTHK92FXvUcT6
	 w1qlQtEGpgfn0C6fNNBhUUc1SooOkfXmqoHdtn0KmGuIr15b2r2SQkojslVKh2F41i
	 abpgWIQjM+s8wfmVqx+3o4MSeOS4T8t+IvVjUwU12MGYNlZPlXrtb16Qyn0kGqxqw8
	 zbsxmS2vTlHgLmMc5Yq7t1dTDRw3d4ijMmLmOli7W/PxFDvnaAj/ddFz9lnyATEbu1
	 OI/asMPVFZjN43Gcibsc7Vgbwsv7Y3+Fq0Z+gaswK3erm+liaWzz6u30hno7K4166a
	 z5sCULEPymbjg==
Message-ID: <a14b8281-005b-e9c2-bae9-cbc2e18ae0d2@collabora.com>
Date: Tue, 3 Oct 2023 10:17:49 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: kci command line poll: Click or Typer?
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
Content-Language: en-US
In-Reply-To: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2023 10:59, Guillaume Tucker wrote:
> Alongside the new KernelCI API we're also working on the new
> command-line tool "kci".  One of the key decisions to make is the
> framework to use for its implementation.  The legacy KernelCI
> tools use the standard argparse, now we may consider using Click
> or Typer as they are popular Python alternatives.
> 
> Here's a small poll with extra context to help people make up
> their mind and vote for their favourite choice:
> 
>   https://github.com/kernelci/kernelci-project/discussions/258
> 
> If you don't have a GitHub account, you can also reply to this
> email to vote instead.  Feel free to also bring up any discussion
> topics here or with GitHub comments of course.
> 
> We'll look at the results at the end of the month so there's a
> bit more than a week left to answer the poll.

The results are in, basically all 3 options received the same
number of votes!  However, there have been very constructive
discussions around it and a fair amount of engagement from the
community which is very encouraging.

Here's a summary with collected pros/cons for each option:

  https://github.com/kernelci/kernelci-project/discussions/258#discussioncomment-7172705

an a proposal going forward:

  https://github.com/kernelci/kernelci-project/discussions/258#discussioncomment-7172800

I'm including a copy of the proposal from the GitHub comment here
for the benefit of the mailing list:

> What I would propose is to start with Click using the version
> currently in Debian Stable (v8.1.3) as it has so many
> advantages over argparse.  Then if users find the Click
> dependencies too cumbersome, we may consider bundling it
> directly with the kernelci package, probably with a Git
> submodule or directly added to the repository under
> kernelci.click.
>
> As a fallback, if we later find that adopting Click in the
> community still requires a larger effort than maintaining an
> implementation based on argparse we might be able to convert
> the tool to argparse then.  This scenario seems very unlikely
> as there aren't any actual signs that Click is more difficult
> to adopt than the existing dependencies (see requirements.txt
> in kernelci-core repository).  So the risk seems very low, and
> if we did hit this kind of problem we would still have a way to
> mitigate it.

Like many important technical decision, it's a compromise between
diverging requirements.  Please raise any concerns you may have
now if anyone believes there are going to be blockers with using
Click as the kci command line framework.  We need to have a
stable implementation by the end of November to meet the next
KernelCI API milestone, as such the implementation of the new kci
tool will probably start next week.  Also, please let us know if
you want to contribute ;)

Thanks,
Guillaume


PS: We should bundle CloudEvents with the kernelci package...
