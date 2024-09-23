Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DDC7DA95
	for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089648; cv=none; b=YFf1eMj+rUS55m49cJ+vZHyaNdieMol7pWIzUlqoJljz+Zx4RuwpUQ4zZHKAwqsIiKw1YM0W1PhWi5ZUu20/hxMUrQ011C2QNExE2/Cr4DuxKP5UfonTcl9ss8pWQME68sbHwc6+NkqpSESw8dt8kDhYK5YBdOjDCktNJfxwKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089648; c=relaxed/simple;
	bh=oi5EljUYeaAqczSgAUsCd+ZDFmFgE9iMitP/mERI3io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJvnm3pSEQmQjWw9BePbpKCiMF3IuzHLxAnOFdrIvts3Tz6cwH5O7EBxTX8/PyZZIeC/NpHOjSEUJLwnW3tpMNfX9H8yWn94PsG9X6PME3npd4JR7fMHtHAIIGNBVj6MgS1R4HminmzAdi9oyz6lsNnhneEl82ydoiyodoUdoq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJmMGjd2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJmMGjd2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so35591925e9.3
        for <kernelci@lists.linux.dev>; Mon, 23 Sep 2024 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727089645; x=1727694445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oi5EljUYeaAqczSgAUsCd+ZDFmFgE9iMitP/mERI3io=;
        b=XJmMGjd2i4L+ahVIulWc6QAlQyp7nu2BRS/a5nJoP3aZF4gzuaLbYky2ysuFWMBzAS
         YWxXlKpRTUg7fvcjoec9TYBeFNZKDW2HRqBynd0A2FABmuKR6CDdrQ2DtWzAFWzJs9Vj
         BpcvJPj+bVkrqaxzAHcz7UGmSqeKd9cn73BDgyjErEmzfnD8B4a5l+sOBrZaWDHKcOCU
         +lHnanaAbV2Q+H8Cqbvv+gEdoXYLBXOiz1qVMA/h6y9kkgzekooKXhY7o5GOSk0c+O40
         6PzOg3m74Gu1/IQKwQW471Ct1ceNk/E9dGrGqaS+1YQKeLYlPEa6r+IUMyqDLd7QwcgL
         fEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089645; x=1727694445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi5EljUYeaAqczSgAUsCd+ZDFmFgE9iMitP/mERI3io=;
        b=UwWOPBYLjxcRQOeyPDaU2jkIv9ocJFJ2QGiXZbD0tN3EtMKVTdA4dnxYLdnrra80Gh
         u+/Yr9JwFE9Zf6koRc3MrQ78k9bqr5kRHh4wcQiUxA7y+faUuwC3jXo+Q7pMMnwBDD1Y
         vz9O6uKRqjbpJBElA8gS6G5+MGBLJqc6113XQ+82oQyNggWngpCuKLN2nTWCXulhQCcQ
         1BNIrnMrhVPzhFejep5i7CUVV7LPAHJ1Y+UPo9rCpyJV2sqy4dGC8SFTsXMTy+WeCZ7c
         Xlw3qwUFtuTs1hQdBtRVcb/OxPxglIGtsP8bziD/hzl/UVDfABFfx5FhXVMrRzk89iPL
         d9tw==
X-Gm-Message-State: AOJu0Yyj3GCtt+Ph5gAFt97NgYXhiC/ipHNZ8rERlwgtGib8Q28aHSej
	vCZkdh9x/X8A9dvGsAiyjZystAMpRP/fK0/oPqHzAElmohg/oCqoEOEOxQ==
X-Google-Smtp-Source: AGHT+IGfNDtLEitLzPv91QGovnGshViyCvdJM9a88J8q5S5SDnK8Vj0iAWPcx69GFtTzrFtzgN5Ztg==
X-Received: by 2002:a05:600c:4ed0:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-42e7abeda5amr89527355e9.8.1727089645009;
        Mon, 23 Sep 2024 04:07:25 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd7490sm98038175e9.28.2024.09.23.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 04:07:24 -0700 (PDT)
