Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9121A4B5
	for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442097; cv=none; b=TSYADhUMWolsdAf3hbG9FADW3li8xFa1Zy+z6Zo1krbPNKWoohInFV9VFNxL54FYEuj6r9kdynZ1GxWK/auHr3rRb6rz2u83SHFA2p5mZ1TO9Uya6U9V09Fh5dcan221957N/8ph3cwEyB3V7h3y/v4FItA6OFywPk5ZEpRozCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442097; c=relaxed/simple;
	bh=N/kqKSd5HGjnRCd+J9lM0CPyS/hgrFerGMHg0X1h0mU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MIOOw1Ez4lpVThVnHQc2A1gDULjYHhbi1YhAuZYPoHxDBVc0zPXL4LZrzxPUZhmaQWTbfouuifR5RiXOSAhjNHYR7CxsfmWF2YQkLfSinzjgQpnrbWO3W4wEMZ/iio15bE/6HuzSe1UH7L/+3eNkektxNEV2hCDv7Lk/umhtOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a7sv6Jfo; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a7sv6Jfo"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e355f1ff4bso119153127b3.2
        for <kernelci@lists.linux.dev>; Tue, 12 Nov 2024 12:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731442093; x=1732046893; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApGi/y+58f9rJEZDIpWpt6jzoTzWeL/xk3OWsFr2GqI=;
        b=a7sv6JfodjfhPBaEygpeehQIqVKNQ86j4Q0f5XD7nmWTGzs0ovlEkC6dGrfckeFLSS
         TlIrM+d5FXgwvGvFa1JRNRV+aj4FvydBBy/J8kaAh7G56VpLzPv72ApubUmgYw5Wm1Pu
         +0O6AwxlhQtRPxGme2juewY6UF1r2DWWd2BJuloHj+2bBrjtpG/dkc64qqmzcLlzt5SX
         OCkflQh1IJ4ekBCNQVP+rek/EF8dfRWLWyBCxF73rvGD2aj9qUcNawY45jQs6VqaDc0e
         bJkWeiclbjBJ514o8cHYgP49Hleb5mqVnNLdscY4AWOZiqLz7BtvzimN3IJ/EbO5jKRo
         6j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442093; x=1732046893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApGi/y+58f9rJEZDIpWpt6jzoTzWeL/xk3OWsFr2GqI=;
        b=YBvz/7JfFY3m8Ykbgk96KaIzAqj30CaJi0bkONt/HMLPOEkF0sTJRPKt0RETXMwytv
         Zajd+Lvs03svWSijzjSBu5dGXuLLbrxFVf/yLHrcksdVmNmBJu/GPBP1v3qM2W5QtS9I
         /OlQdYZwaD0mfDswYu6cGWpXv1M17GUp+f3jImppxDq2CUzin9NqqVCtHMDc9tzGl5kQ
         TsYmoLDpFY0TUneVKLRxP5KCg3dWAnt6xDASrUN1pA0YQKWQxu6w+jqgXINu+V48+fqn
         /Yrzr1gMHLysbvKiM866+m8a8pt1WGa2pEsnhwB3UPbuwzqzYkiPS0fxw8YGlU7n/2NQ
         xvcA==
X-Forwarded-Encrypted: i=1; AJvYcCVVY/K1XvWc8vS2iYNEB2vzuQXo+64tPg5J8dwp4kqzpHJZhzS1o6HZ7KKldoDT/Rci0w29Nvjenw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyME3cQzI+cEewlL5EXL9bwdcwgDLv5wofCXf6/lfJyO/Hq/LC+
	szjpYOaj0BEg5Al+jlnzH92uwuw6O716d1cAWPES/unqCaVSi2FSM715yN8JfAt8RG+NqmUynQ=
	=
X-Google-Smtp-Source: AGHT+IEgl/NagswMe3ogaADqrl8UdqMFKaeMoJU3wMGiXCuoEIJgbxJG6a47VnTjitrfetoMwaEm4xjLgg==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:d3:4d64:ac12:6a5d])
 (user=rmoar job=sendgmr) by 2002:a5b:70a:0:b0:e28:e6a1:fc53 with SMTP id
 3f1490d57ef6-e337f8c6c5dmr54106276.5.1731442092914; Tue, 12 Nov 2024 12:08:12
 -0800 (PST)
