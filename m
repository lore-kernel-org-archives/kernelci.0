Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA0F4E4C51
	for <kernelci@lists.linux.dev>; Mon, 28 Sep 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618317; cv=pass; b=gH1ayHGAnxuZus+rKBLxlj4HnUg2FZet9mQWGt75Dlf6jAP3A4KYXvv0N5/glJpKDrag7vH98BePHEj6aKsyxMLwNK6u95V4Wvrd1QuZzbK2GjN/NTFxYDRT8CI7XOyjG2jQ9Ylg/URVRKhYZnhcXBZJ3m8VJ3aSYFVqUyooxFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618317; c=relaxed/simple;
	bh=ffqDkQI3xrQxfyHfeBZ1jqK0ThvwDLQ7qKnNR0CR8MU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XA/wJdTnehYhmYOzi+Ypd49Iuj3OT1h2Fu4pWYNjb3hdbxHVXREXrX3Ioz9o0Y4ieUHYUjEi8jbeuLzmAhTzE7S8BgsS1X1xUWL7m1wZk74Rbzfp6k5s8pexEL/Fy5vfC58ynWTkvRQJtKhf8mUFBIARS30qfHfBC7MALCCcjpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=QaH7C/5q; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="QaH7C/5q"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2da4eea067so265409666b.3
        for <kernelci@lists.linux.dev>; Mon, 28 Sep 2026 10:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618314; cv=none;
        d=google.com; s=arc-20260327;
        b=p4wsGEbgdIho6sJpIO/EhTHy6yeEuEGwIIESL2XAjAzw0tgfjrGAPlnw5+VzJbLBYF
         z6lTB+igXHIknSoQDyOPDn527fKLnV2z0rLuI81cy6HoPDw1FH+bamF5vT5CtLjlIHZL
         2Up/n+2OmOpm7CiNNv5+XWYG/baPm2tNUVY1VPhECKFlBtjjDsQvUJEh4Dpxw8NfBPrE
         xItRjh9ikKuc9HLSqsIhxIKFZSoiujDoxNeAASxCdFH3g5R8iOWztYqio6u1QLoN4TuD
         ePebDvYUYGUrBCAiuVgbMqeB4Vm50c1hiSeyvbOmsgV0TMnJ+OXLEounF3rW7l8GUJGd
         HrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ffqDkQI3xrQxfyHfeBZ1jqK0ThvwDLQ7qKnNR0CR8MU=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=V24QALOu1l1sdRCFcPs+F7i9XlFcNGfjdHXO0cxLjZf+IsQYHL+ffzPGj3crDLrBAQ
         vNGyaSMdo/IWFNDQIGoGa70NZDxCErLaz+LdEYex3PdMat2+Zp6/9MjiDp7OfIbSTLEc
         DZ9/Y8DC+s3+6C7hsuZ1uVLKy97n4zFejEX+mQ9cFhYGY5XcXAYE3ugacq+80f/OPQlk
         XiplucVgf4NeGzFnvNaKi9Np8paq0lY1PYcBULZDagG2UsYhJyW39N5mCOE3uJNERCpn
         otq5ZYjFuR15Z1FsPGFgJnwBR2TXQomBjN9j3okrkHzTRAH+Waq63204n/a4SAezhy/L
         3CkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1790618314; x=1791223114; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ffqDkQI3xrQxfyHfeBZ1jqK0ThvwDLQ7qKnNR0CR8MU=;
        b=QaH7C/5q67CYOwfgulo7KD+GuyxcYnDOoPJGRkPbgyfJiTcKto52lTRtHM77JIqmrW
         uFseyuKp1FTw+I2zmLmnnwMN6yPSEnLw2FvZ7T4K7CIj/q5ZccBBkrMPFTU+WIEe7091
         zutKwEm162SyqpmS+kOEgyLNspQVndnWbRMYFocMGgBCM/KBbx4z07xhBp/NGDEXt4jX
         +cm+Qb4CB+1v/3uTvdZKhhQxL5YHbQKZObPZfP1ZsBWWXB4qOcP8ysT2gsIlb1EDDkZF
         19lfhRDwve77v5TMTf1rVq5lLv6V+cDWYvKiV0jNEuHjPxxVhxxyVATmtKxVs4wlgQ0F
         x4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618314; x=1791223114;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffqDkQI3xrQxfyHfeBZ1jqK0ThvwDLQ7qKnNR0CR8MU=;
        b=RgajE9Q7GVQkIJNME0u0Maa1e26UJqWTplRwlz2qREMZXN3ee5U9f/dcpkTN9Z1cHJ
         gVUSP9fWc3BX8wKBzO1g1peVtJZKVqDSeRpoUfqLsD1JZYdLkwXb/3a9cRDeLmPdmi+v
         KKpMX6n8+tfMMZG8ONCfjen1Tt0JwsAwFarvFJT2CqUwM1yUlKC17+AcuqUAkXsxIQj1
         GEAGGp6e/9Rz4kMHNbcsP2tFS+hU6TWApGPefGtp+VQy6ilXUpggus+RU2p2h5hKWKHt
         zzA2eNJQrkl1LAjroYPxBWJA4JQ05hI1S48haBzVp84az/CjtlynXHPH01/WP5DgdKJ1
         7K9Q==
