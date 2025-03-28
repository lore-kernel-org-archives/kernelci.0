Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAB18C01D
	for <kernelci@lists.linux.dev>; Fri, 28 Mar 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160612; cv=none; b=QizpCx5mP3HVYeRxgS3hpa9QhrnDhUSXIgAKh21dXHSIrXBCHcsCfvJkGBnlS8NENink0P/vJ4zGoL9MJt8OyH49LVlmQfkHPaNm+xtJZB99ba08JYLrAknrHIZMes8JCkDMKZkGbdA0Vf+qj9TrLqBjNS5dwMuY5grMtn5kcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160612; c=relaxed/simple;
	bh=tZ6+z1v2ZQgxjpOULK7qVgqvgSpFPwoU8eHYMidcf6g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=YCOeKWyJREW/Qj5yN1QTZEYOdubsG5UvYgHIacEhi7Ua1brwdkCargVAAet6vTvrSAzEgydtVwpbehQbcBTCCX+jw9zHwSya1wtJwOnE7s2VUey9k/VerhyObHjxCuN9jzOjB8OdYekoO1kpdPvcXQxXqutI/bzwYOgcEb7AD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8Gmkhue; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8Gmkhue"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14022355e9.0
        for <kernelci@lists.linux.dev>; Fri, 28 Mar 2025 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743160609; x=1743765409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01v4Ly2plFVdLzQR9iKDEmXOghbzhS3F4f+J/wqS5zE=;
        b=C8Gmkhue0rAFZsseqBUE4C5y1YwX+npa0kPqO/H55CNZNn00D+HQddvkQiNUwsrlzN
         vh1IGf8q7giYcGtCjKGIE22ygoRaiwGh0Gjezdwkn8mbtM0nzp95Lw/DUdveboKNGjmj
         QDQEtT3zo0RaH08o6CrOYxJwyBTgfJyYa2nSJAR7qdnT00Se+dqSPmumYcTiRw3WfaNr
         CI5S/SP570t038NHQ0lXP94zc1oyS79WO0xOgkgEZhpVaSmniE+npM9MptWuxrgbAA1X
         tiD9EL/pzDsmfIudnEWJ1efpy57pEsjZk23EpFWcSPYgCClAcL39L4sAQeJm0JKqXabz
         oc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743160609; x=1743765409;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=01v4Ly2plFVdLzQR9iKDEmXOghbzhS3F4f+J/wqS5zE=;
        b=aavXgz2yMP2C2vMLSR88wNXHlUObPwF1geve8UZFNqjU1PVUbzbWTJopoGYqzG6C3a
         /BdiYPXEph+eKOSQFVbR07HiRPYvjGPqgsFN294T3gWf0iFvzfpcIDpSr9m9UosPC/aB
         H1PGtlS2qVrW7V+MfE9LhoAGXyj/79FTCRv2HJ/tBmssqRmJ9Uqo+olNxxmoROVwDPwf
         qD6N9kPR/S9RA+moNVh1HtXQXCnEEB/AbtrwumRXV97vziXbPQeae/00vSqLa+DSjOrg
         FfJ+xFGhRBbCYBYMWGA+ipvfWUSXqLL2UTgVECDq8cJ/vibInYi+9vAyLJCsPIW9D9Az
         rgtg==
X-Forwarded-Encrypted: i=1; AJvYcCX8rSrANjKSJekoUonkm7YNJ+d3d6Td0HaN3kd/v5HELTxQzRZbjxYhQmGNC1uttld7nB9/drHwpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKVHDH8uviq0YOuuytdsybGaWROQ7S0aFIhg2Y9kWH/kk0cx0y
	pRWG0kn0KB3+EC3zd7y05XRXEcXUOHrZek5xUS99aAlChFsYZmkY
X-Gm-Gg: ASbGncsFsl7p3TFkhA2DhhB44Rilth6n7/cjGUHr5LhGbXm03oyUk1/KBsxyPQS2G/N
	fU+EU4wuaOpSbds2nZ6E7pSLOGYBRYnoR/9aHTaKUmfthGfWnBa1MBWSnKJD0pvd5F17Fo3ur1p
	YUvO/yPJZILpq4zJatBb+C04zkjOMeaUuGzSNDAwa204x0dglXyLzXyp9LjFG8ZL6F8PlZWnfX6
	ETHhkGoZYFBFNts2DG5i4gOpqNlSKmwqnPLZSn8bIU5mcdq9g74aSh8rot0kXV2KuumkMWMeFY7
	6tIU7qauuV7ElSIcJFuCYUY30UVDWx6jWJBC5NLeGyk4jHtvfKesvJBlf76f0oJkueaoSGJGbwJ
	VVrvx
X-Google-Smtp-Source: AGHT+IE4BSDXMHjJluO1Qy4iaMazn5bZI2rbdEOfBt6LnXxwdr1jztd0/K3PWfRiX2h5fCy2bLRt4A==
X-Received: by 2002:a05:600c:299:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43d8582e048mr49308165e9.3.1743160608574;
        Fri, 28 Mar 2025 04:16:48 -0700 (PDT)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm23816625e9.28.2025.03.28.04.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 04:16:48 -0700 (PDT)
Message-ID: <be9de8bd-4d4f-4086-bb9a-90d7abaa3dcb@gmail.com>
Date: Fri, 28 Mar 2025 13:16:46 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: v5.3 - test input files
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io,
 Simone Tollardo <tollsimy.dev@protonmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, everyone involved with sending results to KCIDB,

The v5.2 schema adding issue categories has been merged, and we're testing the
already-implemented DB support for it.

Let's now move onto the next change in v5.3: adding support for
specifying test input files (an `input_files` field):

https://github.com/kernelci/kcidb-io/pull/99/commits/07cc1885a1ecae6f25287b61b58ecb4f70a92e63

We already have `input_files` in builds, and `output_files` in both builds and
tests. So this change is, again, quite straightforward. Simone Tollardo, who
works on RISC-V kernel, asked for this (and did the schema change!) to support
specifying the rootfs which their tests executed on. Something like this:

{
    "version": {
        "major": 5,
        "minor": 2
    },
    "tests": [
        {
            "id": "riscv:ab266247c76746e",
            "origin": "riscv",
            "build_id": "maestro:27a3f84da7898ec9f4f1be8e4e043",
            "path": "super-test",
            "input_files": [
                {
                    "name": "rootfs.img",
                    "url": "https://github.com/riscv/kernel/commit/"
                           "f89927a3f84da7898ec9f4f1be8e4e0433db7879/"
                           "checks/39474543369/rootfs.img"
                }
            ]
            "status": "PASS",
        }
    ]
}

NOTE: This is based on the assumption that there could be more than one rootfs
      per build, so the build reference is not enough. Plus it's likely there
      could be other input files for tests, such as configuration, or sample
      data. Please respond, if you disagree.

As the change is minor and backwards-compatible, I'd like to set the feedback
deadline to the middle of next week, Wed, Apr 2. If there are no objections by
that time, I'll merge this change to the schema and database support on that
day.

Thank you!
Nick
