Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBB7ED4
	for <kernelci@lists.linux.dev>; Thu,  4 May 2023 07:57:36 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:7ba8:a84:941f:3319] (unknown [IPv6:2001:861:4a40:8620:7ba8:a84:941f:3319])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD45966021E6;
	Thu,  4 May 2023 08:57:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683187054;
	bh=IZpDMo3QJp1lUXGra8B5C2AjJQdtca+6DSF9xw5ZrNc=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=d86lCG1pP1ZfQer2dR8meFZS95sQkTQr7q422WWLa6xGSv+h6uwM9mZjdsQd2915E
	 ccPPuSdBeos1ldAgDCg7io0WseYKN6TCgjHIjCN1bA8kAlcOUqVgWejf038btLehff
	 WoClyCpNBZfPfyOyM+sCxCaHwVXoY29j5qdLmAUG0BIbW38OTJCMogHNrEuPJ7H6q/
	 yE/cU/WiAwrS1JQC7j1MTRQ2vIig7N98D3W0mVE+aN5u8UCij3iAGjq6uHZ83kUNJK
	 3/CspQIb7fW45kIILEbOACLc50fJIkF9sg/6WJOOzkHl6YGucbFFxjN+UkzTJ3TQ1x
	 6f+NYB8TO7BYA==
Message-ID: <445b1881-f53c-6f4c-2769-cab29011cd50@collabora.com>
Date: Thu, 4 May 2023 09:58:37 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: QCOM IPQ Boards Kernel CI Automation
Content-Language: en-US
To: "Ram Jangir (QUIC)" <quic_rjangir@quicinc.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <SA1PR02MB851150DF6313550B809D8AE899649@SA1PR02MB8511.namprd02.prod.outlook.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <SA1PR02MB851150DF6313550B809D8AE899649@SA1PR02MB8511.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ram,

On 25/04/2023 14:44, Ram Jangir (QUIC) wrote:
> Hi,
> 
> We are from Qualcomm. We are actively upstreaming support for some of  our IPQ (Router chipsets, IPQ807X, IPQ5018, IPQ9574, IPQ5332). 
> Hence we want to run the kernel CI test suites from the kernel trees (linux, linux-next) .  Boards are there in our local board farm inside QCOM.
> So wanted to understand the process involved in testing our boards and getting the results published on the kernelCI dashboard.  
> Can you please help us here ?

Thanks for getting in touch.  I believe Steve (on Cc) once had a
lab connected to KernelCI, is this related in any way?

If your lab is a LAVA lab then it's fairly easy to set up,
there's a documentation page for it:

  https://kernelci.org/docs/labs/lava/

If not, then it's possible to send results from any arbitrary lab
but it's a bit more tricky.  There's currently no way for labs to
get notified when new kernel builds are available so some kind
of "glue code" is needed to bridge this gap.

However, we're now working on a new API which provides a Pub/Sub
interface for this kind of scenario.  The new API is lab-neutral,
it doesn't matter if you're running tests in LAVA or anything
else.  You could even run tests by hand locally and get the
results sent directly to the API.  It's not quite ready yet,
we're hoping to have a publicly-hosted instance this Summer for
people to start using it and start deprecating the current
system.

There's a section in the documentation about it, which is also a
work-in-progress.  Here's an overview:

  https://kernelci.org/docs/api/overview/

If you have a LAVA lab, I believe it would be fine to start by
using the current system now.  If not, then it would probably
make more sense to directly look into using the new API with a
bit of help from our core developers.  There's already a staging
instance available to start experimenting with things, and having
contributions from real-world users with particular types of labs
is a great way to accelerate the API development and adoption.

There's a public KernelCI video meeting every Thursday at 11:00
UTC followed by an Open Hours at 12:00 UTC to discuss any topics,
I guess this would be an interesting one to bring up.  Please let
me know if you want to be added to the calendar invitations.

Thanks,
Guillaume

