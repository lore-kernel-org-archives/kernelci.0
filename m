Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320E343890
	for <kernelci@lists.linux.dev>; Sat, 23 May 2026 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779509199; cv=pass; b=WoeMyKy3CoCGTlhmUDEf8/2Wtsy5FMXEq1aeWtxjuFa5QI1ViN+gLJe65PyqGSuGEty91ciPRLW3af+s4VMaD7KpSajDbZInl2y37Pwb4rd5yXW/DRzUMjs4TUzdQKtwN9Nq+u3MMeMkrKhPOgSKt0RVakyLatGLfH/RdBJv8S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779509199; c=relaxed/simple;
	bh=qSilDaClV/MnvguDmgNjAAWl2qpnPDngfvtr/WcAtO8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TDrcU1uAkAKFdf8fcYuN4r+XLyzn1ujkVR1pS/BPAxoxgRBh9pIvoFwOV4sFLU5qnk5tta6KBUKjPYh8TANq++Dlq/v6GW0LVLmbbh5hR9dJbhW5ISebEj2uU7jQHYNwQ6Sw3DQn9yVa2RdCqHwpbtrmHTiQB41jPZ6mw6DDiWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=OXPI/YET; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="OXPI/YET"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so8480999d50.3
        for <kernelci@lists.linux.dev>; Fri, 22 May 2026 21:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779509196; cv=none;
        d=google.com; s=arc-20240605;
        b=dG8mJujpI3Q2lLHMeV1IYIpfnEzJj6zyyCgbng+QRc/bnswDozKu3rPkeLKKJzrjRU
         iEdin9mksHONax9yFynI5NyZ94nQ7DdUmSbqrAP8repa55dm4o7zgbFwwqRCPad0wreI
         VnYJxirbcn+ivMOWhuJHF5MVHOdMRb6HrKSMszNtLiFaFqlzJ2uG1tBU7Wqg9dy1D3Q+
         gzUSDIs+PZNspcbZ5PScoLbUyEjfhx7H1dBqgc/GIWcp8Kg4keGYhPHrSrekRcGgn/vn
         tXv7n1kZac89NrukgpbDoOIplMmkhpPQa65szOLxe3B09unlr1qQcfyrisaVIwz+xDwd
         aTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qSilDaClV/MnvguDmgNjAAWl2qpnPDngfvtr/WcAtO8=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=W5xqUAfIKjy1DvtJabWKGwAHyFTdJtQssCyNs+ZnrPtr6actVjQSoMm3+UIeadhnmU
         0MWez18esh1XVqOiK7ijzhFfAy7khDNeyRPflLGt+iuMuK1BTrbyjDdijZ+rbU4D3pa8
         U4PlWhMMIZeJVK24MRTMsh2GwO8H/zD7FoG7DQSpZ73gegGgEDF1kgWkzq5xu7CTKHg4
         YRELwBzUGKPiCMVsQZe2qorfhp0if4y3MoUXrmx3EHoZ+5C+MQ9SoX+F67oWOXMQ1EYc
         0aKErclVgMa8L3NnbE/5GrttiuZL63jx6rC+AMuWUX5UH3YKd8kQCdOz7Czi4sv3WkXI
         qp1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779509196; x=1780113996; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qSilDaClV/MnvguDmgNjAAWl2qpnPDngfvtr/WcAtO8=;
        b=OXPI/YETTt2aYS/TTvrGhW8nsVERxy4ug8dnUB1J17g8FQcF/Uyyswz+IFtUEUtdB6
         RDQp+dTl+7IFgnOwtboOqzVHElci/0wKwr74lkvtTVQHnvDQSad5oi/IVTJ9ybRG6zJN
         9oxOtuHKmEPcRmBVj+vGButIxeVr9rpNKDECw0UzJP3bRgAMxztOo6ylKGC6kP99qa+J
         wi5ZGSUUl38nt6LYe/rQGYYDDhghGqgMmGI6+R+CMVXr2X/HIpYlVBTbMBXSHI054my1
         kFRpN3HHyo2s5YB6H4sw25RGiL/4FCDS4iuweLSxvPRPinidiWKOVcmTO8Ll8qDukpc+
         ohzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779509196; x=1780113996;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSilDaClV/MnvguDmgNjAAWl2qpnPDngfvtr/WcAtO8=;
        b=Rr0cS+YHVkpLTGJoaXeaF0mnLhWajufia/iKTBqUUV/V7875vApKw2XX/U575ljbTY
         rNCVQRVrTxAUb1jG3k9cskLGvT7rBkIUvmYIXV+K6wFfTKCkyJvG5VAVf5mog0nfc1DO
         YyRuDJry1TmFqmO3JG95raihxE+l7I42dcDOka+fQ9d/l7nX8dHbpCDzrX8+S1Nj2X1T
         uIcLzxdOE2aecO9MCUCsI6D2hKRpYe8N2e8GGlm1REkAmJmjCYnJ7COdQG9dZ6odH8+4
         rslhiHaHvK5R4z57dozAuPG+cLeZyFlZZpRum4IJSTs8HZzCHyn4MarKMn02/GfnZKwF
         P/Cw==
X-Gm-Message-State: AOJu0YyZ7tiRo8FKdhMqTC8+SYPenDW6mCiJstJxxjzW6jmfCVItJ0R5
	77jWNl5pE4wyusT8P5Ks4PS191vPGzm4lmxKMt05q6OuFqP16VNeJyao9qZp+7/eeh5+uBGOpLn
	PL1C/GRcGLBpP1ZzG/0FLOir8ofTpIjcev5zoOQn3rG2Y0oiqzg2FazU=
X-Gm-Gg: Acq92OGgEiUfIg8FCXco55Zh61GEeABqSIw7jsbSxnQT/EYN3/NFACy5yjYGC+G6Kmv
	gQL40u8+xV5Cuti9OUV87SaH9iEN4KHK1u0z2pVyMYFOieyRQTSBuXpsJBa06uOaHbkBFNAuMXa
	CIYb0hj5ICAmrRsquWlZxYd4L+VTZdB1oDrac+TFaheEx1tejsHwKKqkNsaPPTGuxlLig4uDDZD
	C4jzk5DYBL2pEIQz0W0FfjhIUsdgpZcBooGXxklBE41uQTF+DVEZel+Y5N0KpR6JHs9g+wbedaC
	j0EgqJDbcK4/7QdNGm9xPoFg8B7z1RZ6axwuHFrxO8TPns+R2ygjyOlBWGVKQFIKVjYzYlEP
X-Received: by 2002:a05:690e:d4a:b0:65c:2738:c6ad with SMTP id
 956f58d0204a3-65ec97cb3ddmr6719463d50.17.1779509196384; Fri, 22 May 2026
 21:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 22 May 2026 23:06:25 -0500
X-Gm-Features: AVHnY4JT4RHS858Ps1qwWkz3BA65lPWpZegb8Zo_8MiLguyEwGnGHHxMPMvhk3E
Message-ID: <CAEev2e-Rc=hhieAWmM59jAyNLc-o_ZVA27UQG=YkcbZAEnXYFg@mail.gmail.com>
Subject: trixie riscv64 rootfs builds for kselftest
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I see here [1] that there aren't any riscv64 debian rootfs images for
NFS booting and running kselftest. Is it possible to add these builds?

I've been doing test boots of linux-next on some riscv boards and was
hoping to run kselftest on them too. This would be useful for that.

[1] https://storage.kernelci.org/images/rootfs/debian/trixie-kselftest/20260219.0/

Regards
Anirudh Srinivasan
