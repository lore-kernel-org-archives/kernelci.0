Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3714F81
	for <kernelci@lists.linux.dev>; Fri, 22 Sep 2023 07:58:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CA251F45E;
	Fri, 22 Sep 2023 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695369498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rxsy5LPAHP1WBgKOtgnA5M4j2ewKdmJ7ZeNWgSslu2U=;
	b=QmnRADwH5HvaOiAyjgWkRSRps90pIy750I7Sxc6xEebmDtAOPs4NHrdg8g8M4YEXRmLXIc
	yAo1a4yGXaO9BSKEmaaREBL2FcR4Z6qupkMfDFiq8Gv5MVaB1wcCcefsBEWzrRHGkQZeGn
	fwfHyhCJR1p3OClQAmhnyrVjSCvD3/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695369498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rxsy5LPAHP1WBgKOtgnA5M4j2ewKdmJ7ZeNWgSslu2U=;
	b=EE0waXfcJUEY2tDcXwxUaHMy0/++6qNU0vGLWU6RCtViHyRrF9Ypt6UKzakFivna9IVdYB
	RWmaBLYgbkpdZDCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34F2F13478;
	Fri, 22 Sep 2023 07:58:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UUwvDBpJDWVHLQAAMHmgww
	(envelope-from <chrubis@suse.cz>); Fri, 22 Sep 2023 07:58:18 +0000
Date: Fri, 22 Sep 2023 09:59:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Tim Bird <tim.bird@sony.com>
Cc: "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>
Subject: Re: [Automated-testing] kci command line poll: Click or Typer?
Message-ID: <ZQ1JRywfnmUB0tdb@yuki>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>

Hi!
> I see exactly 0% of the people saying to stay with argparse, but that would be my recommendation.
> The rationale for this is that argparse is old and unlikely to be changed in an incompatible way in
> some future version of Python. 

+1

We recently started to work on new tooling for running LTP tests written
in python and after a few up and downs we ended up with using the bare
minimum of modules we can get away with. Less is clearly more in this
context.

-- 
Cyril Hrubis
chrubis@suse.cz
