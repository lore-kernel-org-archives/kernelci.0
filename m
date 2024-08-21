Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D613635B
	for <kernelci@lists.linux.dev>; Wed, 21 Aug 2024 17:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259753; cv=none; b=aKUePam6swSScfckcsD97KERixiAvC5KMhYFUHLmCE/zFbdcncQJU+N19i2q1gJJ3MHw/ENU02Z70nVcosCjNL4adccvVP2uf14lmsiVCi9mpxXHMDRrAzCaS3db6VQxPEeaAlg4XuYBaYpxnMTQkvaW7SgQ3A9aNWQ9y7bAsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259753; c=relaxed/simple;
	bh=zgqOWKbHW/Yryf4wMIV/j0g34B1etT/jBWEEPkiawuQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=vFS6t/3H6ZIypdNmWp6gLtTQA+ESQ15Cyf53mq6IfdpMShOOPPJrA4s9beLLv+wT8WIbbHHkR7qJjCrNX5g4WWWWzPO1cHgo53WKDZSOvcifGnhc4mrQi9gVOB4yJud4R8c8Dzps0BrY3ckvoYbSK8fQjQq+b7ySEJ2T2FAPJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EohVsnjQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EohVsnjQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42808071810so56393935e9.1
        for <kernelci@lists.linux.dev>; Wed, 21 Aug 2024 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724259749; x=1724864549; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK1zgad1D/waPCW9p0CXNSoIIsaWzVftcn/jskKsrpg=;
        b=EohVsnjQEKBAftoGQDtnpWgsjNTKCR9xD3cs4CAFFINOWc2q/hbwTckDL9So3bm6gj
         ewLm9seizyvwA9Fw1+ZQv7XLT8YTDQuRNLc4tZXrAmi/bcJAVcizzisr0UrnsA33hT9z
         wtOVXSy+0sCtTwwpDxw7TgNl2zqV04XAtosCx2uZ/N+IVvQ/3SxcavDwTUf2T9oE6FSv
         qLitnwMwPnVAfijLLDRAGhxS11q+FGxVjYo/Gb7FHM4MQv9RqSg85laugFgLqNj7RnkU
         ZaSkpxC1s3/cJGqTAR3rHeFIUweOLhXDxkhVT0poz23W5zvrd5Ma286BNEl2FwrFm5jM
         BoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724259749; x=1724864549;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sK1zgad1D/waPCW9p0CXNSoIIsaWzVftcn/jskKsrpg=;
        b=oZum7uKmV8liHa0xwi5LIhjNVcWKFOaTv1xrAM2U9D3jeYGjlVpLNLSoVtTl9Rahc3
         6aWnJs+7wdWN/wauHKNgydMmhbWBsTEsw0PSrY3FxsnlLG1GSrVJAdUnDHGQi9wUw5YF
         FZw1DtvpqqIEZtS7FgLjL/FapoBpyX6M++jEVtKHFx2PA9Xwuw73g+xjd0hc4eJWfLij
         OEuYDeAK5jiy3A83nMvxL/HeZD/nbWwAsH+xprrkkeC7MNnfVLnyLEYcKix0pWrWDh3e
         LOxSHuy5ACFRx+36+xIN1/ILC23CFDr+Rbqfu/NnRUeFhclpOFC52jM8D8ZsReIO7xNL
         uwVw==
X-Forwarded-Encrypted: i=1; AJvYcCU9IQguyrXDkcgHw4AljtCurLwefc55QUoOvoHqQLhGEmZIZVgWYivClTyxdvfNZbe9miA9lItljg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIWnsXRsLW7DetCidB0cFj9A96m6fHW+BdefkhpD0Lq4FdJCml
	HLUlKYW0WHlRwym8oRmUw9gp7dDqfBaWY+snVxlrwiL7LtrLeHX6
X-Google-Smtp-Source: AGHT+IEBEpMyFWMwurCGpbJw3mjFLvxjIDs3XxQ1UD2kDeygUP7vslaW5tWf4hBd9473oqq5+j/J5A==
X-Received: by 2002:a05:600c:468f:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-42abd1121bbmr24189225e9.3.1724259748750;
        Wed, 21 Aug 2024 10:02:28 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b89bdsm16108054f8f.112.2024.08.21.10.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 10:02:28 -0700 (PDT)
Message-ID: <9ea96b8e-6490-4541-81eb-8bab011c8918@gmail.com>
Date: Wed, 21 Aug 2024 20:02:26 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: Support more checkout data
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again, everyone (potentially) involved with sending data to KCIDB,

The previous schema update (v4.4, test data enhancements) is already being
deployed, but I have prepared more backwards-compatible changes to go out with
v4.5.

This time I rolled everything into a single commit, but I'll split it up, if
we have disagreements, or need to work more on the changes.

The PR is at https://github.com/kernelci/kcidb-io/pull/87

But I'll repeat the commit message here:

Add support for three more checkout fields: `git_commit_tags`,
`git_commit_message`, and `git_repository_branch_tip`.

The `git_commit_tags` is an array of strings representing annotated tags
pointing directly at the commit being checked out, as seen in the source
repository. I.e. the output of `git tag --points-at <commit>`. Set to an empty
array, if the commit has no tags.

The `git_commit_message` is intended to hold the complete message of the
commit being checked out, *both* subject and body. I.e. the output of `git
show -s --format=%B`. We're putting the subject and the body together, as it's
quite easy to extract the subject in SQL, while full-text search is easier and
more efficient to do over a single column.

Finally, the `git_repository_branch_tip` is a boolean flag, which should be
set to `true`, when the commit being checked out is at the tip of the branch
at the moment of the checkout (as specified in `start_time`). Essentially, if
you're always testing only the tip of the branch, you can set this to `true`
unconditionally. This flag would let us extract the checkouts which
represented the branch state over time, and produce a rough history of branch
changes, which we can then use for (regression) analysis and graphs, in lieu
of actual commit graph walking.

The (abbreviated) schema for all three fields is below and is very simple:

    "git_commit_tags": {
        "type": "array",
        "items": {"type": "string"},
    },
    "git_commit_message": {"type": "string"},
    "git_repository_branch_tip": {"type": "boolean"}

The PR has the complete schema, with inline docs.

Tell me what you think!
Nick
