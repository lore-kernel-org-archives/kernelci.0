Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C4376BC1
	for <kernelci@lists.linux.dev>; Wed, 21 Jan 2026 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001349; cv=none; b=j7RW5dhgN2HpqRNPaGjVuiCV3WyHYVTIBVgxyMu1yee44ft4ElUR0pEr6uqPF1OR5b6+Cv6Lr6InCZ0aoT06BrWcSJC/GsR4bPQ51i11ukbQox4tWDv8GkkEeIWXubuQSq8IOuOQ/G0t68hRHimj4l0Rh59i11EiAbUZsL5r+i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001349; c=relaxed/simple;
	bh=xTDRmYPSy0Dimpwlr1/5MJ9TUO1KK+2ZMlQ7w8yvf+I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHowdcxGSJkWq6QEe7cJ0lrTduLjS412WlvE5sBJW+lC5T7OWML8ADrAxYnobxaPhR6SCP+IQ0E9RCJjHma++SMqSs3M+vnWjdSCKjPSzkVqzRYG8VTAwKWdmCXl03boCo+NJw/0k2zmlw53V2CnN2Pv5lCBKw5vR/i7hMsW9t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YxNbapGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YxNbapGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17E5C19421;
	Wed, 21 Jan 2026 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769001348;
	bh=xTDRmYPSy0Dimpwlr1/5MJ9TUO1KK+2ZMlQ7w8yvf+I=;
	h=Date:From:To:Subject:From;
	b=YxNbapGuzFDVwqYt6fmWO+gQR/jV0kt8ig0sz4gcdiJ2+r+axADZn0iLRlwQCwXM+
	 dkIJBSn+wRw10tyGZ0rEzXDlV/p44asnsDEvXIUc61pplWG6SOHIrpZLRtCOOYk53M
	 rsmou1rjlQryfCx6A3ziOh88JGbmAhecTcQqv91Q=
Date: Wed, 21 Jan 2026 14:15:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelci@lists.linux.dev
Subject: I would like a developer token please
Message-ID: <2026012154-marathon-semifinal-21ee@gregkh>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I'd like a developer token please, so that I can add my stable testing
machines to the kernelci db feed.

thanks,

greg k-h
