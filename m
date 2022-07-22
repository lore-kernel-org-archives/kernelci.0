Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DAC15A8
	for <kernelci@lists.linux.dev>; Fri, 22 Jul 2022 12:46:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d8so6329137wrp.6
        for <kernelci@lists.linux.dev>; Fri, 22 Jul 2022 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=GMG+w0Xj3DETF/UIhFmDZmkqGW1Gekt3CUW4x29s6E0sjTL+t6eDTw18WwD0pjB1oW
         PxTP5E1sIOFKFIwLkTy8b87PmSphDrpRUkxSGquw7Q2otnh8p9ea/qTn9k1Dbv47euoA
         Zx+S4Pg/XCuMWDNzcPRnkwHoEl2y3ZcC+twjPepOs+K5AX3e1wwziibnO6/foqKL7BLB
         3BzpizSWDta69Cvdl1Bn8zOruvOMRvnCdfmKBlocZQCWEMzg2VyMHcXZKxuZ1oW8qnGz
         jFhGNFjW/lm74vjJr6kF2r247QjaoPlydsU/RMJX+L4VBkORKY2KZzV/y/mwlkCRtbA7
         eZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=MJU1E2oo4GZ2AxTFNN6WOHC8kS7DdNSkhW1hq2X1IiUaA7wfRQvfnMz6ISZDb2d/LR
         dgPdHDavY7mV5m6eOH7HNzq/Y4IfFhRE0hkQ3U6y+nm+fJthUbQ/SuQwd/AZDVM3vCYv
         RqVN95DQROlBbbaVjci7zP3b5+BBwcxanbpCvif4Ymyyj0iUpLUYSuozPv/eZxNVKxbx
         oqZfiwhdvbLwDocKigHQlfW0IZ4MgqToeeL/sKZ8cDLJdpm6B721/oFyNdi6E2qVnupP
         YFw5w3b3va83SENTWrkGSdSHX1DOMSUm1ZBjmtzmcNRHC8FvLzaDo/gPc0ShpnsEU8B6
         hI5g==
X-Gm-Message-State: AJIora/YJgLkUc/02oIaigzq9KjXRFcEJOxgKDgjxR7bITju6mvYZyS0
	zSNLt//Jl9l9RkYHtS7b5qegnybT3jT+jfq895afR6hhW+j5QQ==
X-Google-Smtp-Source: AGRyM1s1U0qgo2aBoAA8pk/u9wSo43mNiApdau0N3OMEYSTxBmcJwWbLQJaEAkv/Rgvy9EqHCb/MHkXRKNQpNS4X230=
X-Received: by 2002:a5d:4b0c:0:b0:21e:69c5:103f with SMTP id
 v12-20020a5d4b0c000000b0021e69c5103fmr249908wrq.402.1658493980818; Fri, 22
 Jul 2022 05:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Fri, 22 Jul 2022 18:16:09 +0530
Message-ID: <CAH=dH9-NZ7r1eos9CqurLhdH9gH22Aff5cJ8VWTnnJLWhf0XeA@mail.gmail.com>
Subject: Test Delivery to KernelCi
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
