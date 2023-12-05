Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684F405D8
	for <kernelci@lists.linux.dev>; Tue,  5 Dec 2023 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QL73S9sP"
Received: from [100.75.103.134] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DADD660715D;
	Tue,  5 Dec 2023 23:38:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701819504;
	bh=2CZFIUejLgdcAX8+486gEwTLlC8kPQFmxUo3clcFhOU=;
	h=Date:To:Cc:From:Subject:From;
	b=QL73S9sPuUGuwn8rgNhwsp5GOmkxycaNKPeOkMyQidqpwQbiE/JNzCs3NSW+Ij7GC
	 +yQOFy7FX0TbxHGTknKAifrhee+GfAwm3gmHQkXf+3wbX5N4XJNho1Bn5LhXygwcZv
	 I7K+/f3M6CWNUkkhZJ7jzHgA6gnMCEc3K9eyjdc9mEDlfwOWNnall6ZRCmUzgROtRp
	 MWK/nuMZ2P3AwKkDSa8Qp1HhF+oK2sQISDFP9aMZmDMweL50JMvfCBUYafhGHYlFi7
	 OPncCX+T2iUqldZE8Lwi7dJwtPpYBtRPc0svFsd0Bmr/k5pxEmxrX/Ns1NE0slG4RE
	 x5FLyfqQeeEkQ==
Message-ID: <5d48c1fa-d577-6f4c-5d3c-37884053e1a9@collabora.com>
Date: Tue, 5 Dec 2023 20:38:17 -0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 "kernelci-webdashboard@groups.io" <kernelci-webdashboard@groups.io>
Cc: =?UTF-8?Q?Jo=c3=a3o_Bertacchi?= <joaobertacchi@profusion.mobi>,
 Ricardo Dourado <ricardo.dourado@profusion.mobi>
From: Gustavo Padovan <gustavo.padovan@collabora.com>
Subject: KernelCI is designing a new Web Dashboard: we want your feedback!
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

TL;DR: KernelCI engaged with an UX speacialist vendor to design a new 
web dashboard to show our test results data. If you want to give your 
feedback, let us know. We still have a few spots for UX interviews!


As we shared previously, we are in the process of designing a new Web 
Dashboard for KernelCI. As you may know, at same time, we are putting 
together a new core infra to replace our legacy and limited system.

Ultimately, we will have a CI pipeline that allows tests to be run not 
only in KernelCI labs but outside of it too, but with test results 
contributed back to the already available common database. Then on top 
that, we want to have a powerful dashboard to help the community 
evaluate the test results in the best manner possible.

You can read our blog post for a quick summary of the UX redesign 
project: https://kernelci.org/blog/posts/2023/ux-analysis/

We have just started the first phase with the UX team interviewing 
kernel maintainers and other users of KernelCI.

If you are interested in providing your feedback just reply to this 
email or reach out to me directly. We will try to accommodate everyone 
that is interested.

Regards,

- Gus (as Project Manager for the KernelCI project)

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

