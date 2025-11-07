Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F1228726D
	for <kernelci@lists.linux.dev>; Fri,  7 Nov 2025 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493395; cv=none; b=uk9y3Gv7uvNN2ULZENhwy5WGSVKhOz1z4IQqYmqaSDa/E6HaZJXXRqw2HMHP2YmacrsmNuHPqtlAXvL9f1PW6+XktBTbLxhZYLzfAPMc0HJc0g7Znp8CpU5tfFyf0zuZMKxpQj4OUH9FvhlEF184Ez4yc9ql3Po9EZHtaULjlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493395; c=relaxed/simple;
	bh=L03uIXQZxdkalVh9ZjTUCdHmAeF5s/msBRS6xoMrnQ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=REEbyvqvPjoFGDd7Ig/tqVPaplDjleq0s9t/Oh+ctqDt/R0C6FeSRaFvryA1OsjFHYyg2shLFL7DMAAAVKef/PaiTNDOgVRvHgkCaKCvMkQI/pYOe7UOI9j1OXs1sJWqvnDpXR9XcLZkdDXO06E6kiVzSUEHfD8j89uQ0lmRisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=03EgJgX4; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="03EgJgX4"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-88f1dad9992so170576685a.1
        for <kernelci@lists.linux.dev>; Thu, 06 Nov 2025 21:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493393; x=1763098193; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=48j2zZJXWTS3tXcJmxqzEPrxFj/EkmhfLmBq2HSrPzY=;
        b=03EgJgX4DdcB0A6Lmjw1ca1xBPZ9kEIgMOlQbQDg6S4jDUftMH9x9XtGVtTls3s8wD
         lT3m4c9UcL5dTBfBtUDUPjZm13PuzkGFJKOmoxs2uyEhfqf/H+3ZiKeT3txy9HEwjGOo
         4rvaVDfwWwKrb5dP4pY8dz2SbJM4ojQj+uDEU8iH+rld292KLJeUkToCY0tmQJ3VdzP0
         s7ahSEdociowavxhNgl5krcn8+EPaF4FBFAZIGWMTVRYjr9UDzx/QHfm91HIGKwoTu3v
         NiG0JFj3OZYT9YRHt7lm95c0F2BGdATzKpJzUqAqiyhN2xDr3DF9Ot2I4sK8jlBIQqj7
         ta7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493393; x=1763098193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48j2zZJXWTS3tXcJmxqzEPrxFj/EkmhfLmBq2HSrPzY=;
        b=WqjwutO+cGGDuI4kc/+U4W7/wuJW7K23qhAKXDTli3mC9JdcHZwD/bsW8W+UDe2P95
         n4V4Qpmsy9fuWYtWBz3z/hHw8hBHevT50Pij2pjILuvrf3KjcZAqDc4mj/zzLnugBs2N
         cEmf6FMLzAr8GD+uOnH9UUfaVQ9wHQR0i8zz7zdJSjCk4M7cQnJqj9GwXU2u0ZX6XieU
         DGrY9myXmre1nckJwefuDOBk4BNobynyqXpWZ7xag4vf+/qmWCUxm60FIbn+BSiZPuoV
         H3fNLZ1GKTq2iwwFtpwzQOC8jVPKKfuBmLOnAd5pngwroMnR2Em+XU4akUKt7YmZOW+2
         l+ig==
X-Forwarded-Encrypted: i=1; AJvYcCVLCl1hpyLNO4/Kf5vH5TbR+q4nFzVrO1u8od/rQW0X11y67FWVetjB/lP4WWV8+P8oBUAkUc1nLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxa4AiZVzvpPV0zV1xA5B3fMEPsyNHy9Y/rxQSU6Sa8huo5OZD
	1BvVXNDQktUN6Q9IDya4a+YiCK5tS+xZSNHUaWu/5sQSuKMoofyxOK6dKBgZVHrDhWr3Dw+rl+l
	jrg==
X-Google-Smtp-Source: AGHT+IGX6OEfniAXqNWEIhp2i9gcLVm92VZiRnkK4/N6XrrlWlAs+epPZsQEP+HqeKvwBATh/hbqJHdIFw==
X-Received: from qkoz12.prod.google.com ([2002:a05:620a:260c:b0:899:fd6d:28b0])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:318c:b0:84d:9f49:6898
 with SMTP id af79cd13be357-8b245351d7emr265794885a.61.1762493392688; Thu, 06
 Nov 2025 21:29:52 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:22 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-2-rmoar@google.com>
Subject: [PATCH RESEND 1/5] ktap_v2: change version to 2-rc in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Rowand <frank.rowand@sony.com>, Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Frank Rowand <frank.rowand@sony.com>

Prepare KTAP Specification for the process of creating version 2.

The version will remain "2-rc" until the final commit to complete
Version 2.  Adding the "-rc" ensures that none of the development
versions will be mistaken for the completed version 2.

After this commit, Sphinx complains that we now need more '=' signs:

  Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
  ===================================================
  The Kernel Test Anything Protocol (KTAP), version 2-rc
  ===================================================

This warning will disappear in the final commit for the release of
version 2, when the "-rc" is removed.

Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index a9810bed5fd4..387062b96c10 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 1
+The Kernel Test Anything Protocol (KTAP), version 2-rc
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.51.2.1041.gc1ab5b90ca-goog

