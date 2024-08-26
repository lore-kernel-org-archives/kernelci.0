Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03016146017
	for <kernelci@lists.linux.dev>; Mon, 26 Aug 2024 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668679; cv=none; b=tpqDUahwxQSURs+GVa8tdD1L7N9u9WTpfbQ1n7F+n4QrseUttgasH1U9KxaWDLWK1Lt4fH2j+YZTm30SVk4+z19g7uheBl9CXAV1HjZPjCMLrdIOphiNIQRxlJ/neXR5fq+WeMII4iksKpcsMdQZd+DO3fBvi7grLLPXZ+w4GVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668679; c=relaxed/simple;
	bh=jy5oW+bm5fGFj4uLkUiH2N1gu5A64bTbhf6qNJ7rumc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=pmXkRkmErSyvWjmHaix2MQrAhzflyqRZPx7jPjeLuZxLM1u54vXQCR8yKZq8+Oog51GaaN6HGnJIXb41Ri079ANltk+KpwI/SH2M69rUnVZq4N0v3UfxWU7VG4SN4TKBAZEy+qeRyeaxVkUJ/ahdqiBFfmSI3JNWDRb3sLAQnss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+geNeR9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+geNeR9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37182eee02dso2182980f8f.1
        for <kernelci@lists.linux.dev>; Mon, 26 Aug 2024 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724668676; x=1725273476; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYmlqxOrrap/I/HisUdXDZ/pHp/pkt+LPC8OanFiHMg=;
        b=N+geNeR9msojmpAyT+B9O9ub2NoFB02HDg7rH0D2VnRnKZJgIrRza7iYvybCYzJiYa
         XyGDemrVu66qws+//q1J+Mw0RC0njGoeIOOTRqsIdFiOkzWWsdX6GXNXZS+4C4wM0Cw4
         kdBwV0xFscAK89YjzTe3gtknMEbCpXt6UTD4/Pg0gSU8cvKNYPo+PJI/D0gzDHt3yyHH
         higmYz1AD7xlJXLNvDBOsv4OictUUjvAWDzft3YtE0TQM5mT+axOQ6ZGowAXa6+cHO1R
         AQhnaqR84I0Q5l5izZkYi5u8XxtdUjX6+nCTvet/v7DbKcqnlCYLOA9CrL2CgTwGpft/
         DQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668676; x=1725273476;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYmlqxOrrap/I/HisUdXDZ/pHp/pkt+LPC8OanFiHMg=;
        b=JMaSUTGvPr0wXp4Xqd8rRWFbXvaJLhBL5pKmgckLCtL5h2wA00Vpk9Be4VnG+y8+l9
         COzkvOzSM3Bap124F0v0EPLDCczgUdoziJw6PsFIszexu9c59Pc2/h3wrzErh8T18AZV
         HVIAbMfsJS49Nic162lLclSPTI2hX57oUuKfukHINm/KQvGOH/INJyfVPKCdgRNkQllM
         JkNtrcng/vYiqiDYJXYmtrXIYoxYTwiGlIyRsRNKP1FmpA1eN9KypoYdrFCliUnuUAv5
         1FjrZK5n1gxYd/pZfAACBfMkqzi8efs1C6lnMgaEcdMy2iOsLi3hJWL9E2LGgqUn+erq
         sIuw==
X-Forwarded-Encrypted: i=1; AJvYcCVYFUzj9xs9D4yNv+Zx7WjoW/gsq/mMVM2RGAGIxSyj/WgpTRioaPXg8vOXhlwh6RcD2VuJy/6vYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNm2VEb0VIaUtPMmatA2irI2LamQC3dlMTVixOpvUDVBJiwrfs
	Fe6ryOmi3PmuY4P67hqbDP2majw7b54/SDLP+AtBE0iSYmpEQWQi
X-Google-Smtp-Source: AGHT+IFzAHDtCv8or5UNZ2SiPaAZC/Qx1E6XPmthvpqorBeDRdZbK/GiXQuneNsu3Fk3MO7lz2L0Ig==
X-Received: by 2002:adf:fc01:0:b0:360:70e3:ef2b with SMTP id ffacd0b85a97d-37310ff3cdamr4783258f8f.26.1724668675736;
        Mon, 26 Aug 2024 03:37:55 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffb71sm10447748f8f.83.2024.08.26.03.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 03:37:55 -0700 (PDT)
Message-ID: <83325732-1607-48ba-bd71-e21c696f6912@gmail.com>
Date: Mon, 26 Aug 2024 13:37:53 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] KCIDB: Support non-binary test outputs V3
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
 <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
 <3adfebc0-75df-40a3-9a8f-6b8bd12bb725@gmail.com>
Content-Language: en-US
In-Reply-To: <3adfebc0-75df-40a3-9a8f-6b8bd12bb725@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/24 12:50 PM, Nikolai Kondrashov wrote:
> On 8/16/24 5:05 PM, Nikolai Kondrashov wrote:
>> Aaand, redone again:
>>
>> https://github.com/kernelci/kcidb-io/pull/85/commits/86b75f6bf6e4f74e594a301382f2b77cfe4cbbd9
>>
>> I switched the value from integer to floating-point, as that allows us to get
>> rid of the exponent field, at the cost of a small accuracy loss. The storage
>> requirements are still 64 bits.
> 
> If there are no more objections, I'm going to merge this on Wednesday, Aug 21.

Support for this (and the "compatible" field) has been merged and deployed
last week. The sooner you send us your data, the sooner we'll figure out how
to process it!

Thank you everyone for the comments!
Nick

