Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62472581
	for <kernelci@lists.linux.dev>; Mon, 10 Jul 2023 19:23:46 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 356946602B7B;
	Mon, 10 Jul 2023 20:23:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689017019;
	bh=v3OpYtK5KlSY50zlw4L0lKNZXUv0DKtGj8jL4vUZSHA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=CkcXS705r828rrdhl0lvy+JHVpUe8d3B23+cY+A0EKn4jqDTtRbJZg/tkqL7gcdWP
	 ClPzBGq43mlYdvzEelkJr5jQkPR7fhBSCeFwEolOzDYST0ihIFXkPGJsdY0i9RvaZc
	 VWIqoWVVPXer1wz6CRPlRncmo1R6LZ+TnffF0dyDSxUweEV7GAPVPhw1CksLigBu84
	 f03bypfPSGSvrgRWCF6Y/7nd3eHN5KO1/u3kSptZBAqjV1dJrzueXI+joPJrRShjpo
	 LxSG7ghVdt5xDXLRarOaamwHQikMd9WcDoq8sTtv41uhrKSKZTXTRj7bNNOPCgb+mM
	 k5VOMAkfmXL2w==
Message-ID: <2ee84d61-3cb4-f745-2aad-c6319cf4e5ac@collabora.com>
Date: Mon, 10 Jul 2023 21:23:36 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Request for Proposals: UX Analysis 2023
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 automated-testing@lists.yoctoproject.org
Cc: kernelci-members@groups.io
References: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
In-Reply-To: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2023 09:48, Guillaume Tucker wrote:
> KernelCI is now looking for proposals to conduct an UX Analysis
> for a new web dashboard.
> 
> Based on the Community Survey in 2020 and after gathering
> feedback and ideas from kernel developers, we now have a clearer
> idea of what would be expected from an ideal web dashboard for
> KernelCI.  The next steps are to start thinking about how that
> could be turned into reality, and for this we need some
> professional help from web designers and developers as we don't
> have such skills in-house.
> 
> The goal of this RFP is to go through an initial UX Analysis
> phase which would then become the foundation for making
> specifications to implement a real web dashboard.  The full RFP
> document can be found here:
> 
>   https://kernelci.org/blog/posts/2023/rfp-ux-analysis/RFP-UX-Analysis-2023-v2.pdf
> 
> See also the blog post which can easily be shared:
> 
>   https://kernelci.org/blog/posts/2023/rfp-ux-analysis/
> 
> Please send any proposals or inquiries to the KernelCI members:
> 
>   kernelci-members@groups.io
> 
> The deadline for submitting proposals is 10th July.  However, as
> we're already half-way through the initial 6-week period and we
> didn't send any email about the RFP earlier, we might choose to
> give it some extra time if the original deadline turns out to be
> too short notice.  Please let us know if that is the case.

Please note that following a recent surge of queries about the
RFP, the advisory board has agreed to extend the timeline by two
weeks.  As such, the new deadline for submitting proposals is now
July 24th.

Thank you,
Guillaume,
On behalf of the KernelCI board of members

