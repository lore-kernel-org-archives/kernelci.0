Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48721A6F0
	for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442100; cv=none; b=Xu8095Gz/x8BdkePEbsxrZrr87mThHnm8ozb8jWwFAFdXdvSIUZ3xQoydO+DTrcFHi5ySCdXNnwzB4vQcN1AoJYsyUNyB7zPoOd0EkYuwT8WOH00C/quWy4/dQuCGRvfAloA+ZbhAHkH6RMNSzE53Gu9bBhQHHyMeDAviNtfHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442100; c=relaxed/simple;
	bh=BZcMip1bKNbU0MtdUd5Um/QIvw5ZzOLApoYfnzoTTh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b/kHFABBwSi8OG8O+oimwS9cs9GVGlSSjwqa7MsCfwWK4f84451CgpyMsU8yVftqoug4NWrGO2g0HmJKqYRr1xJAOqybxm9SHnjqyWvDiJuwRzGp90Z7QZ2T3j60gTH6vUKGNv3ne7dBi/c5JEjXH/77JVXiEUGeJ5PkgVI8osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s4LaB/uz; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s4LaB/uz"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea8794f354so106507807b3.2
        for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442098; x=1732046898; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7eUSGCHQaz0mvFxw9nIvdeT0r5uHAkn6h07yqvZcoQ=;
        b=s4LaB/uzIWOUtbucb/GeOUxAodNOf3lQvdbMWtjNiPliTc63ammdiiMYURPvB5pDKl
         M01d8sCtbkVpXUfWdcvKCjYWqhVU0ZIDe+6TpdqBlzWUJzzarnoVJpG1E62YKdjIXkRp
         kR+fTQ2vFD24LAwXXBbR3+c+NdFKham5AqG4ITWhi7+NmzD9I84GZ98bcFpF2e3bWGFv
         SxDXuuVnB+5nJ9ndAP4+l1fQYTGo7XiG+AlbOwt97qO44w3L1dqRh1SKoTQ9/E+9F47f
         FPMSXXr384AN1jHSrmvTYh6C3s1PbHocQbQmquu4ThlgLEFTMiskkBUsXKGb2oDhcyvO
         cQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442098; x=1732046898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7eUSGCHQaz0mvFxw9nIvdeT0r5uHAkn6h07yqvZcoQ=;
        b=sBncR55mc54MwBU+ZkeC/4AIz8If+cmMc11gmlssL9IGxh9HB3PDw29+WhidW5LyuB
         HdpFsiaXueWOKThdUcBCuF2A5Wfy6dnBTmf6BX/0ueH5Lw4wJne+iVSpjgzYhH+EVr3v
         95UezeLLhktYjKxNEiUF0312slxVQC+HmrxJLV2NaEvZaLY8MhmlQgmq/uuR4f4AnsO+
         4uibNOwXxvK91EB0jMsTnuZv3GI70l/H4AiLKU2e+RFzYthiBpxoZ306A16BgPSzqUdo
         Lx9IxJkmlzgo60T4pZv5CC7KpjTfZocOH07GEBO+ZGVfxIXbvTkhu8iLgEnscwSYY4uy
         bB0w==
X-Forwarded-Encrypted: i=1; AJvYcCXNgc6aqvxLT4nbrgXdrttEM2eiq4yysZvQMktFEiRWaSJeH8Cthx1OI+pibKbNeYlcSmkhXEXFXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxutds6kz/1LuwFUlCU9iLBqait4t7YyM0xx2D7eeM7xzTvS6A
	pcxHBGUOu6yeLZn12OCbIch2oTt58m4J1rOnkHY7xY4QiriFrwyzHA2RzCxkh0obW8GagFPstg=
	=
X-Google-Smtp-Source: AGHT+IEAVxAYdUdYAQubxN8mrbbDw0d3Ds8w2IG/q0VgI/G4c9boud7SVcYUAj1VwuKEfvLwEZTE9bAyMw==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a05:690c:9a0c:b0:6e3:14c3:379a with SMTP id
 00721157ae682-6eadda09a7fmr2383017b3.0.1731442097981; Tue, 12 Nov 2024
 12:08:17 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:48 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-6-rmoar@google.com>
Subject: [PATCH 5/5] ktap_v2: change version to 2 in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
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
index 496799e7b87a..a8ff15e6d0fa 100644
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
2.47.0.277.g8800431eea-goog

