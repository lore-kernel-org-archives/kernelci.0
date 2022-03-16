Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [RFC PATCH 2/2] Documentation: dev-tools: use literal block instead of code-block
Date: Wed, 16 Mar 2022 15:26:22 -0500
Message-Id: <20220316202622.324866-3-frowand.list@gmail.com>
In-Reply-To: <20220316202622.324866-1-frowand.list@gmail.com>
References: <20220316202622.324866-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

KTAP Specification: Change code-block directives to straightforward
literal blocks since the blocks do not contain code.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/dev-tools/ktap.rst | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 37b5dc61bfb8..b9a57ceddd4f 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -115,34 +115,32 @@ The diagnostic data field is optional, and results which have neither a
 directive nor any diagnostic data do not need to include the "#" field
 separator.
 
-Example result lines include:
-
-.. code-block:: none
+Example result lines include::
 
 	ok 1 test_case_name
 
 The test "test_case_name" passed.
 
-.. code-block:: none
+::
 
 	not ok 1 test_case_name
 
 The test "test_case_name" failed.
 
-.. code-block:: none
+::
 
 	ok 1 test # SKIP necessary dependency unavailable
 
 The test "test" was SKIPPED with the diagnostic message "necessary dependency
 unavailable".
 
-.. code-block:: none
+::
 
 	not ok 1 test # TIMEOUT 30 seconds
 
 The test "test" timed out, with diagnostic data "30 seconds".
 
-.. code-block:: none
+::
 
 	ok 5 check return code # rcode=0
 
@@ -202,7 +200,7 @@ allowed to be either indented or not indented.
 
 An example of a test with two nested subtests:
 
-.. code-block:: none
+::
 
 	KTAP version 1
 	1..1
@@ -215,7 +213,7 @@ An example of a test with two nested subtests:
 
 An example format with multiple levels of nested testing:
 
-.. code-block:: none
+::
 
 	KTAP version 1
 	1..2
@@ -250,7 +248,7 @@ nested version line, uses a line of the form
 
 Example KTAP output
 --------------------
-.. code-block:: none
+::
 
 	KTAP version 1
 	1..1
-- 
Frank Rowand <frank.rowand@sony.com>

