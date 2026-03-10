Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAAD29E110
	for <kernelci@lists.linux.dev>; Tue, 10 Mar 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152637; cv=none; b=Xi2C46Xs8C7i/LdtNTiYK5VnrArzHCLdcHECNJ7QQD4YMxmrMpTQFeUP9a6H+6N42Qt04UQI8ILQWKRkI7a2tcZtsx4LEL9hfzRyhDP6Kyjg+yFjSXtSUatKazGG3+XvqtCidwxZ9T45vnS+Vp+Bix+qij7Q3F9BNSLfTsaMI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152637; c=relaxed/simple;
	bh=IsUmbWxJU+aTXEvdwVGY5Z/W95haRACojOATCUiu9Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayHk6nSpXgTBodHLJjSA1lhaEzQk3ieDRUk0s8ozypDsF4pjKxAr7I8zStfLR+KdecFDKsFFb+xANXRQO9ROOlQUDeTjb3Rs8d+SfI4Q7ouyataQCbw8HIUOKZHfIJ5zXzROOm2CuyHutWbKY/Ba56UPoOxM61/P9nEtu5Tl2sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=SEQwgze3; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="SEQwgze3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1773152633; x=1773757433; i=christian@heusel.eu;
	bh=+FDkOe+u7kuDtqdxgHzBKBGqn9sn7Ej4HLh/TXUpidM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SEQwgze3IGdHMSHUax5FYXHpdoPQkEbdSEXY4RGyD3POqVlVAC4TtYnAA/Lbd1eB
	 gNrFTWCMPQ4UDnNt2p4rvkC4FYuNFZ+jZgGXwOQqWq8XXyE7uF+NQPCO6Lpt1JUNg
	 aTSAt7KUa7yLzi7Dt+QlNHd3tOnvbTqHsYCaB7QtiiGbf+hyYMFUpAY9bB1vItKxJ
	 52DKl0dMb4SGjVNsuoL0VHJ+jPJxrz98sBKu9Yzi2AcXnZ+RgEv9sD9Khfu9ea13f
	 HSwkFYIMuKbzw4xj0hT3tuLgQZ3yPcg0q3zt3vQyB02jpU/b0/b93/4QcVg225sr5
	 v4h1qIMWlg7jx5t0XQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEFnP-1vsVjw37bh-006Dik; Tue, 10
 Mar 2026 15:23:53 +0100
Date: Tue, 10 Mar 2026 15:23:53 +0100
From: Christian Heusel <christian@heusel.eu>
To: Ben Copeland <ben.copeland@linaro.org>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: Meeting proposal for KernelCI Bisection
Message-ID: <5847e9d0-2ddf-4d8d-b080-9f0c18b83e10@heusel.eu>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4sjkrnoeb3gyia65"
Content-Disposition: inline
In-Reply-To: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
X-Provags-ID: V03:K1:XasDrtt+3NdsUG+t9foriAXR2VbVrN5X67iOAHBOHamzCnRTkiV
 SMvGKBjiINN7OoP3ctM3ocvWX75/kOcRE1DIlPG86WkJz6FBiqG9Q47/OEIjG+ErkiTgIRT
 6Q3eRlUOniw+Ai2GkyfaRN5C3X8Qw91V+wLessT3eaM2MNHC7jxDzPMBo3GgzbeYjqXvSdg
 8SN5B9681uE563aGQeXWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2CUWkl4si7E=;wStISt0sN9J72pWlHjo5iJbFiQ5
 XOcu8ARjpK86HTxNCu8wpNzcrXKA0sWCnOZ3wrKdL+GHXA8DQjqAHedD53hLBe6oYEfK3zOpb
 bXYlbSlppxYEytR5i1ZN6+tpEWE1VIGkRthF68QQnCP8MoHMO5ZD++K4773QofNIa0io53ntg
 mWI5039gNAFbmGzvrwTB8o2M6Qm3kvMmgpYRwu2PR6arNZDgIiD9+iNJSYeIrxxNThDVHbpYL
 9cuzIf+uuM2uRUUvL0MnkXbQyAFqeHQ+bLhBK+53AI96evTfW1D7OCSr0w5knIA0fcFk8sHE9
 hQ5GN8mjGuX8ATxJQEY3AYFhRVfHX/uATlEYygeKZpPmojPz5NQ2NjD9I7ej0drvlK9VZ/MBF
 SwuweSUcQhMNJJeZxg/0E2xVFQiupCj25rGbB4QyBakxvj3EqY444v7ezHUJDS40EbB1oSysQ
 tGnFKaiuSOHWaYAZ+gBsx7BZdZaUfBw6qfNqYOgV7sHgOPjxLyXD/IWesvsSkS0qxTfzlv1zT
 JTtwYqqqRfdDgqCgLP63SgKKsgQOv8rPefZS57jZaWXE8FzzztKsYi2qY0b33GMvQek6PKeOp
 h9jDVYUw/obTH27V7uheO4O2iEdH4Fw81gBesxnNafISYnOs41j89IWbYPJEseF55PO14+ju1
 aIB/PLrcZqxkYZy2UTjZ+KUmFh0zDY2Gb6tMlU30Ss5dCpmMg4ijTqlK4ZBOm/+sgXPQMB8x3
 mA5sfGDjfGqNzLCUgbcD9TnC0ifjlom1480crXzh3ekoeL0cUaTGwmOjYZCEMNT4FPfMLhu76
 wwd8DnInUbDZk+OAP4q9aEWN9ShL5Hp2dyqHTQu5cmiBVSx8jVGaXiWmlpQabLiWX/uyyiz+o
 OG6P20Qi9rqp/g/Ibe8pZ9VWW0eLnSIcyjKfY7Qwvz8+fmjL0jFXeznB4ynFblaG0Zs7qFtTm
 u8/9LOl9aE03kGhE6anTDGJwyRTMOgVb2hvL7q6sLC5qWTueHsC76lrVeTxad4TisvtRkohB3
 eWOKQtgv5tVkigXA1rU18z002U7xQwPXRbK2w0qf6+Lu6D4G2ZDR4QYbRLMF9+5DVcBXSvAAj
 G556msSgYeDveLpSgjidFxwi8tMIT+a0mVe01oW3cGQaXLsNDv711jk7DdcKV1YsHlLZj5X3O
 r1iZcyR1d2yBwZL3xY9Y1sWeilKaqQ/l5V+alpH8xEx1gQOsTnsqAbaB1uQURl5P79PNjdYcI
 +ZSax8H02hJtgowxe++cam1EMR+kAauizzlNqZ4vwADVnW1rcvpdRG4Y+yRUmn1sBy+B7jHQi
 90JiKd0DttPY8jAVEysPXB/C60JqRoeLDApeqKbZK61EB0VqqggqmTq50jNZxcAj4YtFulXrT
 pFqPNmhTVZgYWfK3YrJpACA6TnKDFm3apGrihZuyZzQbJLStZ3AZk8ovbVxKYfv9YwVaYtPj6
 lRYm0cPhTJXY2zenU3H1g9BxzFIy+a84fTYnOSP3w7VW1HD6+T/ky3jgYzunleEEoWUsKDtF8
 Kz+8SHDFjyBqhphdfBHReXenL+spp759hkfrBs1rx9LQxSDtVTIvQDHzuve62/aws7qLjAI3e
 rRMtHrwKvnyn3WFeiNlPCJGWWdqKF4PHggTtiOmnf6owcgceUz0jQCWZJi0jfCh6BLB+LJoWt
 XlyfDM41z93jcr1oJtn2qBHX4/1XFQS+wHrHfPsCQlhQA6va2QqNgGIJd5WuqoUV2m1IiFfap
 NrRFZod3306GBrVTsbAdB8TI0yuqh6CoaP2esQTea46hRPuPCCIGrDb1VX20pDzXXpV0LSu0x
 tO+B


