Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27391094F
	for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 07:22:38 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:fcef:69b2:fccd:bd45] (unknown [IPv6:2001:861:4a40:8620:fcef:69b2:fccd:bd45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9BED66072FA;
	Mon, 25 Sep 2023 08:22:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695626557;
	bh=IJYtnNXluabAeFlIS0UFBpRSDF/js4GxO9B7+krQZYw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Koq+HtLIo055uwICN6mgE9BxAxxfAfzCLrfNmPU8WjzRLovsRkHLiT9FJ/FHR7xOE
	 NZpbO+Rgy7/9mYVorShBDfdS9jj3mzB/oQtJU7OLc18uLn6ENOdB435ggOrIReEAwk
	 hBNwEYsxDM24WvxoaRpkn8M4SfdiiJ2Mxlj+PbX96tZBF/BkTt6ZrnEyg9f5fiI2ky
	 rM3gnrACqlFc2l+oLVgqvPuzJqitSGlx486pTQq1EgiG88ougsJPFdCMXvip27ly6Q
	 FJ5Ynmnk/sz87pasg5VMRzvjJdItTdF7WwdntsenfN4cgDuAx1nYaaP4dG5zslbK1D
	 8J5fApOf9GNcA==
Message-ID: <ee67f2d5-3229-0258-c572-9a7f3f1e76af@collabora.com>
Date: Mon, 25 Sep 2023 09:23:53 +0200
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
To: Cyril Hrubis <chrubis@suse.cz>, Tim Bird <tim.bird@sony.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
 <ZQ1JRywfnmUB0tdb@yuki>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <ZQ1JRywfnmUB0tdb@yuki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Cyril,

On 22/09/2023 09:59, Cyril Hrubis wrote:
> Hi!
>> I see exactly 0% of the people saying to stay with argparse, but that would be my recommendation.
>> The rationale for this is that argparse is old and unlikely to be changed in an incompatible way in
>> some future version of Python. 
> 
> +1

So that's +1 vote count for argparse I guess?

> We recently started to work on new tooling for running LTP tests written
> in python and after a few up and downs we ended up with using the bare
> minimum of modules we can get away with. Less is clearly more in this
> context.

That's very valuable feedback, thanks.  I would expect a similar
kind of audience running the new kci tool as the LTP ones.

Next step, we can start designing a stable kci syntax this week
with commands and arguments regardless of the implementation
framework.  Then next week we'll recap on this discussion to come
up with a plan that maximises both maintainability and user
adoption in the community.

Thanks,
Guillaume

