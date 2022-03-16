Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [RFC PATCH 1/2] Documentation: dev-tools: KTAP spec change version to 2-rc
Date: Wed, 16 Mar 2022 15:26:21 -0500
Message-Id: <20220316202622.324866-2-frowand.list@gmail.com>
In-Reply-To: <20220316202622.324866-1-frowand.list@gmail.com>
References: <20220316202622.324866-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Prepare KTAP Specification for the process of creating Version 2.
The version will remain 2-rc until the final commit to complete
Version 2.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 5ee735c6687f..37b5dc61bfb8 100644
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

