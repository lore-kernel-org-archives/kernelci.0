Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE6472F72;
	Wed,  5 Aug 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937878; cv=none; b=V2USrvSh6hUyswYlL0syY+8JBUpLF/xaiikTheYgyxf7tuGokuxquzEFYJ44ujBq/sbawRrafexbINraDLrTX6SMWKc8PPJXGjglWOSZnTgRpgxvek0u6NbixOMQzfQuM+xCFLziJUn3oDI6OFcdW01swRGo8SwiJsOE5VnH3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937878; c=relaxed/simple;
	bh=ceIbF42oNdQwzPSSxFo3YbtBZPWCQY/evaQJGq20oYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GW7EQCed+9OAfubw3qsJtsv1MZpu/WvXpeyUDy4OBnUamFL2Yo4nH1NWL+QXjs0XIiR2WSAHGlK4rALL0haBCbQ64Obtf9E/UHUNdvwGPGOyE8IEuTo8/aquJbk/8yUYy49gLDkGoYwzifVNK57wpmSdDBibC7qIaBw6MkaouNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpV6z1wb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpV6z1wb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208E21F000E9;
	Wed,  5 Aug 2026 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937875;
	bh=JqjxxO4fDD1iHB5x1Pn0acBHYOIrEajxZbUI45Qm1OA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MpV6z1wbWtHinshvMxKwDF8LEqlsoykRnWh52rWyUpf1T/2za9wn+BIMlayPtufeU
	 o9UkpZznR6faIh4M8w8CCHBL6yB67zABy5wbxMD5JBpW0DvNksVeEOlRZRCmHr4zhX
	 5cG5Dtmuxai+siJM3Vg5DoZEoTjJUE7IrXKSA5VpXcRMhKY+KCA+Y0sZietaV4IhHm
	 h72LoyhBjQcy63Zn3dAim2/Si32N7CNkMfHzv5cBh1sIm6D82tPbuT3Kfis17bHWfB
	 JC1GHW2N73WbmixD1GbqLFTGjvcnxL9XKzFR9YJq9/SqrhDSN40wtMZCut2NDKsE6l
	 OuWgGo2BK9BLw==
Message-ID: <c7976ee6-0b04-4d65-a57b-335a7d307231@kernel.org>
Date: Wed, 5 Aug 2026 15:51:11 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] soc/for-next: (build) use of undeclared identifier
 'QCOM_ID_SDM850' in drivers/soc/qcom/...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 Arnd Bergmann <arnd@kernel.org>
Cc: soc@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
References: <178588074443.6433.18101951458881957743@kernelci.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <178588074443.6433.18101951458881957743@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2026 23:59, KernelCI bot wrote:
> New build issue found on soc/for-next:
> 
> ---
>  use of undeclared identifier 'QCOM_ID_SDM850' in drivers/soc/qcom/socinfo.o (drivers/soc/qcom/socinfo.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 

This was reported a month ago to Bjorn:
https://lore.kernel.org/all/202607061318.4kbb1336-lkp@intel.com/

so it seems was never fixed and branch sent to soc@ was unbuildable.


> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/soc/qcom/socinfo.c:428:4: error: use of undeclared identifier 'QCOM_ID_SDM850'
>   428 |         { qcom_board_id(SDM850) },
>       |           ^~~~~~~~~~~~~~~~~~~~~
> /tmp/kci/linux/drivers/soc/qcom/socinfo.c:25:27: note: expanded from macro 'qcom_board_id'
>    25 | #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
>       |                           ^~~~~~~~~~~~~~
> <scratch space>:154:1: note: expanded from here
>   154 | QCOM_ID_SDM850
>       | ^~~~~~~~~~~~~~
> /tmp/kci/linux/drivers/soc/qcom/socinfo.c:566:22: error: invalid application of 'sizeof' to an incomplete type 'const struct soc_id[]'
>   566 |         for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
>       |                             ^~~~~~~~~~~~~~~~~~
> /tmp/kci/linux/include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>       |                            
Best regards,
Krzysztof
