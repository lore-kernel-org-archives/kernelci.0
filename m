Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E131D2BF
	for <kernelci@lists.linux.dev>; Tue, 23 May 2023 07:31:20 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:e97a:2e04:43:a267] (unknown [IPv6:2001:861:4a40:8620:e97a:2e04:43:a267])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB5ED660309E;
	Tue, 23 May 2023 08:31:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684827079;
	bh=fXrThxRSneY71ih6WtgE78kI5TRIQ6mSP4v6Qe3q9DA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Q63BMNYLcEbKQD0rysNa5bK2aZ//as0h4V4InW7YHwx/LBEwLkZGsXO1F01PpDUAy
	 zU6554/cwmw5knx0GXdmP7I1V9rsAMYu7SbR7EaZAqjW9Eww4aEzINCbDCBzbo6xx3
	 /i9snEDktRa4FFawbNVehqWDHIDRNd7aH0DPgFfhd0S3jiozzNf/k8zHGTNRes/Ouo
	 QFs825xEVMfy+ZIa5gvbBeeuvauG6DVQkKGwGOMmoOywLk0iM9hpAVkjQ1Dg/TaN+c
	 NJ3TUZL6iMFrva6nwpUtXIXsNKXc8k0wV970+2DVOg3PizXoTiixOeoIxhu7Z5nlAZ
	 VBO93ig/c6+kg==
Message-ID: <a99a73a7-a717-5c35-6299-16ea7187dd11@collabora.com>
Date: Tue, 23 May 2023 09:32:27 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC] KernelCI YAML pipeline configuration
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>
Cc: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <09c2d79d-27f3-1cb1-0d52-df003926a132@collabora.com>
In-Reply-To: <09c2d79d-27f3-1cb1-0d52-df003926a132@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2023 15:13, Guillaume Tucker wrote:
> * jobs
> 
> A "job" is essentially anything that can be run.  This is a lot more generic
> than the test and build configurations used with the current Jenkins pipeline.
> There are still a few assumptions about "jobs" though as they typically come
> with a Jinja2 template to generate a job definition.  This is in principle
> independent of the runtime environment, so a same template can be used to run
> the job in a local shell, in a Docker container, in Kubernetes, in LAVA etc.
> It will do this by including a different base template that's specific to the
> chosen runtime.  Jobs are also expected to require an "image" name which can be
> pretty much anything that's usable by the runtime environment, typically a
> Docker image or a root file system.
> 
> Another difference with the current Jenkins pipeline is that jobs have explicit
> dependencies on other jobs.  For example, a KUnit job or a kernel build job
> will require a source code tarball.  Then a kselftest job will require a
> particular kernel build.  This hinges on the Pub/Sub interface: every time a
> job node changes state an event is sent.  Then a pipeline service orchestrating
> the jobs will look for jobs that have requirements that match the event to run
> them.  This is what the "run_on" attribute is for.
> 
> jobs:
>   kbuild-gcc-10-x86:
>     template: kbuild.jinja2
>     name: kbuild
>     image: kernelci/gcc-10:x86-kernelci
>     run_on:
>       - channel: node
>         name: checkout
>         result: pass
>     params:
>       arch: x86_64
>       compiler: gcc-10
>       defconfig:
>         - x86_64_defconfig
>         - allmodconfig


While working on the implementation of the scheduler, it appeared
to me that the `run_on` attribute was more something that
belonged to the scheduler than to the job.  In theory, one could
have several entries in the scheduler with the same job but run
it in different runtimes depending on the event.  So I'd like to
propose this instead, with `run_on` in the scheduler and not as a
list since the scheduler is already a list:

jobs:
  kbuild-gcc-10-x86:
    template: kbuild.jinja2
    image: kernelci/staging-gcc-10:x86-kselftest-kernelci
    params:
      arch: x86_64
      compiler: gcc-10
      defconfig: x86_64_defconfig

scheduler:
  - job: kbuild-gcc-10-x86
    runtime:
      type: kubernetes
    run_on:
      channel: node
      name: checkout
      state: available

See also the related comment on the GitHub discussion:

  https://github.com/kernelci/kernelci-core/discussions/1907#discussioncomment-5965829


Now, maybe `run_on` isn't the best attribute name here as it
might imply "run on this platform" whereas it actually means "run
upon this event".  Something as simple as "event:" might be
better:

scheduler:
  - job: kbuild-gcc-10-x86
    runtime:
      type: kubernetes
    event:
      channel: node
      name: checkout
      state: available

Any other suggestions?

Thanks,
Guillaume

