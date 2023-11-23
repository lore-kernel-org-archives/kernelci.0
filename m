Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73618058
	for <kernelci@lists.linux.dev>; Thu, 23 Nov 2023 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8esjWvf"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507e85ebf50so680104e87.1
        for <kernelci@lists.linux.dev>; Wed, 22 Nov 2023 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700725372; x=1701330172; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=At+FPC018DKf09p2RSe89eFy4wA5oTJyOpytMU4kgIU=;
        b=k8esjWvfVPtcQCELsVH5L9m0VsSHRQPp79SBBKFLVAEL8X3XzppjYaETO3uaPftvvb
         vI/UxUk/hMJ1I71Qoj1WSS1c+3yTxniaBmAyZZzCWvDr8bVWMeGrOByVf6fCpr8/yU5p
         0ppirUc2gPJQarNngJxWB3nfXMue/DqsLIG63SFNWPBVN4yIV8IqWlpfr7Rxp2C/TxlQ
         hKrMFZqFGOAWeaUMk9x11bhAs2vN2yuKoS+N/uPCl0R6691T+p5NhnGIpnVv5CfoD04v
         aQcoluQNn1MymRvt7XZyFNRiro+tmi/66PaLtcGrirXfiqr16nsDpk6jTYd5JoZmE8nf
         ZzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700725372; x=1701330172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At+FPC018DKf09p2RSe89eFy4wA5oTJyOpytMU4kgIU=;
        b=rFMDPMJZDXw/JRd5qzd2ap8V3GQTpGx50duonEzyMrquagbMZZG5K6ERhdVWmnwp7V
         IHjIKd3TqBVTkjV8QVhuvse0nlevsis95StqQZRfKuvUt3Z9XLZcaeExq2lyxSsHcovb
         BiXN8numBY6KbyRmtehf1v9wRhgCYpi/n4u6vinXbOYV+hOktAAoZe5nuIIELFEBnyT+
         3Q1Nqt01JP/NTQiJf4H16N28XiUHSHFGEbZIcc8zgBfjha7MYYyLuZxCQXs2EEWn8RC5
         +QUUWBLvpRsRuuh2hmnHR//dEH+3hj0ESb1vdvgPQpyViKHJ4Ix6MeJr0DuWQ2MK8pgS
         kqzg==
X-Gm-Message-State: AOJu0Yx6hQjzUbDtVRPgvWzRJD1Mh4Yuq0c+qbV1bq6xipFfdnwQPCr5
	fWTB8ubL7FI365pk1Jvx5/rSFg==
X-Google-Smtp-Source: AGHT+IEmrDJrP/QqVvs9kKyFOG8bQT6cUA0NY7xxSAVNu7mEpFpDXFlPuh7l4xd1U28wFHj3LaJjTA==
X-Received: by 2002:ac2:5f43:0:b0:50a:a82c:a5f2 with SMTP id 3-20020ac25f43000000b0050aa82ca5f2mr2678724lfz.66.1700725372471;
        Wed, 22 Nov 2023 23:42:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c359200b0040b360cc65csm1062105wmq.0.2023.11.22.23.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 23:42:52 -0800 (PST)
Date: Thu, 23 Nov 2023 10:42:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: rafael@kernel.org, lenb@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kselftest@vger.kernel.org, groeck@chromium.org,
	broonie@kernel.org, robh+dt@kernel.org, kernelci@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [RFC PATCH 0/2]  Add a test to verify device probing on ACPI
 platforms
Message-ID: <4f1283d4-1c50-4aba-ba54-b9ea975bf61d@moroto.mountain>
References: <20230925155806.1812249-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925155806.1812249-1-laura.nao@collabora.com>

Your talk was interesting at Linux Plumbers.

https://www.youtube.com/watch?v=oE73eVSyFXQ [time +2:35]

This is probably a stupid question, but why not just add something to
call_driver_probe() which creates a sysfs directory tree with all the
driver information?

regards,
dan carpenter

