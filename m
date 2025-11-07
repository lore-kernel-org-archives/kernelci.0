Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE26281370
	for <kernelci@lists.linux.dev>; Fri,  7 Nov 2025 05:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493409; cv=none; b=JYXMt+Vr7S1Hq+bDWcBHUaViiA4ybFt3V6MsYnrWII2dLhkgLrs7iRY4vUNGYB/p9aZxWek2JPfm8KEQLxVUxeoaQwJ67oVVs4X7J7xjElGPFW9/CmOwPX6QcZsm3HniddNYjZYnUMA5IptN2wXwA5pG2XC4H7iQYlLNfZ5pCuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493409; c=relaxed/simple;
	bh=Gfa74bvT8g21TTG6UeYJUX49YlH6I28Q/5rLnsXNtu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WyWKeTf1Nu6EhpL+2uFuw4fZGvRXOSYoplvtYMgKF00rOlxfIY+zDQA602fxx3RvRqomi5264FoxUSLjwKMkAKCX43Uj5nWUegHtLrgvE2WBUcaO3IIPzu6/J08RNhYyp1AhPzzii6VO4ywVlHgpCKwIjqD8j7hN/vVdElTfwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ynwWHMS/; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ynwWHMS/"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-76c0ad16289so4419557b3.3
        for <kernelci@lists.linux.dev>; Thu, 06 Nov 2025 21:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493406; x=1763098206; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gxyC8GUOhbymd0hZW1Wc7AlwN6X8GVnWJwQLTO+kr4=;
        b=ynwWHMS/ex9C35uGp60hnkDeLRmsdLbRi4EsmGYbfAN4HiwrAfU20W4Wt6xIDPb0Zq
         Pv9O8YdFDclHn9eQYHgCSyquYhXRIizOgRgbBKQUAMOqBASR5qiD7V+8Fv7arLPAuJnf
         9yPAQ1eD97WA17GkyL3JV0m4F1humJgA9wzsFmmer5fKjcAdYzSG6Pn4Ub4YeAfZr5Sj
         xCcf//6s82+lzS0vVnciIYumDRPoju1AzNNqEH0QWLJjGRwbSiIIUbJicE0GvSMmEcsi
         e+/KmED71PiSrPLsMSnsPuaRgUDXAYrHzTfOL1LTAC21GV0RBg4CPT5uOczHOqTAqZj2
         KHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493406; x=1763098206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gxyC8GUOhbymd0hZW1Wc7AlwN6X8GVnWJwQLTO+kr4=;
        b=HuTxUmfgwfo8v72AcwxqsewcVnacywMFigoxDXfzoG/pOZ9rT6mhFEXf4ZN/eT979O
         B+HsxQbj260Q8r0xz37A4UwaHLE7djedTscVJEWA+IjqX2n3dfSY/vK3d4Rao6w7Llyo
         2gKHldBdIBrfNFgsqjiadP2aipaorTLBtRxhHxgos1EugGwn3wzCU6wo5Qbib9BHNam9
         rcIIp/NhSwUxZQK3enfJqy6lvAa1agl9UdjsMzxdemlxVGafzj4ykBREvf82wuIwB6pH
         /A15VcTXqHr3PaMy02pHN9HIlQgavSIaD5xPQVGzuymY514pTJbWEvVr6eodRTPvAJfh
         2lyA==
X-Forwarded-Encrypted: i=1; AJvYcCVGq/HTytGKVIpa2idAr1RuT7YvJVXOMW1n9MKDKEokF+GH/Em8onzxVwpHv8A5RwoteGavSqSrNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywab4hVlQB/APmX5ZExDgHGv4gjX3W8+zYXTqaCfjalEtgISNob
	G5IRuTn5cR9EkOj9N1vKRYh0xEEBuyRI5pm3iEJBIYVpgNIDEUXHYsji2u3nXG3EpwJlmsmc3d9
	JWQ==
X-Google-Smtp-Source: AGHT+IFyTML4kwjlT8XJq9ynWGzbE9ai1eUBXHm+9uVGmQAwTAKz9Wy9ddid4pLEgQKt5V9M2r2fUt9K2g==
X-Received: from ywbkl8.prod.google.com ([2002:a05:690c:5048:b0:784:9edd:65d8])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:f89:b0:787:c612:f0f6
 with SMTP id 00721157ae682-787c61305eamr15892597b3.1.1762493406390; Thu, 06
 Nov 2025 21:30:06 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:26 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-6-rmoar@google.com>
Subject: [PATCH RESEND 5/5] ktap_v2: change version to 2 in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Prepare KTAP specification for the final release of version 2 by
removing "-rc" in the title. This would previously cause a Sphinx
warning.

This series represents the final version of KTAP version 2 that includes
the major addition of test metadata.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index d118119910f8..1abb30887008 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 2-rc
+The Kernel Test Anything Protocol (KTAP), version 2
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.51.2.1041.gc1ab5b90ca-goog

