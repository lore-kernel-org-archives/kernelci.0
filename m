Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF73469835
	for <kernelci@lists.linux.dev>; Tue, 18 Aug 2026 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787061411; cv=pass; b=cATF7W312rydRn7jMDquU5F2ejqCvP5BqSCvH59J4csRbLn9p3QytZDEW4JigfR6go0Wt315VD2buVYrPdoLLzrZCAJg4L3AZIfCspi+V/SlNvh87aqRhWlzKsoQpdJXdfFVBE/eI5pgzBGbbVoK7r3TfODh+/832C/bTPjE7h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787061411; c=relaxed/simple;
	bh=KFS8aazQh3PE4iC/nnOIHJbsf9UEkgWtzOCotMRTkKg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=s1NKVQJSgIM7WYBPzEb4/0NcKaPbaJiAQ2HSnKFR44NZxMDGywbN+EkC1/q1xrlpOOfhbzpPkggABWvsy/W+vzQXuEtGd3n0lgC8KuOxY4QxscOMm0fzOhoa/F9FpjdA1OT4OJYt8frCPFx0wrHnw2KXGphbrGp3VzFSqqKQUIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=wsqgNNRR; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="wsqgNNRR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01663d816so41328795ad.1
        for <kernelci@lists.linux.dev>; Tue, 18 Aug 2026 06:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787061410; cv=none;
        d=google.com; s=arc-20260327;
        b=PCxNz/WiWsgECkIE0Mt1adK7Y++DrKRNwZTqFabKHJktKD6IAci6o5xfepm8P7Zr0X
         Fxf6XcvFJQdGtFEGO89jyvbhT+F/YfG9iJEqStDAUfL+HbqWiFDVLU/DA752Wr1abcW0
         uB4S56B896xLlb8x62VoYo3ojfEuVVs9Rfc943fCtqkeOHaufPlQOqWPg8LZzxkIJFIV
         voOHvnRN/WAxSYFEO6sMV5R9fGF23LF+kRGk4GlItrBtbQICSceFFeKMP0HhvaBSsd07
         2FnPwWFY8CS9LWBuh+wahcY3L3GMNNaxGnIvuL2jwaHOJ13LE2+1vRQR+HScMYkIAfWM
         YniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=KFS8aazQh3PE4iC/nnOIHJbsf9UEkgWtzOCotMRTkKg=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=Nsiu1aMpH3wbaBZOaMu+b0xZwer62WQqhJgy7rtzgN4vAAGKZuh1i/mvn3adaj4RkK
         M30/TgcrEAQLbvdXEQIgsdT8gDZAz5Pqx6rqdQLa1KcZOx0CuPwFzAQ+GTXOKQAGyo7A
         ElhlVZg6/5TzT/0NrbADHXnhuKH3hXx6o0XMwFzeI8zXo96x7LYRtXp2/NN0UPFmJBrw
         UPYKynKYuYhtF/8MnrlxK+j+Q0CgLvuxFagj+juQGDmdFw5bMsQej0mW48gqKvsVlFfm
         T/N76VgBz1tq/Nea/uXBoHWgm5XF+vRyXBbYOjpmMDL+sPr1UqJbN7iwSaJmVy0i/LoT
         J1Ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1787061410; x=1787666210; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFS8aazQh3PE4iC/nnOIHJbsf9UEkgWtzOCotMRTkKg=;
        b=wsqgNNRRkaWWGFMKjsH3wv01QApdqodyysle1S6eH8nJJ9xvRnvsnUdbOX4C4KmFkJ
         Y8hbNcXw+G1OtZ0kyTUVj45sg0N2zt+9gy8PIYJeDIMKwle+4JHB/66evJxGZN8kkulj
         k+0zGSuLHMTYBsfJ8BQ+71qRshIp4TeTMA+nf/me9R6B1D4zX0405WYBPPBXJGMs1S+R
         jOSpPPxwFAIMiaXRjdl5fT2nVNUzh9kRPrl7sm9Egje0foHasNmeKt1+xYcFG4IBFTue
         WVED9wZmCGA5qlQwwWpNmenqBvlF2Tg9YexCSMivLEe0kSV8quKtltnHB8XhYUzaYND+
         uOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061410; x=1787666210;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFS8aazQh3PE4iC/nnOIHJbsf9UEkgWtzOCotMRTkKg=;
        b=hAIjLrDLDw62SrryeLbmVw/kvlbOQySmA4nsocXcGE6EqQGE9Vn+Jghc6/ZJXw+L6a
         yBoZP8hIBvTe9/lCavlOSlhc4QwwSKQfA7QH58GsfpNN8cZvVIK+oVVcDr/qguYCTZzk
         HbD376Uyzgg/unP7R1/hV50Q8jkSZG07rSPEADqydXuXuBFwj4NOe3zTF39YVWHc2PGX
         y7cqt0k/g0tfz/EW4X8yrvQPXa6Ly5kFBySLvuEB1Kjwwt3gQfSTX5ILFJJMjPvyT8gN
         p6WzumDwvMRZeGqktm6wpd5twHQGL7q+qT0wPHHP4TU94WaNi53lzsYjUrftFC/zPg07
         kCtg==
