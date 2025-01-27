Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08C18E351
	for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004345; cv=none; b=fJTw9TOSK6kePn2RhBUCTyFBb3C+mnA0IbGKhg0ry3uqY3P4vHryBzE+HGsV8E1jfvESwdGnBGg0Q9uauHyP5tjyKgagWJW8AEoii3fNuF637SD9f0pkKt1KJvQLmQpXGEaP6z5KRM05aKEjCLSj61RqyeqKqAEqaAQ5NiK0WOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004345; c=relaxed/simple;
	bh=nkr/PLl5Q0ZEQyx5U8g+dnvAT8DRsCwqiQxbaWUVua0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Z01QuLz8NDg65qx0HXGzZK5axAmrxsgtGQmPKq73G3fY03XfAcP6lc3M3whraTjEu54edyS/vSYIYV108T6DIu1Fm7Embq4GsEFOH0vjwhkhmncMfv3IlE8Wf3kS6Cc1jMtnSsRbHBULRJFu8lofA3YC5g9KAwr8Wu7BGQZ60ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXAvTdZl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXAvTdZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738004340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kwypsRR4V/FC6/+fxlt0fS6h6Fxn6ww5c5v9OMMFuhY=;
	b=bXAvTdZlYDVwcV13XxMN94Bn/tZ9do2d2+twveZL2TSHwYZj0JY3F8d9TgMQF0xYyp5Ymo
	+NjiyMxnEAdAsYXUFfY4Hj4Oqf1f2Eif9Ee+KfMz14gTMPFEnNyF2S7RU9Gi3DHOwUMLFx
	NrWoAL18mZ16a1hXPiq4mWXOqzD6DkE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-RBk9IG1kNCyJ7gMerLZBJw-1; Mon, 27 Jan 2025 13:58:59 -0500
X-MC-Unique: RBk9IG1kNCyJ7gMerLZBJw-1
X-Mimecast-MFC-AGG-ID: RBk9IG1kNCyJ7gMerLZBJw
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-218cf85639eso142981985ad.3
        for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 10:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004338; x=1738609138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwypsRR4V/FC6/+fxlt0fS6h6Fxn6ww5c5v9OMMFuhY=;
        b=KuJtcJ/i32A7T067emS/LIRFEtz+6mEmRRvFbw6LwQSchstednh6QBZAEBiAuIOTnF
         /2gxVRDTwmBbVnuu8AnT8vsq21Gml+iQy2TVLtXjMijvlOtV5du67viw0EqjfygcbJBg
         DPMtox02WpuyvbvEeoEx1QmiwB1ZYO992UW9g5CWSGL1ACkv12aB0Wz89Vcu7ApOR0Zv
         jxrA0krMALOTnRQa62+QFc+V2y+04kVo4rPrQIrZkCSQy+0/lyuhTeI1HyTgOvwxISYs
         OYH0W7+t3oX0mAviqGYS9LiGEqvXZWfKok3mo6Bsd//6JUZMbSyGDOL6Onz8rOBr220p
         gSRA==
X-Gm-Message-State: AOJu0YxoWHMK9BfNDubGj2AAdB0aAlzrvUszFVrHjlsdJsRLcYCXUVkf
	a83LhW8RJQaCfJJryUta1SnxpjilW1txcXRMDzcxSCzC6rrn4n8UQCzuGtbZjzyUJ010g9jDKA9
	q3SYOiOtjEuFKgr85kvMyuddKlLygOu5uTXKR52NX+f03h9+FMcHLsJTz
X-Gm-Gg: ASbGncvZbpZrQQF9tYkxAWeC0MwkAOufNo80hHbk3K0oWVl02w2kcUUsJLgaYYfNq8j
	1cOVA+AdR0ae5cchk9rtaNuFbDsDPAXHBc6+PegzwINGkInJQD4AHWdIpHvtrN4T2T8rIy1mllQ
	mS3CoI4gdGz6Oy8aiI3B/lPcKL0HbI6dY8KJHRvVWZip0fGfKge7e0gVBANyPd6Rux8ZB5YgGqp
	tAwqYb5Xt8cdiGLMjbYkmTuHEDGIk0tXTg0lV/w5F7Iw03MLbgmr6uns+2tJEIpqduy6lQV/7Mw
	ybjgWJ7ZbdegWg==
