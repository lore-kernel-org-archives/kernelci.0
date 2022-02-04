Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH 1/1] Documentation: dev-tools: clarify KTAP specification wording
Date: Fri,  4 Feb 2022 14:32:48 -0600
Message-Id: <20220204203248.2981902-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Clarify some confusing phrasing.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

One item that may result in bikeshedding is that I added the spec
version to the title line.

 Documentation/dev-tools/ktap.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 878530cb9c27..3b7a26816930 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-========================================
-The Kernel Test Anything Protocol (KTAP)
-========================================
+===================================================
+The Kernel Test Anything Protocol (KTAP), version 1
+===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
 by a number of projects. It's website and specification are found at this `link
@@ -186,7 +186,7 @@ starting with another KTAP version line and test plan, and end with the overall
 result. If one of the subtests fail, for example, the parent test should also
 fail.
 
-Additionally, all result lines in a subtest should be indented. One level of
+Additionally, all lines in a subtest should be indented. One level of
 indentation is two spaces: "  ". The indentation should begin at the version
 line and should end before the parent test's result line.
 
@@ -225,8 +225,8 @@ Major differences between TAP and KTAP
 --------------------------------------
 
 Note the major differences between the TAP and KTAP specification:
-- yaml and json are not recommended in diagnostic messages
-- TODO directive not recognized
+- yaml and json are not recommended in KTAP diagnostic messages
+- TODO directive not recognized in KTAP
 - KTAP allows for an arbitrary number of tests to be nested
 
 The TAP14 specification does permit nested tests, but instead of using another
-- 
Frank Rowand <frank.rowand@sony.com>

