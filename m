Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2943EF0A8
	for <kernelci@lists.linux.dev>; Wed, 21 Jan 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025677; cv=pass; b=kwqph5il3M6qdwRVSx1CUVakfNmQZX+Ebvefs312rIXJJ42sob98g5pfyrvUVTd7BjvdwwQsMxsa+QVV4uGwHD4j4tGRQmYm3vs1UXqIh8l+AcyM4MaEGmoyMRzgKoIq3O1RLk62s/v9CAzal4g99XhW13S6zzaDcy/sCNjT0Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025677; c=relaxed/simple;
	bh=H6krQahn2NqfYTeX3GSkJQfuMDWfMAySAobEUbNO9QY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r1DJgaX+xT6fw+sm6lMvzAeAxYwiRHOVu3vmwFMLAE/aJT0mP7qclfCDBT03XQN1P0bD28E0RSlcbR7KGxCBfkZCfJFyMKNzkdFRUd/ebDZEfggoY5xSkg3nIk0b2EPh9GSMxjRqdKIn+/14qE0Q/Ju0+uoZOKSj2iq1dzrB/Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=abmKD9G2; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="abmKD9G2"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bde0f62464cso52356a12.2
        for <kernelci@lists.linux.dev>; Wed, 21 Jan 2026 12:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769025673; cv=none;
        d=google.com; s=arc-20240605;
        b=g/Eoksffr5GX6KSuBUvRHTudCAaU1oz94XdghpDJW84q4MszO1UU259v3LoMk2v155
         hyHgvB3enfbjdONWtaI56vjM+ZGvS9wx4AMoG++p9BeomWemRs5iiIw098vlhtzHsifT
         dfxfjsr3Nhsy6mRzteUSp+4J2udrEXaczkuXhk2g46vKe14i2MRTr46DJEsldiJPo9eg
         D+GhJo+3yJqHWglrVAa3qH1ZSTcq3O9jq3eE19VqZ9YWHXkyAIpsKkBS7rFt2Sd9Vzcq
         Ew8iV5LSNn0oTy3eiOHi43M2CNqdFrd4ytyD7F4ojLaSgKivTcyzz/5ITA4su2XU22jF
         3hBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=H6krQahn2NqfYTeX3GSkJQfuMDWfMAySAobEUbNO9QY=;
        fh=iE0vmLwB6/kNrV5nreBoAlr+nMoMNEJT8UrOo+5ZA4A=;
        b=Rn52sFZ3UV4jU+3z+ahmlin/0ebQ2zUq5nWqmq2N9K/rQdXF+e5SDC7x+vg6JnwFvD
         G2uCX8y+vB8+eYYWA/ZnAqB/FiXaiCMh0Ld4eFNvQbVT82J2ecn0h98kaqt42AkFnwrq
         XH4w8EWA2+ra3IPk+EenbwMfnBLHxmHclQQ8+QafMqVis9xWRnw/EJzArvpROyqMR1tU
         PBr+yGNfYU9DQZVx+sryyEWoBmz5mbc+lyN6n4PToOYAgKu6qjgp/ZfyyKkE2FslhZEG
         HymN5QiYbpwyyF5uzB8kh85Zg1J7jrbQpFFCuL/SF+N33r+epvLtyznZGxX/K4v6kTCb
         Ep5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1769025673; x=1769630473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6krQahn2NqfYTeX3GSkJQfuMDWfMAySAobEUbNO9QY=;
        b=abmKD9G2q7LlLl7wEJgB2B9qj+TYfyLTowy8dsviBcK7VnnQA7HUa3GgESOIhOGXBI
         OK3d/7qi653l/JGaOQIGV6pSzg2WlfbXWZNsauAQYKvI2deWeWVA5/ng9kMGe6iugH0j
         5AEEPsIxq2+MtkTqeX21u/3yGcKMictp5ZbJvCbnrBh4vqKXIg7+TNzrzuybPwM+XKgJ
         kwdzcjjdEJz5QndFS3blzxmhf0YXCuR+V7uJAHj06Wj10ORr1/qoPQ9yCL7GLt+h7iRt
         XNC/2ROrSd/fM3ew3L8stu8Gt+cZUgzBUYXXChdoOEy59aTIayYXKprg+DTKLqZwVmEz
         COTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769025673; x=1769630473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6krQahn2NqfYTeX3GSkJQfuMDWfMAySAobEUbNO9QY=;
        b=hEYhdmHQR32ml35xdkiqeLejVmSR4MNDe6D0fvVe+h8lUcsFox6BUOb7Ky2qPEM7nm
         aviRyp0QgqxeoDjYTXFOnFmRr3sXi7Wue0qjT1Dj/H0/RhAUF6V/BM/rMWh4wgDg1juE
         Z4gFgSkE492ZIoXFZyiRU++RgGAmz1i+WhWT/bwAKzReAgbZM9z9U4QxBI+Sh+xoTvNe
         D70+tAJk5rxJqXenUFJuT1Nqydl2K4f+X8O1MP6xnAaHPcP5oGhW8twjlYvn7HISclC0
         kkrY944HzQUsoxVb8tzNLrUanFyms605PNayMdK2xAdbE/aPyLbIq2EjUivw7fgQrSek
         wHlg==
