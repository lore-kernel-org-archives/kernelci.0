Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178F1494AD
	for <kernelci@lists.linux.dev>; Fri,  5 Jul 2024 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720222212; cv=none; b=sE6c++PXvPSemHA2872NV220JB55RI6VgPFJ2ZjJyUUCyIzghdiDFxv1+cekqwHcCYx1FnJ3mpSBG0Ni+7ewo6LGPTxBxuDKg9IoTriLysWBo5gVT9bx+lEf7rnoT8lYQUCOD2eGhSCq4YTmDQw1O9qhD1YTMrm7BeEJ2T/XxAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720222212; c=relaxed/simple;
	bh=+5Axi8pUbv9XBWCm5KmHeoSVyq6vEZaUSVZeT+DQHF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJWTn5rSw57ExwSEVNw8J+vGhCJFkV1Gb6uewl1vfFei0QKmferJqb/b9mmBRn9DjfIKB3n6UTOxyjSCuv4rLwezGiyBzVXMpbnxu6uVQDwawcosk9aBS+3ZcakghEAmn6+2kWu7Jh7exE3ojdM13qI9jcUHNk7r2u3pL+7NO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DwDUZBuk; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DwDUZBuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720222209;
	bh=+5Axi8pUbv9XBWCm5KmHeoSVyq6vEZaUSVZeT+DQHF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DwDUZBuk9A2BOBe7ytpzgBGEI20Teo6NW1BWxXTV+sdQoTMdPCGjpbOks/Gw7CIyq
	 SCV0YMpVcrvFUSUHmPMnzKTQAd5yC9eb0WWNUI46zT40rPrt+Bsglbp54T63z7jpwN
	 8+hNlAj0NyNEvC3bXEl8NmImBoZA3r8bQUVtTPj8U9dJGckWFuGyCkNeSX8pzoabaO
	 Wt4D2pFeXYPTuL1Cxw708waV2K2yPacL7Z6olq53UjjWXAZU3Uqdoaek5LQHfCVtiQ
	 CTkTvmuVWmzmJ3/zsqzFxchnH8N14qHr2IdqmZz7qivvXsAKplhFVoKKlWFb20mSu+
	 M9vdGnbz4bfoA==
Received: from [192.168.1.238] (tango.collaboradmins.com [167.235.144.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 23EAE378206B;
	Fri,  5 Jul 2024 23:30:08 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 05 Jul 2024 19:29:54 -0400
Subject: [PATCH v2 1/3] kselftest: devices: Move discoverable devices test
 to subdirectory
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240705-dev-err-log-selftest-v2-1-163b9cd7b3c1@collabora.com>
References: <20240705-dev-err-log-selftest-v2-0-163b9cd7b3c1@collabora.com>
In-Reply-To: <20240705-dev-err-log-selftest-v2-0-163b9cd7b3c1@collabora.com>
To: Shuah Khan <shuah@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0

Move the discoverable devices test to a subdirectory to allow other
related tests to be added to the devices directory.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tools/testing/selftests/Makefile                                        | 2 +-
 tools/testing/selftests/devices/{ => probe}/Makefile                    | 2 +-
 .../selftests/devices/{ => probe}/boards/Dell Inc.,XPS 13 9300.yaml     | 0
 tools/testing/selftests/devices/{ => probe}/boards/google,spherion.yaml | 0
 tools/testing/selftests/devices/{ => probe}/ksft.py                     | 0
 .../testing/selftests/devices/{ => probe}/test_discoverable_devices.py  | 0
 6 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 9039f3709aff..37214201d974 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -13,7 +13,7 @@ TARGETS += core
 TARGETS += cpufreq
 TARGETS += cpu-hotplug
 TARGETS += damon
-TARGETS += devices
+TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
 TARGETS += drivers/s390x/uvdevice
diff --git a/tools/testing/selftests/devices/Makefile b/tools/testing/selftests/devices/probe/Makefile
similarity index 77%
rename from tools/testing/selftests/devices/Makefile
rename to tools/testing/selftests/devices/probe/Makefile
index ca29249b30c3..7a6eaa031cfe 100644
--- a/tools/testing/selftests/devices/Makefile
+++ b/tools/testing/selftests/devices/probe/Makefile
@@ -1,4 +1,4 @@
 TEST_PROGS := test_discoverable_devices.py
 TEST_FILES := boards ksft.py
 
-include ../lib.mk
+include ../../lib.mk
diff --git a/tools/testing/selftests/devices/boards/Dell Inc.,XPS 13 9300.yaml b/tools/testing/selftests/devices/probe/boards/Dell Inc.,XPS 13 9300.yaml
similarity index 100%
rename from tools/testing/selftests/devices/boards/Dell Inc.,XPS 13 9300.yaml
rename to tools/testing/selftests/devices/probe/boards/Dell Inc.,XPS 13 9300.yaml
diff --git a/tools/testing/selftests/devices/boards/google,spherion.yaml b/tools/testing/selftests/devices/probe/boards/google,spherion.yaml
similarity index 100%
rename from tools/testing/selftests/devices/boards/google,spherion.yaml
rename to tools/testing/selftests/devices/probe/boards/google,spherion.yaml
diff --git a/tools/testing/selftests/devices/ksft.py b/tools/testing/selftests/devices/probe/ksft.py
similarity index 100%
rename from tools/testing/selftests/devices/ksft.py
rename to tools/testing/selftests/devices/probe/ksft.py
diff --git a/tools/testing/selftests/devices/test_discoverable_devices.py b/tools/testing/selftests/devices/probe/test_discoverable_devices.py
similarity index 100%
rename from tools/testing/selftests/devices/test_discoverable_devices.py
rename to tools/testing/selftests/devices/probe/test_discoverable_devices.py

-- 
2.45.2

