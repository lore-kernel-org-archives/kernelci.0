Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014893438B6
	for <kernelci@lists.linux.dev>; Sat, 23 May 2026 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779547696; cv=pass; b=f7e9yO+BibDjfMVjPgZz/4ARdJ5zdV601rhgjIgXueUxxP/rpyEpX+L5MeXdujXZO4HJishe4WQaSQKDp9yBkXFTXGq36TkJKVury+HdeCsPZm/aUF688sOdEAICo4M7anXlpdta6+/o57ScPUmNNXNV+tOFWiyZi5BoFcbGiDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779547696; c=relaxed/simple;
	bh=vUhiKdySh9i/AizhQcHXGw5yVjN0TU+UNgFlA7e5OJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDc0Iv/EYaxudjNDLeT0yR744CZ08F10z9up3Bn8/aWFgdeqFM8IPbCAjdz6fI01vx3oxyQta6BM1uoaacPA+zutkvvVqUZ/NlWa7hiURK413nmH1yTReL+bI0IYuP8f098yTNIycWPO20xMBUmC+N9G1hJALB74sbchGIDMjcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QiKT/vA8; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QiKT/vA8"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c37eafcbeso8713567d50.1
        for <kernelci@lists.linux.dev>; Sat, 23 May 2026 07:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779547694; cv=none;
        d=google.com; s=arc-20240605;
        b=J9xvS2U3SirKnuPHaBImTovkjrTQOsKTDl7P2C42taiRPnm6CwF4caLUedI+xtpqM+
         VG5rn3hNzUvpzTy9ScMzn7t0vNApM+qc5KvbaRuAa3QKAiEMLlyv8TYYrdIzX0ZxZCz2
         qmMNpqk0PsVl8TQGTvvxwNmqmCy1TIhcLrj9kjN7heBgy9e9fnOuh5r96vONnEm4aQvj
         gKuz2b886s3ubRkLMnII7VvmUtOSfXEbm+GFpGwvSkgHFtwGoP2W7cVxcLh6umGUGyhF
         0rn35MTdkoHogHcqjepUIfa21+7Xfl7gqRP1lkm1hJ6hnFjm3KQWoT45b9XYKTcwlHna
         FGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUhiKdySh9i/AizhQcHXGw5yVjN0TU+UNgFlA7e5OJs=;
        fh=FyYv4mk07hA8ZXv1kI7/KkyYBsyOl07IIACFTE50GJI=;
        b=FuEjhMoVW7lyMXXwbdmBhJG64fA5PjMYyjvKstf1cPMnwXz050QIAC58zI3yuQV39N
         v4XHugiGMMGrC3+KKynh+TRHckkYUL8FIdTqAUHRpmx3Zo8I21UKZNhg/bGUIdhVLuoE
         OjMqBVun90xd59iXeWRnGH/cHogroqVOLMGrj43Gn9nAWt+QqdD7n4l9sxhFxw0OHm+v
         KE8gX55QTNO5GES1W6JLDUaW/QZBxnzYL0rY4mtoPDabg/SC+NCpatl09h0vhnv1WVMD
         e4AoW7lktwCiYoquLMGQltAKDdnqCP+UMXX4F+zU1WTu1hOzcTqOtLjKWzgOUYD8IZoY
         8MHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779547694; x=1780152494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUhiKdySh9i/AizhQcHXGw5yVjN0TU+UNgFlA7e5OJs=;
        b=QiKT/vA8cSwH+zyxFsqPciZPlZu8v1UDi1raW+GdMvEw/1Xj7/dalJFne0THs2WxGo
         xPB5Ko5Du3/LTRmTOE/2fKxsrDBtNUhkSr3+BL8tJ/duhYiLepFbtKoqJGx3n+yjCXkS
         IFVJYH+5MixpL6ABv9nmY6JDShaEYNssby9TREjAEkJVSvv6CUYT9E25Lv2+KoId5rGW
         FFeABiaNwrgOCh29IpZ0+pRsYZlkFHXWAFsvxkRW9aL6UM220CZ6a9oW2f6RKuAtHArb
         U9vCM/NDLCWOnrsu6yUBsE463erig5GBpaiNNtoZaRDNe7SBTEMikcmAxQ5jtPyFe2X0
         PbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779547694; x=1780152494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUhiKdySh9i/AizhQcHXGw5yVjN0TU+UNgFlA7e5OJs=;
        b=iTvdOK1nalBxxl5hi/V15Tj08jZPk8V+kTMpxSH5wWMLEwf50VIw5rkJvUqnV65Kg1
         k3Uq3K0FOjfa4uJBQxPIFUP14v4OzQ9vryLcr1IG3Lqov+W9qjPT6RTIGRFJX+FZKxcF
         9AuVNGrzqBkOI70CUmeDxGhuBYwVnvl5Z+igZ+YxPVcwn9mtHPSsXRJ14xBb84sFF77X
         fwxG7ibT84HP4qAjTZctBzsB2/QV/fT1Nkagy+1om6PIQWshuXW1kBhF6YxiROI7uapL
         mht42CjIlhiPmRu2b9bj0WhAcvNoK4fIL12/7MDbMI2FEN89Q6OCPHJ6Z+hBZ47CZQtz
         Tb+Q==