Date: Mon, 23 Sep 2024 13:07:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@lists.linux.dev, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: KernelCI DB credentials
Message-ID: <yr6tydus6dyx7dqucalkwhesck4rh7ibxqyiwt7pah4njk352h@prinuovf2ddf>
References: <gw7roxtasg6njfj7xzhgglbbomwuy7ipintlzd2iojpsvlflpp@6vj4aqcoekst>
 <60b94fd6-b185-428e-8ce2-c1c1a2b5a4d9@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t4qlwxlttvsp3poz"
Content-Disposition: inline
In-Reply-To: <60b94fd6-b185-428e-8ce2-c1c1a2b5a4d9@redhat.com>


--t4qlwxlttvsp3poz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 01:44:33PM GMT, Nikolai Kondrashov wrote:
> Hi Thierry,
>=20
> On 9/23/24 1:07 PM, Thierry Reding wrote:
> > Hi everyone,
> >=20
> > I've been looking into ways to contribute the test results from our
> > internal Tegra test farms to the KernelCI DB. Following the process
> > outlined in the documentation, I'd like to request submission
> > credentials.
> >=20
> > We usually run build and boot tests on various Tegra-based boards on
> > linux-next and various stable and mainline builds. In addition, some
> > sanity testing beyond just booting is also performed, such as boot log
> > analysis and several system-specific tests.
>=20
> Awesome!
>=20
> As long as the kernel and test sources you're running are open, you can s=
end
> any kernel build and test results.
>=20
> > Initially these would be manually submitted, but once this process is
> > mature enough we may want to set up our system to automatically send.
> > Can we reuse one set of credentials for both or is it better to request
> > separate credentials at that time?
>=20
> Sure, you can use the same credentials!
>=20
> I just sent them to you. I gave you access to submit to playground for no=
w, so
> you can figure out how it works. Once you're ready I'll add the production
> permissions.

Excellent, thank you!

Thierry

--t4qlwxlttvsp3poz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbxS+oACgkQ3SOs138+
s6HWog//fnhmEjxOnncuwmcu94dqDUALEoSn6euXHjDIihMbMRhjOcmqR2F8Y8qK
MQsQRHANOqFD8mKFKTQMFBEKFIJ+3RSnQaEnkDdqXBIIuCggrtlkYvafSL7+1a+b
af+MemGbD1jy/jP4JB6QyFbBKEH8ZO8IUurzfOQXKp4mLllR5Q+QfJ/yairMjf/q
EzBDTCiak1Y6W/TgpGTf1z3aCa+IsJZP2WfEW7kgP3kV4IEba8uQuBlNY/77uNGi
KorpLl7NW/vY/fFbdXWZgDygQdbmZR+G3hdu8GQm7j5DFS7fFhwDeuMC751PzKeY
Q7cUD95RX6pdhACS46Uj4VaOfkllxvBiBW1uyFLg6BlGQHPk89/lH5PP7IPDG86/
5HqnFrSiPeBDuo29TBmCiCt0BBY1V0WoWXhEYG4N0qiK3Uid/BsjdNaBwBXQQHNC
2Z84wVEKpElkkboKNSB/IMrvyh+IHHVBH8XPFuDTNgm0l2hkz8p2KibfeaS7qq/N
ERT4YRrqVuTtJaBUGBrnIOZXmziMJJ2LWw40iAyT9SeYDyhRrsOrwseqSUfzGZjo
0LjFyzV3Wmb13RGBIM/a3wATRm2YBH6jd3I4VOsG1bTgvJ6/xyt0vc1IiQqq6hyd
C3TYKPls4uOPmDZjcIow+SDM6YWzwnW2awYmSTzZBFR9Gno1HSE=
=rNlp
-----END PGP SIGNATURE-----

--t4qlwxlttvsp3poz--
