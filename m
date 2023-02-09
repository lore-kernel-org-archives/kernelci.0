Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D6371
	for <kernelci@lists.linux.dev>; Thu,  9 Feb 2023 08:54:56 +0000 (UTC)
Received: from tincan.lan (unknown [IPv6:2001:861:4a40:8620:46d9:3185:bc09:aecb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9349266020B9;
	Thu,  9 Feb 2023 08:54:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675932888;
	bh=vbnRXiU+r4c7lvYMbX38+Jok/UNcPnjR5Ne1oApjqZU=;
	h=From:To:Cc:Subject:Date:From;
	b=VB2WWYTp77n8ycy6ogtmSPtYStA4SHrxRDYimXiBgm2u3/9b2202H5BFiAkaYL5pv
	 B3xXlmNMdE+v+VEAIWCfckf9tJAf1xHxt/90wU2OgfqTs08OxBKzRLtMDXjvIee6Hb
	 airsB87vt3axe4qUe6k03OdamDha3R023xjKdpL/kMnfD39hZwwAT66WSwiTcMOBQM
	 Wr8gwgCTxGwqsAiLm/bGyLc1wZN/q5HONco9swpH8+Cew5urZEn5Mtx4MXz/303UDy
	 Shx87ijZ87Al8vXDIySHyDV4AByv38cC/YLTcS/VsEgR5Ct9PTmz+OF/7YN/lnoZuF
	 tgkS7RkGUMyKg==
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Gautam <gautammenghani201@gmail.com>,
	David Laight <David.Laight@ACULAB.COM>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
	kernel@collabora.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernelci@lists.linux.dev
Subject: [PATCH v3] selftests: use printf instead of echo -ne
Date: Thu,  9 Feb 2023 09:55:36 +0100
Message-Id: <20230209085536.1076662-1-guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than trying to guess which implementation of "echo" to run with
support for "-ne" options, use "printf" instead of "echo -ne".  It
handles escape characters as a standard feature and it is widespread
among modern shells.

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
Fixes: 79c16b1120fe ("selftests: find echo binary to use -ne options")
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---

Notes:
    v2: use printf insead of $(which echo)
    v3: rebase on top of fix with $(which echo)

 tools/testing/selftests/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 9619d0f3b2ff..06578963f4f1 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -234,11 +234,10 @@ ifdef INSTALL_PATH
 	@# While building kselftest-list.text skip also non-existent TARGET dirs:
 	@# they could be the result of a build failure and should NOT be
 	@# included in the generated runlist.
-	ECHO=`which echo`; \
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		[ ! -d $(INSTALL_PATH)/$$TARGET ] && $$ECHO "Skipping non-existent dir: $$TARGET" && continue; \
-		$$ECHO -ne "Emit Tests for $$TARGET\n"; \
+		[ ! -d $(INSTALL_PATH)/$$TARGET ] && printf "Skipping non-existent dir: $$TARGET\n" && continue; \
+		printf "Emit Tests for $$TARGET\n"; \
 		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
 			-C $$TARGET emit_tests >> $(TEST_LIST); \
 	done;
-- 
2.30.2

