Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A62DDBC
	for <kernelci@lists.linux.dev>; Tue, 13 Jun 2023 10:22:51 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so4600969276.0
        for <kernelci@lists.linux.dev>; Tue, 13 Jun 2023 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686651771; x=1689243771;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YL5tImP8wsLO0a7j5rehugKU8GVq0JINrF9tm+JKd3c=;
        b=Ih/i4SCMdeeJG0v99N2rGeFx0jpDfuC4yd5D7yglLRZk2sxG/EFAoJnMRjCvtn86kq
         TJsgVsEGEiJD7JofQhQVL5hSxotYxY45OuYUtvkQLODc2sYOfJ9iDmoY2QUL2TIdOAyt
         aVWLR1WzGrNTEMsJkVVbPpswG4f5elg4k0C0O+P9eJjQzNhscPgXE4FbX6Ixx/mGcnZu
         KuGt7ZbKxRdAErFvrxpQNMXp1t8xaAfhXr3+ffwPR5WCHw9aS7TIrZ93AdvUcv0T5Rsm
         IPjxGqaAg+NdQIPcwxjlBHmLeFW3LcoFhobRn6OCo9YMXzHfVYWtRNIx8MGVYFnFiX8E
         RuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686651771; x=1689243771;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL5tImP8wsLO0a7j5rehugKU8GVq0JINrF9tm+JKd3c=;
        b=IA7WQ4vOi55WRBdeFRSwBzv5ecOm8eipg3F5bQdnv2IXsAm+11kkZmmRmU3EgoC6sB
         OIrstt5unpkmdob0nKoRM9ByZsZggSlarZrn3uqgAD4Vq+qJytnjCVxv9E4S+IFyAl4Y
         wM+mC5Zz7T7QLAXqN/sj9PxHGNnDvUqfKebubeuBzX467fCqb07ZEpI0q8F7Uyw+YqR7
         U0tJMdpicqPXPrGixNOfBJ7TeseUmvy4gd1HISLO4dIjkE1AUzB03B3xDZCwb5BBAcpJ
         P3c+7WcPISSwYYJGhxg8AS7HOQTURyVD0P7DxU+AGkGQeZouReeKK/mnkRwegkAC4r94
         Mf/w==
X-Gm-Message-State: AC+VfDwIYrWYTPdFJN9X9GIU8zv+TJGPj4esuKu6K3lpXnNY+9nWiEnC
	M6DejS9v9koEEw1X0/07WWU7EAfGZxf7jYgvh7mTygQwRNs=
X-Google-Smtp-Source: ACHHUZ71SJDccecNWTrMhwTNwO3PfPR4DuKFUhQhFakLyFEqV8PhFWIG3b5ItgjmuXd7I2rIXUYIkRrSaYABkMWCGTo=
X-Received: by 2002:a25:58c6:0:b0:ba8:4ab0:3b7a with SMTP id
 m189-20020a2558c6000000b00ba84ab03b7amr1044571ybb.2.1686651770895; Tue, 13
 Jun 2023 03:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jun 2023 12:22:39 +0200
Message-ID: <CANiq72m=3yVV73R4OCWBkt54MaBhb-P472pPMeN-xPb6uWpvgA@mail.gmail.com>
Subject: Missing Rust results
To: kernelci@lists.linux.dev
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi KernelCI,

Apparently the Rust-related jobs are not working properly, e.g. see
the last report from late April for `rust-for-linux`:

    https://linux.kernelci.org/job/rust-for-linux/

Does somebody know what could be happening or how we could see the
latest logs for everything Rust related (in case something hints there
at the problem)?

Guillaume suggested it could be failing to find the new toolchain
Docker image or something similar, given the recent changes/upgrades.
The `rust-next` branch received the version bump only a couple weeks
ago or so, so it would appear that something else broke before that?
(i.e. it has not worked before nor after).

Thanks!

Cheers,
Miguel
