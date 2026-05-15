Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CEA3E0089
	for <kernelci@lists.linux.dev>; Fri, 15 May 2026 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862588; cv=pass; b=L1JrGAYpOIUPqXyKyjfjNaYQHFArdD5ulHdJAMxPvZUzkh88oJY0tLDaSTO6CawiEK6BnoB+AUaCmdCXS28JTm/jR3eQcVpqw5S+3wzxVWSnaCz2mrJIU9Qz9qdupe3h1lOJkPmYtfFZfWZ1CdV6aCH32E8YPVgDPquUkJET4fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862588; c=relaxed/simple;
	bh=peWkBH0EKLaYcbmGHNYQ7y63+uJia+DEtKGTkeYwi80=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kvksXhl7plA1Rzn3WFSJ7ntK9zjU0ICyD3pom6Q5AqzXxiq6lNEQV0v8mqbpX/QSe2vny9VnbyqInbCxBTzqT25uxIE2A6cCaymry26P1qOTZrtMNrnoSXcF9g9EfktC6mRMrhVonaH0PAxkXm5aH4sHf9iXktdfpAtDD02Nje4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=yO4rsnUq; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="yO4rsnUq"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso6780129a12.1
        for <kernelci@lists.linux.dev>; Fri, 15 May 2026 09:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778862586; cv=none;
        d=google.com; s=arc-20240605;
        b=DgoELnC58FlJuiIqme2q3hToXu3Gz29dxl4WQeDZc3ZyDmPKTMYBuggAU2GniAtja2
         mMBCBes0m3NosZAPY58263/WHNKsRyt8Y+ZUDlu83rRHtg35P5z9meqpHZgqDLb15Iqe
         4DKdLBZJfL01Sa1uqV2NFJpPJERFwS7fULQ7T1ZktBshqsNogL2Rlh4W1p3IVYGRMiTP
         MxjDCii0x+VOi8UVE0mwNIFZUQ2e8h8tpQw/MYs+8anTHKgFoheqxwV9i4Q+X0BwTKNO
         1ryLEVEpAahpxl91+KidsFtcjvhrUhzvpg/ut7929xtuBsgXII9begLNK3c+B1VVDXys
         m4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=peWkBH0EKLaYcbmGHNYQ7y63+uJia+DEtKGTkeYwi80=;
        fh=iE0vmLwB6/kNrV5nreBoAlr+nMoMNEJT8UrOo+5ZA4A=;
        b=Zefe1I2HBh83YCRVyr3YK2I061kiHa4zP1TUm93x5tM8Trta/RfJGtuMvRtZz3W6NT
         3+T5tDqV+0Ej1pDGUGrKvgEz6bbwY5q/i98jgzjvIjRixDKjZEksR9luzk0p+ljapXDU
         hd4zvGzbWKUId6W77qdpPT+7RataqYbzFiuJGvPwHDDI7R6EM75xu/MqRld8E9htqAZn
         ClPZoaogAL3k4fpEYjuModtpKU93TvthbwZK6GNey4Vopnf50oUjyQ3XOkyRiTIkvIRP
         eN9qJDt4TjJ7xEmjUVtTcvvXRtYNJul7yiPhzsj1X3woXi9FP1yteJJlNwlzsJ/0C6Dv
         0hUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1778862586; x=1779467386; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=peWkBH0EKLaYcbmGHNYQ7y63+uJia+DEtKGTkeYwi80=;
        b=yO4rsnUq3GGuRx++Hqei/+0BwC34FDcav1gS7U5YtsMo1YcSpVxIvBLc3n+2jbQa+5
         U0iWnA7diImNM4v5NvMF0nvO1vFwAJa5HOJn/9tfhUxIGMYXD4BSBTpO92ar1ViajxW5
         zCpjwNeoHeGjnnSrC5f7A72xaJ6V7YqEmBv5C87uQoWhkgSyiJHaNPvI/hu/SAxLxR+V
         DoQS5RpRcXqgbW5g4QqR6ntn0m8/UYN/yB2/wB89lPUUzh9vPwrsXChze5IVWtv+5yAE
         Gb5dwhhge4aMAbcyo1W58AX/QgchrEMHthbkhF2x/U3qwOM54fqpA9nJTLu8OSbje2ze
         m8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862586; x=1779467386;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peWkBH0EKLaYcbmGHNYQ7y63+uJia+DEtKGTkeYwi80=;
        b=Vn084PTzOV3KU1D/KgmI344ENlltscFzXvkhTDli3vABCgpbLsHJBGXrvs1LF+6Yzd
         vG8V3w9YrpP/JQCGE0c+JmRU1hb+9vf6nHAmfjkQY/uJf1JRixP8AQUGd0AL7zUZw0D/
         E4czobEPhwfraoXOPIGVMf0hh3T1PmpEDBcigocUVoH1NGnUg0mEv8+5DQ3yJy/vbWii
         aGH+Qej1RwDUSSjLObW3kWEgCLHw6LJZXKQeZiPnSVW+Zc6vSVjzu/os46KNsTsAyelj
         JHTJboh4SXAUQWuq4jGPFb0B7GLX6Vx7Qm/dgOtSZPixGOFA6ZbbJGCR+Yh0K5h/bs84
         sw+A==
