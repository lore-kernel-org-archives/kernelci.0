Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH v3 1/2] ktap_v2: change version to 2-rc in KTAP specification
Date: Mon, 29 Aug 2022 18:31:49 -0500
Message-Id: <20220829233150.3564612-2-frowand.list@gmail.com>
In-Reply-To: <20220829233150.3564612-1-frowand.list@gmail.com>
References: <20220829233150.3564612-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

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

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index d0a9565b0f44..b9a57ceddd4f 100644
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
Frank Rowand <frank.rowand@sony.com>

