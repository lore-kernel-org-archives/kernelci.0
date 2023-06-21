Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB451C766
	for <kernelci@lists.linux.dev>; Wed, 21 Jun 2023 22:17:04 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55380677566so3234653a12.3
        for <kernelci@lists.linux.dev>; Wed, 21 Jun 2023 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687385824; x=1689977824;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0aARFyuMgGTCClU7BIK0/mVrI2LlT05qIF9f9wRy7w=;
        b=Zo7lKc92nY0BV7uhRtbUFeN4+LkudzshXEHiSciGCSWC1bQ4xjE0aZf659d/Vkn9t/
         Gi0iNrSvdBn9mdMPwTFRYyLq8RiBhT1UL+eGSj706ceRfGi05B56qUwVRHRlzZNwYOuR
         Bnu5paqQYLvXXQg5dfJh5mXBA9ZucowXsPmlmdXd6wcmo+uMaR8qHI2QunBMUNI64V1a
         /vEHW+R9WEUUaqBiZOuHOtC6Ovx9kIU1NnzEDJlbvm2BF2pBCV0grSig+bfR4agVZ/47
         k5oNtrCPurnJMEScs2Fcq2NRthaAEmKwr40R5JHypq5KKfA5hji+hX06W0iUNzI7RgcG
         lTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687385824; x=1689977824;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0aARFyuMgGTCClU7BIK0/mVrI2LlT05qIF9f9wRy7w=;
        b=HgDKLqrgLaRmrvH1qRopSvFGpXXBD7v2DMTWivKtlIQXDActe4iQ0DqnJaXo81k/Jc
         lak/Bc/6LdAX/QVZhAepo6CVK3WfZA+zugr27UHaFsOMeJNB2yLqeDP2v5TbY0aCDY0T
         71EMTcYB/5i12/7LZnN4dU9vpK28lc5lBmwI3B8myOmSDGbxnEuA359RO47eEdofsqc6
         DUTqN6V5u/Gi8NIRzRuSeMB3cpPQ6yYP2O7TODwN5cTgqKYcjIg90Wr2AUZ4WObAci0Q
         k0qQ7YwN5iLHNFvoL+WWxJe2baxj5/+3mZwg1pqZV+W8spfqH5HyPAndJYMNykLqRx7w
         LsDA==
X-Gm-Message-State: AC+VfDyU1FYmqYlUkZRMKJM04zLZDUsdc+7AcE0lJuy5dZnpdrGzBLZb
	6nFNsBVssn9RmD62nM4p0hE2UquO3PjiHwcondg=
X-Google-Smtp-Source: ACHHUZ4bwWADTcUKY3ECdbrb0fGxmv5KSwApuW/DAWBNCT5aGIZZ+dtNlpCcSKrf+WqwAkZ0WP0O2w==
X-Received: by 2002:a05:6a20:1596:b0:10b:e54f:1c00 with SMTP id h22-20020a056a20159600b0010be54f1c00mr13522512pzj.57.1687385823999;
        Wed, 21 Jun 2023 15:17:03 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78dd9000000b00666e649ca46sm917834pfr.101.2023.06.21.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 15:17:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Guillaume Tucker via groups.io"
 <guillaume.tucker=collabora.com@groups.io>, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>, automated-testing@lists.yoctoproject.org
Cc: kernelci-members@groups.io
Subject: Re: [kernelci-members] Request for Proposals: UX Analysis 2023
In-Reply-To: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
References: <74ac6506-7171-5b78-52c5-d6a3095df9dd@collabora.com>
Date: Wed, 21 Jun 2023 15:17:02 -0700
Message-ID: <7h1qi4tq8x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Guillaume Tucker via groups.io"
<guillaume.tucker=collabora.com@groups.io> writes:

> KernelCI is now looking for proposals to conduct an UX Analysis
> for a new web dashboard.

Great work getting this finalized and posted.  Thank you!

[...]

> Please send any proposals or inquiries to the KernelCI members:
>
>   kernelci-members@groups.io

Warning: this list is restricted/moderated, so all proposals will end up
in the moderation queue.

Kevin

