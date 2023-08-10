Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B190200BC
	for <kernelci@lists.linux.dev>; Thu, 10 Aug 2023 20:24:32 +0000 (UTC)
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 723476607236;
	Thu, 10 Aug 2023 21:24:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691699063;
	bh=CWAkbpMFXFQs1T6gDBqCxpIcKwmIAlhfHzW4mUk9Ib8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YgLtGBpWpeULzTa9f9Omhj15XDPiT7VJ+uX1qfW2e8LRP6KgwNCiCD+h2oLZloxuf
	 JSp1ov1/ODjCKt+qGYhCWd8C41+87eDRkzIfQxp7CqJ/foOQrHP0SDTcJ9+qXmLz2k
	 p/sm5GcLtd9XpIynb19abDI1+H7FZ78Ak9JjW5aKB6jOH33T6iUaMR8fUit6EK96pe
	 0ITNp/CeQoBJFFsNTiPuUpfB+hBnklhaT0uftRHvsY2jQPekLy9piABYakLqCZ7G1b
	 DF686k73+pTKJP11J0HaaU/iBD1MVjJ675plGFnSa5uK8/ue6JrgbzsfSku2uCBv2P
	 /9suWEGDqdNPg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cocci@inria.fr,
	Mark Brown <broonie@kernel.org>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	kernelci@lists.linux.dev,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Bjorn Andersson <andersson@kernel.org>,
	kernel@collabora.com,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] scripts/dtc: Add script to extract matchable DT compatibles
Date: Thu, 10 Aug 2023 16:23:50 -0400
Message-ID: <20230810202413.1780286-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810202413.1780286-1-nfraprado@collabora.com>
References: <20230810202413.1780286-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a script to extract all compatibles that can match a device
described on the Devicetree to a driver.

The compatible extraction is done by running Coccinelle with a newly
introduced Coccinelle file that detects compatibles listed inside a
of_device_id table which is referenced by the of_match_table of a
driver struct.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 scripts/dtc/extract-matchable-dt-compatibles | 33 +++++++++++
 scripts/dtc/matchable_dt_compatibles.cocci   | 58 ++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100755 scripts/dtc/extract-matchable-dt-compatibles
 create mode 100644 scripts/dtc/matchable_dt_compatibles.cocci

diff --git a/scripts/dtc/extract-matchable-dt-compatibles b/scripts/dtc/extract-matchable-dt-compatibles
new file mode 100755
index 000000000000..b5e96c7ba42e
--- /dev/null
+++ b/scripts/dtc/extract-matchable-dt-compatibles
@@ -0,0 +1,33 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (c) 2023 Collabora Ltd
+#
+# Based on coccicheck script.
+#
+# This script uses Coccinelle to extract all compatibles that can be matched by
+# Devicetree devices from the kernel source.
+
+DIR="$(dirname $(readlink -f $0))"
+SPATCH=`which ${SPATCH:=spatch}`
+COCCI_FILE=$DIR/matchable_dt_compatibles.cocci
+
+if [ ! -x "$SPATCH" ]; then
+    echo 'spatch is part of the Coccinelle project and is available at http://coccinelle.lip6.fr/'
+    exit 1
+fi
+
+# Use only one thread per core by default if hyperthreading is enabled
+THREADS_PER_CORE=$(LANG=C lscpu | grep "Thread(s) per core: " | tr -cd "[:digit:]")
+if [ -z "$J" ]; then
+	NPROC=$(getconf _NPROCESSORS_ONLN)
+	if [ $THREADS_PER_CORE -gt 1 -a $NPROC -gt 4 ] ; then
+		NPROC=$((NPROC/2))
+	fi
+else
+	NPROC="$J"
+fi
+
+"$SPATCH" --cocci-file "$COCCI_FILE" --dir .  --jobs "$NPROC" --chunksize 1 \
+	--no-show-diff --no-includes --include-headers --very-quiet \
+	| grep '"' | sed -e 's/"//g;s/^ *\([^ ]*\) *$/\1/'
diff --git a/scripts/dtc/matchable_dt_compatibles.cocci b/scripts/dtc/matchable_dt_compatibles.cocci
new file mode 100644
index 000000000000..ecd3705681aa
--- /dev/null
+++ b/scripts/dtc/matchable_dt_compatibles.cocci
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright: (C) 2023 Collabora Ltd
+@rule1@
+identifier table;
+type drv;
+identifier drvname;
+identifier drvfield;
+identifier drvfield1;
+identifier drvfield2;
+@@
+
+(
+drv drvname = {
+	.drvfield = {
+		.of_match_table = table,
+	},
+};
+|
+drv drvname = {
+	.drvfield = {
+		.of_match_table = of_match_ptr(table),
+	},
+};
+|
+// Accounts for mdio and spimem drivers
+drv drvname = {
+	.drvfield1 = {
+		.drvfield2 = {
+			.of_match_table = table,
+		},
+	},
+};
+|
+drv drvname = {
+	.drvfield1 = {
+		.drvfield2 = {
+			.of_match_table = of_match_ptr(table),
+		},
+	},
+};
+)
+
+@rule2@
+identifier rule1.table;
+expression compat;
+@@
+
+struct of_device_id table[] = {
+...,
+{ .compatible = compat, },
+...
+};
+
+@script:python@
+compat << rule2.compat;
+@@
+
+print("%s" % compat)
-- 
2.41.0