X-Received: by 2002:a17:902:f54f:b0:21d:3bd7:afdd with SMTP id d9443c01a7336-21d3bd7b341mr440645965ad.0.1738004338072;
        Mon, 27 Jan 2025 10:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYWynuAQ6dVqX0QoE4kZ5Wh8F1Y8kn1WTSOnlhZZ47NDsPfhlAa1hcBk7x3k8Oxuy7IZ06ig==
X-Received: by 2002:a17:902:f54f:b0:21d:3bd7:afdd with SMTP id d9443c01a7336-21d3bd7b341mr440645215ad.0.1738004337234;
        Mon, 27 Jan 2025 10:58:57 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3081sm66658595ad.62.2025.01.27.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:58:56 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Helen Koike <helen.koike@collabora.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Leonardo Bras <leobras@redhat.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: kernelci@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] gitlab-ci: Let project define runner using environment variables
Date: Mon, 27 Jan 2025 15:58:49 -0300
Message-ID: <20250127185849.34131-1-leobras@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MSWjdnIfITJ6QhzsUZz8mGbdE3l1ZTec5kjQmPIfBbQ_1738004338
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Currently it's not possible to select which runner will handle a pipeline
without changing the codebase.

Add KCI_CI_TAGS environment variable, which can be used to select a runner
either from a commit message, or directly from Gitlab interface.
If not set in any way, the project will pick the default runner.

Also add Documentation for this variable.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 Documentation/ci/gitlab-ci/gitlab-ci.rst | 5 +++++
 tools/ci/gitlab-ci/gitlab-ci.yml         | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/ci/gitlab-ci/gitlab-ci.rst b/Documentation/ci/gitlab-ci/gitlab-ci.rst
index 940a800069238..ce89e4c093863 100644
--- a/Documentation/ci/gitlab-ci/gitlab-ci.rst
+++ b/Documentation/ci/gitlab-ci/gitlab-ci.rst
@@ -371,20 +371,25 @@ Description of Each Variable
 **KCI_CHECKPATCH_OPTIONS**
     Used in `checkpatch.pl "$KCI_CHECKPATCH_OPTIONS"` (see checkpatch
     documentation). It is commonly used with the --ignore flag to suppress
     specific warnings generated by checkpatch.pl. It can also be defined in the
     commit message, since it is evaluated in run time.
 
 **KCI_PATCH_SERIES_SIZE**
     Used to define the size of the patch series, see `job: checkpatch` section
     above. It is evaluated in run time, and can be set in the commit message.
 
+**KCI_CI_TAGS**
+    Used to help choose which runner will deal with the current pipeline.
+    Make sure to use a runner with at least 16GB of RAM, as this is required
+    to build & commit the base image.
+
 .. _triggering-pipelines-from-command-line:
 
 Triggering Pipelines from Command Line
 --------------------------------------
 
 Pipelines can be triggered from the command line with custom variables using the
 `GitLab CLI tool <https://docs.gitlab.com/ee/editor_extensions/gitlab_cli>`_.
 
 Example:
 
diff --git a/tools/ci/gitlab-ci/gitlab-ci.yml b/tools/ci/gitlab-ci/gitlab-ci.yml
index d2679d9929de1..f49105ee61be6 100644
--- a/tools/ci/gitlab-ci/gitlab-ci.yml
+++ b/tools/ci/gitlab-ci/gitlab-ci.yml
@@ -34,20 +34,22 @@ workflow:
 
 variables:
   SMATCH_DB_DIR: /smatch/smatch_data
   # exit code of bash script on `script` will be the exit code of the job
   FF_USE_NEW_BASH_EVAL_STRATEGY: "true"
   KCI_SCENARIO:
     description: Set to any non-empty value to disable scenarios
     value: ""
 
 default:
+  tags:
+    - $KCI_CI_TAGS
   artifacts:
     paths:
       - artifacts/
     when: always
 
 include:
   - remote: 'https://gitlab.freedesktop.org/freedesktop/ci-templates/-/raw/16bc29078de5e0a067ff84a1a199a3760d3b3811/templates/debian.yml'
 
   - tools/ci/gitlab-ci/container.yml
   - tools/ci/gitlab-ci/cache.yml
-- 
2.48.1

