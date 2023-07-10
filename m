Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF26156E2
	for <kernelci@lists.linux.dev>; Mon, 10 Jul 2023 22:42:06 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-401d1d967beso63041cf.0
        for <kernelci@lists.linux.dev>; Mon, 10 Jul 2023 15:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689028925; x=1691620925;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KwijgclT2oZSItO/Hh2KyeFqi7suiMFEV1yfkdQSD4Q=;
        b=ouYhu7jTVjxmrWhMNvS3Cy/gtOB07v3V1U6Vvm6SaXmyreyAGue4amcUdhNBW09Cfh
         w2LD9q6QFszxh6SXS1asCWZv5MfHn63Hcw3DyPe6KdBn//LlhdpeRub7Zd8jrGE/zXS5
         KKWCCedP1leGU4uTCoIAJT4zKZtCzn54yi6UqaJbp1T0cCxWy/vLFgqDlWQPFUXW+HAN
         DKiTDEGnlbmqh/NXomprzzMcijQhJOunIQwvhd2RBHUX1r5hlp95Y2hxwz+nCLX1cew2
         YvGqkIv9qkNyUBSKFT8FjXlFcd+1+F9/tOD2EDvb7cFRELqQ84xKgzH5Sp1gTQDHw0Nd
         OvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689028925; x=1691620925;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwijgclT2oZSItO/Hh2KyeFqi7suiMFEV1yfkdQSD4Q=;
        b=EA6FefAh5t00FWJKL8QkaxWMW7DzFWovVQ7R2EypD57T0f9slmPVNVyrJkIacijhVq
         TAsehDPHkN8uoorHZNnHtPmfa68LYYjISXkCQPGbnlKZWcsLWyOq+p8uGouSy6j03R4/
         6exRdXzPbSSGoII2HnmlA4TlmxONMc6o8bngj2un8WXUlBqqWgco4OzlwUqEn4RtwdUg
         2hbSfk1S1kcGWWLnYJxC8MLu123Bx0vVH+91tlALa3V4/IyLleR3XFDApK/f8bvoshao
         P0nWR0yfbJC/80YY0SdTgKNMRwJkveYw4Wqj+dMUEs9J5WqMPnci4JIxEHFoZ/B5S9N4
         V5Ag==
X-Gm-Message-State: ABy/qLbiHG6F79Fh5RHWnYh8UAqBbLnY1OnkwwLkkaaLaUJGu5s5tOLl
	T1qyV1Ga7EI6GoekKOLbDAJVrRizUsCyfXMunfMuhQqm4v4NN94704ALo3/n
X-Google-Smtp-Source: APBJJlFVvDSc2y81kzRrPAGG7mNNc5oZLt9xesvh8WrOenPN8TpvsXYv52lq3JZOH91eZ4tUtLZvH1dGTTnVw6lPRnk=
X-Received: by 2002:a05:622a:1a84:b0:3f4:f0fd:fe7e with SMTP id
 s4-20020a05622a1a8400b003f4f0fdfe7emr32250qtc.3.1689028925053; Mon, 10 Jul
 2023 15:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Mon, 10 Jul 2023 15:41:49 -0700
Message-ID: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
Subject: Please add new Android branches
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Please add the following new Android branches to kernelci testing.

repo: https://android.googlesource.com/kernel/common
branches:
- android15-6.1
- android14-6.1-lts
- android14-5.15-lts

Thanks,

-Todd
