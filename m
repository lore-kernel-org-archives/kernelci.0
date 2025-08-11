Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847DC202C3A
	for <kernelci@lists.linux.dev>; Mon, 11 Aug 2025 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754936010; cv=none; b=hd8nuh6dzsUhUG2d+t0eZntxk664h936pxtGiBE2Ivjs0VFEofOOMeWpdCm1gK7au87sP704tT8Yc0l5gGipUQ0cWCR9euQa+ogAGCBriPqI8U4QJS1Y2mNHIDlfC9Nz7t+lRqNQUNDd9V38W2CBLgAt3nwuueNJEHbshjRF5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754936010; c=relaxed/simple;
	bh=fXIjMvnFNHRckH4X9ukD/4S18xb/jQ9HMZ44HeTRP14=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hfz+l6UTsDlmszZA2cjfTfcajdrEO998z5Kv4ROraCMYIy+iOI2Bq4oSN/lwzb0RLe39m07/EcjKgkl9iP4yApNqR6mrtAKM7xV+ipb3/Taz5DS2FxTF/finj0MWQAxbrpwbo0uJA246hFIknyWVdVcYXWJrvj49H4RfOktgCZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=XT/HrpGV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="XT/HrpGV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55b9f78efd8so446079e87.3
        for <kernelci@lists.linux.dev>; Mon, 11 Aug 2025 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1754936006; x=1755540806; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fXIjMvnFNHRckH4X9ukD/4S18xb/jQ9HMZ44HeTRP14=;
        b=XT/HrpGV2rY/UoO+JtaNuFgWayFhZwf71TYT9m1fxhhJ14AchlPHmWyOmJqbhJKPWg
         SZ8auOrmwvuWyG7E5WCINWkS4qnEEtlAMryiKqKPIYS/tQsILv7pQiP+vTk0vqrB3q13
         64oHb5D3eF3wjMlNjwKpW+VSym0bqR16g0KtzTP1c/D4tX4gMtyXyxH7A4OKsA0BN1UV
         TUdZQvz+cpJWUAlY3CBH1XawG4/R6CF6WFwgWff9raKhB3tzIwJg2IW/CbmIWytiu/Aq
         s1Kv25/OynofEFio1KnWVxkWeC9PORrxNaZPdzUG7JEJvbJY1E1/sz0ffu9OGRKsKLV0
         RFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754936006; x=1755540806;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXIjMvnFNHRckH4X9ukD/4S18xb/jQ9HMZ44HeTRP14=;
        b=hiOx+AbIvt5cSZzY/j1dDyDugu5HQ0f4tOtYQK5pVpnyiDJhWTcsSEg9dU+ZJKD/vF
         xrAqThxp4Lmnp3VE6XHKlhePUEqa5JLqWfW1LwjDYQVOrL54ie5uQsUyys6MFZdbVdUZ
         YJd+FkPnU1D75Bc4AjBqMR3XniRt9zszBFmGj3W5gva7blWTHPMS4ueAtODU5uWoz1Rn
         e/xF7tDNNqSn8ZN6P8yBpkO4JOxTceeespJHRtdTjv27puGeCSmCbY9TeZp7pF636yAN
         q8X42tHPgG9FZl+sRFInJN/dmhLy+3Cc2JpiRwT+vTN1qvQi2Dv1LzomUrWmZKO5lM6R
         P+Pg==
X-Gm-Message-State: AOJu0YypiBTZPujYe3XPegZTUwX9mCtUbdbK1nRAZ1sN0BVfXtUOcCc6
	xt7dcfNmJeC1Z7csq10hNfKinpOl1gPhtfmHB1ZWwKkT6ealC+Qjbbfh0rji1iHXt3HF6MZ1e6h
	xtiWrWPxkaJaVGeGrT1CqHdsdJJiPuaWh19gALCrUrElTIZKJTr2tvWc=
X-Gm-Gg: ASbGncuC1+QVIC36KpZZCQ78KS0ahpkPJzj8zYvZPYlaBdBSCfUdbD20sEHXMxPQQ6m
	tht7JGpHoYIw1otL+J7v/r9oWKXMCx1SSPiWiagnvtQyhoZEwZJCL9j8a4p31b+OWqvYRcInGsk
	thnhgWZ1yk74X4gOdgQJAUOdL+xJgcvDzuKynIdqohtTdXERY7tVRGpC7asPccLolpZzjQlNLPu
	GfreaI=
X-Google-Smtp-Source: AGHT+IEd/8OdOwLtGgB7NwyL+uSW34JkPMy1L60Xheg+4l7e4xkVq+egHqWWVYvlmJ00rC2ycaF7b3HpVC+UMkmm8QQ=
X-Received: by 2002:a05:6512:3b9e:b0:55b:8033:1d87 with SMTP id
 2adb3069b0e04-55cc9a3c7aamr955217e87.12.1754936006066; Mon, 11 Aug 2025
 11:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Mon, 11 Aug 2025 15:13:15 -0300
X-Gm-Features: Ac12FXyVIX3brKegxb9ap2v8vVR0imjhXKFgEz-Gb1rMVOVjKkXnzcHJUb2hjVs
Message-ID: <CAMVAkEvB-HS79LZ82SHbagJ8tMURCvnHTShk0R1W2vd7X8ZEpQ@mail.gmail.com>
Subject: KernelCI Dashboard Report - July 24 - August 11, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

In the last weeks, we have been focused on the transition of KCIDB-ng
to the dashboard backend as an Azure Managed PostgreSQL. KCIDB-ng will
remain as the API for submitters to send their results in json files.
Production deployment will take a few weeks.

The preparation required some time from the Dashboard team to
understand the DB setup better and configure it well, alongside other
improvements that we worked on during this time.

## Database changes
- The new database was created and is managed by our backend with
Django ORM; its integration is being tested. [1]
- In order to move the database quickly, the new instance had its
foreign key constraints removed, making it more similar to kcidb. [2]
- Some schema changes were suggested, still needs some discussion as
to which will be implemented. [3]
- We are bringing the tool that parses submission data (the ingester)
into the dashboard repository, including some changes to allow for
insertion directly into the new database. [4]

## Improvements
- On the tree-report endpoint, it is now possible to specify the
interval to get checkouts and related tests. [5]
- The build, test and issue details pages were redesigned to have
better readability and organization. [6]
- The response from the issue extras endpoint was improved to be clearer. [7]

## Technical Debts
- Some tree endpoints had their code refined to allow for more
specific documentation. [8]

## Future changes
We plan to keep working on the transition to a new deployment for the
database, providing better performance for the queries and the
dashboard consequently. In parallel, some improvements will continue
to be made.

References
[1] https://github.com/kernelci/dashboard/issues/1332
[2] https://github.com/kernelci/dashboard/issues/1382
[3] https://github.com/kernelci/dashboard/issues/1334
[4] https://github.com/kernelci/dashboard/pull/1372
[5] https://github.com/kernelci/dashboard/pull/1374
[6] https://github.com/kernelci/dashboard/issues/1347
[7] https://github.com/kernelci/dashboard/issues/1335
[8] https://github.com/kernelci/dashboard/issues/1317
