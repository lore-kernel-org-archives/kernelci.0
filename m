Return-Path: <keescook@chromium.org>
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 1/9] selftests/lkdtm: Avoid needing explicit sub-shell
Date: Wed, 23 Jun 2021 13:39:28 -0700
Message-Id: <20210623203936.3151093-2-keescook@chromium.org>
In-Reply-To: <20210623203936.3151093-1-keescook@chromium.org>
References: <20210623203936.3151093-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, David Laight <David.Laight@ACULAB.COM>, stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org

Some environments do not set $SHELL when running tests. There's no
need to use $SHELL here anyway, since "cat" can be used to receive any
delivered signals from the kernel. Additionally avoid using bash-isms
in the command, and record stderr for posterity.

Suggested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/lkdtm/run.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/lkdtm/run.sh b/tools/testing/selftests/lkdtm/run.sh
index bb7a1775307b..e95e79bd3126 100755
--- a/tools/testing/selftests/lkdtm/run.sh
+++ b/tools/testing/selftests/lkdtm/run.sh
@@ -76,10 +76,14 @@ fi
 # Save existing dmesg so we can detect new content below
 dmesg > "$DMESG"
 
-# Most shells yell about signals and we're expecting the "cat" process
-# to usually be killed by the kernel. So we have to run it in a sub-shell
-# and silence errors.
-($SHELL -c 'cat <(echo '"$test"') >'"$TRIGGER" 2>/dev/null) || true
+# Since the kernel is likely killing the process writing to the trigger
+# file, it must not be the script's shell itself. i.e. we cannot do:
+#     echo "$test" >"$TRIGGER"
+# Instead, use "cat" to take the signal. Since the shell will yell about
+# the signal that killed the subprocess, we must ignore the failure and
+# continue. However we don't silence stderr since there might be other
+# useful details reported there in the case of other unexpected conditions.
+echo "$test" | cat >"$TRIGGER" || true
 
 # Record and dump the results
 dmesg | comm --nocheck-order -13 "$DMESG" - > "$LOG" || true
-- 
2.30.2

