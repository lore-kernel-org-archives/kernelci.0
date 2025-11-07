Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34732D7805
	for <kernelci@lists.linux.dev>; Fri,  7 Nov 2025 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493406; cv=none; b=rs1YYneGw1FLF1g8wroGDdip6v4VOJJoa0oQWH+OXJoTBeflZ+tcUhe6Go6dCyntfnM3jN3liI760U6boGRK6mnAE8fXh4WR5yagIdZi3xTlBZOYtgzr73jpLzl/zEItE0WhRh6rMrrvceu9iU9YZWr4UsBdaxA1YxH0NG+Q/uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493406; c=relaxed/simple;
	bh=GNIC6rgmBgBaS/nEumt2IhuduUmMu1+lZQVuuQDtb1E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C1ph2SLA34hZq+5XMs/031eXmTVlUcQ1qCIR9xKq80psREH5O881xLZt5rpiGmefH7iItouJ1ZVYyT4qpw192uHYcK6U7olrxodiZgW8N8HWihFwN8904f857JNHslqoyb4ieP+ojp3BVEx5eC84Otw3n8lEsYAG5r4SAAMRJ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jeOxLowR; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jeOxLowR"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-88f1dad9992so170623285a.1
        for <kernelci@lists.linux.dev>; Thu, 06 Nov 2025 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493403; x=1763098203; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaeKaOMtYstcTutB5sBdiY8lvk6UG68jVdp0csxEu3M=;
        b=jeOxLowRMk3e0cckRFsilAWNy051Ma8J1CBChC902927dWZTJ9GdDVssAFOg59T8Kk
         +77tRwwYQemxp9B/Ki22kJbiRtJgbecn8bBEDpipqkuvNX9890Xr40JHQOaRzmZDBPeS
         CHlNx98Zk/XQ7zngNCeRbfEpKgY6dtHWed+XHKqUS1Xg6B4Vy855ikSCG1xemXrSanOA
         xnJ+aWkkJdyfhjDSx3u2GCgrTZD5aY4GyuChoLByVAmVA9lOxBfNaWKrHU1o1w3pbNVK
         rZKGcpvI/ZTc3ANRrVa3WZM0AWb0HMdqW6bOPH8DBuQ5MybDcJrjzahmRplFOsYxeU2Q
         n3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493403; x=1763098203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaeKaOMtYstcTutB5sBdiY8lvk6UG68jVdp0csxEu3M=;
        b=HBW0A2LkGwtN93DCYMfJAvKYJY7zGQA/A5IMaY8wFG6jWaVD+eiJyKUU5Zv/q+A1KH
         qLkIo2jdcwLds5no64CiKz+VFxejwfoO0ysf/9Nvq6VmnemvF6Qwt0WvweWN22rJjY7b
         8GaWpvcqlBTQEkzqFlVCSABQsV7dPD01v8nqOx0wh6AL6Fd1IyKf+9I/a6x2/gZN2s8T
         4sg2r+gBwPDS0HZx0+pVkpBHMQ6GeAbSNp4FPwigjSYDjf4XvZ3qy66L2Lj/NP+EbsUG
         dNEuvW/meIVqm01trIBWxroHxCeSj+nd5bgMZQTX3EfpX9BH96nz1en3tMKoHtC13Wwl
         d8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp9qm+WkvromGTVgMg3xgNtzET3wfQ5XsIvQ/gGt8GkkemtxWWWKIAO6LhkxxqyK8WFXsZZjfUYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuRnN2hMA4wrIF88ojrdXtzk2IJF/qws3Ki7pIL+9XCpheOxpS
	+vQusCFaWoQh+IXggjf++VuyWDhTnMLB8GoPl49oYzphb30txv8KwIlFVAbr1BAqcslZYZJJ/nK
	CfQ==
X-Google-Smtp-Source: AGHT+IFZud3Q7EnRa+zf4l7+j2mroOoVI6WsZLmo32vYCEH/+wMZNbvoVYG/kriiFUE2+7VSKhLHDP451Q==
X-Received: from qke12.prod.google.com ([2002:a05:620a:a10c:b0:8b2:4d20:bb90])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:2544:b0:8b2:2719:ed33
 with SMTP id af79cd13be357-8b24533e80fmr250072385a.46.1762493402860; Thu, 06
 Nov 2025 21:30:02 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:25 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-5-rmoar@google.com>
Subject: [PATCH RESEND 4/5] ktap_v2: formatting fixes to ktap spec
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix formatting of bulleted lists on KTAP specification for new version.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 70f1557e47ac..d118119910f8 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -22,6 +22,7 @@ consists of important supplemental test information and can be
 machine-readable.
 
 KTAP output is built from five different types of lines:
+
 - Version lines
 - Plan lines
 - Test case result lines
-- 
2.51.2.1041.gc1ab5b90ca-goog