Date: Tue, 12 Nov 2024 20:07:46 +0000
In-Reply-To: <20241112200748.791828-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241112200748.791828-1-rmoar@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112200748.791828-4-rmoar@google.com>
Subject: [PATCH 3/5] ktap_v2: add test metadata
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Add specification for test metadata to the KTAP v2 spec.

KTAP v1 only specifies the output format of very basic test information:
test result and test name. Any additional test information either gets
added to general diagnostic data or is not included in the output at all.

The purpose of KTAP metadata is to create a framework to include and
easily identify additional important test information in KTAP.

KTAP metadata could include any test information that is pertinent for
user interaction before or after the running of the test. For example,
the test file path or the test speed.

Since this includes a large variety of information, this specification
will recognize notable types of KTAP metadata to ensure consistent format
across test frameworks. See the full list of types in the specification.

Example of KTAP Metadata:

 KTAP version 2
 #:ktap_test: main
 #:ktap_arch: uml
 1..1
     KTAP version 2
     #:ktap_test: suite_1
     #:ktap_subsystem: example
     #:ktap_test_file: lib/test.c
     1..2
     ok 1 test_1
     #:ktap_test: test_2
     #:ktap_speed: very_slow
     # test_2 has begun
     #:custom_is_flaky: true
     ok 2 test_2
 # suite_1 has passed
 ok 1 suite_1

The changes to the KTAP specification outline the format, location, and
different types of metadata.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 248 ++++++++++++++++++++++++++++++-
 1 file changed, 244 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index c8f83a7bd470..d4529f4e38c7 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -17,19 +17,21 @@ KTAP test results describe a series of tests (which may be nested: i.e., test
 can have subtests), each of which can contain both diagnostic data -- e.g., log
 lines -- and a final result. The test structure and results are
 machine-readable, whereas the diagnostic data is unstructured and is there to
-aid human debugging.
+aid human debugging. Since version 2, tests can also contain metadata which
+consists of important supplemental test information and can be
+machine-readable.
 
-KTAP output is built from four different types of lines:
+KTAP output is built from five different types of lines:
 - Version lines
 - Plan lines
 - Test case result lines
 - Diagnostic lines
+- Metadata lines
 
 In general, valid KTAP output should also form valid TAP output, but some
 information, in particular nested test results, may be lost. Also note that
 there is a stagnant draft specification for TAP14, KTAP diverges from this in
-a couple of places (notably the "Subtest" header), which are described where
-relevant later in this document.
+a couple of places, which are described where relevant later in this document.
 
 Version lines
 -------------
@@ -166,6 +168,238 @@ even if they do not start with a "#": this is to capture any other useful
 kernel output which may help debug the test. It is nevertheless recommended
 that tests always prefix any diagnostic output they have with a "#" character.
 
