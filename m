Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552712566E2
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006627; cv=none; b=dPVxZtblSyFRa8OxdwIcK9AfPv91o4Oct4xDB3PbIIYjWyNnCniVBMvqJtoOle1JHKd6s0GTH9rdsDk79Fj6os059LElKF106WH2WmNAnQGUkFHOXog9QAuxOAsbfWyHrkIJM0p2JKt4eecjZjhMMVcAMaq6F/S1eDd+d3JFWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006627; c=relaxed/simple;
	bh=L5w/6vBkPzkicID8vavEOrTD8orzwuZFjK21noTsyxE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UfROHH1a3IxXEfkQyr94WnvkCWTwdg6ZfHWrymmt2AVhzz2uq6+qnf7upftiYtpXqM45VOcrIs6e3Y9GThFy8FdSkbSgS+jaTmPeAjPIaq2nnzmr/tbXNGuj+TE7ES66ZA+wxqXmfgwmdMfp99+b6urAqHBaBtfTZILu9YIb1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=Tedevw1N; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="Tedevw1N"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so498921a91.1
        for <kernelci@lists.linux.dev>; Thu, 09 Oct 2025 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1760006623; x=1760611423; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4BNi9dBU9e9xCDaOKm2Ilt/XSrGJKoBZjDLJylLsbno=;
        b=Tedevw1Ngg+o8xzheM0XYoZV4WhPuXftzIP4LJjpJ2OjKzXPNNyR0R/buGrse76VtL
         LDvaBs/AcO2bzn1ktmUwQCFVAFZ9tr7/69Jc7pXMlUbCtwtF3OVhtxxk/2Y97VRXZbKm
         BHPg7f3sMpj4Ca4HTXPPMqpTZHvry+e8B7W+feexF4H9L6d4ZopmElKbph82BZ3vJUFE
         O4vVMDq1udnEXLfg8nvdhMZKD3HI7ALCbfPpDdptplm0UPABbei8NbGEN2fCSaGLyK/6
         k77JmbBvz1ZFhUgKSIva2dQEmX/KhF53rojJfxc3kob9OSrI5Pw6xBvnJ65slmbXKrT/
         IgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760006623; x=1760611423;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BNi9dBU9e9xCDaOKm2Ilt/XSrGJKoBZjDLJylLsbno=;
        b=tCRtoGCZ168b0QZ+094f15xPqDnfQkOqmiXEmr6WDMHRh4fWya0GF4hB4bSR+o92sJ
         /AXcoXcNuKGllql+3K6v9Mm8qPWszo0rZ6MILIHkBqGCu+enloRuhdc5e44za0ffHSL0
         heaqi+MSPZHLl4OyYVNh4CFp/nSDqPSQjuF7HGxqU9rlUMu76IluaSFr4xgdVsMgVzl+
         jVD/eGFLCrrG0x6Hkws1kXqA3CDQkZ2B/za6wpM5rCpyh3cxT2z9yUnlYbP22QavDH8Q
         i3r1ytdC69IfRKO9npRuigOdmkvPxQRSzqnDSAWaxhv6A5VkK+b1zmwMz/El67frC/8/
         Hsog==
X-Gm-Message-State: AOJu0YwCUrhC4haPn7+6wNlJE74bHS8ELJji0TDSN1CuxbRjyEBHqZgD
	wLWiePVnJGnjA79+7Td/4B7kYcEla12chwkA7zlpFF71wnRFgvaBGA7tPR1W8eWw2He9YTMcivN
	j246gJ9/6XwHdPpT7kYx3BvbWr+lN9e365jqVi/Yi4ycYyz19dvlngA==
X-Gm-Gg: ASbGncvhI1NlRChDo3PacEjVyGZuR/g7hPgkeKwkNV6HF6SX0A6tTE6MtLhgZ94YxWG
	qLuGoQlPCgOmYppOhgypJ+WQnl3bHLXFbPKR/qaBS0cu54BJqrEOYDcX07T9Zp7uJ4S5ppvLWrp
	wrLIzmSvKOICqPGfQCrZ1qTeE3N5OPqW/sEBp3U0HvBA7U/kpysnJfYmUO8iOCSWRr7eaGSjMEn
	MtEMZ4J01PL4eYHsGJtT87XiYhZH210cW01S0EUCA==
X-Google-Smtp-Source: AGHT+IHkbtm8qIjsbf61ILB1z8Y4GEgbElPLNvAMUSD+n5Xa0so60DM2lrlIwTKUPgfz/0ygf8c+QK1MRcGc7drgbnw=
X-Received: by 2002:a17:90b:3e83:b0:32e:23c9:6f41 with SMTP id
 98e67ed59e1d1-33b51676ef2mr8214426a91.5.1760006623690; Thu, 09 Oct 2025
 03:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Thu, 9 Oct 2025 19:43:08 +0900
X-Gm-Features: AS18NWAnjEsTfOIuoMxM8DUK2Kb629baGg4aymVDPvG0KSJyz8qMcgiWAXutiuM
Message-ID: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
Subject: CRA compliance
To: kernelci@lists.linux.dev
Cc: gustavo.padovan@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

as per the discussion of last week,
for moving on with the CRA compliance topic.
I propose to create a private mailing-list called
security@kernelci.org or security-kernelci@lists.linux.dev

any objection ? or suggestion?

-- 
thanks,
arisut
