Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164E321A4CC
	for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442098; cv=none; b=b3kK8iyxOgL2/RPeXAtNYDoe+r2vug1sGLjATSmYIRI02zrrTzxuH/2Mtxj17/QoRDtbhC87VD8D+FneA5RbBsoTXaaHvEGWECmzH6UzPIh94YWYwO3LcOtsIM4X9N0TjxGBZ6Cbf0qGA1v89r77Ep3p65dmdg3B0gfuHnyyeiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442098; c=relaxed/simple;
	bh=FJxuu9SZEvE8/lpXK8JtYaTHBfXuBPx5hwpAA4obJiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tfNAkLzVZXuJg9CoiBHVEGYuBXkbXz89zXomy7gh24Uz1pbgFWKBJuNdEByE20S4TBN86Pwur5MymXdXnDH8uNGoQiWXkI1xK3x91cceHNT7CMvhxdKuenbhisweFEMLnhfJY/+0k6zoPRiEGw4sryyyag+pm9CriFBGQbXU/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/rtuE5b; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/rtuE5b"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35a643200so103351557b3.0
        for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442096; x=1732046896; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZebOFvXhdHbUqBa6VoAUwcXkgGJWlmZrSal3cue+e0=;
        b=u/rtuE5b5JY24LVdqK8rZYpeDztFukdegTjezzAZaKKpZX91ZPFvoZG+ewRnkULNEm
         KxrL4PCfsb+NqzvWPoeEX+LS2afsNZZUfn5DMZ6uVZ2LKGDTiA0h0YMFA4LcXO2jbv4p
         e4RWevpSb7yhBz/E6je/LqiM4bURbzP4lNMBoBptyqGS/ohQoZe/h0spBmMZotWUVG0f
         eKdEXGpclNAcJ7DUXj4elKI3qOQMxGbiRrqDYzGHRWYFRqkdIEo2e7mxV8Xgp5QZZZOR
         d05M3KQB5sKvnXEj0U99iDWR6zWc0TC9CCTTU2OI/sodyCI9E55VSwFvOuu/GWivH3VJ
         VbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442096; x=1732046896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZebOFvXhdHbUqBa6VoAUwcXkgGJWlmZrSal3cue+e0=;
        b=lbvFWw5OHE2bygjztscyM90iqpbLBNdX927+7haXnLo8+saqC9dOGxUmIYkkT/qVqb
         NwtI3W81I1H6M568unfkg+ApAuFeQUpb26/et/UrCeCmcWL4iGscqLudjZ3D3oVW5Lyi
         CpZr1c8kSrF2md6x9SF8+VBuJ92OQ5S5mrWAqqlzUbBWGVDxsrJgoARSzR67jToxJFlz
         RWSn25/gl6oAn5+wVzmC7Fez5L+luauN4MPOtfWs49ueNvsJnWogQb49efmfMpgpJ0pw
         J7iZfXpuI51QNfIx1FzV0UwkuIpsK8C5FlfRNsML3rN5c608ZNYwHOG/mxXSWG9jcknU
         CLbg==
X-Forwarded-Encrypted: i=1; AJvYcCUnB41/CR8q6jWeOfUjttLX5epMntC6x3ZX+y/q9UHo6zI01e0LpJ6tgVn+zq3U6B9y2us7lED2+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvI3eF9D2eZwb4nKTphGO1Zqd3pBEuzydjCS2f/1iwZN+sqwDE
	OhozCSQLkjIAxmugVmTr6ayM9Kr0m0tQxUkOMkBwtrKw/fnV5Yy4gc4GuZv9bTeyUbxM8PEyRg=
	=
X-Google-Smtp-Source: AGHT+IFHMV1811rm2dOpYbT3VPVmCYSYVxNohph1lrNLKTBJ3I8s7FaDFr3MiHn8g8q048q+n0kQifFS+A==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a25:6fc1:0:b0:e2b:cd55:11b3 with SMTP id
 3f1490d57ef6-e35ed246250mr179276.5.1731442095955; Tue, 12 Nov 2024 12:08:15
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:47 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-5-rmoar@google.com>
Subject: [PATCH 4/5] ktap_v2: formatting fixes to ktap spec
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix formatting of bulleted lists on KTAP specification for new version.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index d4529f4e38c7..496799e7b87a 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -22,6 +22,7 @@ consists of important supplemental test information and can be
 machine-readable.
 
 KTAP output is built from five different types of lines:
+
 - Version lines
 - Plan lines
 - Test case result lines
@@ -40,6 +41,7 @@ All KTAP-formatted results begin with a "version line" which specifies which
 version of the (K)TAP standard the result is compliant with.
 
 For example:
+
 - "KTAP version 1"
 - "KTAP version 2"
 - "TAP version 13"
@@ -517,6 +519,7 @@ Example KTAP output
 This output defines the following hierarchy:
 
 A single test called "main_test", which fails, and has three subtests:
+
 - "example_test_1", which passes, and has one subtest:
 
    - "test_1", which passes, and outputs the diagnostic message "test_1: initializing test_1"
-- 
2.47.0.277.g8800431eea-goog

