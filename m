Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D021DDF1
	for <kernelci@lists.linux.dev>; Fri,  9 Jun 2023 20:50:26 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-19f45faedfbso1066708fac.0
        for <kernelci@lists.linux.dev>; Fri, 09 Jun 2023 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686343825; x=1688935825;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=izWNb+6MP5eDvXpmmZ+4OuVugULQr70hbJDq79c8GxQ=;
        b=dhy0kPyXZ+AfkpXG3XFGam30GemwS8wBRmKYh4AC21vaij1Q180iPOnjWCVC+IbyRB
         34sC2Vrif/o2QhdRhWRKQ7ck762pqzaUwGf8Tcd6KvwXApl5K/6Bmq5jJ2j0ET5PqiKq
         CFWAJnjP+kUDI2IgAlyQxDwkWk6JaDFfqq8uuAcNYZ7Syi46Ddv1KPAjjCsZh7oj1moH
         b4LWp8DD/LZjcy/Gc5OHB1jSrugEWXBU+FpQTKIv2rLgAHmAgzCgSeUyE+Y5cUbp49+c
         1y6n8n2zCnupQmgbM8ROVr0HPOKnUfhaCSAaccdp+eOXd/GRGEB5eyv8Roiv9DwK19SB
         Vw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343825; x=1688935825;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izWNb+6MP5eDvXpmmZ+4OuVugULQr70hbJDq79c8GxQ=;
        b=Zi4mmZyyCrA4oNdvF0Nz0jRWERK0UJCfUhkjL1VMUz376eB053oBhf7tsKB1Ajox6i
         91mIr/q4uwFqFrrRUrs6ltoXsulzOhIOxBh0KXhaVUGkfxnpFarulLd5SNgibqhmHXsG
         cPQ/fomfDvQ2/LefwPTTB408kI43TqHdIpf0AKHbw56INKc/2JpbwumlChqOxtydwXsO
         wCPORcp8ko6+sbrz7iKoUWNGKNlzyeg0hpkVXFvDKmgYWp/+FbECdq1frPo6Ll0++Aus
         cZ3c0pdGc6sM/ALDg2yccC2WiEgo7zZgQOkzhpHbkjmTanCADj9nheOGnOmea65Ny6wr
         LzNw==
X-Gm-Message-State: AC+VfDw5h/Icj7bf5czzbAz4gDULXCrOjlAzhD06YEMvaO/NGQ4D2quh
	wiYJv9Mwv7gVgejOJMM7ui9YqcvPjCN3N8wvGmnREdRS74eOFcti969QBg==
X-Google-Smtp-Source: ACHHUZ79aq2sxiisEfauqcQBGDDi62j/FO370J9EeQLOVIT6GXGImVhWzLA8n8VCYaOwS6/pmn3+WwBr+2EpHu+fT4g=
X-Received: by 2002:a05:6359:323:b0:123:4ea9:9fe9 with SMTP id
 ef35-20020a056359032300b001234ea99fe9mr2143900rwb.3.1686343824843; Fri, 09
 Jun 2023 13:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Jun 2023 13:50:13 -0700
Message-ID: <CAKwvOd=qxNfPDo-=bxzyzmY3YmsBtxv686rr9Q_thrfC6ni3eg@mail.gmail.com>
Subject: kernelci: please upgrade clang-17
To: kernelci@lists.linux.dev
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Starting a new thread because gmail cannot handle replying to an email
w/ >45k warnings.
https://lore.kernel.org/llvm/6482b7dd.170a0220.a93c3.9102@mx.google.com/

instances of -Wbuiltin-macro-redefined have been fixed in ToT llvm.
Updating clang-17 should resolve most of the error spew.

Does kernel CI update ToT clang builds on a fixed cadence?

Thanks for the tests and reports; we still read them daily.
-- 
Thanks,
~Nick Desaulniers
