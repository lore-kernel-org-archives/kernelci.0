Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376A20D4FC
	for <kernelci@lists.linux.dev>; Wed,  7 Oct 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405182; cv=pass; b=Iz6NIzQaPBEe9Axz7j/UGIBeE2R0GAR0XeCHWuHYKgSgOwthXr/Sp0ijiiqDXJzaP0c/fNqPdzy1GojFQzFN4CB2fMLDJQ1ayqDl1ELkB/v/aUXR2DwMHj/pChaiuR3NQkDXiRVgAHv5y0QAqZR66BooPdJ5bRH4FUXwiPhmKZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405182; c=relaxed/simple;
	bh=BjAy+qTW2P7zLlraadp7vFxhR13oDPht1OQi+cpdS1c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ln+8tCQguQkkePZ2oq3XA2WcjbV7fKMhXk135VymTWPzJ4uUaiJXHlj8abZ4+7JF8pkWXcZNeaLW4plwUs7mEkTTpAN1NnOBnH885Ptu+7/TBsLhgfEmDZxJc6aOwZ2BOwBvbOUlA5U1yUe8BZFDWzJCWGAt+JoLV2Buu9nKmJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LFxnsMPJ; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LFxnsMPJ"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677cc343120so4540446d50.0
        for <kernelci@lists.linux.dev>; Wed, 07 Oct 2026 13:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791405179; cv=none;
        d=google.com; s=arc-20260327;
        b=PNkuTq82UZV5T95Cy82ftrnUobF5oKS7hBfWiPRk2Tq4Gbn2iBAVlv7jQg36ous2s2
         sGHZQWsux1NPEfcHx0mmsLHK+eARQJNgvRkIpW3kFAwXvERM0UOGlDIWsEbaEd0tGCx5
         Et5ABHKMR+MZypN3F1imdnqSa7rm+/pwuXWUvAs/IvWUZ27eZE4ppg1crp8f3AEiukqV
         w2VdVSTW3BfXnXiOAM8srl6xzW6yVl9h/9+OUtccwGTFYkmo3SofOPwnbhJSdCjRyO93
         SIXSasuYV9XIUWuuWaQDHKR0MDPNbiNR3uCUcbghZAzjVv4BOQDQouU+IwuCMMiqLhKL
         BM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        fh=Nm+AAbC6PLo4N9N7C1Oo3FYh8a6PcyKuNTA/z4mDvuY=;
        b=ZbmkR1ZzbCzs+4wS1d9u6BNxWwGNIdrgNhH2Rovek7eA6rr97tFl1jeIBCPaNh5zcz
         hWGrA0maGALiwL2jH7pb30QDEIn+HhKmHuTH1AETIYvO0LT4AWcIRaHxDRRfXqmH04bW
         ZW2jZooLeKmBqNsTcRY0+jKAJXrH6OJ+hS2ANTNFqE4q9cNUWNpH4/oToBW7JXkwBKwn
         GYm7tED8Gd7s5AfQvMKMgZXqwmJRAkfQ0CKfI+gSawffCUni2XQEymBXMZGiqkMZAtNW
         aFbxbl7XoWbY5MlOcLWuH+EHezzHULOOiaELfUKy68VT1ZI17Rp9pUZ+TxZWbREIVhs/
         Xs/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791405179; x=1792009979; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        b=LFxnsMPJCdxU6zJy5pDrETX/s0dKTu5vipe8MUZFANCrupCkWyWGNlgXXIK2men4Jd
         SwSQA/SzTT9foqQ9qLdCimQLD8YhOP2nUuO8b5JtVlsZgdE8j6FhsU3rPkiChFCU5FSN
         l1J/rXtEMu3z9okcySrgs7H4UBAvpu9t9h2dAwMzAySfDIazMq57BKrJ9bq5/KaHp1Bz
         xfsy9uIIdM6w6fnOEtNvVNT5Y4HIcLskfE9dRIBgaWin7yiPOPdEtMEv8JLJHVT2daZZ
         8kiplNkJ3rvsPrrkiN1MqBD304bKMGeEOTup5VVkordr0wsldVuaJs0qfx0cjreGFpri
         DlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405179; x=1792009979;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivTJVfjUBIc9wBwqrJfBdaCwNcPxo6RneZIv1F1z4qM=;
        b=18Ypg4GQLdn5yTyEnDA36d4ss5l0Gp0ocTLdwTv1rSIRe7z/TUajodwAXJQnU/Tcae
         W9ZHX9ulFgiQnNNt63s/ExFiiKOO0GnIwJk1Ew+Syuu5NquSYkCEIF5VIRJmfPcw2Wre
         JqWT0FbWbY+ZgMapwLfQ1ERBg2Fd2CukChPyKLM2TDZDDNNEu1PQiG4JqtLsibJKyaPq
         /21fkHX7iJvl5Kw90faXPZ1WppY0sroEhmUy4HSkDTTyiuVtr7GfHIC41Pejq/bQI+c/
         QgJLQW24NnICUFPCPresDLsoln3bzBJf4VrauZ87G0M/IKKvlHUwo9Js5Y/1aI0TyQeZ
         cnfw==
