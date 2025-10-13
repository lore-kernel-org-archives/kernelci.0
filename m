Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5892DCBF4
	for <kernelci@lists.linux.dev>; Mon, 13 Oct 2025 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386081; cv=none; b=L+jtPIyL48LHa83SquDsSOP8BTclFEXMErE6uH4o6y8MVukpD3uedZtwvSW0c40v1qJVPDswJ3nPE30BMw/qxtXtJww3lV3yvlnxWnhkR46KVg/je/YUX5DxVT6G4YdFZqAjPYqGnH0qqyUZMNfpunK189KSRfrw6UFXjwiw+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386081; c=relaxed/simple;
	bh=+eKM3VVglTPOLZk/Ld+C0+eINQGXhNfW6l9uJ4O8FUo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=txaKTt51hcbjI1mKD2dI/qjkcuRS31CV1UohNRz2PhmnP7ZkhSusUsGkypkkNw7DVpSZ1YPkJC0jzBp1ZzzZ+4FANiUHwhddmlz8EzvfabDZdWvtqvkINaN5Ss462rEUYsIh5IkqjF/bJI/osDyKedRDgON0WtX9z2z5AU1MlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=fNmmUAO5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="fNmmUAO5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so671152e87.1
        for <kernelci@lists.linux.dev>; Mon, 13 Oct 2025 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1760386077; x=1760990877; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+eKM3VVglTPOLZk/Ld+C0+eINQGXhNfW6l9uJ4O8FUo=;
        b=fNmmUAO5IEd9lNXVQw7Xed5cyjV3mFt4cksZ6+4ArCH+1ruMeHHkOPtlYUiImrSN1y
         4Dyucj/4gu+IHTriQKj1R2h65GX5MgXaurRrO5EwMlmjd3EpVpaf26NjktYK0kjf+suO
         YeIVHhXlIjD2UFcgiiJ/PqQNftwjjk2gkY5asWtyrZgDEomx022EpeqUrvE5s5H1Roue
         nCWjc5vkVvuuPsXF+LG4gA3pvI2djnGcY1hxZ+AhCyY+k50rQCm1p25cuvDEaWL7IZ4R
         G9CVWqJJVzX7igZX37ajZTXAjO7rIXsnPS1ZWx6jUvme5VkRCtr9mdCsec+6eNTYAj9s
         AF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760386077; x=1760990877;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+eKM3VVglTPOLZk/Ld+C0+eINQGXhNfW6l9uJ4O8FUo=;
        b=vmA2UoKu5Ylncbuf9e9VNhGKidC+t7K206BglWPtzP4ukxjP1ntWn1N9Far//QffXZ
         RorVUsXSwoPZYAj6f4a8/0nfJldS5THfi6EisBOEPHN53Ma1i+V9MvZTsvB98B/Z+ApX
         yNgaaeSXNcotlHijTnycqwJXKSksCGHCPEf8MQLLhmCahxs+57pNYaEtXQ9n8CMYpkTX
         HfF9lz1U5ogyj147ECC9i3+F24PA1ap9RS3TEW0d9Wo2EHgmhQcXwSanW8zfLX1mkTBQ
         oW9/Fz63zh3VRozf0SMvpZt43fYItwOTYb9uG5pJYC2kpT14socsgXcOsMJGLyjGv6U/
         XEIw==
X-Gm-Message-State: AOJu0Yw4I/A4OOtkERwof2lb5YUuVnw96rPomm2/Xw4UG2fCbGnNQjaY
	f+plaWQU/uEvktdsOSEM5KekO6geL5rlOTzT5D2Z201p0ipUbW2So0uQjR8pjUakUMXYch8N29m
	Jk/Umz0SzgREbYBM5qyjtJdk1VqosELWaOvMFAWX5bb0/s0Xp7Vzw8p4=
X-Gm-Gg: ASbGnctolq4wTjmSPsjt13CSyhcmNQEE53IcpLv45pBqtgdgvS2EfV7p+viQaCt5LIW
	ppUdbnZQelDNnw+/g8rK7hvUo/6GkJ3/1oxG0/7y+EBmBaDNUjtTlq3X7wWyGWe+f1KtvFYQKIC
	c/xyTJONX/TAp28c4Lu/wec/JO+9CdIIB4iuhGT+8pyPNueY0G5OO+yYf+Sgxg9y2oG21poRZXM
	CetNfu94XxiZXX9FeNHcmGRpKkPG0nyRuV2Zw==
X-Google-Smtp-Source: AGHT+IFmSYVWeEFbRT+fAQf5KBzaGbNQ2pEDwPChP5tWW28Ii7jcdC+4UGFyrZPGFECWZO2KkIdfmCurrWel1w3TY6Y=
X-Received: by 2002:a05:651c:2211:b0:365:e848:b7a8 with SMTP id
 38308e7fff4ca-37609ed9121mr32112881fa.4.1760386076586; Mon, 13 Oct 2025
 13:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Mon, 13 Oct 2025 17:07:45 -0300
X-Gm-Features: AS18NWBe7YFYQ6Xso9P09H-llX-WPdIK71pz8dd-Plx1rSjEzDQbh4JfX0kEveg
Message-ID: <CAMVAkEviyZrgPk7NP+tVUc6Nfo1DBbiL=4YWnw2H244FVv5SFA@mail.gmail.com>
Subject: KernelCI Dashboard Report - October 1 - October 13, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

In the last sprint we had a couple of changes related to performance
tools, both for the database and the backend as a whole. Apart from
that we also keep having improvements on unit test coverage, frontend
responsiveness, notifications and others. Here are the changes from
the last two weeks:

## Database
- The database indexes are now better defined in our backend. They
were already created in the database with a separate tool, so we just
formalized them in our Django models. [1]
- Some indexes that were created with said tool were not necessary,
and have been removed. [2]
- Along with the index changes, the Django migration router had
allowed for some unnecessary cache tables to be created on Postgres,
so they were also removed. [3]
- We are in progress of denormalizing the treeView, with a better plan
and well defined steps for it. [4]

## Improvements
- A framework for performance tests was added to the repository,
allowing for tests on backend endpoints. [5]
- We are now able to check backend metrics, such as which endpoints
were accessed, how many times, and how long they take to load. [6]
- Backend unit tests coverage was increased, a single folder with many
files made possible for us to increase it to more than 60%. [7]
- Continuing our effort for a more responsive design, we improved the
layout of the data interval information on the hardware details page
for smaller screens. [8]
- In the notifications front, we added a link to the build config
directly in the notification for a quicker check. [9]
- Following the bugfix below, we reorganized some environment
variables for logging without needing to enable debug mode. [10]

## Bugfixes
- Email notifications were being duplicated. This was due to our
staging instance being on debug mode for a little while. [11]


## References
[1] - https://github.com/kernelci/dashboard/issues/1351
[2] - https://github.com/kernelci/dashboard/issues/1539
[3] - https://github.com/kernelci/dashboard/issues/1517
[4] - https://github.com/kernelci/dashboard/issues/1558
[5] - https://github.com/kernelci/dashboard/issues/1529
[6] - https://github.com/kernelci/dashboard/issues/1535
[7] - https://github.com/kernelci/dashboard/issues/1496
[8] - https://github.com/kernelci/dashboard/issues/1431
[9] - https://github.com/kernelci/dashboard/issues/1551
[10] - https://github.com/kernelci/dashboard/issues/1546
[11] - https://github.com/kernelci/dashboard/issues/1540
