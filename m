Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH v2 2/2] ktap_v2: change "version 1" to "version 2" in examples
Date: Wed,  4 May 2022 17:51:52 -0500
Message-Id: <20220504225152.1451440-3-frowand.list@gmail.com>
In-Reply-To: <20220504225152.1451440-1-frowand.list@gmail.com>
References: <20220504225152.1451440-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Change the "version line" in example output from
"KTAP version 1" to "KTAP version 2".

Change version that should be used by compliant tests from 1 to 2.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/dev-tools/ktap.rst | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 37b5dc61bfb8..c78bb46a4430 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -39,6 +39,7 @@ version of the (K)TAP standard the result is compliant with.
 
 For example:
 - "KTAP version 1"
+- "KTAP version 2"
 - "TAP version 13"
 - "TAP version 14"
 
@@ -46,7 +47,7 @@ Note that, in KTAP, subtests also begin with a version line, which denotes the
 start of the nested test results. This differs from TAP14, which uses a
 separate "Subtest" line.
 
-While, going forward, "KTAP version 1" should be used by compliant tests, it
+While, going forward, "KTAP version 2" should be used by compliant tests, it
 is expected that most parsers and other tooling will accept the other versions
 listed here for compatibility with existing tests and frameworks.
 
@@ -204,9 +205,9 @@ An example of a test with two nested subtests:
 
 .. code-block:: none
 
-	KTAP version 1
+	KTAP version 2
 	1..1
-	  KTAP version 1
+	  KTAP version 2
 	  1..2
 	  ok 1 test_1
 	  not ok 2 test_2
@@ -217,11 +218,11 @@ An example format with multiple levels of nested testing:
 
 .. code-block:: none
 
-	KTAP version 1
+	KTAP version 2
 	1..2
-	  KTAP version 1
+	  KTAP version 2
 	  1..2
-	    KTAP version 1
+	    KTAP version 2
 	    1..2
 	    not ok 1 test_1
 	    ok 2 test_2
@@ -252,21 +253,21 @@ Example KTAP output
 --------------------
 .. code-block:: none
 
-	KTAP version 1
+	KTAP version 2
 	1..1
-	  KTAP version 1
+	  KTAP version 2
 	  1..3
-	    KTAP version 1
+	    KTAP version 2
 	    1..1
 	    # test_1: initializing test_1
 	    ok 1 test_1
 	  ok 1 example_test_1
-	    KTAP version 1
+	    KTAP version 2
 	    1..2
 	    ok 1 test_1 # SKIP test_1 skipped
 	    ok 2 test_2
 	  ok 2 example_test_2
-	    KTAP version 1
+	    KTAP version 2
 	    1..3
 	    ok 1 test_1
 	    # test_2: FAIL
-- 
Frank Rowand <frank.rowand@sony.com>

