Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F242510795
	for <kernelci@lists.linux.dev>; Wed, 28 Jun 2023 19:37:54 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:f5c9:481c:86b4:3677] (unknown [IPv6:2001:861:4a40:8620:f5c9:481c:86b4:3677])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6605166070FA;
	Wed, 28 Jun 2023 20:37:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687981067;
	bh=5GsPc2Odi5dt17GDKFfl1eolrRTcOQPxEPNnMSXNwSg=;
	h=Date:To:From:Subject:Cc:From;
	b=azipeq/+mSR6q2YPAuvdqK1dUlihk2a5mOoO/O/uX3TxRlglls9r0TU4QKl7azOy3
	 HPchDZ4CfgTbeCoAWEZvBaEbj9Gt5rueyXvyvJZhwbTjS4SVCBZYy/Ztuk3n7VkMMn
	 oDysMmZ+96vvPEu7P4IvDho26he6/H6OsSFFCbdPndlUcp9whqxkymJfVPzPUpTKfl
	 jj362HteCUCMDr3+2JFSL9Xs8zEFBpz5do3yVnBADmCtq2gOdNJ1W/qRvHxbPkD/cL
	 GEHH4EwA6NvwXqGxqXbAotk7X+qk1/pI9MI7lyWloxU6LqCqb+CEkeJwxQGm9iMaBl
	 rw+Ty5u8fcQ6Q==
Message-ID: <d33464ef-b4c8-59c1-399a-5f3d071c289d@collabora.com>
Date: Wed, 28 Jun 2023 21:38:57 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: kernelci@lists.linux.dev
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: kernelci.org currently offline due to Azure outage
Cc: kernelci-sysadmin@groups.io, kernelci-members@groups.io
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

In a totally unpredictable move, our new MS Azure subscription
just got disabled for some reasons we're still trying to clarify
with Microsoft.  As a result, basically all kernelci.org services
are currently offline.  It's most likely just going to be a short
glitch as there's no known reason for this to happen, so we're
hoping to have things back online very shortly.  If this takes
longer we'll consider some alternatives to at least get part of
the services restored in a timely fashion.

Sorry for the inconvenience this may cause.

Thanks,
Guillaume