X-Gm-Message-State: AOJu0YzOsm/APG8JRXEWZr8ZHhSzzpF9ry48DFOvdZrHbIKoTVvGqGet
	kToR+v7enEtMbVGunGP8R041TrRaLFUKmiitnhFkYvXiFFPzhloOUOdXvbWqeT1jxF7RYB9Cp/6
	e9eYV9iXfjgbzdumFVPFKTHuY3LuimspHy/2Z8bDEjKAqx9VvozO8GehDtQ==
X-Gm-Gg: AZuq6aKPIup4QMFRafOV0bCXej/1En5JRUNUkpNXrl9l/KVE5NVmh0DdYxAt33dUpIB
	I+IbcZlLTTByYHUSMLI7P4SlxffwAoTBK3JLPzHDOQi1bN7HPWT2kPltm+eYg8zZwG7f6fRQoYU
	CJAvliseTm8tJUNw9ITXwGR2uffGzG5ihP7VieTgkF533LcFArvGpTiQDlMMeK4UxqVuBYpdLuj
	nCZxzrFumS13BcuMetrvNBqPIqFFZzFGXbFqcfZnxewxJrdUVgJVNXL3igS+R6v1fNieducGQ==
X-Received: by 2002:a17:90b:390b:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-3527327df5cmr16044988a91.34.1769025672911; Wed, 21 Jan 2026
 12:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Wed, 21 Jan 2026 17:01:00 -0300
X-Gm-Features: AZwV_Qg_Ssh3rBtsfNMJ_WyDhvF8K5mrgNiNAxf5dKHI3adNlJai9i66ILBV8Gw
Message-ID: <CAB31pV=H5Hxe+jFoMf5pM7aZKJpT0DC3vF=g6ys_TL_K8gVNdA@mail.gmail.com>
Subject: KernelCI Dashboard Report - Jan 05 - Jan 16, 2026
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Over the last two weeks we focused on improving the ingester's
execution model, fixing a couple of backend query/helper edge cases
affecting tree listing and hardware details, and strengthening overall
quality by adding E2E testing infrastructure and additional backend
unit tests.

We also worked on a document to structure/suggest some improvements on
the dashboard, it can be checked here:
https://docs.google.com/document/d/1TPQ-rKCvKF5PR25-zq4PCTqjTPXRTdQKVgBzyue=
PRpo/edit?usp=3Dsharing

## Ingester

- Refactored the ingester to use processes in a =E2=80=9Cfan-out=E2=80=9D p=
attern. [1]

## Backend

- Fixed a SQLite query issue affecting tree listing. [2]
- Fixed hardware details lab handling when misc is None. [3]

## Testing / Quality

- Added Playwright E2E testing infrastructure (tree listing coverage,
selectors, docs, config). [4]
- Added unit tests for HardwareDetailsBootsView. [5]
- Added unit tests for HardwareView. [6]

## References

[1] - https://github.com/kernelci/dashboard/pull/1672
[2] - https://github.com/kernelci/dashboard/pull/1686
[3] - https://github.com/kernelci/dashboard/pull/1688
[4] - https://github.com/kernelci/dashboard/pull/1674
[5] - https://github.com/kernelci/dashboard/pull/1694
[6] - https://github.com/kernelci/dashboard/pull/1697
