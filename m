Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7182F3D
	for <kernelci@lists.linux.dev>; Tue,  7 Nov 2023 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CSr/v2Am"
Received: from [100.94.43.135] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6865566074B9;
	Tue,  7 Nov 2023 08:26:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699345597;
	bh=mZbKLjfIaJb0k0xyEGReXyr7HtcXK7hP6JLpSaHg+cY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CSr/v2Amk235Z2wNcgR9XWppHwXXuC7ARb50Aq69YejmqWzjGpqGYaNOtftIkq7FH
	 hDUb7ww90cZhK7l3hV3mRs5MRRRjrErv5JxHacQQ4NlDQkAuwaqQm6mlSAU1orX7Zw
	 hXJTiHPkrynPLvKfHUsqceh/J4GpfFa34P9xMNyz2PTnQzhs0XeUHjc6bVg4DW4Toe
	 llD58aFBsRmGO+SfmcLNctbQEg6mE9g7uDp8o2TA1+2JtpaIbu+GXt2Rulmgfz3Dn9
	 xoCytecJThz1bw/AkaPd9NbkgfrqfQ+IABYoC6ngBnaKWrZm0fXiW28i2XVqKQKYe9
	 v5CIAsPKdsndA==
Message-ID: <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
Date: Tue, 7 Nov 2023 09:26:34 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Please add new Android branches
Content-Language: en-US
To: Todd Kjos <tkjos@google.com>, Denys Fedoryshchenko <denys.f@collabora.com>
Cc: Viktor Martensson <vmartensson@google.com>,
 Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com>
 <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com>
 <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
 <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 19:03, Todd Kjos wrote:
> On Fri, Nov 3, 2023 at 6:57 PM Denys Fedoryshchenko
> <denys.f@collabora.com> wrote:
>>
>> Hello Todd,
>>
>> I've seen your request for updates on the Android tests. Guillaume is
>> probably swamped at the moment, so I'm jumping in to help out.
>>
>> Let me know if there's anything I've missed or if you have any pointers
>> for me as I get up to speed:
>>
>> I've updated android tree configs to use clang-17, instead of 14.
>> Regarding the stable kernel configurations, the differences are as
>> follows:
>>
>>     Added 'imx_v6_v7_defconfig'
>>     Added 'omap2plus_defconfig'
>>     Added 'vexpress_defconfig'
>>
>> Additionally, in our stable trees, we include 'arm64-chromebook' and
>> 'x86-board' config fragments, which are tailored for running on actual
>> hardware. Would you require these as well?
> 
> It would be great to add this to ensure we haven't broken anything
> that is supported in stable.

I don't think it's worth adding these extra builds, the Android
kernel trees aren't really tested in LAVA labs and these
fragments are only there to enable more platforms to boot with
mainline.

>> We are also building kselftests, which are useful only for real
>> hardware tests. Should we build them for the Android trees?
> 
> Yes, please do.

It's already done, we don't need to add anything else.  The
kselftest build step is run with all builds now.  Just some
builds have more config fragments enabled to build more kselftest
binaries, but that's not useful as kselftest isn't run with
Android trees anyway.

>> Relevant PR: https://github.com/kernelci/kernelci-core/pull/2165
>>
>> If it is ok, i will merge it at Sunday and enable in monday production
>> update.
> 
> Thanks Denys. I expect we will want to watch these builds for a few
> weeks and probably trim out a few that we don't think are as useful
> (this is part of the discussion on this thread). I'll reach out when
> we are ready for that.
> 
> I look forward to seeing the increased coverage!

Probably we should remove the fragments for x86-chromebook,
x86-board and kselftest for the reasons explained above.  We
really need to make sure the build and test configs are
streamlined, what might look like more coverage can actually be
just added noise that makes the system less efficient and
increase the costs of operation.

Then as mentioned before, I'm sure you'll be glad to know that
the GKI builds got fixed in July as part of the efforts to
improve the overall signal/noise ratio.

Thanks,
Guillaume

