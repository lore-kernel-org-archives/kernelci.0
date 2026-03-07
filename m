Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD01382F36
	for <kernelci@lists.linux.dev>; Sat,  7 Mar 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772870204; cv=none; b=Otsir7GHYFu2l//Fx0TwhX33KIDCm0dC8hFEGFGgtXqtmb+4oKdIvWYtA+1jHSw8YcnE+i+cXFbqaNTCXfrAp5oMHNDn0cc475bUJNyyTau3Mb+its2UN8mCb5zygsodT0YSEHtzHe9fA+bEiMF9xvUBe3lj9jsoegpaD0A5x5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772870204; c=relaxed/simple;
	bh=PHwciIX6SNEO9BV3Ml/+wuhPYm0O+KCZPVO+4NP4SGw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9cpExF5ndv/0sxJuTBcWDoQQx0jB1odNqPaW1zEyEjXgwi5tTZLTgrb1InPiOoksoXMwInIm/0/xIKJM5vpODMoG41M0Os0IImxdZ4K4gTpjNxbisiXeN38kU8LiPwWrGJFRfsLQNMNYUR39NW9J4vZFkRjaSCU47fRzGma5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwbcGZ5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwbcGZ5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C986EC2BCB0
	for <kernelci@lists.linux.dev>; Sat,  7 Mar 2026 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772870203;
	bh=PHwciIX6SNEO9BV3Ml/+wuhPYm0O+KCZPVO+4NP4SGw=;
	h=Date:From:To:Subject:From;
	b=rwbcGZ5C8HNn+4yy9UyxCVaMOTZF6B6t4vBzOfF0cggSQclAvyvLZE6mW28zapIb/
	 1L9QPlhW8ArZHP8y9ETAV/HgYC20q4rEtTOhUTf98S6BUgAgVkXRSvtPzhWXB0dfYJ
	 oWki3KwtpZQxAUmHR8iR3HO0emsbuifNMWpfUUjTW3TpZFCEcLV94r+Yg72iANQRjc
	 YS6pChO3EIACZtQwCwRzuGpotkW3dcRz/AQxidz7neKMlFrGx4EgpCM9pNb1pM8lO8
	 WIt8KAaOCokzA4MrYGsUXZjye/JEQOIDxtzE5nMNilEH/V6b1tFv8sTPdJTeVkXPgV
	 mYhe+XcxtMkZA==
Date: Fri, 6 Mar 2026 23:55:46 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: kernelci@lists.linux.dev
Subject: Enabling additional KUnit tests in KernelCI?
Message-ID: <20260307075546.GA19654@sol>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I would like the KUnit tests in lib/crypto/tests/ and lib/crc/tests/ to
run in KernelCI and have any failures reported to
linux-crypto@vger.kernel.org.  Preferably on all platforms, not just
UML, since UML doesn't cover all the code.  Is there a way to do this?
What is the status of KUnit in KernelCI?  I'm having a hard time finding
information about this, and looking at the latest mainline test results
(https://dashboard.kernelci.org/tree/mainline/master/4ae12d8bd9a830799db335ee661d6cbc6597f838?p=t)
there seem to be no KUnit tests running at all.

Thanks,

- Eric
