Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F196AB1
	for <kernelci@lists.linux.dev>; Wed,  6 Sep 2023 18:46:49 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AC7366003AC;
	Wed,  6 Sep 2023 19:46:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694026002;
	bh=a5oirTrjLA7TMiQ4uyfcYy8v29FjDAaKEm0yAlL7Rvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LcYgyIW5RBO0VKt/ZMCIAjbsSeBbHliLFf7OjHL0/mit74Pk5bNYyQ7pCrEQE4/Sd
	 uiun/jyY0X+RCSeLAWOBocAXCjetW1+ryfXxDHvWwXbJhAW4Q6Up9mAv9U5agHlj2s
	 36Xj2cWr1wmZEWNYbnsW6PNqDET+CErOBblEd8zOlOY0vrqCdsz5Ytxtq46sVD2uOP
	 qSrqecc+hXXNBLIgy5J8PpLHHZAnE7dWtNgnJ16FzNJ9vN3ojysK6J8rSBxDv18tlA
	 D0noUcVjbd5EwcDDvpQ0wmhvf/iwl2dKEnIFQcGkwfB4VjZxruOO8vGx9uSJD5+MTk
	 YCSQEgv/N+Eqw==
Message-ID: <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
Date: Wed, 6 Sep 2023 20:46:16 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Please add new Android branches
Content-Language: en-US
To: Todd Kjos <tkjos@google.com>
Cc: kernelci@lists.linux.dev
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com>
 <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Todd,

On 05/09/2023 19:18, Todd Kjos wrote:
> On Thu, Aug 10, 2023 at 8:56 AM Todd Kjos <tkjos@google.com> wrote:
>>
>>
>>
>> On Tue, Jul 11, 2023 at 4:57 AM Guillaume Tucker <guillaume.tucker@collabora.com> wrote:
>>>
>>> Hi Todd,
>>>
>>> On 11/07/2023 00:41, Todd Kjos wrote:
>>>> Please add the following new Android branches to kernelci testing.
>>>>
>>>> repo: https://android.googlesource.com/kernel/common
>>>> branches:
>>>> - android15-6.1
>>>> - android14-6.1-lts
>>>> - android14-5.15-lts
>>>
>>> I've created this PR accordingly:
>>>
>>>   https://github.com/kernelci/kernelci-core/pull/2002
>>>
>>> Please note that we're now operating with reduced build coverage
>>> due to some temporary limitations with our Azure subscription.  I
>>> know the Android kernel builds should be covered by the GCP
>>> clusters but right now the system is designed to distribute
>>> kernel builds randomly across all clusters so we can't easily tie
>>> Android builds to the Android clusters.  Hopefully we'll find a
>>> solution to go back to normal coverage within a week or two.
>>
>>
>> Hi Guillaume, Any ETA for when the full set of builds is restored? We still have greatly reduced build coverage and it's been a month.
> 
> Ping. We are getting a lot less value out of kernelci with the greatly
> reduced set of builds for the Android kernels. When will the full
> build coverage be resumed?
> 
> If it needs to stay reduced, can we decide precisely which builds are
> done for Android kernels?

Sorry for the slow reply.

I think it's fine now to re-enable the Android builds and maybe
we should also take this opportunity to confirm which ones are
the most relevant to you guys.  As part of the process of
adjusting the build coverage, I also fixed the GKI builds which I
thought were the main ones.  Even if there is enough build
capacity to build "everything", keeping it streamlined to what is
really useful makes the overall system more effective.

Are there any particular combinations of arch, config, compilers
you care about more than others?

Thanks,
Guillaume

