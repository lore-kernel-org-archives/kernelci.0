Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09023209F2C
	for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 20:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442086; cv=none; b=M0CO4TZoVM/QiqpTQe0I3+VuCoWXwvONX3x/ToB9qdKIYhSVNERW5bAMbwTTa+G8iaHk6EMqnI9bbK8UbjmmDGpc4WvifuJ0z2B1ul/2a8OOPkQnqJoN8Heix2JtERWTTJLMqSQfQGm1tm/PenlB++14/E9XP9Rehm7HZPLeFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442086; c=relaxed/simple;
	bh=RHZ3bzWQ32ir8dvykH3nttL8q/pnHAH4dgFUQF3xSZc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XT2hybNqrvH0+36n04lhTaE/a6Iw0bc0Q2K5JomEPeSyv9MwWRjS3G35nyM867lYNY9VcJCNQ+g4NYBCtAfrCKU3ebcjGtwhDDEhwFv+tSh9eMAE4ZQWj+Rrwmuj2jeluCtGOU5XcHmditQEOp/PIusluC6/kJlKLRB4G6PTvCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KrDUJjCC; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KrDUJjCC"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2e3321aae0so9241199276.1
        for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442083; x=1732046883; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNJMf/dEdEXGOQzVC+DsIsgZe/E51V+ULiXsqRjRICw=;
        b=KrDUJjCCGDSGZ4ePyRjaCeZKAB8JddGlcPbxALIZ9UX6oGLJ1eJ5djiWwQV0857cAB
         YcldUE3RaKF8l0kOyCvH1a30QUODKLK9RErJ6NH5M08e6vAKqkwIOrprG9N/bD/cgE76
         uRC08lcwo0CzrIwfwP0/1F+/i4ck/w/idWRoYhp3DpigPqyK/V/qEvCZfGd1FxBvEZWc
         ysPwS4WaGGbEy6mFBR+WHB1zurzKalfBUIVpsWbDs+Vbh3yD1p/n6q+ofuJ2XYVCjo8z
         BpRf5tjzcYoQsVUH/kp+uQrXOOd8qq6QmtVaoR1DfaMmMzgfzzVnmsxnAjtt5qI8carV
         uWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442083; x=1732046883;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNJMf/dEdEXGOQzVC+DsIsgZe/E51V+ULiXsqRjRICw=;
        b=goGHAIBXCvFGksWBqxS3WfiDIOIZafUkUIY4hM2u47NzP3BbgaZlhrlkuUBc5XS9tv
         hrn/MYGSRjmF77H2wkM5IMyYcLg4Nhz0DdvikzFTmeYolSrJANwFg25m/y+iUsCla0qY
         yu8OsdV9QnCbyuMnxCBPEpjxJvt6cqCPqquXMTA06Y3EXr4k4iUEwNBuYLL7ftzoubIZ
         sluQXrMPbZdFs+R2TQJccHi4zbfIWAyDsD0J9qo66B5seZrodF0O98DOVRjGppXvchKx
         PBN6PhGmUdsj1VjxQaVIhLlaBVnJNVSblTMfb/g7iUPnIHreese6KYtIFHUB1SrEz1wB
         uWzg==
X-Forwarded-Encrypted: i=1; AJvYcCXyXUkvQ1gk1OwR41e9BBAK1tZSRnY9s13pN7dzAER8Ym0BC85b48YWWDfyx5FJOySGiigfaIQVBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9tM2rFQW5d8EhuCG0WIvjOLpLpHa3fbcSZ5PH5uXfu3MolQUb
	nyTwPPeD+xDcf0kng6cHbz2O7PAmuejSoCynhF+bm37gv/9tWloOdjelM0FjmvHX3LL/i/h97Q=
	=
X-Google-Smtp-Source: AGHT+IGWbxSkKKXBUo0jXvLY76zHqclSM/Sk5GYrZs492hudc1yUtPuCSAnoXDL51XUAfvEFlt5QUI6Nfw==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a25:ef03:0:b0:e30:be64:f7e6 with SMTP id
 3f1490d57ef6-e35ecdea920mr175276.3.1731442082279; Tue, 12 Nov 2024 12:08:02
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:43 +0000
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-1-rmoar@google.com>
Subject: [PATCH 0/5] release of KTAP version 2
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series represents the final release of KTAP version 2.

There have been having open discussions on version 2 for just over 2
years. This patch series marks the end of KTAP version 2 development
and beginning of the KTAP version 3 development.

The largest component of KTAP version 2 release is the addition of test
metadata to the specification. KTAP metadata could include any test
information that is pertinent for user interaction before or after the
running of the test. For example, the test file path or the test speed.

Example of KTAP Metadata:

 KTAP version 2
 #:ktap_test: main
 #:ktap_arch: uml
 1..1
     KTAP version 2
     #:ktap_test: suite_1
     #:ktap_subsystem: example
     #:ktap_test_file: lib/test.c
     1..2
     ok 1 test_1
     #:ktap_test: test_2
     #:ktap_speed: very_slow
     # test_2 has begun
     #:custom_is_flaky: true
     ok 2 test_2
 # suite_1 has passed
 ok 1 suite_1

The release also includes some formatting fixes and changes to update
the specification to version 2.

Frank Rowand (2):
  ktap_v2: change version to 2-rc in KTAP specification
  ktap_v2: change "version 1" to "version 2" in examples

Rae Moar (3):
  ktap_v2: add test metadata
  ktap_v2: formatting fixes to ktap spec
  ktap_v2: change version to 2 in KTAP specification

 Documentation/dev-tools/ktap.rst | 276 +++++++++++++++++++++++++++++--
 1 file changed, 260 insertions(+), 16 deletions(-)


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
-- 
2.47.0.277.g8800431eea-goog

