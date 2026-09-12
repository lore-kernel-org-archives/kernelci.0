Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61811C5799
	for <kernelci@lists.linux.dev>; Sat, 12 Sep 2026 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239364; cv=none; b=YRYcyGFrVWNVm8+N5qZmEB5reUjKiaQfuGJS2bS8IyMKcSCqG9WnQFu3datfEuSgnkRJtr6v88IqU2TZicoqmCjpqUuSSxOgd0hQwbSZA/cfZH1vyl0J+C2CP2nyd3FoPAdInJ6ty6kgvXx9NhvzoMuCWBlGX9cIEsSxcArW614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239364; c=relaxed/simple;
	bh=PkRjjGXPGvXmSb86gecvrgndDVeXQkkdT9WiGv+mb9o=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=hmgB+jLN4ZfmVgH3oEmAh87X0K74bA3b8wFKtJxyk/8v5G+//3PId0NJixEjVwo3RcFFcCrgTPVE0ar0FuKKYD0X1VtYTPB/viamhfXtpLR1XddxZPMKXNBwoUk9BNa25htjqDry6Bo+hSMPmuur2g3KVdjDkzDbqQ5y91WQlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRHUJ9vD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRHUJ9vD"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so9041835ad.1
        for <kernelci@lists.linux.dev>; Sat, 12 Sep 2026 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239362; x=1789844162; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:subject:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkRjjGXPGvXmSb86gecvrgndDVeXQkkdT9WiGv+mb9o=;
        b=NRHUJ9vDzt40BI/TwvfR9GNydH297rlGwzZDwGkpbbhuhtwR6PdXHryo9EX2liIcI8
         mB7GYJ0SY8ON65LvjvCMdFzICe0YGus45KsTVpNX6LafB8K8YuiqjNkrzSdvEYkqPnRh
         F8tSFvoQAcySxghycsbX2LP/cMJyoewcQdL58ANEfePdqOoOh+T+J8i/CmjbBaR/7EXc
         5wFaVfwoUE3yzI3UKN+wrJe7o1xklpmmDt7T829BgZlu68KK01lL8IgwnOsgHBYX7eLp
         1NS1nVjMPnbqIUOxTTwrFyF8Z9xDoy31FcqFABJvWbx8zG1qQQzpVWdGXUBwKJasEzeR
         elFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239362; x=1789844162;
        h=mime-version:content-transfer-encoding:content-type:subject:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkRjjGXPGvXmSb86gecvrgndDVeXQkkdT9WiGv+mb9o=;
        b=UUgfLHame/FmzxORTDkUBbslQxpK7dqS5SJf0e0s4WzWfwl71xIf0lsphzLK8Tm6YK
         gRcBzp5vIF44KHZcygN/GFbEUF8LysJ9o1w8KB3Foyx95HDoSjZkuVkZCA6JtZe5N4Y8
         hCEnhXYXvAQa0QjAWl7Rfjpxd0TW4z/ESGxit2C2gS8r3FYu/pbsG9vBOOBBKvEL6XZV
         A+DUgScYvR9PMXr9DvwsEkBPOalPiwLbOVtv+LFxeFIe6sUANglg+6egRtCyQg3AUUtN
         T7Eg4/cNnUvUy6KB8x5zt1dUlR8ikz57/+y75PGhJwsJJl0pkydbPHdzqLslZlNV6UG8
         dgWg==
X-Gm-Message-State: AFuF++kVBi/FzbxrJ/w1WBWmVlHgjG8ma8pOqGrcNIsS3qClGq9n1jU9
	Vhi8ICGqIpRDBHtz9M2rl8r+kMhOwiCMcx/wI3lETxMi9tajAxqSV3vmgoQlFeq1
X-Gm-Gg: AYBFou2HcyxZcuHY89iH81l2NAoxcyr57BbSo95AkK2SrNH5CzoeotWV5HmvOox7Qtc
	WwtcDO3pRIN1uMNzO3h4D6xocqUT25c1kxDsVGkYd8chi/Ljt2zHu0d6CcOt7aydeqi+wpiKaQH
	X1swbu+0Kxpl+UQJnSJKtz+XORh5CeXwKjwYF19m1V4p59beawOYPto8ixbu4lrPx/yl3xyZbS4
	2PhFWdnUQzmYypvnj+70oiqr9pGoj5uttEx5gAiMebOk58/K7f2yFh691Pi3D72+Prf7ggphWGe
	aETrlDh26UjJM9fENx2bGw+7IAYxLc6zYrW+DlBr+eoRS9Ie/Fhm+fNL9xxMduTp2ynH6Aw1iTU
	5IGTGeeqcc429Z6Zz4vcpjNwZ5Su59vO19TikzTCAJkFmhVtu1s8xMAf80ljL+Cw+A1P9id69Kf
	tQYZVlvZ2GUXzAS9f880bYxt0gnNLbPa7ykj976QQNxyVK9fOvL3I+Nf3gXvAN/mvmzx0obKKyY
	q4/7ma48/JDVlvt4801gBO8s65U+aVGr63LQs1jZE2E
X-Received: by 2002:a17:903:1508:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd2a35aa10mr198074605ad.15.1789239362338;
        Sat, 12 Sep 2026 11:56:02 -0700 (PDT)
Received: from [127.0.1.1] ([92.4.69.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03ac1ecsm3446917eec.10.2026.09.12.11.56.01
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:56:01 -0700 (PDT)
Message-ID: <6aa5a041.21256627.bf8ee.e2ed@mx.google.com>
Date: Sat, 12 Sep 2026 11:56:01 -0700 (PDT)
From: anmol <anmolx.work@gmail.com>
To: kernelci@lists.linux.dev
Subject: could you help me build this?
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

hey Kernelci,

i'm anmol, an indie dev from india building an ai music app with real-time co=
llaboration, where people can make tracks together.

quick ask: do you support indie builders through credits, hardware grants, or=
 ecosystem access? i'm building on limited hardware and a proper setup would =
let me ship way more.

happy to share what i'm working on.

thanks,
anmol
