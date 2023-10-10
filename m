Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58115AEA
	for <kernelci@lists.linux.dev>; Tue, 10 Oct 2023 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gjxf8mI4"
Received: from [IPV6:2001:861:4a40:8620:d901:c525:a85f:2da3] (unknown [IPv6:2001:861:4a40:8620:d901:c525:a85f:2da3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E2D56607038
	for <kernelci@lists.linux.dev>; Tue, 10 Oct 2023 11:21:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696933294;
	bh=jT5eHPzsc3YMFBFDWMUbP4J/oFTbe52sXwRBd7Htsrw=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Gjxf8mI4vLLZkFrs/HuhFy8j5U8PSujJRvyW1+9XDqoyr93FhDOi7F8A5L2EGZPGp
	 DIEfZt2J2OprQpgEPfXuRN1AkoREn2Etw96IVScJOeC4Wgn1PnJyfMD2p1yiEue+pT
	 qdKmvRrRw8L+2Al1Qy9Yfcjt54PE60flSy2q94o8LdhbIhbtUH5/JegAEdtLx4nl94
	 blXzW189wNmquu/lauRcAXfBdBY/MS1UKgJUHASkhCpUnSSn1LajvcfNgJqja/UGj5
	 Bm7ZjMp7nWB+SL/ZGCWHEQaLmGp2a2WvshlV1InJOdAokW9foIO40/GdeqOAqZuDFV
	 7c5r5HjqkyoZg==
Message-ID: <8233450c-6a62-ae50-7912-dc849e8f2223@collabora.com>
Date: Tue, 10 Oct 2023 12:22:16 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: New open hours for AMER-EMEA timezones
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <f059956c-30ac-2ada-8c19-8bacc0b8b969@collabora.com>
Content-Language: en-US
In-Reply-To: <f059956c-30ac-2ada-8c19-8bacc0b8b969@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2023 10:25, Guillaume Tucker wrote:
> Hello,
> 
> As discussed previously several times in the past and more
> recently with Kevin and Nikolay, the currently weekly Thursday
> meetings are good for EMEA and APAC timezones but not AMER,
> especially not US Pacific.  The idea is now to add an extra open
> hours and it seems like Wednesdays at 17:00 UTC would be ideal.
> It would be good to have at least a couple of people from EMEA
> time zones attend it and help bridge the gap with the Thursday
> meetings rather than just rely on written notes.
> 
> How does that sound?
> 
> I've prepared a poll to get an idea of people's preferences with
> a few other options around this time window:
> 
>   https://framadate.org/6NDCHsuSbG78v5a6

...and the favourite timeslot is Wednesday 18:00 UTC.  I'll get
some invites sent to the same list as the Thursday one.

Thanks for answering the poll and talk soon!

Guillaume

