Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7198814
	for <kernelci@lists.linux.dev>; Tue, 19 Sep 2023 16:43:37 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 1D989660576C;
	Tue, 19 Sep 2023 17:43:36 +0100 (BST)
From: "Guillaume Charles Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <6dd07972-3646-496f-add0-b7993acefd0c@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Tue, 19 Sep 2023 17:43:35 +0100
Cc: =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, kernelci@lists.linux.dev
To: "Mark Brown" <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <84e-6509cf80-5-78984280@144048748>
Subject: =?utf-8?q?Re=3A?= Reduced build and test coverage
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

On Tuesday, September 19, 2023 18:12 CEST, Mark Brown <broonie@kernel.o=
rg> wrote:

> On Tue, Sep 19, 2023 at 04:44:06PM +0200, Ricardo Ca=C3=B1uelo wrote:
> > On mar, sep 19 2023 at 15:31:31, Mark Brown <broonie@kernel.org> wr=
ote:
> > > If we're doing this -next would be very helpful too.
>=20
> > Does it make sense to bisect -next, though? Considering that it's
> > constantly rebased, so I don't think it has a coherent and "linear"=
 log
> > like mainline. That means that bisections aren't guaranteed to work=
 on
> > it. Is that right?
>=20
> When bisecting -next you should generally bisect it against the mainl=
ine
> it was based on.

Yes that's how the KernelCI bisection works. It's the most useful branc=
h to bisect automatically precisely because it's rebased every day with=
 thousands of commits, so a bisection takes between 10 and 15 iteration=
s and it's painful to do manually. And that's where most of the bugs ar=
e.  Then mainline, stable and stable-rc are the other critical trees to=
 cover so it makes sense to enable them first.

We've discussed enabling bisections again with sysadmins and I think we=
 can have this done in a week or two.  Other issues are about measuring=
 costs empirically for different parts of the system and adding a filte=
r in the legacy back end to avoid flooding Jenkins with jobs that won't=
 get run (they still use up all the RAM).

Cheers,
Guillaume