>> On Thu, 2023-11-02 at 15:11 -0700, Todd Kjos wrote:
>>> Guillaume, any ETA on when we can ramp up the Android tests as
>>> discussed on this thread?
>>>
>>>
>>> On Tue, Oct 17, 2023 at 1:42 PM Todd Kjos <tkjos@google.com> wrote:
>>>>
>>>> Guillaume,
>>>>
>>>> I guess we didn't get to a complete plan... From above, can we
>>>> enable these:
>>>>
>>>> 1) compilers: gcc-10, clang-17
>>>> 2) archs: arm, arm64, i386, x80_64, riscv
>>>> 3) same configs as current android tests
>>>> 4) plus configs used by corresponding stable kernel
>>>> (https://linux.kernelci.org/job/stable) not included in #3
>>>>
>>>>
>>>> On Mon, Sep 25, 2023 at 8:17 AM Todd Kjos <tkjos@google.com> wrote:
>>>>>
>>>>> On Mon, Sep 25, 2023 at 1:22 AM Guillaume Tucker
>>>>> <guillaume.tucker@collabora.com> wrote:
>>>>>>
>>>>>> On 20/09/2023 00:54, Todd Kjos wrote:
>>>>>>> Guillaume,
>>>>>>>
>>>>>>> How about this for android trees:
>>>>>>>
>>>>>>> 1) same compilers as current config (gcc-10, clang-14)
>>>>>>> 2) archs: arm, arm64, i386, x80_64, riscv
>>>>>>> 3) same configs as current android tests
>>>>>>> 4) plus configs used by corresponding stable kernel
>>>>>>> (https://linux.kernelci.org/job/stable) not included in #3
>>>>>>
>>>>>> OK thanks, I think we can set this up easily.  We'll get back
>>>>>> to
>>>>>> you if there's any ambiguity.
>>>>>>
>>>>>>> We get a nice benefit from sync'ing with the stable kernels
>>>>>>> since it
>>>>>>> allows us to tell which issues originate upstream and which
>>>>>>> are
>>>>>>> introduced by android changes. It's also useful to build each
>>>>>>> with
>>>>>>> both toolchains so we can expose the cases where gcc-10 is OK
>>>>>>> but
>>>>>>> clang-14 has issues (and visa-versa).
>>>>>>>
>>>>>>> I don't think we need to build all of the combinations if
>>>>>>> there are
>>>>>>> too many builds - we could trim out some of the configs from
>>>>>>> #4 (you
>>>>>>> can recommend which).
>>>>>>
>>>>>> OK, we can look at past results or optimise incrementally over
>>>>>> the weeks to streamline the overall build coverage.
>>>>>>
>>>>>>> We'd also like to start in an all-green state. So let's trim
>>>>>>> out the
>>>>>>> error cases that aren't caused by android kernel code. I
>>>>>>> think there
>>>>>>> are some 32-bit cases that fail with the clang-14 tools and
>>>>>>> some other
>>>>>>> cases that fail in stable.
>>>>>>>
>>>>>>> Could we start with all of the builds for #1 - #4 and then
>>>>>>> tune it up
>>>>>>> after a few runs to get rid of long-failing cases and/or to
>>>>>>> just
>>>>>>> reduce the load on the build service?
>>>>>>
>>>>>> I believe this part of the discussion is still unresolved with
>>>>>> Nick, and maybe it would make more sense to address this when
>>>>>> the
>>>>>> builds get moved to the new API where we'll have more
>>>>>> flexibility
>>>>>> and more accurate log parsing etc.
>>>>>>
>>>>>> Another aspect that wasn't too clear in the discussions, should
>>>>>> it be clang-14 or a more recent version?  Right now, mainline
>>>>>> builds already include clang-11 (oldest supported one) and
>>>>>> clang-16 and linux-next builds use clang-17.  So there is
>>>>>> upstream build coverage for them, and if clang-14 is the
>>>>>> standard
>>>>>> version for Android kernels then I guess it would make sense to
>>>>>> stick to it - but that's up to you.  Doing both clang-14 and
>>>>>> clang-17 for Android builds would seem overkill to me though.
>>>>>
>>>>> I'd be fine with tracking the latest stable clang version (clang-
>>>>> 17
>>>>> now) and dropping clang-14 so we can help the clang team find
>>>>> regressions.
>>>>>
>>>>>>
>>>>>> Cheers,
>>>>>> Guillaume
>>>>>>
>>>>>>> On Wed, Sep 6, 2023 at 12:50 PM Todd Kjos <tkjos@google.com>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> +Viktor Martensson +Betty Zhou
>>>>>>>>
>>>>>>>> Guillaume,
>>>>>>>>
>>>>>>>> I think that's a great idea. I'll get back to you with the
>>>>>>>> set of
>>>>>>>> configs, arch, compilers we'd like to have coverage for.
>>>>>>>>
>>>>>>>> -Todd
>>>>>>>>
>>>>>>>>
>>>>>>>> On Wed, Sep 6, 2023 at 11:46 AM Guillaume Tucker
>>>>>>>> <guillaume.tucker@collabora.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Todd,
>>>>>>>>>
>>>>>>>>> On 05/09/2023 19:18, Todd Kjos wrote:
>>>>>>>>>> On Thu, Aug 10, 2023 at 8:56 AM Todd Kjos
>>>>>>>>>> <tkjos@google.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On Tue, Jul 11, 2023 at 4:57 AM Guillaume Tucker
>>>>>>>>>>> <guillaume.tucker@collabora.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Todd,
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/07/2023 00:41, Todd Kjos wrote:
>>>>>>>>>>>>> Please add the following new Android branches to
>>>>>>>>>>>>> kernelci testing.
>>>>>>>>>>>>>
>>>>>>>>>>>>> repo:
>>>>>>>>>>>>> https://android.googlesource.com/kernel/common
>>>>>>>>>>>>> branches:
>>>>>>>>>>>>> - android15-6.1
>>>>>>>>>>>>> - android14-6.1-lts
>>>>>>>>>>>>> - android14-5.15-lts
>>>>>>>>>>>>
>>>>>>>>>>>> I've created this PR accordingly:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> https://github.com/kernelci/kernelci-core/pull/2002
>>>>>>>>>>>>
>>>>>>>>>>>> Please note that we're now operating with reduced
>>>>>>>>>>>> build coverage
>>>>>>>>>>>> due to some temporary limitations with our Azure
>>>>>>>>>>>> subscription.  I
>>>>>>>>>>>> know the Android kernel builds should be covered by
>>>>>>>>>>>> the GCP
>>>>>>>>>>>> clusters but right now the system is designed to
>>>>>>>>>>>> distribute
>>>>>>>>>>>> kernel builds randomly across all clusters so we
>>>>>>>>>>>> can't easily tie
>>>>>>>>>>>> Android builds to the Android clusters.  Hopefully
>>>>>>>>>>>> we'll find a
>>>>>>>>>>>> solution to go back to normal coverage within a
>>>>>>>>>>>> week or two.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Hi Guillaume, Any ETA for when the full set of builds
>>>>>>>>>>> is restored? We still have greatly reduced build
>>>>>>>>>>> coverage and it's been a month.
>>>>>>>>>>
>>>>>>>>>> Ping. We are getting a lot less value out of kernelci
>>>>>>>>>> with the greatly
>>>>>>>>>> reduced set of builds for the Android kernels. When
>>>>>>>>>> will the full
>>>>>>>>>> build coverage be resumed?
>>>>>>>>>>
>>>>>>>>>> If it needs to stay reduced, can we decide precisely
>>>>>>>>>> which builds are
>>>>>>>>>> done for Android kernels?
>>>>>>>>>
>>>>>>>>> Sorry for the slow reply.
>>>>>>>>>
>>>>>>>>> I think it's fine now to re-enable the Android builds and
>>>>>>>>> maybe
>>>>>>>>> we should also take this opportunity to confirm which
>>>>>>>>> ones are
>>>>>>>>> the most relevant to you guys.  As part of the process of
>>>>>>>>> adjusting the build coverage, I also fixed the GKI builds
>>>>>>>>> which I
>>>>>>>>> thought were the main ones.  Even if there is enough
>>>>>>>>> build
>>>>>>>>> capacity to build "everything", keeping it streamlined to
>>>>>>>>> what is
>>>>>>>>> really useful makes the overall system more effective.
>>>>>>>>>
>>>>>>>>> Are there any particular combinations of arch, config,
>>>>>>>>> compilers
>>>>>>>>> you care about more than others?
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Guillaume
>>>>>>>>>
>>>>>>
>>>
>>
>>

