Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5224E4C4
	for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150083; cv=none; b=dNJTsgXO7ShPsoBI3zR3TjqJkY4u+Z5L42/za96gRGxwwoJ6sCurH9hsJONf7yD4F/m6QcYp07q6VfuintDPlmLYAuMTolmRf/hbf9Uq/KasCUG6a+OOw3+VqNwdqUW19zNSAUSOTKBxGire41jgU+2aXN+POfk0qC6nWY+7Jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150083; c=relaxed/simple;
	bh=M0QjQpwcxQawfa1JPfZQhherE0N4LobAVmDlB3bk/hI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wx6l8DGfgdcU/jbwmKellrSuwO9iZbcM/pkSkEsnYN/+AR+MN5zlWrYQ0YtOPW0uxIsku1fD4CVBrhDru1qx08PpuNJTGdMJmmzMoU+glDNLdVBfB5I+3E72utFdDqp8bXKk1i0u/cr93DjWzu2qg8COB/y9KXb0tHO76BlczqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=CgxP5Igf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="CgxP5Igf"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553cbe3e77dso165108e87.1
        for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1752150079; x=1752754879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0QjQpwcxQawfa1JPfZQhherE0N4LobAVmDlB3bk/hI=;
        b=CgxP5Igf1GxAN+8+k2NFylYF3kwzlRyLadCJJleMOsT+abzBV9uLiuEiCM4AQwMwrJ
         MnMTUbLEWiuRijML0ydt6FBhj0RY2vzBuZwsw00+rVb8W3aUZC1M9KSY8URKBYnEWQUZ
         1CnglTAu+3mxxwrjugayoIr2FEwfjuKBR0YZG5pXinVy/rKHwH43iP/OsjfzAx7eG02n
         G2mzR8sdx4cPtCV820cOHfDkEcJarZ+9LqVa6PHeKTw6NCzfz1GRKwGeKVC1O9vLWsaf
         6IJpax2LvvpJuxDKoO4t3JiFiAGbOK5soBaKac7tO/co6ZTEixDWFD72HeD0wEKFy0xG
         EUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150079; x=1752754879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0QjQpwcxQawfa1JPfZQhherE0N4LobAVmDlB3bk/hI=;
        b=oKTmjrSEnh6kqFDi3mbqfNobn9diEnSr0XJONrewJq3VICRjBRFs5CB9h8zQNRsDe9
         NgVxHWYcR1jEqJ8WS/61Ou2VXeHLTKlRMcnZaAFv0A1UfNpkK58WyxeNyHAxH02cnFyK
         reYfyHPDvQQg955WPSxcAn4+n5ZOdK7ALm8pAREH5LYnQXVd2o81a+RPJOX0h0NjeyZZ
         CDuwLOF+Liyjq0edyupIQ3Tpp+40bmYpN2wT6fZ/uXzCN8ROJsCgH7mSVnxQE4m1s1qT
         Qp3LXnwIWWEcFrL6hy4G/xgw1+6YmSnEZ9UHbgvu0xxjxsYj/bUdBsZTprmLCyzIcPBl
         6mRQ==
X-Gm-Message-State: AOJu0YynnhwaT7y0w7nE07dAs7+I9iAwxOhbyU3C9TIm0voLOpu2qKuw
	qPe1nxnCQ8QVpRCWBS3ZWcUcWJqNqtBmeFOLuPG5F32RO4jJPudHXI3ekTtPUU3Nbg4mRgsbYHn
	41ecScqAWiMuoJ89A1zaMNf4Uj064fYuI2OHmaKocBXqOsRmICpQKIPY=
X-Gm-Gg: ASbGncvrx6lC0YmTqcEUT3bdiUGk5JL86RWiaU9M/0/Jw+3KmXyWgxmr5lD/GX+WLxG
	0swdP/uH9qITF0YPAK1rI1F3BW4hyZ9tjg0v49VeLvGuHTzp2CKkNw1HUIJ5HUdzJmOjUyJGmSX
	Bo83Jc0/sVGNesZq67Qsy7hLrywbupuTmWJvR59I4bfwIcsTJWHtsGiFuJ
X-Google-Smtp-Source: AGHT+IGdaBfm3tU7mZnZo3ybv5Az59hkU+6z21vOJRRsBSf/aqErN68WjfSlIULi+rBDEOrqCa2heefjTyBm34sR5+o=
X-Received: by 2002:a2e:bc22:0:b0:32b:9792:1074 with SMTP id
 38308e7fff4ca-32f485bad60mr6570801fa.10.1752150078388; Thu, 10 Jul 2025
 05:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Thu, 10 Jul 2025 09:21:07 -0300
X-Gm-Features: Ac12FXyMHdt5IB8MWQI521d_NDgX2_szfDLdWmBAVxIE3hQeUC-Z37JsFooGvHs
Message-ID: <CAMVAkEsCEBNayPxXJXBXBXHRYLtqiwq6cMcgr8GL+5MgSgRtgw@mail.gmail.com>
Subject: KernelCI Dashboard Report - June 27 - July 9, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

We in the dashboard team are working on sending a new report after a
deployment of every sprint with the main features and fixes, which
usually happens every other week. Here are the changes since the last
report:

## Improvements
- A new endpoint was added with the same return as the checkout
summary report, polling tests up to 1 day and with some other
parameters open [1]
- Added support for multiple paths in a checkout report, as well as
multiple paths in the kci-summary endpoint [2]
- Improved checkout notification query performance [3]
- Added kci-dev information on the page footer, linking to the cli
page and with an example command [4]
- Added description to request parameters on most backend endpoints,
also visible in the swagger ui
(https://dashboard.kernelci.org/api/schema/swagger-ui/) [5]


## Bugfixes
- Filtering by architecture wasn=E2=80=99t updating the card correctly, eve=
n
though the data was correct [6]
- The /c/treeName/gitBranch/gitHash endpoint wasn=E2=80=99t working after t=
he
treeDetails url change, but was corrected [7]


## Technical Debts
- The sqlite used to store cache and extra data was a single database,
it was then divided into two, allowing for a better control over cache
versus notification data [8]


References:
[1] https://github.com/kernelci/dashboard/issues/1321
[2] https://github.com/kernelci/dashboard/issues/1217
[3] https://github.com/kernelci/dashboard/issues/1310
[4] https://github.com/kernelci/dashboard/issues/1247
[5] https://github.com/kernelci/dashboard/issues/1300
[6] https://github.com/kernelci/dashboard/issues/1268
[7] https://github.com/kernelci/dashboard/issues/1311
[8] https://github.com/kernelci/dashboard/issues/1223
