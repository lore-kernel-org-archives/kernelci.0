Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77ED19A
	for <kernelci@lists.linux.dev>; Thu, 15 Feb 2024 00:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707955474; cv=none; b=eUd3JJt475UItuYx2Mko1XbBd+zBTHRCYeuIfKy3bjWwA107SImVbhV1Ls26IHygwg9+XIAtd+yCQK0MCP+uPBC8I0rIfOzMt44enuPXiZt0JID0QLEqfDbqUcIW8nFOxaMey/TQVvMPpKe/ym6c5HKckzJQ2uFkOGf5n1D/rd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707955474; c=relaxed/simple;
	bh=mJKqoicOPkcFqwDi+A3roDLDRlTf/kEblG7CuXMvjEE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=denL3jTkbqTWyxYtIubMSeWDtaNB+QPzBhOUT+RGIRlxEwJw4+BZTkSYeFoBpogYD7KWT4Dug6aRE8ipBXK7jNXYxeIVdlJUja3ZrjTMXhzAiUNiqqxk4Gv470tEMbsRplL0pL9n6UoKUCOuakXT+LQOX9JgiV35GSjOOo/ic6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CxCqI1dq; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CxCqI1dq"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7bbdd28a52aso4860939f.1
        for <kernelci@lists.linux.dev>; Wed, 14 Feb 2024 16:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707955472; x=1708560272; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVF0D9x/KUuB6UIX2BRq8TL+FlS6ATSbLW/Bb/pxKy4=;
        b=CxCqI1dqY2BCMpLk90UU2HTapxBQoW05vBH5jlu6AmVWkbBqut4He//iL21WTx0UPa
         RwHJLHrzGhQK8Bqd0rR6FDJ7U8i3HXdBtqKdt5uKCWTs0KRSVuPDgA1pLtjv4jo6tv2p
         ygrbHpH3GlsiDHl4C/jgcDWksNoeAgI1irvUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707955472; x=1708560272;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SVF0D9x/KUuB6UIX2BRq8TL+FlS6ATSbLW/Bb/pxKy4=;
        b=NXcCTNql/e3MUt3UEWTyAgtRBB9x2IidR+5DbhHbSHhGPodMB1XMW0eDKRr+y1TN1R
         7pjh6/5LJ8spwCXgkE61aXbY5v4iKk6nYAOB3KLgiQzUxcIiUL+VDRqzD0Le39w1yx8q
         IkUT91jf4kJj8v96R3pyxHfqsElzGMt+OZfw1guQM517Jkm2EkxymLaX/+qNdNSx+pbu
         4w1l7WOiK+ls3hVLR3DsOEUtt73/GaNv8RR2ogdXrRPVNtynbNHZ9loGXOeqODOxSmha
         I1DV5DRKaJkXaCzKJ2HMBNjNxs9g4BRpbIwOERSn6XAFGJjBGfON8e8DWJSmMX0qfZPJ
         H5rw==
X-Forwarded-Encrypted: i=1; AJvYcCX8LieU9UtoVhWSxTcGhzi16SHtT+iaX+3D3dJN+UdmiYoC0fuMXL8RtCyYe18Ib8eOt7YhP994LCTswrr4tvKKokiA/tTHZr8=
X-Gm-Message-State: AOJu0YwkGtjvv8sfNqukUIUcs4LRSn1IeKDZjATfwdNpeQY9PHkqPSiI
	Mxa65SL5Jr+3FsmH+/5PgX0d4uMOwt6RkkRz8JX6ivP52EQKyKM+f1Bh1qQlqrw=
X-Google-Smtp-Source: AGHT+IHRnZWJRD/8H9TBYZ2yyIcpqZoq3E6mcsYnMPIf9DJbcNyALI5OkcQMtb2CuVRLCARKZA6uKA==
X-Received: by 2002:a6b:690a:0:b0:7c4:8398:ac64 with SMTP id e10-20020a6b690a000000b007c48398ac64mr260345ioc.1.1707955471930;
        Wed, 14 Feb 2024 16:04:31 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id n8-20020a02a908000000b00472c7130ccesm60676jam.143.2024.02.14.16.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 16:04:31 -0800 (PST)
Message-ID: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
Date: Wed, 14 Feb 2024 17:04:30 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Guillaume Tucker <gtucker@gtucker.io>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-members@groups.io, kernelci-tsc@groups.io,
 shuah <shuah@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Shuah Khan - Self nomination for KernelCI TSC Chair
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I would like to submit my nomination for KernelCI TSC Chair.

https://lore.kernel.org/kernelci/260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io/

I am a Kernel Maintainer & Linux Fellow at The Linux Foundation.
I maintain Kselftest, KUnit, USBIP, vimc drivers, and cpupower
tool. I am an administrative co-maintainer for nolibc.

As a developer, maintainer, and contributor, I consider kernel
testing and validation are two very important aspects of the
development process. I am interested in seeing automated testing
and test rings succeed and thrive.

If elected, I would like to work towards continued success of
KernelCI.

Other hats I wear:
- Serve on the Linux kernel Code of Conduct committee.
- Authored A Beginner’s Guide to Linux Kernel Development (LFD103).
- Lead the Linux Foundation Mentorship program aimed at increasing
   diversity in open source and providing equitable access to learning
   resources.
- Served as the ELISA project TSC Chair and continue to contribute
   acting as a bridge between ELISA Safety and Linux kernel communities.

thanks,
-- Shuah

