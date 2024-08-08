Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1A32F23
	for <kernelci@lists.linux.dev>; Thu,  8 Aug 2024 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723146465; cv=none; b=Hvi6qZBCpWID1zMRIWDua4aQZ0rIBjw5ohXgBEASDareMcwXsecs4yTNcmmlyAv9hjrhR+7D99ffhRar8SKaBT85ZnybO7KjtYsYPt29ID/voE/LBa+1U7mrkSmZ2zYQuoktvbDeQhzU8hOhhzwBCeGIu7c9cAHpDd6QAVpoYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723146465; c=relaxed/simple;
	bh=vApTUTOWwPmXBXb7jwaCb9AW7w65UJcitp5PvpDd3O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOkSjE++HqkkNraiVdBantgxhpcF13acvSufSOuGjrmy5j0fpXbVWQOW9JxLXvuK79MdWJjQ8+UDzTyrhhn+UIt82d0GivoDHpjNgMP/DXCLJsyogWi3jKkJ+R15lZz31H5UlYfT4Mx777bED0+RvDIkF4dTwxuLJ54uaLGJW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hp7bjR5l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hp7bjR5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D67C32782;
	Thu,  8 Aug 2024 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723146465;
	bh=vApTUTOWwPmXBXb7jwaCb9AW7w65UJcitp5PvpDd3O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hp7bjR5l+1j3mPakvxsg16Pf/XHmbiSI3Id/cx50agAOzTb1csScifiw1NsVYN0Du
	 waAmU2SoMj3FcM1QfOo3MhYrkC3J5Op7aEplFomhWHou0DCMkQVWwIVuqswVAMDNM+
	 zv7RZMiwLGfNYFu15b2LpmR9gN9FkxxlHGzMfE/MKxORzh1Yi1TQTeQ/yNi6JQyxYJ
	 NN6X5mNvdzUyyBQTBiOayZxMOKZRf97QvzoF52Z2LanTuPjrhAE3x8+MfhPGJi9eWg
	 jdYGsi1vbudwf54e4r9A1VXQQMbmrwoztnWbg3HsZH/bPR9eBvacBAGVHkTmmNL8/B
	 Capd0KQNX1Zyw==
Date: Thu, 8 Aug 2024 20:47:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
	syzkaller <syzkaller@googlegroups.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vishal Bhoj <vishal.bhoj@linaro.org>,
	Alice Ferrazzi <alicef@gentoo.org>,
	automated-testing@lists.yoctoproject.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Tim Bird <Tim.Bird@sony.com>,
	Johnson George <Johnson.George@microsoft.com>,
	Veronika Kabatova <vkabatov@redhat.com>,
	Guillaume Tucker <guillaume.tucker@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	Don Zickus <dzickus@redhat.com>, Philip Li <philip.li@intel.com>,
	Denys Fedoryshchenko <denys.f@collabora.com>,
	Michael Hofmann <mhofmann@redhat.com>,
	Tales da Aparecida <tdaapare@redhat.com>,
	Aditya Nagesh <adityanagesh@microsoft.com>,
	Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
	Sachin Sant <sachinp@linux.ibm.com>,
	"Hambardzumyan, Minas" <minas@ti.com>
Subject: Re: KCIDB: Support non-binary test outputs
Message-ID: <ZrUg0MoK6g3yLQfG@finisterre.sirena.org.uk>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
 <e0d90418-5de7-41ed-8aae-872a717c10dd@gmail.com>
 <8c9b63b0-453d-4f2c-8777-66871ad7923d@sirena.org.uk>
 <813ff1ba-7d87-4afd-9852-c7ed598869c8@redhat.com>
 <7aebe4a6-fdea-4774-83bc-b293012db052@sirena.org.uk>
 <43e16520-5a04-42b2-91ef-e25b435af179@redhat.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XH0Rl233Z9AH0MFG"
Content-Disposition: inline
In-Reply-To: <43e16520-5a04-42b2-91ef-e25b435af179@redhat.com>
X-Cookie: Your love life will be... interesting.


--XH0Rl233Z9AH0MFG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2024 at 09:05:20PM +0300, Nikolai Kondrashov wrote:
> On 8/6/24 10:20 PM, Mark Brown wrote:

> > TBH as a submitter getting specific stuff back immediately (or at least
> > the option for it) is really helpful.

> Do you mean that you would like to know if you submitted something wrong
> immediately?

> Could you elaborate a bit here?

The whole workflow where you push data in and then check to see if it
appeared in the dashboard can be a bit obscure if you're trying to get
things right.

> > Putting the exponent in as a number does seem like it'd be much more
> > helpful for machine processing.

> It's helpful for normalizing to a single exponent, so data can be compared,
> but that's not something that a database can do fast. So, not helpful in the
> end.

It might be helpful on the read side though (ie, doing it as part of
rendering rather than in the database itself)?  Not so good for queries
but useful for UIs.

--XH0Rl233Z9AH0MFG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma1IM8ACgkQJNaLcl1U
h9B0wQf/QJ5ExF+EBevph3FS4feIqB6MY5xncB+OFpmqhpi61Mg3NH91rnIjgotv
wiSKe1m47NJpEUHasKjouEPBORPIYBD7rkc4r7BVZCbBQslMjCeDU668ByvjjH5r
83DZLNhP38O9cyu9rwYABr38/sO5gbLzugrLXXYS07P71N04o3ptUslqA9QL/ftB
agXLcVlekfSGdfLeVjF5OuK+bxOy7RMMIkGHFwC2EDzSuvS3yxH6XKxf1sTUq1vh
2QZUNK3v3+idaTS3NKfchmdeSMxvD2sxxJ+paaukWkEmwPCI+qCAW2iK5xuZQwtK
8xfvMzm/r/++Tqrkrp1FoEl/EfzkkA==
=6RSt
-----END PGP SIGNATURE-----

--XH0Rl233Z9AH0MFG--
