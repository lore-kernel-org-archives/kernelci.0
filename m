Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C91DF759
	for <kernelci@lists.linux.dev>; Tue, 25 Feb 2025 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740486980; cv=none; b=GfhTk0rusifts0ELk8zqADoaYw4E9Ll+5/jxnbgWVygY16BSySxlrgxeVHTOtAd2NS90LK4BYARad1J8RVZr/yW66cYPNZvCafy7/XV6syesltyXNH0Yl7fL459mgtrBKUsI54dRveNOe+pJ2bZivwJMnphaUGZh/chQ12BJMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740486980; c=relaxed/simple;
	bh=c9sFDQcyR6DsVN3YuRvmUTge2+n4kgwHEQmFkoMXOlg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pX6/9KOjufIqdACItgsy5L5v8ngb5cgG0rRjhoodhBK22moDx3SAGKDGKGqQbtBM1STgIFX5K/WI68HYfXC4tEwZwcogIj+H92h+/hjieWnQiWhl6RlVami4HOX/fDL+zPv0enQtYcKfPek8J98itp4R2/K2gH1zRHrU2Gq+pcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li4hKVUF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li4hKVUF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3102130f8f.2
        for <kernelci@lists.linux.dev>; Tue, 25 Feb 2025 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740486976; x=1741091776; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9sFDQcyR6DsVN3YuRvmUTge2+n4kgwHEQmFkoMXOlg=;
        b=li4hKVUF4968UDWw4qyzQ33rcZ136FUxlIHMbiQFU/9twwPncVMeiFCxunp5bmxnRH
         8gvmC3mkqZr9y5ZUFvsI8PtZyj2r0d+pu0RVJPjkhviUP9hzzIxz/RqNajO3FN5nv63K
         CX0psGamDecZB2DWDsda1k1C9lrW/FfOEUje9KTBazupAZiM87bQwhaN4XrDF0qX23/h
         KfwyRQVZI5z6k2NHqpWs8WVTf+pc+ZnyXSvGgEVC8dQLvDVGaVkRdQijPAzZSvkx+575
         7Rtpk5gEeu9mGlyvhCxMEt5e+bOtM7AhzHz/b5ZaOftyPw35UWgqga2sROZcH+RlW+eq
         LSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740486976; x=1741091776;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9sFDQcyR6DsVN3YuRvmUTge2+n4kgwHEQmFkoMXOlg=;
        b=IVfXbFa1qwwlbDXNHCci+KU/F3i9kdRUFtVLeanZSSIKaueP6kTGdqAE7EFK+ioOEU
         NKI37MeFAKVkOZi2EFWLb2JpMUUJXW1B6YOzU7BGJNtLTb1a+9u3ISTd0Ddm/+dMKH/u
         ZGMlGM3WRcBd0tAOi9QDjQOdWrb9YNRts76QwHfMLXS3PupOuNHUulW5aH6VpMYlGvI/
         N+1vaz6clSvbSPLT9bsIiJoS/xKfSn948sLpxHBvENKOwI4540OtmcOEYLoVaXMEDwL9
         kUMcckDBqlh599wjoFG5Ty6oOb+MLuk3yodIO6X8wKlf3W9vCr0f6zzLcrDjoh50C53b
         t84w==
X-Forwarded-Encrypted: i=1; AJvYcCWOsCbjekp0XzrNFozoVCIMLrmPOnPchLH1ho/FNumEZjge/MScwKuBr6t5TzPzWAnyUoK+p7e0kg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO6v1qkK5MrS9vYlJNlGLOJNVmKa3IfPUWImINV6JdBF940cxr
	OD/lXCkkNI8ZvywFpLCZstiqa7nQMV5VKzYWTkNvLKcdzAoRFLdJ
X-Gm-Gg: ASbGncu7yOsyrejE68zCn2xeFf6enNTmRuEPBfE39idkC/GTRy5O5vusB5ByvAUIysS
	zH2KQYC7qln/CEumC1i/npWBMXUUByFQZI2Hu/XhJdN4ZS4N/mwlbQ0r0BMDlhWXuJdHb4ouoa0
	rh4ebpsU0ZlnwhqaA7+nmMxfXY5sM7auAXQyfk1NcYvuTx6deSTOEBqRfOj38QGJ9HUhEfTs1ru
	dKe29hy4IHOuuUlho2lDN0+9bKG3cG4obqeqjhnHsIef+Y+dxeWIkz6Rvu1GMDk/e0GMsMFxjm+
	eA2knkGZEA23F4V6jvsLPu4eyXdd66LuTiUQd8msnOSAnWbeQ2zDb5jGEHDukg==
X-Google-Smtp-Source: AGHT+IGrUEO26LSsmT1u5HWr40h6xGpdPFiz+XPTsmnGBchjSlF9istYpZIDb58tV/WaxDRh6k77eQ==
X-Received: by 2002:a05:6000:2:b0:38f:3392:9fd8 with SMTP id ffacd0b85a97d-38f6e95f455mr12859935f8f.18.1740486975351;
        Tue, 25 Feb 2025 04:36:15 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab155ebcasm24594185e9.30.2025.02.25.04.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 04:36:14 -0800 (PST)
Message-ID: <dced03b9-c3af-4dd5-8e38-0fd0bce1c01a@gmail.com>
Date: Tue, 25 Feb 2025 14:36:13 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: webmaster@armlinux.org.uk
Cc: Arisu Tachibana <arisu.tachibana@miraclelinux.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Exposing linux-arm.git over HTTPS?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Russel,

I'm working on KernelCI's KCIDB I/O and database schemas, which let us collect
and expose Linux testing result from multiple CI systems (see d.kernelci.org
and kcidb.kernelci.org).

We've been allowing git:// in repository URLs for a while just to accommodate
your repository (git://git.armlinux.org.uk/~rmk/linux-arm.git), but this makes
things somewhat more difficult for us and occasionally permits misalignment in
repo URLs, complicating aggregation.

We haven't really received any results for your repo in at least six months,
so it might be a non-issue. However, would you be open to also exposing your
repository over HTTPS? So we could drop git:// support, simplify things, and
be able to accept data for your repo at the same time, in the future?

Here's a bit more context: https://github.com/kernelci/kcidb/issues/622

Thank you!
Nick
KernelCI TSC chair
