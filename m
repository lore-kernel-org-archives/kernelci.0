Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99171802D
	for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 20:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14283C433C9;
	Thu, 21 Sep 2023 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695329326;
	bh=ujnmw4KvI3Eu7vuowzA5caBt1gtu931nP/4lWmh2dC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtyVFUIYbETgMi2kYy0opoREUIvcnwRWlCdXZgsCe8ZqSVJh/5aItqyz7NtHgyyo7
	 a/lnmObrSsagExri5Rbir4vAVO8tSWiyzPqo9/52uJ6rPm3W3OUfTRf90idfm3FRc5
	 S2nR/hOagObA9suZorzapfxkevKkzSzLa3/YM5wmglXKsfSJ84zYlXNx1fb1CmGDcU
	 ab12FAXpF8bVHgh40d69gMNERa18yV2PK/Zlk6sb9VYnc3gTlQQ59Dz2YuIbS8A5s6
	 00vx+nfIo5jE9/8v+8LG69utQ/6PeGeZWX5OmSrMbIHZzXCThf2HbhwJ+04FNV1UR/
	 7XSl5e0k7KvSQ==
Date: Thu, 21 Sep 2023 21:48:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tim Bird <tim.bird@sony.com>,
	"guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>
Subject: Re: [Automated-testing] kci command line poll: Click or Typer?
Message-ID: <d5161b00-6688-4632-b878-90aa755a95dc@sirena.org.uk>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
 <b6743bf5808d43a48e9cc78ea0871fd8f23e1f6f.camel@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8G2a07N1ffTEjKm7"
Content-Disposition: inline
In-Reply-To: <b6743bf5808d43a48e9cc78ea0871fd8f23e1f6f.camel@linuxfoundation.org>
X-Cookie: Caution: Keep out of reach of children.


--8G2a07N1ffTEjKm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 09:17:02PM +0100, Richard Purdie wrote:
> On Thu, 2023-09-21 at 19:41 +0000, Tim Bird wrote:

> > If the python community cared about backwards (and forwards)
> > compatibility, they would not need
> > the whole mess that is virtual environments.

> years (Bitbake in case it isn't obvious). Admittedly we've tried to
> keep it's dependencies minimal (much to the frustration of some) so
> I've not had much exposure to the wider module ecosystem and I've point
> blank refused to 'need' virtual environments for our use.

FWIW assuming the issues Tim has run into are similar those I'm aware of
then modulo the general stuff with the 2->3 transition (which was it's
own special thing) the issues are all in the module ecosystem rather
than the core language and standard library.

--8G2a07N1ffTEjKm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUMrCkACgkQJNaLcl1U
h9CtZQf6AgeHT6WHtQkIJXMwciGBqoAqD7IoosyLfRvr7VtqXND0PNqeauO2Hu9R
gpRfPY7G3wU/s6fUtm2A4uFLJJK/hfTvIbxSUAMo1iBVt8atboCFjAvtiX6gGUDB
lveIuBy/+EvkWBGufSD4HwPzSTgU75QAm3V0f4eugWEs01ENBdFjXubfpXR9ONLP
0m7v40ocgevbFdDg3jvVsR8xDfp+9kYbV5USxcdS9ZISXse9Ont2P/l3uTDLBrs3
vX7k3/lvRtdUeeT+B3Ss/Kb9dz0kFpAYSjKwPoYGDHbzEt0F+fu5ZrzSh1hkeHyz
5FikwywIaJ3XVkrI4VMe1M+qTa2wFw==
=SUsB
-----END PGP SIGNATURE-----

--8G2a07N1ffTEjKm7--