X-Gm-Message-State: AFuF++nI2hDOlI47W9CctDsbtf1/TG2sZahwert5rih5CGjpMuiIP/ru
	ieJVov1HO4FMZhI5Zrnz+bms0extj+tPBksfRcUBf7XlKB2cWWKuXZDd2VHr70e2rqA1Rw0jbIv
	fyPNRwVi83MkZEpRuKFY9BU6LkrZNrpnNz4KDX/kX1QSZr+sar8RTEzk=
X-Gm-Gg: AYBFou1jQvl939RsZN1Ue4f6AK9PlyA0RgEsRRAII2gDUg8gO2qVaRoPog2Xv6O8SfH
	ZHYIoja8kQch71mbkc2tPWWkGgqc3m4TY4Ohkidlb6aCFH7tSvIAm47UH5L52c4OiN8AtkUXqbg
	LtT9IXRXYjGoexaCw8Oy9egD4W/DlA65K32+gkgQVn0kQhAIgfWeRqhqN34Dzxe7kn37navj7kd
	MefTcfLiqbf5XffFZNAVqMU8/bphiNEhLY/TQ1aLfrAj6F7jhDFgNFon8m7vvpMFkDoMrAAvEEg
	7Qvp1rUrvsCy6Gq32Wptp/ghSvF6c6gR/z+PAfln30pZvqlL5tWzzKBK7ZGvzFAF7ocXmJucuQP
	A+jolq58gpDAC
X-Received: by 2002:a17:907:970f:b0:c29:d31f:7d7a with SMTP id
 a640c23a62f3a-c2ac52c828cmr1108564666b.21.1790618313755; Mon, 28 Sep 2026
 10:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Felipe Bergamin <felipebergamin@profusion.mobi>
Date: Mon, 28 Sep 2026 14:58:22 -0300
X-Gm-Features: AclHuK88dszSZq5_1jbz3lfmVqNDbhrHnjAFtc_WkuL88ZAXiRLFG9invTRn3d0
Message-ID: <CACcoU0HDd76vJqTW2vvSDOZh7vVtetpewZCuv-QPgu2AiwJB=g@mail.gmail.com>
Subject: KernelCI Dashboard release
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We have just deployed a new version of the KernelCI Dashboard. Here
are the main changes:

- A/B comparison: clicking a build or test row now opens a
side-by-side details view, where you can inspect and compare logs from
both revisions. You can also navigate between the currently filtered
or searched results directly from the details view.

- Status filters: build, boot, and test tables now support selecting
multiple statuses at once, making it easier to narrow down results to
the combinations you are interested in.

- Log viewer: failure and error highlighting has been refined to
reduce false positives.

- Hardware pages: Hardware Details URLs no longer require explicit
start/end timestamps. The Dashboard now derives a consistent time
window automatically, which also makes these URLs simpler to share.

- kci-dev commands: the Dashboard's kci-dev command generator has been
updated, making it easier to reproduce or investigate results using
the CLI. (Thanks to @aliceinwire for this contribution)

Several smaller fixes and improvements were also made to the backend
and development process.

Feedback is very welcome. If you run into any issues or have
suggestions for how the Dashboard could better support your workflow,
please let us know.

https://dashboard.kernelci.org/

Best regards,
Felipe Bergamin
ProFUSION - KernelCI Dashboard Team
