Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C487B1B86CC
	for <kernelci@lists.linux.dev>; Tue,  9 Jul 2024 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546737; cv=none; b=WFBcliwwiAAHddPjqt21sEBwgzY0TFU8zh3RHGsqjkqgmlwkyHcSkWUrlvsIVcdPC91vBXjoqN4wslaGc7SEakq2oEQNF0jUyLG/Xy2H2COiArsXiK9HyHlstildJDM80f6bGaIk0aD5Ytyh4NDS9BAzNzHG4ppBo+5iMx4Bpf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546737; c=relaxed/simple;
	bh=uAJ8XqTvIDdKRbySvXP/jP9aGrJTDGt0YVLT+O4jvlY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VheaFr1wSMMQCtRnkZLCdfK6qSMq3xBF5dMcQr2Nzebmeo+5U5FoGE6+RCV3S566TsuPybXIsdTx6zaNZOnMaEqeCkjZDuGkFMFbNbIqd2KQMB8/cza2l2H67PSbdna69jfP0ranHmWxqYdandzFIKV/zE4Y9As70/2AHs7rpfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DwrkhljZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DwrkhljZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720546734;
	bh=uAJ8XqTvIDdKRbySvXP/jP9aGrJTDGt0YVLT+O4jvlY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DwrkhljZSLM+khT3Rpaex9TzKSw++BxuNrn1MzgpISfRwrTEXnAXCeb8qKfPlH+VG
	 bN8nWKHCbsZQOULTbH1Fun7juMO0+gqwEJxgUKzZzIJHVuV/Q//ZdPvbsuP3TRVlSb
	 /ml9MAq36Oe7GfYzq7HjxkV/wtCwMZ10Z9qZmnZpUcXVpTTg1Ek+VhR5lmKdf8DP+e
	 nv7Rwa/gVQzzoK7lLvbDE3m6mYd18m3+6vcHSWsFHzF2/dHFxjv6XxQURwqkKWJFRz
	 O7Kp/rw71z540vEBV1hIl1GDfodobp1ooZ9OrH1eATI/h9HIez+nE/pcvZ9btJ3/HI
	 wHTSocKkaqB7g==
Received: from [100.113.176.132] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4547A378107C;
	Tue,  9 Jul 2024 17:38:53 +0000 (UTC)
Message-ID: <01c856716324fd101de893554683c10db35db47e.camel@collabora.com>
Subject: Re: new branch + more recent gcc?
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, Muhammad Usama Anjum
	 <usama.anjum@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev, Viktor
	Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>
Date: Tue, 09 Jul 2024 20:38:51 +0300
In-Reply-To: <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
References: <962098da-8dfe-8a77-169d-ac1b2902b8b8@collabora.com>
	 <CAHRSSEzH+PF92DrbPXKPwpaoqEPhh1hWKL8vio9Ou_-ejcb0Bg@mail.gmail.com>
	 <CAHRSSEyp35+k4v-ak1qp0vvUOWJjTnJkWhOtCO5MCS++zL2u6w@mail.gmail.com>
	 <CAHRSSEwYk1oGmJEn5xvB91GKSmaJ_ku5D7hvbS00Jb9-piUbOQ@mail.gmail.com>
	 <a5fef4b96be3c80aff75eb3b20e1edc90e8bfe42.camel@collabora.com>
	 <CAHRSSEzfXJU=GcyC_HfUUnNQdyjT8S68HqhN1bdaB6NE0TPGsA@mail.gmail.com>
	 <961641f4-e0ed-48da-8336-186e3b8d23ea@collabora.com>
	 <CAHRSSEx+1=8N6wEDFwiXoR61q+oX-r9tGXJjJ6vtzJ4y21c1uA@mail.gmail.com>
	 <CAHRSSEwO4M0KKwdVEwjBDQ4vjMrWcHYKUVX7f4D9P9wTe2LTUQ@mail.gmail.com>
	 <CAHRSSExXLEaz9GpnBXGE383Rq_rzgxFjWqnsxX_fRGkj4848fA@mail.gmail.com>
	 <bb6b9aba-04d4-4b36-a556-d52f44b12ed6@sirena.org.uk>
	 <CAHRSSEypz9tgdeaFSXvVr=KZZdg=XY32zDkWT-dYi7N3z8Hh3w@mail.gmail.com>
	 <95e1943a-d534-4ce4-ba3b-285a52684420@collabora.com>
	 <CAHRSSEzRE2ZXui+uiq=eZvDRcdkjo2cKK7qO4nUTEFOo2cz15Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I am investigating cause, likely one of cross-compiler images is broken
and blocking k8s queue. It is likely will be fixed within few hours and
few more needed to clean the queue.

Sorry for the hiccup.

On Tue, 2024-07-09 at 10:02 -0700, Todd Kjos wrote:
> Something isn't right. We've dropped from about 35 builds per android
> kernel branch down to only 1-5 builds. Can we get all those other
> builds back?
>=20
> See https://linux.kernelci.org/job/android/
>=20
>=20
> On Wed, Jul 3, 2024 at 11:09=E2=80=AFPM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
> >=20
> > On 7/2/24 8:45 PM, Todd Kjos wrote:
> > > On Tue, Jul 2, 2024 at 6:12=E2=80=AFAM Mark Brown <broonie@kernel.org=
>
> > > wrote:
> > > >=20
> > > > On Mon, Jul 01, 2024 at 10:27:24AM -0700, Todd Kjos wrote:
> > > >=20
> > > > > 1) use gcc-13 instead of gcc-10 for android kernel builds
> > > >=20
> > > > It sounds like you just need an upgrade here rather than
> > > > specifically
> > > > GCC 13?=C2=A0 The reason I ask is that GCC 12 is the standard
> > > > compiler in
> > > > Debian Bookworm so might be easier to update to quickly.
> > >=20
> > > GCC 12 would be fine
> > >=20
> > > >=20
> > > > > 2) add android15-6.6-lts branch to kernelci testing
> > > >=20
> > > > https://github.com/kernelci/kernelci-core/pull/2597
> > > >=20
> > > > > 3) discontinue all gki_defconfig builds
> > > >=20
> > > > https://github.com/kernelci/kernelci-core/pull/2598
> > > >=20
> > > > (not 100% sure I got that one right, have to see how it goes on
> > > > staging.)
> > >=20
> > > Thanks!
> >=20
> > I've opened PR to enable android builds including android15-6.6-lts
> > in new
> > kernelci:
> > https://github.com/kernelci/kernelci-pipeline/pull/667
> >=20
> > >=20
> >=20
> > --
> > BR,
> > Muhammad Usama Anjum
>=20

