Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F5516C692
	for <kernelci@lists.linux.dev>; Fri, 14 Jun 2024 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718381769; cv=none; b=RgUH09ZQlkI+sf/1JNV8Dj5GUJlR40p2Id3hzMY3+hW2gFusd2ZJACkVWBUKfwyBzLWrPw4oaZGuDwOU3ZV4ftUQtaszIVxcQlUnGj4kRXrHnRv5wyeScFc3qKvL9P54mswfSC/xUsk1giPrBXc3HbHMqA/U98VLid6Wx4yW4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718381769; c=relaxed/simple;
	bh=bNSULpWI3A9zTsSkvEMB90xTA0hLj+vVNn3xtTYcf/k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jon9MC85Rvj5TXlCxJ/LQjKBSfOGcnYs/V2BLmNG/DsdExK3NKbBk5XWHlE5fzSB1feUdRQcT9yn1HCfXpePYMW6ll6nH5CcbV5dBQinMoZ0GfPstJ8o3154cd26ZXlYtqhoNeMMmAJv3FVwzwdXERCBhw0Cgl6sKVnMXOYcaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZmbGQmAD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZmbGQmAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718381766;
	bh=bNSULpWI3A9zTsSkvEMB90xTA0hLj+vVNn3xtTYcf/k=;
	h=Date:From:To:Subject:From;
	b=ZmbGQmADNBBa1o6efaoPV1ja0STaExIIqlDgC6kBIoAcyEKNp6iJn9JcNQf8TbcVD
	 RcKlbfKUF9wymYs8KthULUpByyzrs9I4KXHkSp/w3neRcNfjXYi0ZsbV7S9pKyIXhk
	 kMzaNMnhib+ld2Mf6Bg7bacfuE8VlBhqMmuj2jZ2cZZ+EuqjpVREQdeeac/MUYmUru
	 fE+M/vts+Zk1NEnnqwhGd0OxIhaBvk3xCqAdR2F6RL0SeXS6onlTkWL/F7uKKH5wuQ
	 kdqKi7w3qNCNLw2ImhrrZRtTveuO6Q1zjBsubcGsPgxS56LoOTn8/Sd9T3QGKatkJ5
	 C8pSZYCdYCkZw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2BA4637820A7
	for <kernelci@lists.linux.dev>; Fri, 14 Jun 2024 16:16:06 +0000 (UTC)
Date: Fri, 14 Jun 2024 12:16:04 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: kernelci@lists.linux.dev
Subject: New repository created for platform-specific test parametrization
Message-ID: <7e4f06b4-99e2-44a9-b0a8-cd9b12f171ca@notapiano>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi All,

I'm writing this to let you know that a new repository has been created under
the KernelCI organization, called 'platform-test-parameters' [1]. Its purpose is
to hold the information that is needed to run tests parametrized for a specific
platform.

As one example, the discoverable devices probe kselftest [2] that is upstream
requires a platform-specific file to describe the devices to test for, but those
files can't be stored upstream and need to be supplied from elsewhere. Thus this
new repository now stores the files for a few different platforms, allowing us
to run the test on those platforms [3].

While we should strive to have the upstream tests be as generic as possible,
some platform-specific information is sometimes needed. I hope this repository
will serve as a way for us to collaborate on the platform-specific data, not
only to collect and maintain it, but also to standardize the format of such data
and even help drive the upstream test engineering to use agreed upon formats.

Thanks,
Nícolas

[1] https://github.com/kernelci/platform-test-parameters
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dacf1d7a78bf8a131346c47bfba7fe1f3ff44beb
[3] https://github.com/kernelci/kernelci-pipeline/pull/642
