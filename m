Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3922AB55
	for <kernelci@lists.linux.dev>; Wed, 21 Jun 2023 07:47:24 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d5c1:8964:fef7:3a60] (unknown [IPv6:2001:861:4a40:8620:d5c1:8964:fef7:3a60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 190266606F8B;
	Wed, 21 Jun 2023 08:47:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687333637;
	bh=gl768/ty1OEIG88A0P/DFED3AO9msfS+rmzBbeV9wi0=;
	h=Date:To:From:Subject:Cc:From;
	b=drYZ6Urtkx7ph++5O23Pd7J9j5LKBFjft2BqTPdFGm5CxreN+yoJtH2o+waXtv3ZO
	 qQwsf6rWsMeS+OoB8txcWmJSyvdKv7qMqX/ulQ6msYNIx3PXBgv2sdZOruBBft9ZJi
	 QJpsnZwdd/zyi0g84nGv5qP8VneXUQUG+n7wOKZ3JQTU0gFcBoXZfMhIsMCOso18Em
	 ZjJCwCPZmfyF6Rhwxwv1TUguosne2p6mjcevHo/3a2seC4X/OykDr9sAgpGiwNTLj/
	 5dAKEeXK3cwg/iYNIB7EOqBHlga5Ka7wxIFol723qBNE6NHuLWL+GZY1rNyTOIqWmX
	 Iwr2PumD/NjaQ==
Message-ID: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
Date: Wed, 21 Jun 2023 09:48:32 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 automated-testing@lists.yoctoproject.org
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Request for Proposals: UX Analysis 2023
Cc: kernelci-members@groups.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

KernelCI is now looking for proposals to conduct an UX Analysis
for a new web dashboard.

Based on the Community Survey in 2020 and after gathering
feedback and ideas from kernel developers, we now have a clearer
idea of what would be expected from an ideal web dashboard for
KernelCI.  The next steps are to start thinking about how that
could be turned into reality, and for this we need some
professional help from web designers and developers as we don't
have such skills in-house.

The goal of this RFP is to go through an initial UX Analysis
phase which would then become the foundation for making
specifications to implement a real web dashboard.  The full RFP
document can be found here:

  https://kernelci.org/blog/posts/2023/rfp-ux-analysis/RFP-UX-Analysis-2023-v2.pdf

See also the blog post which can easily be shared:

  https://kernelci.org/blog/posts/2023/rfp-ux-analysis/

Please send any proposals or inquiries to the KernelCI members:

  kernelci-members@groups.io

The deadline for submitting proposals is 10th July.  However, as
we're already half-way through the initial 6-week period and we
didn't send any email about the RFP earlier, we might choose to
give it some extra time if the original deadline turns out to be
too short notice.  Please let us know if that is the case.

Best wishes,
Guillaume,
On behalf of the KernelCI board of members
