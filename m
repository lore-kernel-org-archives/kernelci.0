Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF6EC5
	for <kernelci@lists.linux.dev>; Thu,  5 Jan 2023 10:00:02 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:ca7e:ed27:bc15:7986] (unknown [IPv6:2001:861:4a40:8620:ca7e:ed27:bc15:7986])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63BE76602D05
	for <kernelci@lists.linux.dev>; Thu,  5 Jan 2023 09:59:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672912795;
	bh=SHVaoUWL7WvlLP44JdLG1ISAlhEn+UCq21ZqTCwQCmw=;
	h=Date:To:From:Subject:From;
	b=EpsAj2J3dyOm4ABt4MChlN+fboewIcFx5iMptxAEEwEyPqX1yC7hpoyLk/+YgfERh
	 O0BdrkT5kHFKj0vOHnOopYlKjqWS+yTn9SH5Cp3jkziXYT8vzGRYQmYm/OhonwupdX
	 xew1eOV5C8kKJ/yNLTzrRbV74BLlLVd1A3nTUv1gwC9Tnlu+dRicKTBjp9N6aArXer
	 3uu6u9ag2P13wydcAR0wqwjQuRlj7MiaJIAXgdxSqWNeX2bjcGdulhTe8XPoc9BD0S
	 F8tCydUjfrA7HGc73m1YcggbB4q39/jy4t3O+hBufcLWzqfm4mIX82Mus+wdkxedDS
	 zVXRqaZvspxDQ==
Message-ID: <4ae8d73f-ed10-c3b5-c6c3-e30ffdf95d7b@collabora.com>
Date: Thu, 5 Jan 2023 11:00:32 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: kci command and new API & Pipeline
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As the new API & Pipeline implementation is getting closer to
being fully functional, the next step is to start transitioning
the kernelci-core Python package and command line tools.  Some
work has already started around that, with some primitives to use
the new API and more recently to provide an abstraction layer for
storage.  We also need to make sure the current tools and various
systems using it (Jenkins...) continue to be supported with a
clear deprecation plan.  So here are a few thoughts about how I
suggest we do that:


* kci command

With the new API, builds and tests share a common base object
model called a "node".  So kci_build, kci_test and kci_data
become kind of confusing names.  Also the idea of having a single
kci command has been floating around for a while, so now seems
like a good time to start implementing that.  Basically, the
kci_* commands will remain supported for as long as necessary to
ensure a smooth transition while production is still using
kernelci-backend and Jenkins.  Meanwhile, new commands using the
new API will rely on the kci entry point.  Then we can have
things like "kci node get <node id>", "kci user create", "kci
storage upload <files>" etc.  The code behind these commands
would be used by the new pipeline too.  We might even consider
implementing the pipeline services as commands in kernelci-core,
so kernelci-pipeline would ultimately have no Python code left at
all (e.g. docker-compose would just call "kci monitor loop").

I've made a first set of PRs to introduce the kci script as a
single entry point command and just a "validate" sub-command to
validate the YAML configuration:

https://github.com/kernelci/kernelci-core/pull/1582
https://github.com/kernelci/kernelci-core/pull/1585
https://github.com/kernelci/kernelci-core/pull/1586

I'm taking this opportunity to enable pylint in GitHub checks for
all the code getting added now, and we should also get the
documentation and unit tests updated at the same time.  We might
also consider increasing the minimum Python version which is
currently 3.6 to say, 3.9 or 3.10 as this could improve the code
quality.  But these are more like implementation details than
design decisions.


* storage abstraction

The old kernelci-backend implementation provides its own endpoint
for uploading files, which have to be on the same server as the
backend service.  The new API is entirely decoupled from storage
as the data schema just requires publicly-available URLs for the
files which may be uploaded and stored using any arbitrary
mechanism (SSH and Nginx by default, but could be s3-compatible
or anything).  So I've made a couple of PRs to add a
kernelci.storage abstraction module, with support for both SSH
and kernelci-backend with the corresponding Jenkins changes:

https://github.com/kernelci/kernelci-core/pull/1573
https://github.com/kernelci/kernelci-jenkins/pull/117

I've also added a kernelci.legacy module to keep code that should
eventually be removed.  This makes it easier to refactor the rest
of the code that just needs to evolve.


* API / database abstraction

There is currently a kernelci.db module for abstracting the
backend / API / database interactions.  This was initially done
in order to provide some flexibility between the old backend and
the new API and also potentially use things such as KCIDB
directly.  However, the design has now evolved to push the
abstraction line at the API level instead with modularity around
its pub/sub mechanism.  The client-side code could now be
simplified a lot by removing endless corner-cases as each API has
a different set of features.  So I'm suggesting to move the code
that talks to the new API to a separate module e.g. kernelci.api
and plan to deprecate kernelci.db which would only be used with
the old backend.


Please feel free to share any thoughts you might have on this.
Here are in particular a few things I think we need to clarify:

* Do you require a Python version older than 3.10 for your
  KernelCI use-case?

* Can you deal with minor CLI changes in the current tools?  For
  example, --storage is being replaced with --storage-config.

* For how long would you need the old code to remain in the
  repository with minimal bugfix support?  I believe the new API
  and pipeline should start getting ready for production in the
  April~June (Q2) timeframe, so we could plan deprecation to
  start around that time and removal later this year
  e.g. October~December (Q4).

I know there are a few instances of KernelCI out there with
various kinds of custom integrations that rely on some of this
code, but it's unclear to which extent they do.  So please share
any specific requirements you may have to help you transition to
the new system.  While it's important to take KernelCI users into
account and minimise disruption, please also keep in mind that
the code base and services need to evolve in order for the
project to scale in a sustainable way.  So the earlier we can
drop old code (and Jenkins!) the better.

Thanks,
Guillaume