X-Gm-Message-State: AOJu0YyRuCpk4lw96dC6abfojDopvqatWRJmzVg5R503WWV5fpfhrAz9
	DbMiiTsPPEYfAk9hz6bBKML+IULvZixnHRry0EJ2wfh4emjgsSTNBj3l74f7z8pXhQYf12IcJp7
	FuaCqEF8Sg5GowazwZqWC6HxX93yyqby+KtWoPQW8j0OSxnfYeAaIj8WJ5A==
X-Gm-Gg: AR+sD133VVvVuMeLpkqZsZ4R1xVWOA4cxwXAxofnMZerZ9MSxpiuV3M2Ch+lDtAmOKH
	BkI1nOZOYvqXmHhKNvUBHLBdpzjWH2hCEwd1GRHJjeHgANdP+K77wUXMes1GzfPw5I41LqdJUmZ
	HICQdXcFTS0IQoNJTHGp2nvMx6m7GO4c48ix8u9lBgaVlbRdlv5c7s9nlj7zgEsxj1Sg7FFwapY
	IX8eClcSa5qs0LnIKw8sK5SPPwbudi3UpjfL8mpX8IYFnMvpYXsnDtujluEq2FRlV5jDIWaR1VC
	2JO0rEL4D5F+/F+7XceoU/CHn9u8BU2m7r8N4GRXTFUiTg==
X-Received: by 2002:a17:903:13cf:b0:2d0:8b28:51ab with SMTP id
 d9443c01a7336-2d3b0c312d5mr403824875ad.7.1787061409719; Tue, 18 Aug 2026
 06:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Tue, 18 Aug 2026 10:56:38 -0300
X-Gm-Features: AcwNN1VznzM5CCWcCs0Y30OU_MYyl-E94nd1VkO4uU6WaHfK8m3sghxCWn5dnJ0
Message-ID: <CAKKBm2sgXvwMdT45Se-57VEJpp01ro5wNenOCyu67UkHhE4_pw@mail.gmail.com>
Subject: =?UTF-8?Q?Subject=3A=C2=A0Dashboard_Updates=3A_UX_improvements_and_Ing?=
	=?UTF-8?Q?ester_Robustness=2E?=
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello KernelCI community,

We have deployed a few updates and fixes to the dashboard. You can
check out the live site here: https://dashboard.kernelci.org.

UX

 =E2=80=A2 The Issues table now defaults to sorting by First seen, newest f=
irst.

 =E2=80=A2 Sort order is now saved in the URL across all listing tables
(issues, builds, boots, tests, hardware, trees), so links you share or
bookmark open with the same sorting applied.

 =E2=80=A2 Clicking a column header repeatedly no longer drops back to an
unsorted state. The tree listing still keeps pinned trees (mainline,
next, stable) on top when no column sort is active, and switching
detail tabs clears stale sort params.


 TREE DETAILS/TESTS

 =E2=80=A2 The tests table uses a single unified hierarchical layout instea=
d
of nested subtable.
Expanded groups share one header, single-item paths collapse
automatically, and there are Expand all / Collapse all / Disable
grouping controls.

 =E2=80=A2 Test pages without a meaningful status history now show a clear
message instead of a long spinner that eventually fails.

BACKEND

 =E2=80=A2 All production HTTP requests now use explicit timeouts, so a hun=
g
remote call can no longer stall the ingester indefinitely.

 =E2=80=A2 The ingester now exits with an error when all workers die with w=
ork
still queued, instead of waiting forever.

 =E2=80=A2 Backend dependencies were updated, including switching kcidb-io =
to
the published PyPI version.

Best,
Alan Peixinho
KCI Dashboard Team
