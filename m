Return-Path: <frowand.list@gmail.com>
From: frowand.list@gmail.com
Subject: [PATCH v5 1/1] Documentation: dev-tools: clarify KTAP specification wording
Date: Thu, 10 Feb 2022 17:36:30 -0600
Message-Id: <20220210233630.3304495-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Add the spec version to the title line.

Explain likely source of "Unknown lines".

"Unknown lines" in nested tests are optionally indented.

Add "Unknown lines" items to differences between TAP & KTAP list

Convert "Major differences between TAP and KTAP" from a bullet list
to a table.  The bullet list was being formatted as a single
paragraph.

Reviewed-by: Tim Bird <Tim.Bird@sony.com>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

I'm not sure if I should include a review tag of patch 2/2 version 4:
  Reviewed-by: Kees Cook <keescook@chromium.org>

Changes since version 4
  - Remove patch 2/2 (fixes to code-block directives)
  - Remove patch 2/2 (conversion to table folded into this patch)

Changes since version 3
  - Add reviewed by Shuah

Changes since version 2
  - Add missing quote after word: incorrect
  - Add Reviewed-by tags

Changes since version 1
  - Explain likely source of "Unknown lines"
  - "Unknown line" in nested tests are optionally indented
  - Add "Unknown lines" items to differences between TAP & KTAP list

Fixes to code-block directives in version 3 were also submitted by
Randy Dunlap in:
https://lore.kernel.org/lkml/20220131003637.14274-1-rdunlap@infradead.org/T/

 Documentation/dev-tools/ktap.rst | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index 878530cb9c27..d7fe05de40b4 100644
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
@@ -174,6 +174,13 @@ There may be lines within KTAP output that do not follow the format of one of
 the four formats for lines described above. This is allowed, however, they will
 not influence the status of the tests.
 
+This is an important difference from TAP.  Kernel tests may print messages
+to the system console or a log file.  Both of these destinations may contain
+messages either from unrelated kernel or userspace activity, or kernel
+messages from non-test code that is invoked by the test.  The kernel code
+invoked by the test likely is not aware that a test is in progress and
+thus can not print the message as a diagnostic message.
+
 Nested tests
 ------------
 
@@ -186,10 +193,13 @@ starting with another KTAP version line and test plan, and end with the overall
 result. If one of the subtests fail, for example, the parent test should also
 fail.
 
-Additionally, all result lines in a subtest should be indented. One level of
+Additionally, all lines in a subtest should be indented. One level of
 indentation is two spaces: "  ". The indentation should begin at the version
 line and should end before the parent test's result line.
 
+"Unknown lines" are not considered to be lines in a subtest and thus are
+allowed to be either indented or not indented.
+
 An example of a test with two nested subtests:
 
 .. code-block::
@@ -224,10 +234,15 @@ An example format with multiple levels of nested testing:
 Major differences between TAP and KTAP
 --------------------------------------
 
-Note the major differences between the TAP and KTAP specification:
-- yaml and json are not recommended in diagnostic messages
-- TODO directive not recognized
-- KTAP allows for an arbitrary number of tests to be nested
+==================================================   =========  ===============
+Feature                                              TAP        KTAP
+==================================================   =========  ===============
+yaml and json in diagnosic message                   ok         not recommended
+TODO directive                                       ok         not recognized
+allows an arbitrary number of tests to be nested     no         yes
+"Unknown lines" are in category of "Anything else"   yes        no
+"Unknown lines" are                                  incorrect  allowed
+==================================================   =========  ===============
 
 The TAP14 specification does permit nested tests, but instead of using another
 nested version line, uses a line of the form
-- 
Frank Rowand <frank.rowand@sony.com>

