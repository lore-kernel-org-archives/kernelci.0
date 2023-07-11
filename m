Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDC18B10
	for <kernelci@lists.linux.dev>; Tue, 11 Jul 2023 11:57:19 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 873FF6606F97;
	Tue, 11 Jul 2023 12:57:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689076637;
	bh=YqsPwWn03rcwhXjFVr9lvjWwqGwSi9VOCXJOYV4sGBg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=V7hckda6o7dk8wXO35JOHrrDNOa6lxBauUkXGV5OmEXKm3wzV3DCE8Cuo7N12soPA
	 pIIVON1+c/2nfnTM6vEV1PvCyl7DptPkJEPRSCz5omHNTnrrrplxzuhttYZ0WUsNPh
	 V4xeMLeqXTWd6ABT3etjbL5fURV7SNChbL708ozlDZ+ai4ofqlfKFnV4NhyO365zp2
	 jdT3nwvUmZ/qd04u4k7QhYqmbZO3Pql7rxL0wLqLndnOYBLCJyiBMIptnrCgv3XVXC
	 BXPIiEdpIbrXr08tAz0SuJhhuM1Z6+F8yoIDNKZWvdWilM5EhXdR3fts0uUtOLQVNb
	 McPLSz6wzV3Ag==
Message-ID: <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com>
Date: Tue, 11 Jul 2023 13:57:15 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Please add new Android branches
Content-Language: en-US
To: Todd Kjos <tkjos@google.com>, kernelci@lists.linux.dev
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Todd,

On 11/07/2023 00:41, Todd Kjos wrote:
> Please add the following new Android branches to kernelci testing.
> 
> repo: https://android.googlesource.com/kernel/common
> branches:
> - android15-6.1
> - android14-6.1-lts
> - android14-5.15-lts

I've created this PR accordingly:

  https://github.com/kernelci/kernelci-core/pull/2002

Please note that we're now operating with reduced build coverage
due to some temporary limitations with our Azure subscription.  I
know the Android kernel builds should be covered by the GCP
clusters but right now the system is designed to distribute
kernel builds randomly across all clusters so we can't easily tie
Android builds to the Android clusters.  Hopefully we'll find a
solution to go back to normal coverage within a week or two.

Thanks,
Guillaume

