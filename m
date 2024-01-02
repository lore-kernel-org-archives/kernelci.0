Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5220FA
	for <kernelci@lists.linux.dev>; Tue,  2 Jan 2024 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7j9EMZ6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso85755765e9.1
        for <kernelci@lists.linux.dev>; Mon, 01 Jan 2024 23:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704181563; x=1704786363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iHhD+e+1GG2LR5Q+uwUPWMKjzXneKZEYPGVrdDS3Exk=;
        b=h7j9EMZ6ejxgNtnJr3Bk0Ed4XzudR8T9k8FCH0dXP0LKH4Hr/7JIghRHP1gLoNCarH
         qXxWJWWD/AfrfSVcNpSoBwMwRTA5BEqznvfRxX1B86lhZlbCUcSCUzBSn1UoYUDoFWJS
         xlvMysweOu03HIoFBJ1sGnS/zgQQ2Br492L/FQZEFEIFh4yH0J6/AGoCrlLK3PCOdmvl
         gGNs9pDYShzOKFuo6fOdqmwqtzKnauTXP+glP5Afs5q0Bi6E8HMULC/Gx70zOMByFIQG
         SF8aWTjfLCt+mCg9r5knqXFUUJvb0OEWC2OM15n4DnO0ce+G4I0Avozsiban4aUonPFw
         dBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704181563; x=1704786363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHhD+e+1GG2LR5Q+uwUPWMKjzXneKZEYPGVrdDS3Exk=;
        b=Kkog0RJ/rpD2GUxjLwTITMcVEQaY1o2mYbbm5K1u/OPnukjNOXjoyycuaLLtdgwgus
         8EDUNRCaeEIOdZ7uPtSEO4Ch8qds6F7pR3ElnsysZNOr+LUgwpZNLlUvgD+5kEv/O8pp
         pCxsjYJpyXmn3AkH0T4dok9TBA84lX/DIIpNXSHA2vwNGN0BrzWRXdaUOYGQqk4xyHzL
         4B2hEy5fENjKBRD7WAc/yTcAj9zGOkb7vmz1RqIKKSs1BwycgWuIpTofuOwObwT1VIaH
         vb+INZyBY3dlhDKXR9hZIJGkHbdxGkxACKRqPaItOVAlnpzTj3rWeR+/W3//xJPubPbW
         A6Jw==
X-Gm-Message-State: AOJu0Yz3ClLDoBjBjxTyDVQQq/fGNATFxTvca/xdccmakdWN1V1lm72p
	02d1DQCDNIewwND444BGA2KJUtHLE4tlsw==
X-Google-Smtp-Source: AGHT+IHZM9WS+upGseBJPvyCFjM81kkTRQxUR0kQ5A933R//MIPNKfDQsQzf7os5FOBCXJA8CoAPxg==
X-Received: by 2002:a05:600c:1987:b0:40d:5798:1797 with SMTP id t7-20020a05600c198700b0040d57981797mr6118743wmq.63.1704181562764;
        Mon, 01 Jan 2024 23:46:02 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c4fd400b004094d4292aesm43262533wmq.18.2024.01.01.23.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 23:46:02 -0800 (PST)
Date: Tue, 2 Jan 2024 10:45:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>, kernelci@lists.linux.dev,
	kernel@collabora.com, Tim Bird <Tim.Bird@sony.com>,
	linux-pci@vger.kernel.org, David Gow <davidgow@google.com>,
	linux-kselftest@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Doug Anderson <dianders@chromium.org>, linux-usb@vger.kernel.org,
	Saravana Kannan <saravanak@google.com>,
	Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/3] Add test to verify probe of devices from
 discoverable busses
Message-ID: <3271d300-74c9-4ef3-b993-a8ddeda6076c@suswa.mountain>
References: <20231227123643.52348-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227123643.52348-1-nfraprado@collabora.com>

Life hack: Don't put RFC in the subject.  Especially if it's a v2 or
higher.  No one reads RFC patches.

This patchset seems like a low risk patch to apply.

regards,
dan carpenter