--4sjkrnoeb3gyia65
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Meeting proposal for KernelCI Bisection
MIME-Version: 1.0

On 26/03/04 05:28PM, Ben Copeland wrote:
> Hello all,

Hey!

> On the KernelCI roadmap, I propose we start a discussion on adding
> Automated Bisection into KernelCI.
>=20
> We have many options and have learnt many lessons from past
> experiences. KernelCI today lacks the ability to do automated
> bisection. So I would like to put the meeting together to cover
>=20
>  - What bisection in Kernelci should look like
>  - How do we go about Bisection at an efficient computational cost
>  - What are the options for automation
>  - Put together actions list
>=20
> Bisection needs to fit into KernelCI V2 tooling (i.e., Kubernetes,
> kci-dev). We also want to provide bisected results to the Maestro
> mailing list.
>=20
> I have a list of people to include on a call. If you are interested,
> please let me know, and I will add you to the meeting.

I would be interested to join aswell, could you invite me? I did a lot
of bisection work within the Arch Linux distribution and would
potentially be interested to provide some input and maybe use the
resulting tooling!

> I propose the meeting for Thursday, 19 March, at 15:00 UTC.
>=20
> Regards,
> Ben

Cheers,
Chris

--4sjkrnoeb3gyia65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmmwKXkACgkQwEfU8yi1
JYUuNBAAjUA1yPFdMgyXGzHfmVSt5jzAALQVGEt9qs0qK63BVWGI/1hYd8WgsoJp
EY24ve/hPTVG9pHF6f9uUQ2wUfapnGfwVKUtdV4l7cyMocAmjKidbl45RGf8XfBX
cb3X9aFJLZkNNkYFYI+q07gS4jSgMk6aPSyz6yPZ4L9WQXiJU/Izj1msqOLC408b
gUvTFMbGHDncqg5iNUxvD8leuqgZT38lSNWGBjVgG2UBw2Iw7ebrqMpO4q/Zy2FA
xV2ssmET7I1QZ9iPoWSdGdznbCuXO57A9JaCU8ap80zkLTHUkAZMqCw0o4SMT4eU
E+9gLC3m/zqEUioelJF9s9UUKCuHpW7kebLwtd3hMI+ME3FtpK2QScIsrGR1Ax/9
fk3lDv/Dkr+h7cenHxexkOVieGUmjbgI8PO5vszgrEIvvQEQCX9tj1UgK6QGmSq1
s6YlRy1ETGEMLBJLDHRjcxelqXjb6A184znoDRLNFTJqbxefoYxZJ6XLBqD3MJOa
CWYEHO/tJq0l84HvNwYi49eYY0o5CP/HQgPCnMfrMpqpkTpiRMer3pXvlsvrX7OT
ixMmK/zsPeSzzFcGo3k02mpIcZF4pyZ2DDkI6e0wHpTdZn1wMBM9/15EDi+eihJB
3eIrUILcj1blmi0JUeeAHFdZdSZLD+uC7g+ZzAHEL27VaobH3T4=
=Oope
-----END PGP SIGNATURE-----

--4sjkrnoeb3gyia65--
