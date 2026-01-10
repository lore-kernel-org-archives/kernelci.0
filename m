Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3C2E9749
	for <kernelci@lists.linux.dev>; Sat, 10 Jan 2026 00:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768003211; cv=none; b=Jv5s6ED5N7B2znsEVAuJxjanfma7wHGq0CzboGfMQYRaIxiABRPrR0MH0+K9n2LVIrcueyuUx3X7L4EsASU/YAdGokxzEY/dpBVRFnbSeDZU9/4yxxGFbWq/zMU303pb7lMtDeKiXJb8OGr4aiZh2x+Hh8UJriRK7OFmHCNAtU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768003211; c=relaxed/simple;
	bh=2QHxdQLvG+gRpmhTbJQEWI4N8DgI1BMfBjGHbyEqedM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Reh3B5/ehQgx/f5W0aYbTR28qGgdNvQISC+nfsPYMjVtMqbJ8G3fQQsHzzPGwto+TY5w8e5V/7jAG3hkqSzuYB1AWlDVk4UPQupi8bedtRaLyb/OqJSyjtH3VNa8yu4/lWTVLqWYih1/hIIDBBNw2TeWiLibliQiurhnXDIyM9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ta60KpOn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ta60KpOn"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ae255ac8bdso6762348eec.0
        for <kernelci@lists.linux.dev>; Fri, 09 Jan 2026 16:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768003208; x=1768608008; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8FN8df4J+50RjwOlouhTxFytQtVKBGzJn9ZPAGZgh9E=;
        b=Ta60KpOnEHbuz55z6gV6ZO1OwFB+xes5Nb2P9RGh5lyyYPpkR7hFmL4rp374Xe0Kox
         op3HBXUWQlbQ2oxwCKP54RFtvw0LOFKdWOu9oJowzKNHRZKH5oNhpqfDUlNEHSUsd7qJ
         eR+QWWJgtXC7DrdZUoI6j0uwAzOL/dr/ZrC1v1pSE80q2n0VHlFdyQfWC0pYKAFIeOjy
         Kjwvt2OO2znZmY/Rhc0ygunVts0eSapcpQcLcz+eOfVbz2awasKEbbE3CvZzUNS/9iOA
         OxDDf8dOJrG5ogEJqS+cwxz75aepnqz9AP5uAuABMB7X2/UuRjJZhP25En0b/i06ZKqv
         2iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768003208; x=1768608008;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FN8df4J+50RjwOlouhTxFytQtVKBGzJn9ZPAGZgh9E=;
        b=qm+tGSrKQDoF1+BTsToQYRSZ8XrgBNDxWI8+ouYc3lu9yA/Z01ZokxbSf6LAshxV8m
         0ghPaxi3SCfS7VwsCBVOkp6RKj2lkFE7XhzATWEkZ9njC/Qp6b4eFhmOb51/JU8AXYzl
         tZbKAV5+YGv3fwJtB4BBiGfhKDtTzQGR63yAPg7g2YAZiE1g0gUdoUNhMH2BNtY2VG/R
         LXCJKX2SF2B6Cz0+07dPRcNZ7iK9tvZeMYekZaOCBO9vrmWogFRCMmjsaN+jAkcLirxn
         49wVfJkefcHsduiBL032vav9gYfEvYsom7EP7loGcE4hIWMCOgv4KwxNZmBNtzjzsbFQ
         aEEg==
X-Gm-Message-State: AOJu0YxqeQuxZ61OSaP5gktV6uG1uEk0/cNAe1KyUXvG0nxOkf/gPGg9
	Q9z/ISIt4lfFuG/n8tNDCp9PIPLBKyXNL21PvTmII9mbDzPVl/5SqeBgH1LM/TX5f2PYzZwy7zE
	Ymw6l
X-Gm-Gg: AY/fxX4F+cBoBARmAmwUtR6YBQNCWTiQC0RmoYqdA8fY0t5Ixb5cUzqIFX7Q1DL163L
	zfa8pecvkU3+0uTF223fJL0cPiDKbTeOdPxHfJZHaUlblApI3Uu1pUwjNBfNvCqrdrpdP8cJZnP
	5VFRvZ47weZNOWNnyklxIhjg9BYen+OvcZXykBRD/vqgdfkQRimv4d8hQJ4oGd70X54FWmj/RzP
	1VQOUy/TIKUUWHeB8BNpYuo1X7DQTbrbD5ElPsTm7LJZWrnk8JOrCLenijZDy/4s6XmEpBRPALp
	Uk6DDTE4Idqp35ptfxjRiRzb2vDujyi64PFO5I3f3HXzW0xcFj4GFfTRD2YsyvJG5NMII4Wa247
	ngdSYy40HDH/tzbI6oRlV7QadlZIHE9sJgB5xyEwcPpSzul5gT0iuFo+1h3CEHfmae0JmX4NZp/
	n0B+QV
X-Google-Smtp-Source: AGHT+IETctctktLp61CWmk1neGiUJxICCFQhEfGo+DCeD+hourOVI1vyAtX8Gt9xncF+3Q994ijxqQ==
X-Received: by 2002:a05:7301:fd8b:b0:2ae:5b24:1cf6 with SMTP id 5a478bee46e88-2b17d30f886mr8388768eec.32.1768003208094;
        Fri, 09 Jan 2026 16:00:08 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm14082910eec.20.2026.01.09.16.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 16:00:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-01-10 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 10 Jan 2026 00:00:06 -0000
Message-ID: <176800320641.1167.1124346807193767256@1c5061884604>



KernelCI Metrics Summary
========================
Period: 2026-01-03 00:00 UTC to 2026-01-10 00:00 UTC


ACTIVITY
--------
   329 issues
  2858 incidents
  4171 checkouts
 12901 builds
1160793 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     803                14
redhat      5                  1


LAB ACTIVITY
------------
There were 10 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                7734      0         3857
maestro     k8s-gke-eu-west4       0         0         98757
maestro     lava-broonie           0         1635      211437
maestro     lava-cip               0         1084      0
maestro     lava-collabora         0         6411      400497
maestro     lava-foundriesio       0         172       0
maestro     lava-kci-qualcomm      0         73        40735
maestro     lava-kontron           0         613       0
maestro     lava-pengutronix       0         568       0
ti          opentest-ti            0         1038      0
────────────────────────────────────────────────────────────
Total                              7734      11594     755283



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
