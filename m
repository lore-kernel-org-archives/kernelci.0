Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5918A6C1
	for <kernelci@lists.linux.dev>; Mon, 24 Mar 2025 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818691; cv=none; b=n+4FgG+ykT0XqDednvr1uqikUNU8Uqll1VKGwbuLzjd/Hj8y4j8+uPF+N7UHq6U3R+zsBI3IIipeC8e28BAaShQFwE0vFv7XST23Q0g881e1gnsLo/NuN3ADgWeg7G+GtSFhet3Br+ABHzFvZgUWN6upC5UOAUD52sTYOyTZXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818691; c=relaxed/simple;
	bh=FNl6UNilvI2xTbNhpacD2WkrziyFEkB6OaQZ2Qlmemg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=FfEtqo3JkosF9yzgk0H2FTvWYlPpxd/LBzGDsBfDVLara7TXSY7XdNjtrMmZtbf/Q0mIHfqjHFdOIKAYAFR1dwDVNHzvfqUqKP2o5udbGM1osO2BJZ+j8upOfyRP8wd76IeGlZUsN25nYETOPxmgbIKnMH4jM4vQmubU2XSC0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0l2cT6i; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0l2cT6i"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc04516cso4626832e87.1
        for <kernelci@lists.linux.dev>; Mon, 24 Mar 2025 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742818687; x=1743423487; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ealWHHs66lo8gPqHdCWEUQD4Y+zTd7Wx8XFM6S5s87Q=;
        b=M0l2cT6iDIfWTyxX5VKWCPisBc4XZ23SLoHxr7zOBmH0SmtqCWbZDJnKitzWfHC/SH
         4H82mAjqYjQQpSIV1MrOl2fkKzZTg9e2U/PGpgu0KxxVcq17Y0gQ0oZxuEQdRfMooZqQ
         AXxYcAO/12wTWsfIkiHUs0t1ikE1qeqbJXAa1cx0lCPYHeQrnojBoDWVZDidbpZVyC9e
         7B2iNd1JvM/lme5JnOvpz6AvuT46ety2WDuCDIvFphXQ/2Au8oXyAVO59BYSWf3qB5B4
         fRa/lL+NuBc9XETxOjZnxTaD+ASG0olbvAHCkbHujC4lvmQ8nBanD/wZeENCQ1w911Iw
         0JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818687; x=1743423487;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ealWHHs66lo8gPqHdCWEUQD4Y+zTd7Wx8XFM6S5s87Q=;
        b=qXlHlJIIM0U8g0ErM+w8EoJn94SDLz/QBF9QEvQMSGCCt5WaJiQWtBgL/stGw60R13
         Hhe3WwEIB0QFjmbrHuhzdJviAjx1rM4RywmjfQA674qhDNPue0zcxR33zedrFTwLZ46/
         D1wsmRWiYNSB6qebu3RQ93zRg8lrhsKILn9MWxUzJZ4mk9SHIwvEMz0s8axQegGWSPht
         Sq197eRc6YWPZFtLQSNg3Drda/geI3waMp8BhLaxOTcHXqVOing5jOUjRJHJWD5XSWWH
         PyFj0dQrbnNlJGpcAPzWRjDwSq+WTlahinMDAQDY+rNGYr53fcMnRX2P7QdRJ68aRu6U
         zoCw==
X-Forwarded-Encrypted: i=1; AJvYcCUOyAEXDXUA4mZx75+t7w0ePVAYC+xwgSfEcdyO8eGjdFFQ8iKmKR7B1BrvmEaacO8B2ea9gZ+BiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7jirvRyH7R0M3Wzb2A4P6q81jR7gebQq6ArjX81JLP8gqUeCo
	2VsvJxTJoQuyyK8s3wFWaXUJFgIbebtOjKa/+6zsT7fyvy17oOX3
