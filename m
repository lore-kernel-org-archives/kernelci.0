Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526C111A
	for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 21:14:32 +0000 (UTC)
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C09E166071C7;
	Mon, 28 Aug 2023 22:14:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693257271;
	bh=z6VcAPJB2wzNAu89McnlY95dVXFDs/OIGdTL7JnPRB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oMpynwLUhWpxC9zt87DMRf+/cOWkS7TxKvY8xxkT3Rc7jiscnNIOCObEfWqDDeiV3
	 CDHbA85yGrR1X7Q1S0Ce+CnHGFTJBMAUgCMRV8qXT6fgPEqiQeNC1DV3u+xZnx6JKN
	 /IP/zAVJj/LVs8UjmyEppHOPGLUq9aU07kPHXxq569kUcgbbNABV8JShJI/dwTNfXU
	 T69lu7TQVbPwsGRnOEE74iJUQnus/Ge/H2uXZj0PbS/tOGL1zmJstI9WSJuDFInGiJ
	 TBFpxgp/aH6lsFY33xbpEULkeza0HzT8Vqvjj4C9G8iv8LpkKSwFp+CrCdSkq6kZZT
	 Y3k62HKoNs8Eg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	kernelci@lists.linux.dev,
	kernel@collabora.com,
	Guenter Roeck <groeck@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt: dt-extract-compatibles: Handle cfile arguments in generator function
Date: Mon, 28 Aug 2023 17:13:10 -0400
Message-ID: <20230828211424.2964562-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828211424.2964562-1-nfraprado@collabora.com>
References: <20230828211424.2964562-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the handling of the cfile arguments to a separate generator
function to avoid redundancy.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v2)

Changes in v2:
- Added this commit

 scripts/dtc/dt-extract-compatibles | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-extract-compatibles b/scripts/dtc/dt-extract-compatibles
index 9df9f1face83..2b6d228602e8 100755
--- a/scripts/dtc/dt-extract-compatibles
+++ b/scripts/dtc/dt-extract-compatibles
@@ -49,6 +49,14 @@ def print_compat(filename, compatibles):
 	else:
 		print(*compatibles, sep='\n')
 
+def files_to_parse(path_args):
+	for f in path_args:
+		if os.path.isdir(f):
+			for filename in glob.iglob(f + "/**/*.c", recursive=True):
+				yield filename
+		else:
+			yield f
+
 show_filename = False
 
 if __name__ == "__main__":
@@ -59,11 +67,6 @@ if __name__ == "__main__":
 
 	show_filename = args.with_filename
 
-	for f in args.cfile:
-		if os.path.isdir(f):
-			for filename in glob.iglob(f + "/**/*.c", recursive=True):
-				compat_list = parse_compatibles(filename)
-				print_compat(filename, compat_list)
-		else:
-			compat_list = parse_compatibles(f)
-			print_compat(f, compat_list)
+	for f in files_to_parse(args.cfile):
+		compat_list = parse_compatibles(f)
+		print_compat(f, compat_list)
-- 
2.42.0

