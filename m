Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B51E7C23
	for <kernelci@lists.linux.dev>; Sun, 13 Jul 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395071; cv=none; b=a6T/nQZO1NjE4nkgggxDGkFO8mpj6PX0WReVcWDyUTvHVR8cVs0gQhTTQ2e9uFQsR8K78FTQkbFazwWc7+TOdRGu+q3GYo8nlOLPR5FAudhHp3veAuOtYf/I2xpujctydem4tyjbobcMvzYbHTuJPEjVuhfKPrIy01XaD0uKWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395071; c=relaxed/simple;
	bh=lcdydv8sYkAEzCFbM1kD/zH/iQmbLtyt/8XOYlmpchc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p4KB7PrsWStZyiUN78FUatU68T5x5tv8usPC/Da6J+5Z/IjyuMmo+dUekJmfhJOpvmev9Snrv4ylLSr/LgmIxU846/hfj3U2aEHfcR6Lewpa+QugrkHfsthDaRqJD2aULCdlQ2WKpnjlgDvwRvkKkUuOOt1MsLfwSVsj8tx6UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu6h1CCy; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu6h1CCy"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81749142b3so2944759276.3
        for <kernelci@lists.linux.dev>; Sun, 13 Jul 2025 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752395068; x=1752999868; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Busf/73Amz2RvNENLx/WG5XU+64PtmKHqQY2kO8k0Z4=;
        b=Uu6h1CCyebw9fcw44HD6nu+i9v+y+6RFI+2NgIZx6dTW3owPbtGp8XTNcf81y4jkOy
         yXo03dbFQmLlSx7DpGeZv/9z9igh2x4fRls05iWhraXf0kO7Oe10bNFFw/nJvAn7AIAH
         zKxQpcfTghvSZsX3ZqC0ib2KEt0eYrybxDXTjeDdD9zVnIADHG/qqm3Gz6Cl1hIOfyfH
         onipLHPx5IgEEs40/BNYxTFqGC8z1vGc4y9OdeF90af8aze5cqTgl5BzwLgvXeKUGmLD
         HYD/WftDSJjotrdJwNVh6+8aPp+IQpjJ8xF+a6olxW6KIk8Wij58y1LeODUgbDySp8XE
         ylkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395068; x=1752999868;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Busf/73Amz2RvNENLx/WG5XU+64PtmKHqQY2kO8k0Z4=;
        b=UhLT5ki2LpBfx4f33NcsOClSEe/GdGs68ldGML7o+zkXopg10qeAxdYRQgB1/NNR+C
         jY9zzRMAUJryjKayzcN4NwDt4cxsS4oyPgXeQ/8AwLRjHBQmRPNFs5ALUJQtWZatryPM
         xbJ0VdrQXWIpVe5SeUwVRBkpsm6Z8HqSJ0ZWkmUFM1MQuz0b/qhDBBe0rJbSmJjQzUHA
         H6Ttc5Bz48craJFjI5OHbz7WoM7je1ivoIkPzhWpviqNM2jlUh7t8vcv3CrNUVhN5JIL
         g1LpBK0e4d/xPhnPHyreeIWAZRVVtAtnipQAt73UiLk2hMj8jPkdW3uCZHy3TU5o34w+
         cLOQ==
X-Gm-Message-State: AOJu0Yx1Q0W4yJiPzT625H8vdrRYJH1lVggPM8kVgC1TN+o+Rwe4krAb
	s8VQ9RS7i7eYuwodgcKnX9iEMZunbPQbcuAwuk1PrULCoJbtQOkbc99Yg3UDXfM58IzNFl2rPU1
	7IKQrbZElmAnNaAObi80xm9PPlqeYzkujKDoDK7M=
X-Gm-Gg: ASbGncs+GbwibnG0qgPeTAhtN1+MJ8wrTbgpIrymuGoaGarZScqFRQdQi+osIy54IVV
	1ke5VMIOGntDLnxHedt9wdkb2mh6u+k1DJShp/bk7CEwgUDuvcRsR5qQFFY++AdH4hzJLSVL7he
	+2FrbScvOPFIT1ViQV9rxhuFREB9jmTsm5ePryoORGKiKcVRJRldOiub4um/iDuc8cgIcc8DUhJ
	ePWSUQa
X-Google-Smtp-Source: AGHT+IG89XTR+PkINLv+WymVj3ZpnxW6lZOEE7UolBay7kFXMHvTwgGTgcwqLPL1DRh/1KhHTByXkg1THpTbCXQAoSo=
X-Received: by 2002:a05:690c:dd5:b0:70f:88e2:c4ae with SMTP id
 00721157ae682-717d5e368e3mr149103377b3.37.1752395068555; Sun, 13 Jul 2025
 01:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jesse Simpson <jesse.simpson36@gmail.com>
Date: Sun, 13 Jul 2025 04:24:17 -0400
X-Gm-Features: Ac12FXxtV0PKgIcHxMmpXUGgnpE3ut5u2hl6JHzLENldEUIyPtwDYVMYeQxnogk
Message-ID: <CACH1CvPX8G6J=HyPV_jOYBFNba+TCT+8+YjyZ-OB53NX0OOieA@mail.gmail.com>
Subject: Hello from the Gentoo Kernel CI (and requesting test credentials)
To: kernelci@lists.linux.dev
Cc: alicef@gentoo.org
Content-Type: text/plain; charset="UTF-8"

Hey everyone,

I am working with Arisu on the Gentoo Kernel CI project hosted here:
https://gkernelci.gentoo.org/#/ . For a little while, this project was
getting persistent test failures and even longer still, this project
wasn't even able to post to KCIDB. (I see records from 2022 where it
failed to post).   I started working on this project earlier this
year, and have gotten tests to pass, and now I want to fix the
connection to KCIDB. (https://github.com/kernelci/kcidb/issues/330)

The Gentoo Kernel CI project takes the linux kernel of various
supported versions, applies the gentoo linux-patches, and then runs
basic tests.

Arisu is still the admin of this infrastructure, but I am taking the
role as contributor, submitting patches based on how they work in my
testing environment but without access to the live environment. I
suspect that Arisu will need a new credentials file, but as a
contributor,  I would like a set of test credentials to test
kcidb-validate and kcidb-submit so that I can make sure that our
scripts that calls these functions in
https://github.com/GKernelCI/Ghelper/tree/651090a3082ec684a315a808874a9091e819db3b/kcidb
folder works.

 Do you all offer test credentials or a staging environment that I
could post to?

Thanks,

Jesse Simpson
jesse.simpson36@gmail.com
