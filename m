Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A3217F47
	for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442090; cv=none; b=mrrYdLog34rtp3P0kHxLMV6S64zqwTMnZ20GoZ0lJGGIcsQuENHGaJs1nZ+coIev3JryDM/KMwxZwjFKjOJ++5j5pqQ1mjIMzPCTUchCpM4QiUg5jypOoJea15PKfr3BTs38c3YX/uO3F5Wo5MUVwVAAb7MPIBiUqVdB4vbn9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442090; c=relaxed/simple;
	bh=Cm/eSbmPeMPfJ/E//ira1pv4Z1VsSaUAw7VZkKz7sRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B8cU29HCPU/VBSmpI2bA4+HlZ7gK1SIwYuZDE1EzkdldQWEeCm8vPZuqjH0hg6yDKZeVgynz4Uxv8QSvh28TImMWtXIXXa427/bqyf84Mb1cJjCCyBMRY40jJ+nGEkoPChYsp0Bnagc0HH0ddrRc4CdnuWJCgXqahdHUaTVuNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=09+/CIGR; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09+/CIGR"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7b15659b098so739863985a.3
        for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442088; x=1732046888; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQtsjzam/tQ6ilcR7zH4AHmKAym/OiKHd6SuoQU0pLU=;
        b=09+/CIGRm0LztRhr6mqQ/Ed2c7Ms9XDvnqxvBrlMLnTkhB4xpiI2fev5drHhVEij1V
         aYgVERd+0U7mTU4HauAFf24vBP4JPq7RN9+LoGbRAh8Sw99MD6rKxVI4/gDsN99znbMy
         dgRCD+xd2n/9EgVLPfhxp8IJBV3l8zKcjHhbINJXuE4vbVjmTaxL1WxZvICvxG3guJvi
         CwsTYBasvc09B7wX7k/NZNi3cIyOUZhXx/2wT4RuvffZx2ISc0i00Mx1jYChUrR7Qvk6
         lCinLfZF0Tl0t2D6Pz4r4gIs/MbvPgyOy02CGozzG9zudcx/ncu1sRvO0CcxZyKQJr8k
         rwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442088; x=1732046888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQtsjzam/tQ6ilcR7zH4AHmKAym/OiKHd6SuoQU0pLU=;
        b=oQhuYpsjcqizOcBWEgehorr105TeA73iX7yabRc1G6SKEzGGIgAdbA/HaFBs7TPeSu
         bgdhvc7kRdNfvNXkBAjQeU6q3iPzizMnKaBOXVxKDrc0X0nOrH97Snc0dhZ7iFa/P0M3
         0rHQ8vTGUrkhuw4ZGvd2XX674YXURD1dGCwXaFv8CuB1adsaQAAC/aIiYjhp/5csLw3o
         l+wh+7biAH87kfqw2ItBqT44C+7v84B/fxPVPSEuGiv9TbZx9HC2789r7f85FNIZVCLz
         CXjNxebkIbqI7CmD8JQI/k9difGzNifVavk9wDAwpwqy7VS/g9FzcWMlTuTH/VxzuKrp
         Y2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUN9XMSYU2KZmGrYgCq21waZcaGIxHR8LyU4vrdow+j5IbuROV/grb8ERaJtuYbwGKq+o4W22pS6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxagr9Y/sS1OzrLC+GiFw0ssVpHEaYV+RIp8HoqmD7jeo6iV5vc
	Z59agz09EozW+hc1THtCSYeEH++KokMiO55fFx/3r0gqSPcl3st7dVtneA9sg1pZt48VDe2Uwg=
	=
X-Google-Smtp-Source: AGHT+IGfGyU7tdZqjtr7KJw/2/4k9KdVjXiekuns5ySOGstmvVLOLtq64XkmS7ScAEgZKCZ7k/oCEnEgBQ==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a05:620a:172b:b0:7b1:50fd:4cd2 with SMTP id
 af79cd13be357-7b3528cea97mr40585a.5.1731442088098; Tue, 12 Nov 2024 12:08:08
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:44 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-2-rmoar@google.com>
Subject: [PATCH 1/5] ktap_v2: change version to 2-rc in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
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
index 414c105b10a9..333193f51a53 100644
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
2.47.0.277.g8800431eea-goog

