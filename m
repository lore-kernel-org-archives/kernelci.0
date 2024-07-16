Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D306FB8
	for <kernelci@lists.linux.dev>; Tue, 16 Jul 2024 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122805; cv=none; b=aRP2MIsSwnVnORkU/XGBCmE1YM2ePFYTG/6vsKc9OX7Sn1kmru+ULyyOzWFx1ZuLKYHzrZ/89DPYs2eMJ5PcJZ8zh5LjYlct34GFlBoBKK6oSZxQidTEt9o4YKjYzxq853bRrikiERAcLrIoYk0dpXuX9OiNMVqZxHcwcKvYaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122805; c=relaxed/simple;
	bh=G2VbuFGJldh2ljMi87HaA1K2kAK79sI/kg2vBUszNYY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l5BJO5V/bLsHrn3PnQfKoIax6jldQYroLyM1XbFtCmm0vOmqxOkJT9qdgVVVbDU8F/NZD9A9WEVMFH/MX75Nc5kBsFOo5/FqspLSlmv5z3pYnNWaV4jAPUtyw9mgMO3PobYnspnYF/3rKB2/ysqCkA9+3HvGmaP4om9Wq8EN5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h7HmlH6G; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h7HmlH6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721122802;
	bh=G2VbuFGJldh2ljMi87HaA1K2kAK79sI/kg2vBUszNYY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=h7HmlH6GbL1X+vqQdOCi0eMmFMdlAw53kgVySGLJI7Z4KGPWGo0EErCJZNL5BLl5I
	 Mocim2yYkfy2wiDNRc4fz/An9zfN5B5GbXW+ELfDsw8fbD8TTQx31HgdtAlcxRE1Rg
	 IzonM1yfZzFFvnrzazteNRp0rCXKO73o9stNfhmnAHttHRRdZah4FwH8baGc+79q8e
	 Jdje7IWn0JUiId21zCf4c/13DFaU8+p8UUHKxfLXeN4dk4o5dbPwKqSYunB0qBVdbE
	 2uAyeAzyTDtRYDJIDwMGryzCEb/Ng4WU9PHAvAHawpcivO2imwuZ8LgZkmH4+s7NrT
	 xMWNdB18FCBYg==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4596D3780C13;
	Tue, 16 Jul 2024 09:39:58 +0000 (UTC)
Message-ID: <ddbb549e-7964-4f55-8a7e-69140134b9c6@collabora.com>
Date: Tue, 16 Jul 2024 14:39:53 +0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev,
 Viktor Martensson <vmartensson@google.com>, Betty Zhou
 <bettyzhou@google.com>, Denys Fedoryshchenko <denys.f@collabora.com>
Subject: Re: new branch + more recent gcc?
To: Todd Kjos <tkjos@google.com>
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
 <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
 <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
 <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
 <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
 <CAHRSSEz_=hs_p=u4XCuGx2xpd36rkycOof7sOh0e1cXtnRXODA@mail.gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <CAHRSSEz_=hs_p=u4XCuGx2xpd36rkycOof7sOh0e1cXtnRXODA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Todd,

It seems like some branches in android repository have been deprecated. We
are thinking of removing them from the KernelCI. Is it okay to do so? Or do
you want us to continually running tests on these deprecated branches for a
little while? I'm not sure about the deprecation schedule for these.

android_4.9-p, android_4.9-q-release, android_4.14-p,
android_4.14-q-release, android_4.14-stable, android_4.19-q-release

Thanks,
Usama

On 7/11/24 10:20 PM, Todd Kjos wrote:
> Denys, it looks like you fixed it. Thanks!
> 
> On Tue, Jul 9, 2024 at 10:38 AM Denys Fedoryshchenko
> <denys.f@collabora.com> wrote:
>>
>> I am investigating cause, likely one of cross-compiler images is broken
>> and blocking k8s queue. It is likely will be fixed within few hours and
>> few more needed to clean the queue.
>>
>> Sorry for the hiccup.
>>
>> On Tue, 2024-07-09 at 10:02 -0700, Todd Kjos wrote:
>>> Something isn't right. We've dropped from about 35 builds per android
>>> kernel branch down to only 1-5 builds. Can we get all those other
>>> builds back?
>>>
>>> See https://linux.kernelci.org/job/android/
>>>
>>>
>>> On Wed, Jul 3, 2024 at 11:09 PM Muhammad Usama Anjum
>>> <usama.anjum@collabora.com> wrote:
>>>>
>>>> On 7/2/24 8:45 PM, Todd Kjos wrote:
>>>>> On Tue, Jul 2, 2024 at 6:12 AM Mark Brown <broonie@kernel.org>
>>>>> wrote:
>>>>>>
>>>>>> On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
>>>>>>
>>>>>>> 1) use gcc-13 instead of gcc-10 for android kernel builds
>>>>>>
>>>>>> It sounds like you just need an upgrade here rather than
>>>>>> specifically
>>>>>> GCC 13?  The reason I ask is that GCC 12 is the standard
>>>>>> compiler in
>>>>>> Debian Bookworm so might be easier to update to quickly.
>>>>>
>>>>> GCC 12 would be fine
>>>>>
>>>>>>
>>>>>>> 2) add android15-6.6-lts branch to kernelci testing
>>>>>>
>>>>>> https://github.com/kernelci/kernelci-core/pull/2597
>>>>>>
>>>>>>> 3) discontinue all gki_defconfig builds
>>>>>>
>>>>>> https://github.com/kernelci/kernelci-core/pull/2598
>>>>>>
>>>>>> (not 100% sure I got that one right, have to see how it goes on
>>>>>> staging.)
>>>>>
>>>>> Thanks!
>>>>
>>>> I've opened PR to enable android builds including android15-6.6-lts
>>>> in new
>>>> kernelci:
>>>> https://github.com/kernelci/kernelci-pipeline/pull/667
>>>>
>>>>>
>>>>
>>>> --
>>>> BR,
>>>> Muhammad Usama Anjum
>>>
>>

-- 
BR,
Muhammad Usama Anjum
