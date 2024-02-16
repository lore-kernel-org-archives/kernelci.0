Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C612FF60
	for <kernelci@lists.linux.dev>; Fri, 16 Feb 2024 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114705; cv=none; b=ZYK/iIZqp53ZoUeXTsnAm14w90shcTY1miFQQwrKZEeNE1rtnEKy8VQroXrYJjzWQsBUTqIIO4s7la4NdB47Yj1dqFTtNUoCWLCQ8+TeKiajwNHsV+fcv/tMSD06L26asW+O964ieYJoBzVeSVoNqTMs+DPble2kiLnZHcJFkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114705; c=relaxed/simple;
	bh=/QrbU7mIOIgCypGKB0IOzWGa8xxIQV/+Z09Anx9ablo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eb5o5+mCs+WVdOaLFTTld/aX5rI3jdYvRj6TcJzTPNrQzbHT128VjHTnunfMe3R8A65imOJ3LefO2XOge+WWC/uRL17ermPPh7MbzNIJj804tYlteS/pnRHc4iQB3hR9QQkcui53p2sn1vkTarNp94xIMc5BZxHk7b6HqQho0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T9D95AhU; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T9D95AhU"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36510561483so189385ab.1
        for <kernelci@lists.linux.dev>; Fri, 16 Feb 2024 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708114702; x=1708719502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24Pz4A35ugogjIN/QzQ3mlQBkYVajEUkDcXFPHJEoAo=;
        b=T9D95AhUI3yy4iySmP/l4NC+aYwxu194IVYvNW7PdXj/jAk1lj7GZtOgr69rQcv7gx
         Cwsj3TzpiN+3ARsRXkHjzL4JrkrI2mkW5YdPUwKulHoF2B/bNzTs+nVyCvmhWEunaAP4
         duLmg26U8xjly/D3c2YxFW7YStoUHsc46Y2Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708114702; x=1708719502;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24Pz4A35ugogjIN/QzQ3mlQBkYVajEUkDcXFPHJEoAo=;
        b=rxHbtFqZSpTNxHVzPQmoIjAx7FULHldB/oIf163VBKrMEIPVPd79xtjJQ4WaY8rx/+
         sFm+1aZ8w6+qBU3qksNAkCrUlHd6dajf9l97BuAl/qKqxrdkGQ6RFusSx/bPuViKrmbm
         X9HsSSg/0QD36b58qN9mF7ktWmT724o7U2puEd4ou5H4xsOr1uciGqvZ4KT0LReI31Q3
         ophcFgV3Ee3SwC2rKx2jzDV3f8TavnJTnrQ1BCyjPFMPyHqsc9khqbAutIgLa7tiaYXp
         95yiaLs2PM4IqyJjM8oE3fZUjB+KeU5IYY9jjBJ8p0998AL1UMhWWY1q6lukBnJV6ElR
         MsOA==
X-Forwarded-Encrypted: i=1; AJvYcCVom54L+ezuAaW+OrsJZl7doVF4CeS+4S0uRIC2peZas5ohh3J6+lugVJ6MtiP7f+uBKgcWnKgLDTfgSYMl0UzMoxPNscrmRzQ=
X-Gm-Message-State: AOJu0Yz/C8BItXdHyXlJRSQqA58p0qIC3PElkZaVHd4flCgcRfzbHdYu
	5XPl5PuSIEJm2tPVZkTeB24MYLSJt0MeuCOUvyKZvtCRKCv66l0FBqT5DUEOzSI=
X-Google-Smtp-Source: AGHT+IFVEIJqGKw5DLB+VjbG/SYVmvRwfFs7FptF1NpxQVP8Q5PXN+GGbkJ3KApB33xpUx43FBwWzQ==
X-Received: by 2002:a05:6e02:148b:b0:363:d7d2:1ddb with SMTP id n11-20020a056e02148b00b00363d7d21ddbmr6314463ilk.0.1708114700354;
        Fri, 16 Feb 2024 12:18:20 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id q13-20020a056e02106d00b00365035f224asm681191ilj.35.2024.02.16.12.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 12:18:19 -0800 (PST)
Message-ID: <7ad0a492-fdd9-4a33-b34e-04d4f71256a8@linuxfoundation.org>
Date: Fri, 16 Feb 2024 13:18:18 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shuah Khan - Self nomination for KernelCI TSC Chair
Content-Language: en-US
To: Donald Zickus <dzickus@redhat.com>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 kernelci-members@groups.io, kernelci-tsc@groups.io, shuah
 <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <db438c3b-05d3-4c9c-9730-b99fec6b2ccf@linuxfoundation.org>
 <CAK18DXaOeQT1beoUOENtB94gX_Sr2AkbJD2kU7QkxE1RWGq9qA@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAK18DXaOeQT1beoUOENtB94gX_Sr2AkbJD2kU7QkxE1RWGq9qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Don,

Yes you are correct. We have met before.

Congratulations on being selected as the chair of the LF KernelCI.
Scheduling a meeting sounds good.

thanks,
-- Shuah


On 2/16/24 10:57, Donald Zickus wrote:
> Hi Shuah,
> 
> Thanks for volunteering!!  My name is Don Zickus and I work for Red Hat.  I believe we have met at LPC a few times. I was recently voted as chair of the LF KernelCI project and would like to welcome you!  I believe Gustavo will help you navigate the TSC process.
> 
> Perhaps the TSC could schedule a meeting to ask questions and gather an understanding of your views.
> 
> Thanks again for volunteering!
> 
> Cheers,
> Don
> 
> On Wed, Feb 14, 2024 at 7:10 PM Shuah Khan <skhan@linuxfoundation.org <mailto:skhan@linuxfoundation.org>> wrote:
> 
>     Hi,
> 
>     I would like to submit my nomination for KernelCI TSC Chair.
> 
>     https://lore.kernel.org/kernelci/260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io/ <https://lore.kernel.org/kernelci/260bfac4-0d48-2a10-e15d-75695ae12544@gtucker.io/>
> 
>     I am a Kernel Maintainer & Linux Fellow at The Linux Foundation.
>     I maintain Kselftest, KUnit, USBIP, vimc drivers, and cpupower
>     tool. I am an administrative co-maintainer for nolibc.
> 
>     As a developer, maintainer, and contributor, I consider kernel
>     testing and validation are two very important aspects of the
>     development process. I am interested in seeing automated testing
>     and test rings succeed and thrive.
> 
>     If elected, I would like to work towards continued success of
>     KernelCI.
> 
>     Other hats I wear:
>     - Serve on the Linux kernel Code of Conduct committee.
>     - Authored A Beginner’s Guide to Linux Kernel Development (LFD103).
>     - Lead the Linux Foundation Mentorship program aimed at increasing
>         diversity in open source and providing equitable access to learning
>         resources.
>     - Served as the ELISA project TSC Chair and continue to contribute
>         acting as a bridge between ELISA Safety and Linux kernel communities.
> 
>     thanks,
>     -- Shuah
> 
> 

