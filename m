Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E67645
	for <kernelci@lists.linux.dev>; Tue,  1 Oct 2024 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796114; cv=none; b=rbi7QsiIPuMQeVXTA+b+M94BTxFd25pUj9HjGSmSQXo96osxuCtJkuD184I8fPx2UQHcFmbwd6z8QTMSIgKsdaHP+N9erWpU81aLWC25MbH+mq6hT30XzPeDEayEALRYwsgdtHW5HLTT3Iu2YepwGjS8hQsjTNJmeEfZ2Uiq0Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796114; c=relaxed/simple;
	bh=XBx7fnrzF2lKVPMIzUpmtpvqF/2LJkrcEIeksMW8LVA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Vt16hUgqyUJ6cKBjtVU3D6H/sCR1dR0K1mqOMHzxov+EQFKS2V7nBznji5RqpfKw+M0o/23XDUOcnCaHlq4TBg+KawN8rVjuotIKUsayqhj76x4WCQxIiZZvSffr3yXdnB2Tn236abZWf3ut+0bVsyMff+oleZajaKUWXjKzYuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D72E40009
	for <kernelci@lists.linux.dev>; Tue,  1 Oct 2024 15:21:49 +0000 (UTC)
Message-ID: <82421990-2826-4efc-adbe-8b256e7b4b12@ghiti.fr>
Date: Tue, 1 Oct 2024 17:21:49 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernelci@lists.linux.dev
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: RISC-V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi everyone,

We (the RISC-V community) are looking for improving our CIs that are 
currently spread over all the RISC-V companies, mostly private and very 
incomplete.

I only found one RISC-V build in kernelci, can I do something to help 
adding a better RISC-V support?

Thanks,

Alex

