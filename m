Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCD227F00
	for <kernelci@lists.linux.dev>; Fri, 21 Jul 2023 17:21:17 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF2416606F70;
	Fri, 21 Jul 2023 18:21:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689960076;
	bh=O6ak05gQKxIFMVye1XhfVJTyD31y3Rj6yNGQKvtrQ/0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GAUnkWBO9p8NV0N3GHJ3L/tU2fINzDjKhQdVlZlDqdmd4P2jGKQKgZytwF9u1vcok
	 AGHELRrNJR0YXDlduXIaXZxbJAueMo5qibccG+RVnXhCzJMTN2PB+ayEKjEFfjywDx
	 trSUfne4x90gcD8E/jo8tGBsHC7Qaz2nVaYbyiP8zeDik6b9a33ZRXfqc+hJazXtlN
	 LhjNKGrRc0St4QGywFcODKVhmQVGEcIUQgJj/l/54BNF10jpxCRh8CET/FFdsWWeff
	 BaKudfBZu3MZM2JYeWQ1QeSlE5xZs+JkMOfXtWjscn/PlLEfpLhxGhJNtRIHenKtbS
	 ULVrPKQMEFYNg==
Message-ID: <c20bab15-5b86-34e7-50bf-d85c2f2661e0@collabora.com>
Date: Fri, 21 Jul 2023 19:21:13 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: BPF-CI integration with KernelCI
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: Nikolay Yurin <yurinnick@meta.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: David Vernet <void@manifault.com>
References: <87afa4a50985db47ee5681c4913514f0ce8bac1f.camel@meta.com>
 <c39423d0-f7e4-a55f-45e0-6c02888766fd@collabora.com>
In-Reply-To: <c39423d0-f7e4-a55f-45e0-6c02888766fd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2023 22:06, Guillaume Tucker wrote:
> Hi Nikolay,
> 
> On 12/07/2023 05:01, Nikolay Yurin wrote:
>> Hi everyone,
>>
>> I am part of the Kernel PE team at Meta, working on BPF CI [1].
>> Currently we aggregate patches from Kernel Patchworks into Github pull
>> requests [2], run Github CI and sending results back into Patchworks.
>> I'd like to explore ways to integrate with KernelCI and see how it
>> works with our current setup and tests.

Just so that everyone knows, there's now a GitHub issue to
discuss this as well as this email thread:

  https://github.com/kernelci/kernelci-api/issues/307

Thanks Nikolay for creating it.

Best wishes,
Guillaume


> It's great to see this topic being revived now that the new API
> is getting ready for beta testing.  We discussed it with David
> Vernet (on Cc) last year at Kernel Recipes.  The idea is to have
> a service making a bridge between your Patchwork system and the
> KernelCI API.  I think it's a great way to start doing pre-merge
> testing with patches from mailing lists as the scope is pretty
> well defined.  If I understood this correctly, the target branch
> is always the same and only one or two small kernel builds are
> required to test them.
> 
>> I saw comment by Guillaume Tucker [3] saying that kernelci-backend is
>> unmaintained. Could you point me out to the up-to-date documentation on
>> how to setup local instances?
> 
> You can find a quickstart guide here:
> 
>   https://kernelci.org/docs/api/getting-started/
> 
> Please note that it still needs some polishing, we have a few
> things left before we can host an instance publicly available
> with early access for some beta testers.  Doing a PoC around this
> would be a very good way to exercise it and get some feedback.
> The guide is about setting up a local instance which you can
> already take a look into and get a bit familiar with the
> architecture.
> 
>> I'm open for feedback and discussions on the future of BPF CI, feel
>> free to reach out to me if you have any questions. Thanks!
> 
> Sounds great.  I guess we can already start discussing some
> high-level concepts and think about how this could be done in
> practice.  Then there will be an email announcement once we have
> a public instance available which should facilitate work on this
> topic.
> 
> It would be good also for us to get to know how BPF CI works a
> bit more, maybe you could join a weekly KernelCI community
> meeting to discuss this?  It's every Thursday at 11:00 UTC.  If
> this is not a convenient time, please let us know and we can
> arrange something.  There's also https://kernelci.slack.com in
> addition to IRC.  And thanks for the links, I'll take a look.
> 
> Put simply, one approach would be for Patchwork or a GitHub
> action to generate an event on the API's Pub/Sub interface when
> some new patches need to be tested.  Then a service would be
> listening for this, preparing the source code tarball and the
> rest is in principle the same as when testing code taken from a
> git repo.
> 
> Then we can look into more advanced things such as doing
> incremental builds for series of patches like 0-day does and
> tying new revisions of the same patch series together to compare
> results, track regressions against to the base git version before
> the patches are applied etc.  Reporting the results via Patchwork
> and email replies on the original thread would also seem like
> typical things to consider.
> 
> Thanks,
> Guillaume
> 
>> [1] http://vger.kernel.org/bpfconf2022_material/lsfmmbpf2022-bpf-ci.pdf
>> [2] https://github.com/kernel-patches/bpf/pulls
>> [3] https://github.com/kernelci/kernelci-
>> backend/issues/301#issuecomment-1630386265
> 
> 
> 

