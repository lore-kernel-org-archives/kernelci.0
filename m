Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757F119BD5
	for <kernelci@lists.linux.dev>; Mon, 31 Jul 2023 19:44:43 +0000 (UTC)
Received: from [192.168.1.100] (176-169-236-103.abo.bbox.fr [176.169.236.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BA756607003;
	Mon, 31 Jul 2023 20:44:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690832681;
	bh=CkG+/zKofkxwh+i44LbU/xgDaZChWkCdD8S/DoCh21I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PnuO424OnAruHLHsJAjST9avs/ffQIaQsD07PEB6sZM3F8M2a3zD6Jbi2Pn36mU/V
	 Whv3MhwNPqljvtRRn6Yq73WssrSNtcdUMF3fLkWIoIW6zNYLRJPFeLO8VknJ4MqjDB
	 2QryvTMXxrDin/x/hDg4cOCklKUQ29sZKknBVInyVBqmcDSMjYCmH+BukXZmnZvtO4
	 /72e5go3H2tW1XaYCuDHoeZo5/ZEQmDA6OMGgn9+UEFjg4p2NVEXupQ5Fg9WM6stbt
	 IpZJPXsaHrnUn+x2nThDeCy6N+I/FNjCKJpzlKtVloAhVoRtIEwZvLHaqLH+cpLDZx
	 cqyOgeWlfL1iw==
Message-ID: <16476e24-b3b2-5f9a-9ae9-50062857d348@collabora.com>
Date: Mon, 31 Jul 2023 21:44:38 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: could you give me a job configuration that can post job, build
 and test to kernelci-backend
To: jwjiang@mail.com
Cc: jiangjianwen@uniontech.com,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <trinity-dd9b2fbe-c328-4f84-ac7c-d6c59e4a526f-1690508189736@3c-app-mailcom-lxa08>
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <trinity-dd9b2fbe-c328-4f84-ac7c-d6c59e4a526f-1690508189736@3c-app-mailcom-lxa08>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/07/2023 03:36, jevon qiang via groups.io wrote:
> Hello,
> 
> I'm a newer to kernelci. And now I can use following notify block to post test to kernelci-backend successfully:

Please send an email to the new mailing list:

  kernelci@lists.linux.dev,

as explained on the groups.io home page:

  https://groups.io/g/kernelci

> notify:
> 
> criteria:
> 
> status: complete
> 
> callbacks:
> 
> - url: http://192.1 68.122.208:8 000/api/v0.2 /jobs/ ( http://192.168.122.208:8000/api/v0.2/jobs/ ) {LAVA_JOB_ID}/tests/?format=json
> 
> method: GET
> 
> - url: http://192.1 68.122.208:8 081/callback /lava/test?l ab_name=lab- 01&status= ( http://192.168.122.208:8081/callback/lava/test?lab_name=lab-01&status= ) {STATUS}&status_string={STATUS_STRING}
> 
> method: POST
> 
> dataset: all
> 
> token: kernelci-token
> 
> content-type: json
> 
> However, I couldn't find a way to post that job's definition and its build to kernelci-backend.
> 
> Could you give me a demo job containing those proper notify block(s)?

This code is now all deprecated and should only be supported for
about 6 months.  We're now focusing on the new KernelCI API, some
more details about that will be communicated soon on the mailing
list.

In the meantime, here's a sample LAVA job that has a valid
notification callback if that helps:

  https://lava.collabora.dev/scheduler/job/11178187/definition#defline108

Thanks,
Guillaume