+KTAP metadata lines
+-------------------
+
+KTAP metadata lines are used to include and easily identify important
+supplemental test information in KTAP. These lines may appear similar to
+diagnostic lines. They were introduced in KTAP version 2. The format of
+metadata lines is below:
+
+.. code-block:: none
+
+	#:<prefix>_<metadata type>: <metadata value>
+
+The <prefix> indicates where to find the specification for the type of
+metadata, such as the name of a test framework or "ktap" to indicate this
+specification. The list of currently approved prefixes and where to find the
+documentation of the metadata types is below. Note any metadata type that does
+not use a prefix from the list below must use the prefix "custom".
+
+Current List of Approved Prefixes:
+
+- ``ktap``: See Types of KTAP Metadata below for the list of metadata types.
+
+The format of <metadata type> and <value> varies based on the type. See the
+individual specification. For "custom" types the <metadata type> can be any
+string excluding ":", spaces, or newline characters and the <value> can be any
+string.
+
+**Location:**
+
+The first KTAP metadata line for a test must be "#:ktap_test: <test name>",
+which acts as a header to associate metadata with the correct test. Metadata
+for the main KTAP level uses the test name "main". A test's metadata ends
+with a "ktap_test" line for a different test.
+
+For test cases, the location of the metadata is between the prior test result
+line and the current test result line. For test suites, the location of the
+metadata is between the suite's version line and test plan line. For the main
+level, the location of the metadata is between the main version line and main
+test plan line. See the example below.
+
+Note that a test case's metadata is inline with the test's result line. Whereas
+a suite's metadata is inline with the suite's version line and thus will be
+more indented than the suite's result line. Additionally, metadata for the main
+level is inline with the main version line.
+
+KTAP metadata for a test does not need to be contiguous. For example, a kernel
+warning or other diagnostic output could interrupt metadata lines. However, it
+is recommended to keep a test's metadata lines in the correct location and
+together when possible, as this improves readability.
+
+**Example of KTAP metadata:**
+
+::
+
+        KTAP version 2
+        #:ktap_test: main
+        #:ktap_arch: uml
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          #:ktap_subsystem: example
+          #:ktap_test_file: lib/test.c
+          1..2
+          # WARNING: test_1 skipped
+          ok 1 test_1 # SKIP
+          #:ktap_test: test_2
+          #:ktap_speed: very_slow
+          # test_2 has begun
+          #:custom_is_flaky: true
+          ok 2 test_2
+        # suite_1 passed
+        ok 1 suite_1
+
+In this example, the tests are running on UML. The test suite "suite_1" is part
+of the subsystem "example" and belongs to the file "lib/test.c". It has
+two subtests, "test_1" and "test_2". The subtest "test_2" has a speed of
+"very_slow" and has been marked with a custom KTAP metadata type called
+"custom_is_flaky" with the value of "true".
+
+**Inheritance of KTAP metadata**
+
+Tests can inherit KTAP metadata. A child test inherits all the parent test's
+KTAP metadata except for directly opposing metadata.  For example, if a suite
+has a property of "#:ktap_speed: slow", all child test cases are also marked as
+slow. However, if one of the test cases has metadata of "#:ktap_speed:
+very_slow" then that test case would be marked as very_slow instead and not
+slow.
+
+Note if a test case inherits metadata it does not need to appear as a line in
+the KTAP. Using the example above, not every test case would have the line
+"#:ktap_speed: slow" in their metadata.
+
+**Edge Case Examples of KTAP metadata**
+
+Here are a few edge case examples of KTAP metadata. The first example shows
+metadata in the wrong location.
+
+::
+
+        KTAP version 2
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          1..3
+          ok 1 test_1
+          #:ktap_test: test_2
+          #:ktap_speed: very_slow
+          ok 2 test_2
+          #:ktap_duration: 1.342s
+          #:ktap_test: test_3
+          #:ktap_speed: slow
+          ok 3 test_3
+        ok 1 suite_1
+
+In this example, the metadata "#:ktap_duration: 1.342s" is in the wrong
+location. It was meant to belong to test_2 but was printed late. The location
+of this metadata is not recommended. However, it is allowed because the line is
+still below "#:ktap_test: test_2" and above any other ktap_test lines.
+
+This second example shows metadata in the correct location but without the
+proper header.
+
+::
+
+        KTAP version 2
+        1..1
+          KTAP version 2
+          #:ktap_test: suite_1
+          1..2
+          not ok 1 test_1
+          #:ktap_speed: very_slow
+          ok 2 test_2
+        ok 1 suite_1
+
+In this example, the metadata "#:ktap_speed: very_slow" is meant to belong to
+test_2. It is in the correct location but does not fall below a ktap_test line
+for test_2. Instead this metadata might be mistaken for belonging to suite_1
+because it does fall under the ktap_test line for suite_1. This lack of header
+is not allowed.
+
+**Types of KTAP Metadata:**
+
+This is the current list of KTAP metadata types recognized in this
+specification. Note that all of these metadata types are optional (except for
+ktap_test as the KTAP metadata header).
+
+- ``ktap_test``: Name of test (used as header of KTAP metadata). This should
+  match the test name printed in the test result line: "ok 1 [test_name]".
+
+- ``ktap_module``: Name of the module containing the test
+
+- ``ktap_subsystem``: Name of the subsystem being tested
+
+- ``ktap_start_time``: Time tests started in ISO8601 format
+
+  - Example: "#:ktap_start_time: 2024-01-09T13:09:01.990000+00:00"
+
+- ``ktap_duration``: Time taken (in seconds) to execute the test
+
+  - Example: "#:ktap_duration: 10.154s"
+
+- ``ktap_speed``: Category of how fast test runs: "normal", "slow", or
+  "very_slow"
+
+- ``ktap_test_file``: Path to source file containing the test. This metadata
+  line can be repeated if the test is spread across multiple files.
+
+  - Example: "#:ktap_test_file: lib/test.c"
+
+- ``ktap_generated_file``: Description of and path to file generated during
+  test execution. This could be a core dump, generated filesystem image, some
+  form of visual output (for graphics drivers), etc. This metadata line can be
+  repeated to attach multiple files to the test. Note use ktap_log_file or
+  ktap_error_file instead of this type if more applicable.
+
+  - Example: "#:ktap_generated_file: Core dump: /var/lib/systemd/coredump/hello.core"
+
+- ``ktap_log_file``: Path to file containing kernel log test output
+
+  - Example: "#:ktap_log_file: /sys/kernel/debugfs/kunit/example/results"
+
+- ``ktap_error_file``: Path to file containing context for test failure or
+  error. This could include the difference between optimal test output and
+  actual test output.
+
+  - Example: "#:ktap_error_file: fs/results/example.out.bad"
+
+- ``ktap_results_url``: Link to webpage describing this test run and its
+  results
+
+  - Example: "#:ktap_results_url: https://kcidb.kernelci.org/hello"
+
+- ``ktap_arch``: Architecture used during test run
+
+  - Example: "#:ktap_arch: x86_64"
+
+- ``ktap_compiler``: Compiler used during test run
+
+  - Example: "#:ktap_compiler: gcc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)"
+
+- ``ktap_respository_url``: Link to git repository of the checked out code.
+
+  - Example: "#:ktap_respository_url: https://github.com/torvalds/linux.git"
+
+- ``ktap_git_branch``: Name of git branch of checked out code
+
+  - Example: "#:ktap_git_branch: kselftest/kunit"
+
+- ``ktap_kernel_version``: Version of Linux Kernel being used during test run
+
+  - Example: "#:ktap_kernel_version: 6.7-rc1"
+
+- ``ktap_config``: Config name and value. This does not necessarly need to be
+  restricted to Kconfig.
+
+  - Example: "#:ktap_config: CONFIG_SYSFS=y"
+
+- ``ktap_id``: Description of ID and ID value. This is an open-ended metadata
+  used for IDs, such as checkout id or test run id.
+
+  - Example: "#:ktap_id: Test run id: 14e782"
+
+- ``ktap_commit_hash``: The full git commit hash of the checked out base code.
+
+  - Example: "#:ktap_commit_hash: 064725faf8ec2e6e36d51e22d3b86d2707f0f47f"
+
+**Other Metadata Types:**
+
+There can also be KTAP metadata that is not included in the recognized list
+above. This metadata must be prefixed with the test framework, ie. "kselftest",
+or with the prefix "custom". For example, "# custom_batch: 20".
+
 Unknown lines
 -------------
 
