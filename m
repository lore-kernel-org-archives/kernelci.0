Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460422EF4
	for <kernelci@lists.linux.dev>; Tue,  5 Dec 2023 18:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GWm78cBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701801947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Pn+itft8+t9gCpb+p0n8ROWTVnB2CjHIA3gauTTjrw=;
	b=GWm78cBqT7an++E/2esmLB1XyZGLZfBbHgUKIGN6GWiKysuz9jMVeqQNri3Ikd8ZW+R7HM
	Bve5WYN0ltcaB73qpiotbEZUv4E6q8GP8/QSbWXOjXPBnM2FPa4efZSlUrmIAaOzr62A8V
	z1VXb1/CwkNlvhIM7yYIxFKFfc8mvGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-NSiVmWg1P-6dG6IQJTJCSg-1; Tue, 05 Dec 2023 13:45:43 -0500
X-MC-Unique: NSiVmWg1P-6dG6IQJTJCSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD593102F00B;
	Tue,  5 Dec 2023 18:45:41 +0000 (UTC)
Received: from ruby.redhat.com (unknown [10.39.192.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00601492BE6;
	Tue,  5 Dec 2023 18:45:38 +0000 (UTC)
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
To: workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Theodore Ts'o <tytso@mit.edu>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Darrick J . Wong" <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	Veronika Kabatova <vkabatov@redhat.com>,
	CKI <cki-project@redhat.com>,
	kernelci@lists.linux.dev,
	Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Subject: [RFC PATCH v2 03/10] MAINTAINERS: Propose kunit core tests for framework changes
Date: Tue,  5 Dec 2023 20:02:59 +0200
Message-ID: <20231205184503.79769-4-Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

DONOTMERGE: The command in question should support -h/--help option.

Signed-off-by: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6d0777e21657..68821eecf61cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11624,6 +11624,7 @@ L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
 S:	Maintained
 W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+V:	tools/testing/kunit/run_checks.py
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit-fixes
 F:	Documentation/dev-tools/kunit/
-- 
2.42.0

