Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA086D1BA
	for <kernelci@lists.linux.dev>; Tue,  5 Dec 2023 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 4725E12023B;
	Tue,  5 Dec 2023 18:58:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 032DB20028;
	Tue,  5 Dec 2023 18:58:19 +0000 (UTC)
Message-ID: <7181366346c744a544515f69b1c21d5dba6ab25a.camel@perches.com>
Subject: Re: [RFC PATCH v2 02/10] MAINTAINERS: Introduce V: entry for tests
From: Joe Perches <joe@perches.com>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft
	 <apw@canonical.com>, Theodore Ts'o <tytso@mit.edu>, David Gow
	 <davidgow@google.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Brown
	 <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Darrick J .
	Wong" <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, Veronika
 Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
Date: Tue, 05 Dec 2023 10:58:19 -0800
In-Reply-To: <20231205184503.79769-3-Nikolai.Kondrashov@redhat.com>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
	 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
	 <20231205184503.79769-3-Nikolai.Kondrashov@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 032DB20028
X-Stat-Signature: hn7kghgmzrchozzphyan4eirx6b5kn3b
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/YiS7yEWBgHPlpHd3dQkdApjFJd1hvXR0=
X-HE-Tag: 1701802699-774340
X-HE-Meta: U2FsdGVkX18NEtwviUMTx0MGx9JIeBeZTP3Z6TF+54NCEYXkuZ6y1qSb6UglvMdC+Ju3wgdDoHT1Iobu+sIxpy90DdjTBFPna5n+Bb2LFYFSsj6w5HHhvl/t2pWUh2hztHJc+VIyWV8pGGbTXU0XhJDyGb6dnzDpHDaV/JC/JMNlwrCbJmkKt4F0HiY1X3q29TfkNibof7o6NCypFobPNniSBrL9Y3cXwOgSspvKQe3KRUtXMO8rFm19ZAazgf3qAsiCA5l4hznlOo82JLZyZ9SMOIuiPeA98rF0vrDCJAUcGXHpHd95pm+bW4mTiEbU

On Tue, 2023-12-05 at 20:02 +0200, Nikolai Kondrashov wrote:
> Require the entry values to not contain the '@' character, so they could
> be distinguished from emails (always) output by get_maintainer.pl.

Why is this useful?
Why the need to distinguish?


