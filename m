Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] merging kernelci-build with lava-ci
References: <20180906194726.GA16832@delenn>
Date: Thu, 06 Sep 2018 15:13:42 -0700
In-Reply-To: <20180906194726.GA16832@delenn> (Ana Guerrero Lopez's message of
	"Thu, 6 Sep 2018 21:47:26 +0200")
Message-ID: <7hva7i6zqh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Ana Guerrero Lopez <ana.guerrero@collabora.com>
Cc: kernelci@groups.io

"Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:

> We discussed in one of the weekly meetings the idea of merging kernelci-build 
> with lava-ci. I took a quick look at this and as hoped, they can be both merged 
> easily.
>
> The easiest seems to merge kernelci-build (~200 commits) into lava-ci (~800 commits),
> the only conflict is the README.md file so this file needs to be removed 
> from kernelci-build before the merge. Then both repositories can be merged
> with merge  --allow-unrelated-histories.
>
> The steps I followed:
>
> $ git clone https://github.com/kernelci/lava-ci-staging && cd lava-ci-staging
> $ git remote add kernelci-build https://github.com/kernelci/kernelci-build-staging.git
> $ git fetch kernelci-build/master
> $ git merge --allow-unrelated-histories kernelci-build/master
>
> And exactly the same procedure works for the staging repositories kernelci-build-staging 
> and lava-ci-staging. You can browse the resulting repositories at:
>
> https://gitlab.collabora.com/ana/kci.lava-ci-staging
> https://gitlab.collabora.com/ana/kci.lava-ci
>
>
> Is there any objection against doing the merge of this two repositories next week? 

No objection from me.

> Do you have any preference for the name of the new resulting repository? For the sake
> of suggesting something, what about just "kernelci" or maybe "kernelci-core"?

I like kernelci-core.

Kevin
