Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73528B3FF
	for <kernelci@lists.linux.dev>; Tue, 10 Jun 2025 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563756; cv=none; b=piKSpFR8r3X/4Yo5U6Xz3o0kA4hz6t00vLMVayrtsyKmrOngSZPQ8OeEI6XV5F9Vr/YG7t4at6GmmQkFZTSFFVyZeD/gcz22CXMLENNagFiRpxD/Y1SfYU5CAM6x2HxChjWQrZtWKnE3wluWn7eFIx3kG5FNUCJAol/Sq9O8a98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563756; c=relaxed/simple;
	bh=IHQLUXQeFNK/S3fHtrO9RluZc5qHUn5q9oDN+5rNckw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VzU6Tu222lFdA2khgS7sZt7anGtcfJOQlFybgIt4BwFoNW9jIETaDtBJKivsm39KhbjxnnR76e+md9J+yiel0N8SwpTGSDuNqEBvsZsDU/cSnCT8XiEN0JczI8HuQFEEvXPdmKX63d0LTQZ5Rz89r2kEQs0rVF6NSMTeVBzGldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=K20FCh5Y; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="K20FCh5Y"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32ae75801c1so5249041fa.1
        for <kernelci@lists.linux.dev>; Tue, 10 Jun 2025 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1749563752; x=1750168552; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IHQLUXQeFNK/S3fHtrO9RluZc5qHUn5q9oDN+5rNckw=;
        b=K20FCh5Yao9HEm6EDaiW1zJkLZbGn/i7ey3/VsrytoPU8mpoedgvpmYwAn3ZQ0laea
         0vCrtriI4pjkf+8l6tfFP3HOt4VO5fsLuxQav91G8tnjPQ58F8nqHZq+BtUYuS1N0vg+
         RhJ63HhDtepBhXiDxukNBDrgdmf0z5hnLxzwpQ671rVuiFdJ/nwwvJX1a4nuAR9llBWn
         dfZGjY93/ecav1ZoCWHemM5mmDVuUIDSxP5ga7Rd+DmbwUgiiVjnrSxJs13eXE3ymIaI
         ZrDh/h5lsIa8n5tTFXCD9wbWO/+1Cxcban3zAlLFw3E4OtTheJDBl4Sa/VJD0rBPymnl
         jWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563752; x=1750168552;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHQLUXQeFNK/S3fHtrO9RluZc5qHUn5q9oDN+5rNckw=;
        b=sTxSqsehtNbEKQjmWGmg+ePqt0NMej0l+dY18/WhOuJZG5T4xIBS3av3IL/BfK+Ygo
         aL0HRQeSXqTUWEDUMu/e8HA1sRxpkvFwpCuMmpbYEaU8rfVrFLUw5brWkc5bmuxJgsQh
         XwVtgRurm5cpTaAuZEYjdiM9UHsrjnOZQzrIO02wK5kf/SyVEmsGFFn8ABXjZzCeDDrW
         Imf0GvNU6Ix/fVkSn/CdCfEpvty9b2AwbTN6t/KR+h9X3a0fIi1t3hw1PQHYDF7O4zLl
         UMZDaHkyodQtXCz+61rtumT55gZYTQS1G45fQbcchgSpTa40/6YDhu66BdbX5NbmBoT8
         HuPQ==
X-Gm-Message-State: AOJu0YzN1KAgcJqZ60ds4aOxpU2lKJAzJ7Y9cDGhQx86SWPzxhI1H3tc
	Qsb2IgzsMAnPHhuKTOc+dBtJZ1V7Ak/H2Aqj8v3LCXcCMnmgAakW/B1u06NJzhdgisewrOBz3e2
	jqmByZo8I+NgRHb4rdX/QUsE9AivELjIw6qdKfctmAr5NjSlU0vnTR6c=
X-Gm-Gg: ASbGncsInB/fj5aBYX6WBxK90HKe/nt0n9uBPoqqxVjcqGuSJFnxPHVNWqFPJioXSvd
	gUBIH0pEGlqomlZRq5lnGQDtFstDpw60QtVje0Io89CTMuMFJH6u8TnOC5nnA16k6Ekey5ZIuD4
	qEdbQ0VtCdcEiRN5IwHujqOxj3zoVQVIR2OVIQe76DsFKC7w==
