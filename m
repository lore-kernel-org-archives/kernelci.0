Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472022F36
	for <kernelci@lists.linux.dev>; Thu,  9 Mar 2023 08:26:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id cw28so3816557edb.5
        for <kernelci@lists.linux.dev>; Thu, 09 Mar 2023 00:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678350412;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RMunSKb6o0mwi7lDDlMy5s5rILfzcqDsQ+m29tnpMuE=;
        b=HbdOjIDiDtXYeDwwEuA5UNETvFHs0TkyNLCI1vagQtvrgZiYWCfLyQaPkgpHQjtNaJ
         2LJ6d/pHFiNclkQ5CpD8O9edZBtJMozBrQgbU8CU0H/2lDMqd89evKLuRnEU8jMGkxxY
         yV60Elguo2r5RP1IccXIGshGVLH3SiVlEIe8rgAJtBq0wCAdlBeFjz0iRJaHiRY4D4kn
         M1AuoNrw5nemuUkyeVd2wbhtdltNVoNuWF1Ow218/pODKOiWLcmUgXxBdHuACupfi17n
         qljMqQZFzXiYRlDYtAGhxlXGKP6mpJT2kZwDLK+ZNSD3OwBfS9G3Ua9i9ULz0dGmx8mo
         qZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350412;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMunSKb6o0mwi7lDDlMy5s5rILfzcqDsQ+m29tnpMuE=;
        b=wsiXdHt5xfLH+VTEaJFcgL14mdeL/8VQw8e3TJltcZEzpRGfpAI90MT5164sKEKjZF
         Z0KhOHPrtwpKRdFbac+qguduFfW8zUyCgR4Hq21n+WNr/VXa3n+h+AYnSbViuntPQuXn
         UNtLPI7H9lRrolPvfF34L5SICQ2nRv72E6bW6HbvJW6mBN6s+dGkIKrRF7VezLcQ18Et
         sGW+2qcP3O0xx52LZpvuQpLCuS9WBptJGUXWXkIKz9RkHoWCXcdP9Pbpd0a8QXSfcms3
         ebGgtZrXWDk/rFMJmUNPWLuHl6a6TndGu7a1Pup8JvoVq9OHDTlA4I5EO9tA3Hpepqsk
         zyiw==
X-Gm-Message-State: AO0yUKXZ1lmW94qfFevDvFnz/dFQwUQd/z49mYToX5Zjg8Bp63uJPN9n
	OYt5yQVvr3+vlZbuqbpxtA9qa01jo9mgM9C+P0NUTmjHDQZDV41u
X-Google-Smtp-Source: AK7set+PPaOfsn+cIj3tTccw4KI21qVMCsAq07ejcRSanbwfrQA6An5X0YNyAM7GSijWG/8zhbljpwLOoAey7rIS/Rw=
X-Received: by 2002:a17:906:498e:b0:901:e556:6e23 with SMTP id
 p14-20020a170906498e00b00901e5566e23mr10624929eju.0.1678350412122; Thu, 09
 Mar 2023 00:26:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olofu Ojoachubione <olofuchubi@gmail.com>
Date: Thu, 9 Mar 2023 09:26:41 +0100
Message-ID: <CAOHb_39iXN2YqLpXz7_kfcvZcFjchCVA0gBHgDZhV_2E6zuNnw@mail.gmail.com>
Subject: Introductory Message
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello, I'm Chubi and I'm an outreachy applicant.
I am happy and willing to contribute to this project.
