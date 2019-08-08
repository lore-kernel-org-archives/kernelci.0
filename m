Return-Path: <viresh.kumar@linaro.org>
Date: Thu, 8 Aug 2019 15:04:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: My Branch not getting tested
Message-ID: <20190808093433.c4b2x23opmee2bgt@vireshk-i7>
References: <CAKohpomfjPajY6fp0CywZ-khzNZEjwmAzKz3dzc4=R9B-vOXgw@mail.gmail.com>
 <CAH+k93GJ=xJJR5dCb-Fwrc7nmcdGVJvCqLchg3fZBdVU9bEnTQ@mail.gmail.com>
 <20190806070817.3wrzstcvrcyac4d2@vireshk-i7>
 <20190808081454.5atort63pqt6glfo@vireshk-i7>
 <CAH1_8nCQiy8e7iQVgFf7MixMocefUMC09hQgA33ijK4QaqSEMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1_8nCQiy8e7iQVgFf7MixMocefUMC09hQgA33ijK4QaqSEMg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, Matt Hart <matthew.hart@linaro.org>, info <info@kernelci.org>

HI Guillaume,

On 08-08-19, 11:19, Guillaume Tucker wrote:
> There's a PR to add your branch:
> https://github.com/kernelci/kernelci-core/pull/135
> 
> It will get enabled on kernelci.org during the next production
> update once your PR has been merged, so probably tomorrow.
> 
> I put a comment there, it would be a bit better to use https to
> avoid all the redirections and reduce the number of requests with
> git.kernel.org.

Great, thanks.

> Also, do you need your for-kernelci branch to be built for the
> full range of architectures and defconfigs combinations?  That
> amounts to about 200 builds, but if you only make changes related
> to a subset of that then it could be greatly reduced (say, only
> multi_v7_defconfig for arm, and only build arm, arm64 and x86_64
> arches).  If your branch doesn't get updated very often then it's
> OK to have more build configurations enabled.  There aren't any
> strict rules about this but it's important that we tune each
> branch to get optimum overall performance.

I am more interested in boot testing as my tree is already getting
build tested by 0 day build bot from Intel.

-- 
viresh
