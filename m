Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD251C37
	for <kernelci@lists.linux.dev>; Mon, 11 Dec 2023 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="MNqL1NGt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4258e0a0dc1so28812321cf.2
        for <kernelci@lists.linux.dev>; Mon, 11 Dec 2023 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1702322507; x=1702927307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q3XVK2i6i8i/tjsGLnz+6VEGZ+iQwH0e6JsQ2ll1sM=;
        b=MNqL1NGtyZDp6fpfvL7TVgXb9rYW5J89QdFbUBCRxN50+CDPmZrQzHVHhwn1wiiKLt
         Vvfe4RkUhhcMHuwAceldWApDzb5W+GLe9xrAcPKpUwYdX1XsGLFCk4X6MWiIBTq0UtER
         bmbeWQPdSMW2EbyZTc0mlvsn3ev2pb5XaEHt4Z3FL3rXWPQDbFkwVMcwIyru2M4pIPX5
         9DOKXjC8a9W8eytzzY1D+owvKN8eBVVRRiJ/mHEmeQ/cXkxsnhxyFDkCbFnN4bTN/tkO
         4nG49rQF6sUg1rfcmpCd773xZLpE5MwM6SHqJVYKJPacrkiIEW/IjS2dTPpeNIM6lFtW
         m7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702322507; x=1702927307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+q3XVK2i6i8i/tjsGLnz+6VEGZ+iQwH0e6JsQ2ll1sM=;
        b=WDeTBo/dHfOFcZXhsCTDXUddHD/FLvJgNEXD7TWdN+k2fc3a7DW0XZKZHdKbhgMgBA
         adImejVp8BH6op7tBhuh1MASR/Ylv69h2SstqhkKqJmu6hOaxHdQ2Pp2cdKwEbYdMmdZ
         pe3oxZSJ1DAfNyn4wlxCqAl28+kueFYFU4K68nRD57Cy+lTmKnBSi/FyEx8WQXzbMgpU
         /ZSDtp9f2VMK8hAd7vTRCHW40W4AFMcsk+5f8tlz8/4iYnCPhojvcBQ1ltPTBZusZZZ4
         j+XBHSuz2/5lUN8SqVyG0HuHgOx/IymkN+iTpOkq0ekdQvcWKnmHp25vd5HjC73TNZyF
         yQnA==
X-Gm-Message-State: AOJu0YwN4BPrYSOUPi4FC18GL2vM7cT59lYk0ejQLHFJIcOE5QD/841s
	0B9XHiFQ0ARE5dZR/lGPg6AuG+F0hdU8s+/0kuaerQ==
X-Google-Smtp-Source: AGHT+IEcvhBhDFbIc8qohR/ciuBi295P5AkeYB2ByIm3POtNdTKXzF/65y2z3RoKGb0Mlsg5F20kQGLflz4nMRZdc0I=
X-Received: by 2002:ac8:5fce:0:b0:423:77aa:163b with SMTP id
 k14-20020ac85fce000000b0042377aa163bmr7007200qta.51.1702322506786; Mon, 11
 Dec 2023 11:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5d48c1fa-d577-6f4c-5d3c-37884053e1a9@collabora.com>
In-Reply-To: <5d48c1fa-d577-6f4c-5d3c-37884053e1a9@collabora.com>
From: Ricardo Dourado <ricardo.dourado@profusion.mobi>
Date: Mon, 11 Dec 2023 16:21:35 -0300
Message-ID: <CAHrXaCvAf=bB-mHix4ai_J3vkzMmzm37QzdPgPzKx8gs2GLtQg@mail.gmail.com>
Subject: Re: KernelCI is designing a new Web Dashboard: we want your feedback!
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, 
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>, 
	"kernelci-webdashboard@groups.io" <kernelci-webdashboard@groups.io>, 
	=?UTF-8?Q?Jo=C3=A3o_Bertacchi?= <joaobertacchi@profusion.mobi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi community members,

We value your input! Please take a moment to share your thoughts on
the KernelCI Web Dashboard through our quick survey:
https://www.surveymonkey.com/r/PHG2BC5

This is going to take only 5 minutes.

Your feedback is crucial in enhancing the KernelCI Web dashboard's
user experience, saving time, and increasing productivity. We
appreciate your time and contribution.

Best,


On Tue, Dec 5, 2023 at 8:38=E2=80=AFPM Gustavo Padovan
<gustavo.padovan@collabora.com> wrote:
>
> Hello,
>
> TL;DR: KernelCI engaged with an UX speacialist vendor to design a new
> web dashboard to show our test results data. If you want to give your
> feedback, let us know. We still have a few spots for UX interviews!
>
>
> As we shared previously, we are in the process of designing a new Web
> Dashboard for KernelCI. As you may know, at same time, we are putting
> together a new core infra to replace our legacy and limited system.
>
> Ultimately, we will have a CI pipeline that allows tests to be run not
> only in KernelCI labs but outside of it too, but with test results
> contributed back to the already available common database. Then on top
> that, we want to have a powerful dashboard to help the community
> evaluate the test results in the best manner possible.
>
> You can read our blog post for a quick summary of the UX redesign
> project: https://kernelci.org/blog/posts/2023/ux-analysis/
>
> We have just started the first phase with the UX team interviewing
> kernel maintainers and other users of KernelCI.
>
> If you are interested in providing your feedback just reply to this
> email or reach out to me directly. We will try to accommodate everyone
> that is interested.
>
> Regards,
>
> - Gus (as Project Manager for the KernelCI project)
>
> --
> Gustavo Padovan
> Kernel Lead
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park
> Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
>

--=20
Ricardo Gej=C3=A3o

Senior User Experience Designer for KernelCI Web Dashboard