X-Forwarded-Encrypted: i=1; AKwUvBypMplsjgy9Nmtm9J9CzFQlO0jQDRJ1imGeH4SuUjrUub+DeRNT47Bh5veose71S32sxZSPnSQGAw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKe/RTZWW2PllZTDhfNwg98qXzRgVKhnphJ5fmY1tAUj8YkJEML
	6G0bNIstelfdvKePsefwnYp/XM9RCcUd0sF2W2OEtCyPnmjjOpKVBP0nD/ya9mRjKoQZL8RFXo+
	KTgcFKQfBI/KzfassSeQZ9+fRa69r3bVJFCyU7d7404Wd6eeTJgRLMDjcCg==
X-Gm-Gg: AYBFou3btyUPu1oJkZCXXLLlZk9iDNVqqIThJawjJc7vMTIh+sWny10l361izr4hID8
	SBXN4X4Vso7+AIUqamkfMPg2P665aIpKVPUhdsvrdo7s+1uPH57Bwoh8P8TL/PJK0QSVcqjv/dJ
	3Tb+8Aq8LM7KXWQQMF/XTQcIbWHDB74yKx2ifHsebO1x3+31G1el8pNPPr8FS+ELBId9g4YY0e7
	daG72hpel1nuzPxCn4oi3i6eJtx1QINQTWFOYSZugknPCw+o8fS92Dz6mezX4yovAjc69zGfGol
	sIreyacrhlvcPdfamv+hw+sTuZ1n2iBmM1ajfGjZ4223LDlWEB+e4Ox5uqrAnCmXqwjBTVtHBbd
	76MG5l0UycsM=
X-Received: by 2002:a05:690e:d86:b0:66f:c1be:a65d with SMTP id
 956f58d0204a3-6790a4c52f2mr2150347d50.79.1791405179114; Wed, 07 Oct 2026
 13:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 7 Oct 2026 15:32:47 -0500
X-Gm-Features: AclHuK8P1OmqSjxw1Q8TP15n8s49AfcTPTrHW89OlIGcXgdQz488ItjpqK1Zalo
Message-ID: <CAEev2e-6GVv45RWRLEF6LULovbiwrGE1-PxTzqKkD-zr4K=4KQ@mail.gmail.com>
Subject: run_kselftest.sh timeouts don't work properly
To: linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I noticed some hangs while running perf_events kselftests on some
RISC-V boards with potentially broken PMU overflow interrupts. It
looked like the timeouts worked properly and killed the first 3 jobs,
but the 4th one would just hang and never timeout.

# timeout set to 120
# selftests: perf_events: remove_on_exec
# TAP version 13
# 1..4
# # Starting 4 tests from 1 test cases.
# #  RUN           remove_on_exec.fork_only ...
# # fork_only: Test terminated by timeout
# #          FAIL  remove_on_exec.fork_only
# not ok 1 remove_on_exec.fork_only
# #  RUN           remove_on_exec.fork_exec_then_enable ...
# # fork_exec_then_enable: Test terminated by timeout
# #          FAIL  remove_on_exec.fork_exec_then_enable
# not ok 2 remove_on_exec.fork_exec_then_enable
# #  RUN           remove_on_exec.enable_then_fork_exec ...
# *# enable_then_fork_exec: Test terminated by timeout
# #          FAIL  remove_on_exec.enable_then_fork_exec
# not ok 3 remove_on_exec.enable_then_fork_exec
# #  RUN           remove_on_exec.exec_stress ...

This hang can be simulated on any host by adding an infinite loop at
the beginning of these 4 tests.

diff --git a/tools/testing/selftests/perf_events/remove_on_exec.c
b/tools/testing/selftests/perf_events/remove_on_exec.c
index 89e7b06835df..d9a76351efa6 100644
--- a/tools/testing/selftests/perf_events/remove_on_exec.c
+++ b/tools/testing/selftests/perf_events/remove_on_exec.c
@@ -99,6 +99,7 @@ FIXTURE_TEARDOWN(remove_on_exec)
 /* Verify event propagates to fork'd child. */
 TEST_F(remove_on_exec, fork_only)
 {
+       while(true);
        int status;
        pid_t pid = fork();

@@ -120,6 +121,7 @@ TEST_F(remove_on_exec, fork_only)
  */
 TEST_F(remove_on_exec, fork_exec_then_enable)
 {
+       while(true);
        pid_t pid_exec, pid_only_fork;
        int pipefd[2];
        int tmp;
@@ -171,6 +173,7 @@ TEST_F(remove_on_exec, fork_exec_then_enable)
  */
 TEST_F(remove_on_exec, enable_then_fork_exec)
 {
+       while(true);
        pid_t pid_exec;
        int tmp;

@@ -197,6 +200,7 @@ TEST_F(remove_on_exec, enable_then_fork_exec)

 TEST_F(remove_on_exec, exec_stress)
 {
+       while(true);
        pid_t pids[30];
        int i, tmp;

Then run like this
./run_kselftest.sh --test perf_events:remove_on_exec

Some digging around showed that there are 2 sets of timeouts, one is a
120s timeout imposed by the runner script (run_kselftest.sh) and
another is a 30s timer for each test process by the kselftest harness
(kselftest_harness.h). The harness's 30s timer causes the first 3
fails (at 30s, 60s, 90s), but neither of the timers seem to cause the
4th job to fail when we hit 120s.

It appears that the harness launches each test within its own process
group using setpgrp(), which might prevent the kill signal from the
runner at 120s from propagating to the test process.

This bug can affect other tests that timeout too. I'm not sure what
the best solution is here, and was hoping someone else could chime in.

Regards
Anirudh Srinivasan
