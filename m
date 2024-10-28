Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79904AEE0
	for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116035; cv=none; b=BZZ2N9tUJivl9VIrQK/dpbkBTU03YswdOig4l/fuZWUkxehqn+si6p3HjhMJBQky3W6aW+9WkEHn+W3eRzIhrFUSE8Th1ZP2mlOmrqFFq5BRQw1SAM+GcwtjFXZLfTzDPyH/2RMP1zE8DCb1mSl3hGcZKjkPD/OewLJgE6NKGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116035; c=relaxed/simple;
	bh=CyGdrC5AP5Gf2OwQD03nZCs8THhCto0FN1VjOkWykQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oW2EvlHJjpHI4y51E0RH7ysqgtggQ99hdf6Dl5cAIk1e5OWtK51j6+PsFGMd3TiZDd99B1at3fC4QKGvG/yypoYi5PVxcBRRb4IoLZMja917KIV+RprMx6vAdDQIjRIGV10CvqJD+WfJjOte7marA8dPj6w+1ww3cWhdllv62Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMOPFnjr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMOPFnjr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso41486925e9.1
        for <kernelci@lists.linux.dev>; Mon, 28 Oct 2024 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730116032; x=1730720832; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GmPxLOXLwlvyU12rdreUV0y6uiinQq21Afh0+Kh1ub8=;
        b=mMOPFnjrJN/nl45lBT8vyM9S58mA63VbsyIEGtp++l8+mRBwJ8A94s7pWt4Ff+8yBs
         mBQG/TY6VaWrlbz2mzcTWdpqCi6+1X0X3cvNz0EtlGF/FKowhEIFmgLA1HX65sxQoLjG
         FXK07P+V5HdxMSWF+3O5e8lfJalwpDLdc2jxNxZErHGqcJIuaX3SIMZpW7/+OdwvMNmC
         oJ93kLqFm07g8Hz63JNwMgnlD7lxiFqI7Jwoh+DqZdbdaAZFH3BgbYvZHNa8ST5OBLk/
         wcKoiViCXxA5miOs2a0VuQ13ww+SHcuZgBSB7B+AtVCVJx+rmDOHRVLeGH+wnewQQANh
         EXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116032; x=1730720832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmPxLOXLwlvyU12rdreUV0y6uiinQq21Afh0+Kh1ub8=;
        b=BGFDkzVNod0vD/R5deUIi+nTirZ/zPLBJJHHOmdjLc6spqxo7n141VUTcCHCyOBdoB
         5TCj9YnvnVC40hauBLmeH89NJy8+MNOhZnPziPifXdmtgCW9lGIXxACih8wALnBphaFe
         jf6TRfhgu35olzCRks0Nujr5wg69sNZBPAM/3Da6mm71gi7awoZ5xbkRlEVjYBsiPc59
         mdsL48XnwN9Yx0j4Tpp1ucwznYSIMN6nTh1LASmNCmdmukor3WqYVbMn3uScqY5RlavP
         Hd7aaKcv4vbGZwaZJrF5FWjA3SGhZ1v/azWXjGWoUIqNtfCc6L4kqf8T5hft3dYDrngI
         sh+A==
X-Forwarded-Encrypted: i=1; AJvYcCWMsIzWrxoHWUOpw+HneqlOH4N9k7W0OvPJBQXvYRAhTtdaH1T+Wk+m441pDiSUre3jEFYSRDYKpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVnif0os65C+NRx90e2IugqmYFO8qJrYIJQd3Pq45eUdYTEDQ/
	CrzFfDc1CnchBVLpG0mAz+DTYNsFVgkAsajMsbiViEYDgNaqBtcf
X-Google-Smtp-Source: AGHT+IGnesEwE8Dln5W2eqYo1FBow7iGOz3bJ3Erz0uvgSwt5bw0FfhHURieg4RUiGjbNJ1SmP+0EA==
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr56423845e9.27.1730116032255;
        Mon, 28 Oct 2024 04:47:12 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360eb09sm106908565e9.48.2024.10.28.04.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:47:11 -0700 (PDT)
Message-ID: <bad65b80-b66f-4fe6-a367-43a9c5a300e6@gmail.com>
Date: Mon, 28 Oct 2024 13:47:11 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TSC Votes on Chat Choice
To: Trilok Soni <quic_tsoni@quicinc.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <e84eac0b-f5de-47e1-9a1e-cb4ae1947b0d@gmail.com>
 <b4336093-9136-4a00-9191-d8946a594ff2@quicinc.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <b4336093-9136-4a00-9191-d8946a594ff2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/24 12:10 AM, Trilok Soni wrote:
> On 10/21/2024 3:48 AM, Nikolai Kondrashov wrote:
>> It seems that the majority would prefer moving to Discord, and have a bridge
>> with IRC. Although there are "Matrix and IRC bridge" advocates too
> 
> I would prefer to use the Discord. Best part here is that I can install it on 
> my mobile but can't install in my work computer due to restrictions. 
> 
> I like discord because it keeps me near to the technologies used
> by my teenage son :).

Thanks for the feedback :)
My daughter is also all-in on Discord :D

Nick