@@ -206,6 +440,7 @@ An example of a test with two nested subtests:
 	KTAP version 2
 	1..1
 	  KTAP version 2
+	  #:ktap_test: example
 	  1..2
 	  ok 1 test_1
 	  not ok 2 test_2
@@ -219,6 +454,7 @@ An example format with multiple levels of nested testing:
 	KTAP version 2
 	1..2
 	  KTAP version 2
+	  #:ktap_test: example_test_1
 	  1..2
 	    KTAP version 2
 	    1..2
@@ -254,6 +490,7 @@ Example KTAP output
 	KTAP version 2
 	1..1
 	  KTAP version 2
+	  #:ktap_test: main_test
 	  1..3
 	    KTAP version 2
 	    1..1
@@ -261,11 +498,14 @@ Example KTAP output
 	    ok 1 test_1
 	  ok 1 example_test_1
 	    KTAP version 2
+	    #:ktap_test: example_test_2
+	    #:ktap_speed: slow
 	    1..2
 	    ok 1 test_1 # SKIP test_1 skipped
 	    ok 2 test_2
 	  ok 2 example_test_2
 	    KTAP version 2
+	    #:ktap_test: example_test_3
 	    1..3
 	    ok 1 test_1
 	    # test_2: FAIL
-- 
2.47.0.277.g8800431eea-goog