X-Gm-Gg: ASbGncuzdOEINVuqaQ/sAG1X0QfQJTbuWDpIe8lITSG12Lh5YuJqoUJU4i4G6BOc8z6
	rWI7KNC9QPGj4LtUgre7G4rNjvKpx37mzAsXbdGaup2TfoE6/CE58ZIRBje/EikTE50DyIlzfsm
	y79MJ6XGVeHCRN2ejOVve4b+icFaHjH2/GseXnD94Cp74D+itujlgfN2YQT8GwXwXWSnVPUTKKR
	66qHVL3sWUcdAvtcKLP0ZIQ2xPr81XdxxoQ6YB0ewZvD+8P25vl8MTNsm2XzE6wrEhBJ+NhcQOH
	gcrK6FzJJr5q/eLfI6OsZo5IIc5N0Vmw5lD0lo8/KoxfgYAvZLrnhZKzv/aubkjvkz4xlFBgq+9
	Gc0mVDbZ45GXV8SctxLxg8iVaygXvfFkxWo9iEh4yn+Y9Z9+Ao2Rzpg==
X-Google-Smtp-Source: AGHT+IFQwv2o7f1unNFZ5Ttw0z8U4XVopLzD2yOEFKFxjAnmV1c8wNFE6u6FEGRO1szRNRDKLJimcA==
X-Received: by 2002:a05:6512:6c4:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-54ad63fc0e6mr4645222e87.0.1742818686943;
        Mon, 24 Mar 2025 05:18:06 -0700 (PDT)
Received: from ?IPV6:2001:999:508:9f7:9eaf:bd42:a36c:5616? (n5fnjixpwisvmi39jiu-1.v6.elisa-mobile.fi. [2001:999:508:9f7:9eaf:bd42:a36c:5616])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65083d7sm1122463e87.192.2025.03.24.05.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:18:05 -0700 (PDT)
Message-ID: <92698250-fab5-4f39-8f2d-3f29d85bdd40@gmail.com>
Date: Mon, 24 Mar 2025 14:18:04 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: =?UTF-8?Q?KCIDB=3A_v5=2E2_-_issue_categories_+_=F0=9F=97=B3_POLL?=
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Johnson George <Johnson.George@microsoft.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Philip Li <philip.li@intel.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 Benjamin Copeland <Benjamin.Copeland@linaro.org>,
 Manoj Kumar <ManojKumar08@arm.com>, Michael Hofmann <mhofmann@redhat.com>,
 marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, everyone involved with sending results to KCIDB,

Please consider helping protocol development by filling this 5-minute form:

    🗳️ https://forms.gle/FsZL84bcAzqve1aC8

We now have full support for ingesting v5.1 schema, including the new
"origin_builds_finish_time" and "origin_tests_finish_time" checkout fields.

So, we could move onto the next change in v5.2, adding support for
categorizing reported issues:


https://github.com/kernelci/kcidb-io/pull/98/commits/e7ba6a9f351a724f69a556f7967f96bb83e398e4

We already have the ability to determine if a reported issue is a build or
a test issue, and if it's e.g. a boot issue. However, it requires joining with
its incidents and the incident builds and tests. That is costly, and still
doesn't let you have finer categorization, such as "which kind of build or
boot issue is that"?

So, we'd like to add a field to issues specifying the categories it belongs
to. The categories themselves would be standardized outside the schema, and
discussed separately.

The new "categories" issue field would accept an array of "path" strings, exactly
like the ones we use for tests, but this time pointing to nodes in issue
categorization tree. E.g.: "build.error", "build.warning", "boot.oops", etc.

Here's a sample for an illustration:

{
    "version": {
        "major": 5,
        "minor": 2
    },
    "issues": [
        {
            "id": "maestro:ab266247c76746e5ccdc49ba08c7d1f10996cd12",
            "version": 2,
            "origin": "maestro",
            "culprit": {
                "code": true,
                "tool": false,
                "harness": false
            },
            "comment": "too many arguments to function call,...",
            "categories": [
                "build.error",
                "compiler.error",
            ]
        }
    ]
}

As the change is minor and backwards-compatible, I'd like to set the feedback
deadline to the end of the week, Fri, Mar 28. If there are no objections by
that time, I'll merge this change to the schema and database support on that
day.

Nick