X-Google-Smtp-Source: AGHT+IH7vnV84nc25X+gT1Qsp+ft9PjMTliqqRcUf4eAH9FFUA50hb2Hj6C0tiMr66QodR6/tZfL+UlPjdfq6Al1SkE=
X-Received: by 2002:a2e:8608:0:b0:32a:63fb:ef90 with SMTP id
 38308e7fff4ca-32adfdc54a7mr11582191fa.11.1749563752073; Tue, 10 Jun 2025
 06:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Tue, 10 Jun 2025 10:55:39 -0300
X-Gm-Features: AX0GCFtGN2V7gj4VqXX7CHjpyXXgD3Dg9boxWPgL4qrCErM0i7iZDwCYNwdfItU
Message-ID: <CAMVAkEsVj4-YithQrnkixAR63_UMJWuwCRzOhayVqRyL5Lm10A@mail.gmail.com>
Subject: KernelCI Dashboard Report - Sprint 24: May 26 - June 06
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io, 
	=?UTF-8?Q?Jo=C3=A3o_Bertacchi?= <joaobertacchi@profusion.mobi>
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

The KernelCI Web Dashboard development has been going for a quite a
while now. Recently, we thought of sending the sprint reports to the
community mailing list as well to raise more awareness about our
progress there.

During this past sprint, several improvements have been made to the
dashboard in the last two weeks, and a couple of bugs have been fixed.
Here are the main changes to the KernelCI Dashboard in the last two
weeks:

# Improvements

* The issue listing page [1] is improving, and now allows users to
filter the results by origin and only issues with incidents are now
shown [2].
* If a tree has relations to tests from a different origin than the
tree itself, those tests are now shown in the tree details pages [3].
See example for stable-rc/linux-6.6.y [4].
* The origin selector at the top bar is now limited to tree listing,
hardware listing, and hardware details pages. The origin of a tree is
now shown at the header of a tree details page [5].
* The Build Details page had its sections rearranged to give more
focus on the tests section [6].
* The "Hardware Used" card at the top of a tree details page has been
removed in order to allow users to see more valuable data directly.
The hardware used by builds, boots and tests is still available in
each tab [7].
* Response messages for tree endpoints were changed for better clarity
[8]. See example for android/android15-6.6 at [9].
* The commit hash and start time fields are now easier to select for copy [10].

# Bugfixes

* Shortcut /i/issue_id was always taking the user to the issues
listing page instead of the corresponding issue details [11].
* The tree details page was not responding if it had builds with
status different than pass, fail or null, now it is showing correctly
[12]. See example for android/android13-5.10-lts at [13].
* Nested test tables were showing the wrong test card, now they show
the exact test that you click on, allowing for a quick view of the
test result [14].
* Hardware details weren't showing tests when the checkout origin was
different than them, now even if tests from a hardware are from a
different origin than the selected one, they will show up in the
hardware details page [15]. See example for hardware ti,dra718-evm at
[16].
* Riscv builds weren't showing in tree details (this bug was covered
by showing tests from other origins in tree details) [17].

References:

[1] https://dashboard.kernelci.org/issues
[2] https://github.com/kernelci/dashboard/issues/1074
[3] https://github.com/kernelci/dashboard/issues/1250
[4] https://dashboard.kernelci.org/tree/stable-rc/linux-6.6.y/18952a1fc4ac790deb4faa116f18310d7010a9fb
[5] https://github.com/kernelci/dashboard/issues/1243
[6] https://github.com/kernelci/dashboard/issues/1245
[7] https://github.com/kernelci/dashboard/issues/1244
[8] https://github.com/kernelci/dashboard/issues/1257
[9] https://staging.dashboard.kernelci.org:9000/api/tree/8b5d78fb5c56fd82d8e621644ff073a375fa83d6/tests?git_branch=android15-6.6&git_url=https:%2F%2Fandroid.googlesource.com%2Fkernel%2Fcommon&origin=maestro
[10] https://github.com/kernelci/dashboard/issues/1252
[11] https://github.com/kernelci/dashboard/issues/1253
[12] https://github.com/kernelci/dashboard/issues/1274
[13] https://staging.dashboard.kernelci.org:9000/tree/android/android13-5.10-lts/d76d4cd0623a12e7a5512e26fee809feb445b26b
[14] https://github.com/kernelci/dashboard/issues/1231
[15] https://github.com/kernelci/dashboard/issues/1207
[16] https://staging.dashboard.kernelci.org:9000/hardware/ti%2Cdra718-evm?et=1749238200&st=1748806200
[17] Issue at https://github.com/kernelci/dashboard/issues/1239
