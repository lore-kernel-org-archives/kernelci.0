Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6385E4C7D
	for <kernelci@lists.linux.dev>; Mon, 20 Mar 2023 19:21:21 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id z19so3222907plo.2
        for <kernelci@lists.linux.dev>; Mon, 20 Mar 2023 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679340081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWhumSwE6VPdraIKdHkGXCZdveSGyvkn+v17HrXzLoU=;
        b=VA8aZkWAwouurkFwtG7y1H2ErfKKJZWtd5n6zNvgQ9V/tbgcrFvDEjgNUX+C26EohC
         3XF5OzB3GuMYennO2skytyBQ67dXiOz+J+yRqnA0MTaIA4ZL73XFzQi6B28vNZkxeOXv
         SrA2p2w4nBtJd+CgCfvqhSJuIht0fkWs9DLQWukwKJRNHBZjGgTFM6EmIFbFYTV/zUUZ
         yDDInIgClxY2cZgPPnHMzu/Q0lSWerxNkwn2AMN2T8lFZY588uwPLVtlLM9GAuqaanZc
         ue3b4QlswNx2ohsNZ0GpI3MomRMNsK3/20Lf+pC9STW4HMJPDhF7hsuAGTxEJC73c8xZ
         xLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679340081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWhumSwE6VPdraIKdHkGXCZdveSGyvkn+v17HrXzLoU=;
        b=QT9y0NInXC9xTtWLpQUM24wOKrHuwUxpf780HJPhA6LWwJQ1mWJmk38cJGsWa3xlrd
         DUC0a+Rk4WAX0sJ6OzFVNYyT/uTuXFGB6zDKx4gsWO2MV3rRh0lgHk0AJLMaP0qZnWF1
         yGbLKzAn5Df17XzT4x4lBdCQxw0nrlxCs41wkUQzIUel6/PP6hpFPblRPThUGD5FhZ8k
         ER9UDP/Rm/ZRZJZI/Sa+hp0dZrxNlIM2iOpBCzI+BCDJXBAIHKPC24w64NxZcCHhq4aA
         D0wqX3GH/M5j5PB65RbVOq2g/eX62kaw9+kd9YR6AWCB9mv7I7HatwI6Omp6+8/sTP8u
         Kvig==
X-Gm-Message-State: AO0yUKUydBfnFqhtKV8M4Rv1Ps6rpsOJo7iyvc2Wqt3zcDd8GZpTQ3rE
	gjO8mhIyJxoU6/I9e3UKaf+Qwmcs9GVPBPSmsONbdw==
X-Google-Smtp-Source: AK7set97ym3r3TVpdTad4XjDZPrMBp8LWDpdIFqTUCzJk9uiQxZ8zofvh8E3jDnD5nKC5aWGXAkBO7iJddRY68bTF8Q=
X-Received: by 2002:a17:902:c94f:b0:1a0:527b:9189 with SMTP id
 i15-20020a170902c94f00b001a0527b9189mr6877966pla.11.1679340080664; Mon, 20
 Mar 2023 12:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230316225915.494688-1-rmoar@google.com>
In-Reply-To: <20230316225915.494688-1-rmoar@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Mon, 20 Mar 2023 12:21:09 -0700
Message-ID: <CAGS_qxp2u3F4abmYgN+XwCG8CJN37NSqWSC===SWLCjZG8HYBw@mail.gmail.com>
Subject: Re: [KTAP V2 PATCH] ktap_v2: add recognized test name line
To: Rae Moar <rmoar@google.com>
Cc: frowand.list@gmail.com, davidgow@google.com, skhan@linuxfoundation.org, 
	keescook@chromium.org, Tim.Bird@sony.com, brendanhiggins@google.com, 
	corbet@lwn.net, guillaume.tucker@collabora.com, kernelci@lists.linux.dev, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 3:59=E2=80=AFPM Rae Moar <rmoar@google.com> wrote:
>
> Add recognition of the test name line ("# Subtest: <name>") to the KTAP v=
2
> spec.
>
> The purpose of this line is to declare the name of a test before its
> results. This functionality is especially useful when trying to parse tes=
t
> results incrementally and when interpretting results after a crash.
>
> This line is already compliant with KTAP v1 as it is interpretted as a

minor nit for if there's a v2, s/interprett/interpret (here and above)

Also, I want to elaborate on the previous paragraph a bit more, in
case the motivation isn't clear.
The problem with TAP and KTAP as-is is that the name of a test case is
only known *after* it completes.

So the scenario being referred to is

KTAP version 1
1..1
<lots of output>
<kernel crash, no more output>

It would be nice if parsers could report "test FOO caused a crash" as
opposed to "the first test case caused a crash, good luck figuring out
which one that was"

Daniel