X-Gm-Message-State: AOJu0Yw3UZ9Ow4uMQQA+tHfXF50pcOT3hEkek5djjrysjB7FO3mutNhA
	RQKsBB0ivAL0hLstbd8o7TUvN0bM+IT/Nx4nj/JB92gEUtecyViAkPr7KSz0NqLpfHrXZHL7W/t
	mPZNLUPd3O77kINo5E9n2rqQ58XYbJ4p0+TRBeVg4KL0SOmPyBnI86OI=
X-Gm-Gg: Acq92OGqS2HrBF2/7oVGFoo9vscRQtD1+eQX/YwAkhjlkmiaq/ASAtbmcCVPsXThX2G
	NfZff716rTvsO8m08KLkDsiHAbKRtPKxn7XkAWHuD3MHP+uMJdPrykfIv/UhBmqpIuOwyg+SRpI
	QaYH/4VVDKSBr8NZAX4vBl3KiB1Y/SRBpDa9QE3xQcwOL6FmFqyzuDUicEtEeQG6bUI97UBR+ws
	zsS2hy/D5feVFeNcgqG5wDSpEeEzZ46BT9GhML/STZeRUWScnmZc4tQk/jv8WZDWbGpmkoAdahf
	Mo2nqw/5
X-Received: by 2002:a05:6a20:2594:b0:3a2:f116:c3e5 with SMTP id
 adf61e73a8af0-3b22e8003f3mr5471954637.12.1778862585786; Fri, 15 May 2026
 09:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Fri, 15 May 2026 13:29:34 -0300
X-Gm-Features: AVHnY4IKPFt4CNCBIRRoKRciVmjwVm-SJHVxNwQjKGkGJV3wtf1Nv9qFdWjFpYE
Message-ID: <CAB31pVmLEORwM6y3pPxmhwLeQuM6_Rzr+PvA5FY_Sh9OmZncZA@mail.gmail.com>
Subject: KernelCI Dashboard Usage Survey
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Over the past months, we have addressed many of the main issues we
were facing in the KernelCI Dashboard, and we are now at a stage where
we can focus more on useful improvements for the platform.

To help guide this effort, we are looking for feedback from the
community on how the dashboard is currently being used. We want to
better understand which features are most valuable to your workflow,
what pain points still exist, and what may be missing.

If you have a few minutes to spare, we would greatly appreciate your
input through this short survey:

https://forms.gle/WtSmW45NKoBoG6fZ9

Your feedback will help us better justify future improvements and
refine the dashboard.

Thanks in advance to everyone who takes the time to contribute!
