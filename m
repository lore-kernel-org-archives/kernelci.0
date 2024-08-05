Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727FD1E485
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722861207; cv=none; b=NsxrxxskenAQ6XC00XjDQhSmjHlZZYdUbRYNvRCJlAW/ObICJqONhM/uX1UkHoVZyDrt8l8UVO2jdhWZ207gB1QoZbpEQHfSDaYq2p3wEF8o3rdHO3H3zyQShFtcBVrLZ/EiXKovOaGIYy3fCiMdBovMfvBje2M1qJEqQ8KDqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722861207; c=relaxed/simple;
	bh=C+zB7HdHk4TulfFjKwVbr3eKev7gzIWsUkK4vZvUTC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTp5rYA9DIuBKwYyBLb6GN0vCqQDFlykxQ0sXha/cD/znLfUIAuT7M0liXQiCDDG4X32eddunSJKb9J30kb1cucMx5goHUsX5CiGyzp0vT2Oz4d1P3ZMz4ECNi7kRZ0PdReFfHUau4PtYgR+pKZSnE15TEz8Fv8vDzCwzMJnP2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOThcb3b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOThcb3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041CBC32782;
	Mon,  5 Aug 2024 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722861207;
	bh=C+zB7HdHk4TulfFjKwVbr3eKev7gzIWsUkK4vZvUTC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOThcb3breVe1AF+l15yPP1f9+PqozhM7BfjQ/LX1fFuATcWklaPrRu7JgPCxeQ0f
	 J1a6UHp/SLR8nb/wfvd+59KwhOcXOsP5jySCVhmxQCPUMd21HSPMuvZsuAMHr7ZXWW
	 fleAhyngHYtDmhO1al1jbU1GFrDJ9ekW8HdfNcvyO/Wf2Gp9/lAyxfHfJWzgF8JxKm
	 5owOEvpd5RgQxqeSuHZawI8iEVD8v6XPxYZyYgSOk4mIzgL1VuTT8W0mTS4k26iNj/
	 MCCxrSbp0/JGUi/NiLOXrPCa+3K4tgHUzTlto8cNlbbjoPhTRiRQnw2Oo8xndgSznz
	 uhzvdVqOBVOwA==
Date: Mon, 5 Aug 2024 13:33:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
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
Message-ID: <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LABG2NPcpm9MsAkI"
Content-Disposition: inline
In-Reply-To: <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
X-Cookie: Goodbye, cool world.


--LABG2NPcpm9MsAkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:

> Here is the (abbreviated) schema for the new field:

>     "value": {
>         "type": "object",
>         "properties": {
>             "integer": {"type": "integer"},
>             "number": {"type": "number"},
>             "string": {"type": "string"},
>             "boolean": {"type": "boolean"},
>         },
>         "minProperties": 1,
>         "additionalProperties": False
>     },

> The meaning of the value itself depends on the particular test, that is the
> "path" field value. Each property inside the value corresponds to a data type.

Might it be useful to directly specify units for use with "number" to
help with normalising data between different CI systems or hardware -
for example with boot times both seconds and miliseconds seem like
reasonable units to use?  It might also be useful for UIs, though we
could also do that with a separate table for the tests that they can
query.  Perhaps I'm just worrying too much about specialist cases where
it's likely that CI systems won't just be picking up an off the shelf
suite that has standard units.

--LABG2NPcpm9MsAkI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmawxo8ACgkQJNaLcl1U
h9Da4Qf8CRPTeq88Q3MFdGXr1LaUxD0exje6U9HA3UOFB+CRtSfxn0yk0zDw5HQu
25JnCUl6ZhZ83nHOSfZ82amz1UI5PBer4iXUcXXzU+88W9V1ul9eel6F30J9HCNC
VduzUSYkMobBxKLPnqFrSu0ux3fIZeJ0fBdmKiMfaUAjdnn4jWdfrnWsKpdZ1sLi
K199JutioCb0YtPGTKe7wE6OXPk7rCXzf9Yc7kBGlmMSrh7EW1ZRaemN5o87VXe5
DCcW+I2ToVPtMwzRi4d58cXvG/mTKWk5nHo4wc2ZF1/LA6amTwn7PXedUzWcZvu8
RCv47Np3fe7QAbiRsoErXCgccMlnWw==
=JZpm
-----END PGP SIGNATURE-----

--LABG2NPcpm9MsAkI--
