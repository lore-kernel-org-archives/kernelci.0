Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD711C92
	for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 08:22:15 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:fcef:69b2:fccd:bd45] (unknown [IPv6:2001:861:4a40:8620:fcef:69b2:fccd:bd45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A523966072FA;
	Mon, 25 Sep 2023 09:22:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695630133;
	bh=Nd2EbIk+8jrnGJswPz1QfBxnpihb7q+Ia59cNFuXO4c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ifyyqq6o7fTIm3/Sk4QQGebVolFsCbmSAAWE3P+nZHJbEKrbfx8NdUUcXuew7hdZN
	 QbcsHc2r4gSvst3qmFf2VKGxlwWoeBx+i/qaAeUj/Tr0dYfN4zaZQooWNMWZqXto1/
	 YW6NMsmk5cZUBdLguSm6hmD3tnXiLbDwgZu6alnMErATr1o5Zpw9Z3fQg49mtFbwN7
	 8qvp/7DijW2d213SDYfcEZI+zPpCQ77GfaqgYeguByjd6HVAiwNjnGrU85urzEvSdu
	 n7cL4iWxvCnAYwjrHBqrAHUYY5fZ0AjTKaltKKV2pGLtovzcGpZTanhJbe6q9ton2h
	 FBTeYsaYl5m5g==
Message-ID: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
Date: Mon, 25 Sep 2023 10:23:31 +0200
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
To: Todd Kjos <tkjos@google.com>, Viktor Martensson <vmartensson@google.com>,
 Betty Zhou <bettyzhou@google.com>
Cc: kernelci@lists.linux.dev
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com>
 <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
 <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2023 00:54, Todd Kjos wrote:
> Guillaume,
> 
> How about this for android trees:
> 
> 1) same compilers as current config (gcc-10, clang-14)
> 2) archs: arm, arm64, i386, x80_64, riscv
> 3) same configs as current android tests
> 4) plus configs used by corresponding stable kernel
> (https://linux.kernelci.org/job/stable) not included in #3

OK thanks, I think we can set this up easily.  We'll get back to
you if there's any ambiguity.

> We get a nice benefit from sync'ing with the stable kernels since it
> allows us to tell which issues originate upstream and which are
> introduced by android changes. It's also useful to build each with
> both toolchains so we can expose the cases where gcc-10 is OK but
> clang-14 has issues (and visa-versa).
> 
> I don't think we need to build all of the combinations if there are
> too many builds - we could trim out some of the configs from #4 (you
> can recommend which).

OK, we can look at past results or optimise incrementally over
the weeks to streamline the overall build coverage.

> We'd also like to start in an all-green state. So let's trim out the
> error cases that aren't caused by android kernel code. I think there
> are some 32-bit cases that fail with the clang-14 tools and some other
> cases that fail in stable.
> 
> Could we start with all of the builds for #1 - #4 and then tune it up
> after a few runs to get rid of long-failing cases and/or to just
> reduce the load on the build service?

I believe this part of the discussion is still unresolved with
Nick, and maybe it would make more sense to address this when the
builds get moved to the new API where we'll have more flexibility
and more accurate log parsing etc.

Another aspect that wasn't too clear in the discussions, should
it be clang-14 or a more recent version?  Right now, mainline
builds already include clang-11 (oldest supported one) and
clang-16 and linux-next builds use clang-17.  So there is
upstream build coverage for them, and if clang-14 is the standard
version for Android kernels then I guess it would make sense to
stick to it - but that's up to you.  Doing both clang-14 and
clang-17 for Android builds would seem overkill to me though.

Cheers,
Guillaume

> On Wed, Sep 6, 2023 at 12:50 PM Todd Kjos <tkjos@google.com> wrote:
>>
>> +Viktor Martensson +Betty Zhou
>>
>> Guillaume,
>>
>> I think that's a great idea. I'll get back to you with the set of
>> configs, arch, compilers we'd like to have coverage for.
>>
>> -Todd
>>
>>
>> On Wed, Sep 6, 2023 at 11:46 AM Guillaume Tucker
>> <guillaume.tucker@collabora.com> wrote:
>>>
>>> Hi Todd,
>>>
>>> On 05/09/2023 19:18, Todd Kjos wrote:
>>>> On Thu, Aug 10, 2023 at 8:56 AM Todd Kjos <tkjos@google.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On Tue, Jul 11, 2023 at 4:57 AM Guillaume Tucker <guillaume.tucker@collabora.com> wrote:
>>>>>>
>>>>>> Hi Todd,
>>>>>>
>>>>>> On 11/07/2023 00:41, Todd Kjos wrote:
>>>>>>> Please add the following new Android branches to kernelci testing.
>>>>>>>
>>>>>>> repo: https://android.googlesource.com/kernel/common
>>>>>>> branches:
>>>>>>> - android15-6.1
>>>>>>> - android14-6.1-lts
>>>>>>> - android14-5.15-lts
>>>>>>
>>>>>> I've created this PR accordingly:
>>>>>>
>>>>>>   https://github.com/kernelci/kernelci-core/pull/2002
>>>>>>
>>>>>> Please note that we're now operating with reduced build coverage
>>>>>> due to some temporary limitations with our Azure subscription.  I
>>>>>> know the Android kernel builds should be covered by the GCP
>>>>>> clusters but right now the system is designed to distribute
>>>>>> kernel builds randomly across all clusters so we can't easily tie
>>>>>> Android builds to the Android clusters.  Hopefully we'll find a
>>>>>> solution to go back to normal coverage within a week or two.
>>>>>
>>>>>
>>>>> Hi Guillaume, Any ETA for when the full set of builds is restored? We still have greatly reduced build coverage and it's been a month.
>>>>
>>>> Ping. We are getting a lot less value out of kernelci with the greatly
>>>> reduced set of builds for the Android kernels. When will the full
>>>> build coverage be resumed?
>>>>
>>>> If it needs to stay reduced, can we decide precisely which builds are
>>>> done for Android kernels?
>>>
>>> Sorry for the slow reply.
>>>
>>> I think it's fine now to re-enable the Android builds and maybe
>>> we should also take this opportunity to confirm which ones are
>>> the most relevant to you guys.  As part of the process of
>>> adjusting the build coverage, I also fixed the GKI builds which I
>>> thought were the main ones.  Even if there is enough build
>>> capacity to build "everything", keeping it streamlined to what is
>>> really useful makes the overall system more effective.
>>>
>>> Are there any particular combinations of arch, config, compilers
>>> you care about more than others?
>>>
>>> Thanks,
>>> Guillaume
>>>

