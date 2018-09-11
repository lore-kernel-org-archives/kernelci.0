Date: Tue, 11 Sep 2018 15:01:27 +0200
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: Re: [kernelci] merging kernelci-build with lava-ci (DONE)
Message-ID: <20180911130127.GA9601@delenn>
References: <1551E749E71DE356.30399@groups.io>
MIME-Version: 1.0
In-Reply-To: <1551E749E71DE356.30399@groups.io>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On Thu, Sep 06, 2018 at 09:47:26PM +0200, Ana Guerrero Lopez wrote:
> 
> Hi!
> 
> We discussed in one of the weekly meetings the idea of merging kernelci-build 
> with lava-ci. I took a quick look at this and as hoped, they can be both merged 
> easily.

I've merged the repositories today. Now we have kernelci-core and
kernelci-core-staging:

https://github.com/kernelci/kernelci-core
https://github.com/kernelci/kernelci-core-staging

Some notes:
- I have carried all the tags. The ones coming from lava-ci-staging got
  the suffix "lavaci-" and the ones from kernelci-build-staging "build-"
- branchs haven't been carried on
- I added a "DEPRECATED" note in the description of the four old
  repositories. In a few weeks, we should consider archiving them:
  https://blog.github.com/2017-11-08-archiving-repositories/

Cheers,
Ana

