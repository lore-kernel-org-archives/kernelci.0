Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFA19CD13
	for <kernelci@lists.linux.dev>; Fri,  4 Apr 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743803109; cv=none; b=k+C6aNWXz2jaLy2FbVwXjq0ahEiOOk88rwyOgN9qPc7Svy2BkWa9tOrtwOBmce4LS7pvpm5sZpGupUlD0ZsYy0zegzIvHGoC1aj8GlWkcJl7KUJKIuC6KW8uFS4M157R2msqPcOKLf8orw+hFXoZU2qWZ3yArE7MaoBMVbbahbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743803109; c=relaxed/simple;
	bh=IZzW6MBjHIud3wj2YINCOIOslrr3kEN4CCNJc49nNk8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ho1zVseovhtkhZLgaGIPL9JwqQmo0iqipdRCglzifxpixphpstco0G4SuUCHnyFrWdmNbJLnzzqXZtZiCnn6m4tWoSnblrl+ED7S9mGz+e7doL3LvMLL8IRX5DDpaRdZB4YKVTkJT9KenLJphpKEnlJtk/ZXVXL7hDcwVz494c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkZY6ejL; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkZY6ejL"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476805acddaso27753551cf.1
        for <kernelci@lists.linux.dev>; Fri, 04 Apr 2025 14:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743803107; x=1744407907; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NYLb1idUh4mud+aFla8VmX1rADqGbOr545gxjwma75c=;
        b=EkZY6ejLw+EMPvEv2bwIvWeHHMIVU2nNvUWmW52m0p1lVNN5uOKuT8xhjuXAqINcsI
         3xLJKa6+zU7ABI4F8gipFBAp4AYr4J2lfsnLuVscvUTvSSAHlhIEYTjnQA7jKTX7YkZs
         z+2IAR2oTwznnHHQ7JBbEChZX7s/IjXI2Jn+wTJ4orOkRdVO3m0H/jfcn2mfAAD7owNN
         JzUKmZF0XOGGk0S5Vm8A26DeaWlsVLoJmGD/A0mYCu+Qgq9jYrc6MTxdkuwJuGrPHCri
         n+VmSNtAP4ztgPowJ2gk6hmdxX6cWI632+pbgl5PD8TNqa3tttVZiADOkhPyJA5SIiXe
         v5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743803107; x=1744407907;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYLb1idUh4mud+aFla8VmX1rADqGbOr545gxjwma75c=;
        b=JioznjcsjxP2qY26yvYoPAXbZ7eICW2HVvM/UCNApQA7EbSU/z4xEOFtm36JA3yhuA
         cjM2TSlHTvxl/S1BFkx5/KI67YI4QHSJfBYhXUYU/ELMkH+k+USIWNWK1t4uUDIaDLBc
         tCqp69N2CH1j+cBaYTzylCmEMV6ez6jCFVvtBqhtmhGTBOwtBYm9RjwgWAURWq75lHR8
         B7DTjvABzjz0t4xZTxlSJsFIxc4CJaxWHSZwOgZeXy5PBdx8tRqcQZbdiKZba+XYyz9Y
         lVemlfHbVQ48Flv1g4AUNRmX1Skh8czMP8/rSNBncVwM153pJlgzqNKpIMH8VLPRqsuU
         aJSw==
X-Gm-Message-State: AOJu0Yzl0vfovN49m+boJ8jSIiWkplYbyXFiohIO7nzrzyySzgzA6YeI
	RWKYbUQwBCvflePdZRnBoay3uK3rL7xsnwQrCxutRQSrBJsAhv6ywAfQMoJlLveV6F5jGJCR2SE
	/doX/FNeaVpci+lGJp6kHFRSelEZYcF9R
X-Gm-Gg: ASbGncsk2o4DAFVDA0sLLO4w7V8BVpS9TO6S4s3k9NKH+Ki/d7g2VWV5DJYb7yd7atp
	NuZVHzQ8uFSKDbI0i6RmauhTKeLfVy6ZYeGwFuqY8i427uMpENhmsQ6Q5pFavbACrxG8V3//Qtf
	e1WliEeia+IrShTqmPx5kk3bVljp5b
X-Google-Smtp-Source: AGHT+IHjvvgquC8kth+MNjnP379l+dI/G/gWZyNGsAt9vM8EjG+WGeglVtJl8JaITeT4eclk3es6g1RJ0fYmgz5Cau4=
X-Received: by 2002:a05:622a:654:b0:478:f8bb:b5e with SMTP id
 d75a77b69052e-479259598dcmr75680441cf.13.1743803106786; Fri, 04 Apr 2025
 14:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adrian Johnston <adrian3@gmail.com>
Date: Fri, 4 Apr 2025 14:44:55 -0700
X-Gm-Features: ATxdqUHXEnw6ywvY31XKARC_pv50f8RpCmxiMTwr19Qe6EQXp6nutYjHFO5b-CI
Message-ID: <CAMtebm+miDTOR-PcJrJbzfSS=1eNLQJ8CGQf1E3+NpcLh+mYKQ@mail.gmail.com>
Subject: ref_tracker
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello kernelci,

I have exciting news. We have a reoccurring class of dangerous bugs in
the kernel that could be identified during a CI run.

The kernel comes with a reference count debugger called ref_tracker.
And yet, every minor release of the kernel seems to fix another
reference counting bug.  Often kernel releases fix 3 or more.
Meanwhile, the folks over on linux-debuggers aren't even sure anyone
is using this reference counting debugger that often.

Is anyone willing to flip the switch on this debugger on your staging
machine?  This seems like the kind of thing Linus should know about 20
minutes after merging a patch.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/ref_tracker.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e66934eaadc83b27ada8d42b60894018f3bfabf

Thanks!