X-Gm-Message-State: AOJu0YyO/rb2OeUdAMMTFcL7Zb0pGPX1k5db45Xw6ds1YMH55DkSHmYV
	DIyafE2krrWZvGTPTbWXe7XWTZZDGargESDr+UUAhCObIZ2f7EKSUCPBj4PzoEumJx7ioe+NvIn
	N+P3q9Lri8zuyoUSPlzoi8lciXftpEwUA4iudxSkWcw==
X-Gm-Gg: Acq92OG9JIjelZszy9qDz7NKVbPJkogpFL4JEZ1cXKG0gSgZXPcj2dsyGNDyRsVO7x2
	4Scbuzxvb3zICp6pD/k3pDEnLIAGnw+WQw6zGH103ZbMYF31neJn6DfHhj0SaGAsWeTRr4pnexf
	DwpNF+VB8LCs8a1mnnnhenqeAN6IddbSCiCWXjea5eFCj1P7Us3QY5B5AY4bww26CYxD07u2pxr
	dfpsCkhCO4cagnzUecmGkzLzdAt1P7ihmr4OJkM9gMCmuEKBPKlLx9lb0VPPXbDAmlXc99q+zjU
	Kw2bYyzJB3go/+lkrtCP9a/ElwELhLmTyI7XBEEdfLmpqej2eIQSz/8zs2faC2a7vpBO+iA=
X-Received: by 2002:a05:690e:251a:20b0:651:c160:1c06 with SMTP id
 956f58d0204a3-65ec9a1ec26mr6345100d50.58.1779547694007; Sat, 23 May 2026
 07:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEev2e-Rc=hhieAWmM59jAyNLc-o_ZVA27UQG=YkcbZAEnXYFg@mail.gmail.com>
 <CAL0q8a7BAV7KgM2K4ii21qFXrhKieyJsM2wG7_Y=p459ec10jQ@mail.gmail.com>
In-Reply-To: <CAL0q8a7BAV7KgM2K4ii21qFXrhKieyJsM2wG7_Y=p459ec10jQ@mail.gmail.com>
From: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Date: Sat, 23 May 2026 09:48:03 -0500
X-Gm-Features: AVHnY4I30ztec229B2EeNcvh8QJMrQ4aeEuseRc1LsQ7mQcr-zDHeJ1bPRv6YGM
Message-ID: <CAEev2e_bLhfSAjq3Jwwfqy2bXhgNQ6Dygu=zSHqw39U1taTUEg@mail.gmail.com>
Subject: Re: trixie riscv64 rootfs builds for kselftest
To: Ben Copeland <ben.copeland@linaro.org>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Sat, May 23, 2026 at 2:22=E2=80=AFAM Ben Copeland <ben.copeland@linaro.o=
rg> wrote:
>
> Hello Anirudh,
>
> Thanks for the email. I have opened a PR at
> https://github.com/kernelci/kernelci-core/pull/3102 to add it here.
>
> I tested it locally. If you want to give it a try beforehand, I can
> send it over; it'll appear in the next production release.

Looks good. If you have the built assets somewhere, please share them.
I will try it out.

>
> Regards
>
> Ben
