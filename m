Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A939FFB
	for <kernelci@lists.linux.dev>; Tue, 28 May 2024 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922562; cv=none; b=OHI5O7YeEzgl0fa+agz9JL6/GZd1BKepSHbA//NhYeWS2D3G1RuzBtqRExlqxldPUsshnMHFNil1c7qR4i64ajLNmtwQ64bYiVn6D+9TlQunyuvWnkCH9lJwpaFKx86rB6pUGoj0Sz+WVWfkS2MoyiQLbsfZJ9EjDyIQ6LHxxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922562; c=relaxed/simple;
	bh=4iV6UzxXWrmUOvthmfb6MoOnqWr7/pxFTEFGwYlpiO8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uhoLK9e3Y+tjpnxY0hkhzDn3r4FQHtUYmyrjAnz5pdp0f+palZyRQp5+O76lnVZIKBNtyJJK25MLZwEJmfzkoFgJj7SRlCpjqpl41mmhVEp8jnvEItK1J4UUNExsRN/FtJOvEQ82Xnc4IjAr/TQ4sf5L3DR6Pu/Ef3l7PdYj650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-68187c5534cso774400a12.0
        for <kernelci@lists.linux.dev>; Tue, 28 May 2024 11:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716922559; x=1717527359;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iV6UzxXWrmUOvthmfb6MoOnqWr7/pxFTEFGwYlpiO8=;
        b=fSDcNprCSXyhhAwtuNqCrdOyF/2urRXyy4+N+obuDRY6h243di2GJj2JIONRYUWiHu
         GYaUEa9XdsNynvcbIH/OVv0uo9kjskfO5At+bzsT20+2nIFIDec05BiXeqaGNcNIzI9+
         j15aBnAoD4tnd0aAzcsOoBjtw702ac1NitXT6UE0G+W1dZcE/yFQBYcZcgJfY4NoLMmx
         Ppt4XspQHzfevKZb8rFZprAN3XKRWRxDPe8bvYkhe0Fzyrd0J9NmczT8Pf64iksAjyr4
         x35bAFYBGvI6bbmNn23E/yBIG+jnq4THeIBL+biKXU5K2G+PHYptbtHv8Xbdszpejny5
         OG4g==
X-Forwarded-Encrypted: i=1; AJvYcCXuv0FyP2XuzfRCeNcWcwUJAsSJSi/1pIyAYWr6I/H805FnV6iK9GtrjeQc7qEh5gGiBac9q4h4EOGYGPzoMRrPM5NAvpwPq7A=
X-Gm-Message-State: AOJu0YyvnttWunRN6GYtf7GvpNSlqgwG7FyMGCLxRLC4hS85MnE6qIR7
	62c2VjSGvgupB9cS1a7hSdu8lONItbNAb3q8np9bl+RQX0aVP6o1DWZ7zftQYKY=
X-Google-Smtp-Source: AGHT+IFeqWW6ut+ijqsH7tZPBhmmVVrCyHdvFo4XbvrgdmXda4ELYywRZTiDRswRZz2mkd5n7VfaEg==
X-Received: by 2002:a17:902:db0d:b0:1f4:8a69:dab8 with SMTP id d9443c01a7336-1f48a69e464mr75976085ad.56.1716922559585;
        Tue, 28 May 2024 11:55:59 -0700 (PDT)
Received: from localhost (75-172-111-169.tukw.qwest.net. [75.172.111.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7d1b46sm83870365ad.110.2024.05.28.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 11:55:59 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>, "kernelci-tsc@groups.io"
 <kernelci-tsc@groups.io>
Subject: Re: New name for new "KernelCI"
In-Reply-To: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Date: Tue, 28 May 2024 11:55:58 -0700
Message-ID: <7hed9l3gw1.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nikolai Kondrashov <spbnick@gmail.com> writes:

[...]

> I think it would be good to have the new name associate with one or more of
> the below qualities/functions (but feel free to dispute and extend this):
>
> * focused
> * simple
> * powerful
> * experienced (as in arising from experience)
> * open
> * distributed
> * commanding (a fleet)
> * kernel-related
> * bug-related
>
> One of the current working names, that Gustavo Padovan has proposed, is
> "Maestro". As in "KernelCI Maestro". It hits the following associations:
> focused, powerful, experienced, commanding.

For these central software building blocks that coordinate much of what
happens, the image of the orchestra conductor definitely comes to mind,
so I think Maestro is perfect.

> As a joke and to come up with an example, I suggested "Kraken", that is
> "KernelCI Kraken", which hits these: powerful, experienced (it's old), simple
> (minded), focused (on sinking ships), distributed (it has tentacles),

Also the name of my local (Seattle) pro hockey team, so I like that one
too. :)

Kevin
