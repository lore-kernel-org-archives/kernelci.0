Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kci_build proposal
In-Reply-To: <20200528172824.rwk5lj3ybhhymwdm@xps.therub.org>
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org> <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com> <20200421172848.ko5ydgus5nyp3blw@xps.therub.org> <7himgn7rty.fsf@baylibre.com> <20200527195831.nl2ptfjlcfkh4tyb@xps.therub.org> <77677a1d-1862-408d-9169-c92eb4f81066@collabora.com> <20200528172824.rwk5lj3ybhhymwdm@xps.therub.org>
Date: Thu, 28 May 2020 16:31:42 -0700
Message-ID: <7ho8q77i1t.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io

Dan Rue <dan.rue@linaro.org> writes:

[...]

> tuxbuild is a commercial build service and tuxmake is an open source
> build implementation. For what it's worth, I think kernelci should
> consider using tuxbuild; it's designed to be highly scalable (thousands
> of concurrent builds) and reliable, and would solve kernelci's build
> capacity problems. LKFT has been using it in production since January
> and it has reduced our build times dramatically.

Cool, thanks for sharing about tuxbuild.  It's the first I've heard of
it.  It definitely looks promising.

I think we need to know a lot more about how it works, what are the
underlying compute resources, how (and who) is capable of bringing more
compute capacity to the table, how (and who) will be capable of
contributing code, etc. etc.  Using a commercial service like this is
probably unlikely, but I certainly hope we can collaborate on the
tooling as the use-case is identical.

After a quick glance at the gitlab project
(https://gitlab.com/Linaro/tuxbuild) and screencast, it seems to me that
whatever your backend is, it's basically k8s batch jobs (or a
reinvention of them.)  We're in the process of converting to k8s batch
jobs (currently running on kci staging), and with that we can scale
build parallelism dramatically.  We're able to use compute from any
cloud-provider that supports k8s (our staging instance is currently
using both Google Compute and MS Azure) but the kci-tools are
cloud-provider agnostic.  We just use the standard kubectl cmdline tool
and the python3-kubernetes package.

Kevin
